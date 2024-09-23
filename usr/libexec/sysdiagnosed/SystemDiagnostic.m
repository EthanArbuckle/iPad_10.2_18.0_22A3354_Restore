@implementation SystemDiagnostic

- (id)getAutogenTimeSensitiveContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/ltop"), 0, CFSTR("ltop.txt")));
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:", v5, &__NSArray0__struct, 0, self, 1, 10.0));
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskContainer"));
    objc_msgSend(v8, "setName:", CFSTR("utilities-timeSensitive-embedded"));

    objc_msgSend(v7, "setRuntimeChecks:", 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionContainer"));
    objc_msgSend(v9, "setMaximumSizeMB:", 25);

    objc_msgSend(v3, "addObject:", v7);
  }

  return v3;
}

- (id)getAutogenLogGenerationContainers
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
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
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
  id v164;
  void *v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  _QWORD v172[2];
  void *v173;
  _QWORD v174[4];
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  _QWORD v179[7];
  void *v180;
  _QWORD v181[2];
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

  v167 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("SEP Util"), 0, 1, self, 5.0));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setRuntimeChecks:", 17);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/seputil"), &off_1000ABA98, CFSTR("sep_util.log")));
    v195 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v195, 1));
    objc_msgSend(v4, "addSDTasksToContainer:", v6);

    objc_msgSend(v167, "addObject:", v4);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 36, CFSTR("logs/ProactiveInputPredictions"), self, 5.0));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setRuntimeChecks:", 16);
    objc_msgSend(v167, "addObject:", v8);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("umtool"), CFSTR("logs/UserManagement"), 1, self, 5.0));
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "setRuntimeChecks:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/umtool"), &off_1000ABAB0, CFSTR("umtool.txt")));
    v194 = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v194, 1));
    objc_msgSend(v10, "addSDTasksToContainer:", v12);

    objc_msgSend(v167, "addObject:", v10);
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("testIOMFBGPO"), CFSTR("logs"), 1, self, 1.0));
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "setRuntimeChecks:", 17);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/testIOMFBGPO"), 0, CFSTR("testIOMFBGPO.txt")));
    v193 = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v193, 1));
    objc_msgSend(v14, "addSDTasksToContainer:", v16);

    objc_msgSend(v167, "addObject:", v14);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/afktool"), &off_1000ABAC8, 0));
  v192 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v192, 1));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:", v18, &__NSArray0__struct, CFSTR("logs/AFK"), self, 1, 5.0));
  v20 = v19;
  if (v19)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "taskContainer"));
    objc_msgSend(v21, "setName:", CFSTR("AFK"));

    objc_msgSend(v20, "setRuntimeChecks:", 16);
    objc_msgSend(v167, "addObject:", v20);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 9, CFSTR("logs/BatteryHealth"), self, 5.0));
  v23 = v22;
  if (v22)
  {
    objc_msgSend(v22, "setRuntimeChecks:", 16);
    objc_msgSend(v167, "addObject:", v23);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("AMSToolCookieExports"), CFSTR("logs/AMSTool"), 1, self, 2.0));
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "setRuntimeChecks:", 17);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/amstool"), &off_1000ABAE0, CFSTR("amstool_cookies_list.txt")));
    v191 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v191, 1));
    objc_msgSend(v25, "addSDTasksToContainer:", v27);

    objc_msgSend(v167, "addObject:", v25);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 28, CFSTR("crashes_and_spins/MemoryExceptions"), self, 5.0));
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "setRuntimeChecks:", 16);
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "collectionContainer"));
    objc_msgSend(v30, "setMaximumSizeMB:", 45);

    objc_msgSend(v167, "addObject:", v29);
  }

  v31 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("usbctl"), CFSTR("logs/usbctl"), 1, self, 1.0));
  v32 = v31;
  if (v31)
  {
    objc_msgSend(v31, "setRuntimeChecks:", 17);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/usbctl"), &off_1000ABAF8, CFSTR("usbctl_list.txt")));
    v190 = v33;
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v190, 1));
    objc_msgSend(v32, "addSDTasksToContainer:", v34);

    objc_msgSend(v167, "addObject:", v32);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("assistantd state dump"), CFSTR("logs/assistantd"), 1, self, 1.0));
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "setRuntimeChecks:", 17);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/assistant_tool"), &off_1000ABB10, CFSTR("assistant_tool_dump_state.txt")));
    v189 = v37;
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v189, 1));
    objc_msgSend(v36, "addSDTasksToContainer:", v38);

    objc_msgSend(v167, "addObject:", v36);
  }

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 54, CFSTR("logs/UnifiedAsset"), self, 2.0));
  v40 = v39;
  if (v39)
  {
    objc_msgSend(v39, "setRuntimeChecks:", 16);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "collectionContainer"));
    objc_msgSend(v41, "setMaximumSizeMB:", 1);

    objc_msgSend(v167, "addObject:", v40);
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 29, CFSTR("crashes_and_spins/MemoryExceptions"), self, 2.0));
  v43 = v42;
  if (v42)
  {
    objc_msgSend(v42, "setRuntimeChecks:", 16);
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "collectionContainer"));
    objc_msgSend(v44, "setMaximumSizeMB:", 1);

    objc_msgSend(v167, "addObject:", v43);
  }

  v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("benchrun_validate"), CFSTR("logs/benchrun"), 1, self, 2.0));
  v46 = v45;
  if (v45)
  {
    objc_msgSend(v45, "setRuntimeChecks:", 17);
    v47 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/benchrun"), &off_1000ABB28, CFSTR("benchrun_validate.txt")));
    v188 = v47;
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v188, 1));
    objc_msgSend(v46, "addSDTasksToContainer:", v48);

    objc_msgSend(v167, "addObject:", v46);
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("pmudiagnose"), CFSTR("logs/pmudiagnose"), 1, self, 2.0));
  v50 = v49;
  if (v49)
  {
    objc_msgSend(v49, "setRuntimeChecks:", 16);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/pmudiagnose/pmudiagnose"), 0, CFSTR("pmudiagnose.txt")));
    v187 = v51;
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v187, 1));
    objc_msgSend(v50, "addSDTasksToContainer:", v52);

    objc_msgSend(v167, "addObject:", v50);
  }

  v53 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("IOSADiagnose"), CFSTR("logs/IOSADiagnose"), 1, self, 5.0));
  v54 = v53;
  if (v53)
  {
    objc_msgSend(v53, "setRuntimeChecks:", 16);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/IOSurfaceAccelerator.framework/Resources/IOSADiagnose"), 0, CFSTR("IOSADiagnose.log")));
    v186 = v55;
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v186, 1));
    objc_msgSend(v54, "addSDTasksToContainer:", v56);

    objc_msgSend(v167, "addObject:", v54);
  }

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("IOPowerSources"), CFSTR("logs/IOPowerSources"), 1, self, 1.0));
  v58 = v57;
  if (v57)
  {
    objc_msgSend(v57, "setRuntimeChecks:", 17);
    v59 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/iopsutil"), &off_1000ABB40, CFSTR("iopsutil-all-dump.txt")));
    v185 = v59;
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v185, 1));
    objc_msgSend(v58, "addSDTasksToContainer:", v60);

    objc_msgSend(v167, "addObject:", v58);
  }

  v61 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("CoreAnalytics"), CFSTR("logs/CoreAnalytics"), 1, self, 1.0));
  v62 = v61;
  if (v61)
  {
    objc_msgSend(v61, "setRuntimeChecks:", 17);
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/analytics_tool"), &off_1000ABB58, CFSTR("analytics_transform_counts.txt")));
    v184 = v63;
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v184, 1));
    objc_msgSend(v62, "addSDTasksToContainer:", v64);

    objc_msgSend(v167, "addObject:", v62);
  }

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("cryptexctl"), CFSTR("logs/libcryptex"), 1, self, 2.0));
  v66 = v65;
  if (v65)
  {
    objc_msgSend(v65, "setRuntimeChecks:", 16);
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/cryptexctl"), &off_1000ABB70, CFSTR("cryptexctl-dumpstate.txt")));
    v183 = v67;
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v183, 1));
    objc_msgSend(v66, "addSDTasksToContainer:", v68);

    objc_msgSend(v167, "addObject:", v66);
  }

  v69 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 55, CFSTR("logs/IntelligencePlatform"), self, 2.0));
  v70 = v69;
  if (v69)
  {
    objc_msgSend(v69, "setRuntimeChecks:", 17);
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "collectionContainer"));
    objc_msgSend(v71, "setMaximumSizeMB:", 1);

    objc_msgSend(v167, "addObject:", v70);
  }

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("profilectl"), CFSTR("logs"), 1, self, 5.0));
  v73 = v72;
  if (v72)
  {
    objc_msgSend(v72, "setRuntimeChecks:", 17);
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/profilectl"), &off_1000ABB88, CFSTR("profilectl_list.txt")));
    v182 = v74;
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v182, 1));
    objc_msgSend(v73, "addSDTasksToContainer:", v75);

    objc_msgSend(v167, "addObject:", v73);
  }

  v76 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("dastool"), 0, 1, self, 5.0));
  v77 = v76;
  if (v76)
  {
    objc_msgSend(v76, "setRuntimeChecks:", 17);
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/dastool"), &off_1000ABBA0, CFSTR("dastool.txt")));
    v181[0] = v78;
    v79 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/dastool"), &off_1000ABBB8, CFSTR("dastool_evaluate_all_activities.txt")));
    v181[1] = v79;
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v181, 2));
    objc_msgSend(v77, "addSDTasksToContainer:", v80);

    objc_msgSend(v167, "addObject:", v77);
  }

  v81 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/atcrtcomm"), &off_1000ABBD0, CFSTR("atcrtcomm.txt")));
  v180 = v81;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v180, 1));

  v83 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:", v82, &__NSArray0__struct, CFSTR("logs/atcrtcomm"), self, 1, 5.0));
  v84 = v83;
  if (v83)
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "taskContainer"));
    objc_msgSend(v85, "setName:", CFSTR("AppleTypeCRetimerLogs"));

    objc_msgSend(v84, "setRuntimeChecks:", 16);
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "collectionContainer"));
    objc_msgSend(v86, "setMaximumSizeMB:", 1);

    objc_msgSend(v167, "addObject:", v84);
  }

  v87 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("suggestToolTasks"), CFSTR("logs/suggest_tool"), 0, self, 10.0));
  v88 = v87;
  if (v87)
  {
    objc_msgSend(v87, "setRuntimeChecks:", 16);
    v166 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool"), &off_1000ABBE8, CFSTR("dbStats.txt")));
    v179[0] = v166;
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool"), &off_1000ABC00, CFSTR("fileSystemMetadata.txt")));
    v179[1] = v89;
    v90 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool"), &off_1000ABC18, CFSTR("dbSchema.txt")));
    v179[2] = v90;
    v91 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool"), &off_1000ABC30, CFSTR("assetVersion.txt")));
    v179[3] = v91;
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool"), &off_1000ABC48, CFSTR("DictionaryExtractions.txt")));
    v179[4] = v92;
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool"), &off_1000ABC60, CFSTR("DictionaryInteractions.txt")));
    v179[5] = v93;
    v94 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/CoreSuggestions.framework/Tools/suggest_tool"), &off_1000ABC78, CFSTR("DictionaryInteractionsSummary.txt")));
    v179[6] = v94;
    v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v179, 7));
    objc_msgSend(v88, "addSDTasksToContainer:", v95);

    objc_msgSend(v167, "addObject:", v88);
  }

  v96 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("diagpipectl"), CFSTR("logs/diagpipectl"), 1, self, 5.0));
  v97 = v96;
  if (v96)
  {
    objc_msgSend(v96, "setRuntimeChecks:", 17);
    v98 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/diagpipectl"), &off_1000ABC90, CFSTR("diagpipectl.txt")));
    v178 = v98;
    v99 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v178, 1));
    objc_msgSend(v97, "addSDTasksToContainer:", v99);

    objc_msgSend(v167, "addObject:", v97);
  }

  v100 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/Frameworks/SensorKit.framework/Support/srsupporttool"), &off_1000ABCA8, CFSTR("errors/srsupport_tool_errors.txt")));
  v177 = v100;
  v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v177, 1));

  v102 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:", v101, &__NSArray0__struct, CFSTR("logs/SensorKit"), self, 1, 5.0));
  v103 = v102;
  if (v102)
  {
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "taskContainer"));
    objc_msgSend(v104, "setName:", CFSTR("SensorKit"));

    objc_msgSend(v103, "setRuntimeChecks:", 16);
    objc_msgSend(v167, "addObject:", v103);
  }

  v105 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("ppmctrl"), CFSTR("logs/ppmctrl"), 1, self, 1.0));
  v106 = v105;
  if (v105)
  {
    objc_msgSend(v105, "setRuntimeChecks:", 17);
    v107 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/ppmctrl"), &off_1000ABCC0, CFSTR("ppmctrl_getClientState.txt")));
    v176 = v107;
    v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v176, 1));
    objc_msgSend(v106, "addSDTasksToContainer:", v108);

    objc_msgSend(v167, "addObject:", v106);
  }

  v109 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("nightshift"), 0, 1, self, 5.0));
  v110 = v109;
  if (v109)
  {
    objc_msgSend(v109, "setRuntimeChecks:", 16);
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/corebrightnessdiag"), &off_1000ABCD8, CFSTR("night-shift.log")));
    v175 = v111;
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v175, 1));
    objc_msgSend(v110, "addSDTasksToContainer:", v112);

    objc_msgSend(v167, "addObject:", v110);
  }

  v113 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 16, CFSTR("logs/CoreRepair"), self, 5.0));
  v114 = v113;
  if (v113)
  {
    objc_msgSend(v113, "setRuntimeChecks:", 17);
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "collectionContainer"));
    objc_msgSend(v115, "setMaximumSizeMB:", 1);

    objc_msgSend(v167, "addObject:", v114);
  }

  v116 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 31, CFSTR("logs/OSEligibility"), self, 2.0));
  v117 = v116;
  if (v116)
  {
    objc_msgSend(v116, "setRuntimeChecks:", 16);
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "collectionContainer"));
    objc_msgSend(v118, "setMaximumSizeMB:", 1);

    objc_msgSend(v167, "addObject:", v117);
  }

  v119 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("ffctl"), 0, 1, self, 5.0));
  v120 = v119;
  if (v119)
  {
    objc_msgSend(v119, "setRuntimeChecks:", 17);
    v121 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/ffctl"), &off_1000ABCF0, CFSTR("ffctl.json")));
    v174[0] = v121;
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/ffctl"), &off_1000ABD08, CFSTR("ffctl.txt")));
    v174[1] = v122;
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/ffctl"), &off_1000ABD20, CFSTR("ffctl_changed.txt")));
    v174[2] = v123;
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/ffctl"), &off_1000ABD38, CFSTR("ffctl_featureset_list.txt")));
    v174[3] = v124;
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v174, 4));
    objc_msgSend(v120, "addSDTasksToContainer:", v125);

    objc_msgSend(v167, "addObject:", v120);
  }

  v126 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("ModelManager"), CFSTR("logs/ModelManager"), 1, self, 2.0));
  v127 = v126;
  if (v126)
  {
    objc_msgSend(v126, "setRuntimeChecks:", 16);
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/modelmanagerdump"), 0, CFSTR("model_manager_dump.json")));
    v173 = v128;
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v173, 1));
    objc_msgSend(v127, "addSDTasksToContainer:", v129);

    objc_msgSend(v167, "addObject:", v127);
  }

  v130 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 12, CFSTR("Preferences"), self, 1.0));
  v131 = v130;
  if (v130)
  {
    objc_msgSend(v130, "setRuntimeChecks:", 17);
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "collectionContainer"));
    objc_msgSend(v132, "setMaximumSizeMB:", 1);

    objc_msgSend(v167, "addObject:", v131);
  }

  v133 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 8, CFSTR("logs/powerlogs"), self, 2.0));
  v134 = v133;
  if (v133)
  {
    objc_msgSend(v133, "setRuntimeChecks:", 16);
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "collectionContainer"));
    objc_msgSend(v135, "setMaximumSizeMB:", 30);

    objc_msgSend(v167, "addObject:", v134);
  }

  v136 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 25, CFSTR("logs/HIDCrashlogs"), self, 5.0));
  v137 = v136;
  if (v136)
  {
    objc_msgSend(v136, "setRuntimeChecks:", 16);
    objc_msgSend(v167, "addObject:", v137);
  }

  v138 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("agx_util"), 0, 1, self, 5.0));
  v139 = v138;
  if (v138)
  {
    objc_msgSend(v138, "setRuntimeChecks:", 17);
    v140 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/agx_util"), &off_1000ABD50, CFSTR("agx_util.txt")));
    v172[0] = v140;
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/agx_util"), &off_1000ABD68, CFSTR("agx_diagnosis_report.txt")));
    v172[1] = v141;
    v142 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v172, 2));
    objc_msgSend(v139, "addSDTasksToContainer:", v142);

    objc_msgSend(v167, "addObject:", v139);
  }

  v143 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("ModelCatalog"), CFSTR("logs/ModelCatalog"), 1, self, 2.0));
  v144 = v143;
  if (v143)
  {
    objc_msgSend(v143, "setRuntimeChecks:", 17);
    v145 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/modelcatalogtool"), &off_1000ABD80, CFSTR("model_catalog_tool_status.txt")));
    v171 = v145;
    v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v171, 1));
    objc_msgSend(v144, "addSDTasksToContainer:", v146);

    objc_msgSend(v167, "addObject:", v144);
  }

  v147 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("CloudSubscriptionFeatures"), CFSTR("logs/CloudSubscriptionFeatures"), 1, self, 2.0));
  v148 = v147;
  if (v147)
  {
    objc_msgSend(v147, "setRuntimeChecks:", 17);
    v149 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/csfctl"), &off_1000ABD98, CFSTR("csfctl_gmdiagnose.txt")));
    v170 = v149;
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v170, 1));
    objc_msgSend(v148, "addSDTasksToContainer:", v150);

    objc_msgSend(v167, "addObject:", v148);
  }

  v151 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 23, CFSTR("logs/GenerativeExperiences"), self, 3.0));
  v152 = v151;
  if (v151)
  {
    objc_msgSend(v151, "setRuntimeChecks:", 16);
    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "collectionContainer"));
    objc_msgSend(v153, "setMaximumSizeMB:", 1);

    objc_msgSend(v167, "addObject:", v152);
  }

  v154 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("ProtectedApps"), CFSTR("logs/ProtectedApps"), 1, self, 1.0));
  v155 = v154;
  if (v154)
  {
    objc_msgSend(v154, "setRuntimeChecks:", 16);
    v156 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/appprotectiondiagnose"), &off_1000ABDB0, CFSTR("appprotectiondiagnose_diagnostics.json")));
    v169 = v156;
    v157 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v169, 1));
    objc_msgSend(v155, "addSDTasksToContainer:", v157);

    objc_msgSend(v167, "addObject:", v155);
  }

  v158 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/IOAccelMemory"), &off_1000ABDC8, CFSTR("IOAccelMemory.txt")));
  v168 = v158;
  v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v168, 1));

  v160 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:", v159, &__NSArray0__struct, CFSTR("logs/IOAccelMemory"), self, 1, 5.0));
  v161 = v160;
  if (v160)
  {
    v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "taskContainer"));
    objc_msgSend(v162, "setName:", CFSTR("IOAccelMemory"));

    objc_msgSend(v161, "setRuntimeChecks:", 17);
    v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "collectionContainer"));
    objc_msgSend(v163, "setMaximumSizeMB:", 2);

    objc_msgSend(v167, "addObject:", v161);
  }

  v164 = v167;
  return v164;
}

- (id)getAutogenLogCopyingContainers
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
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  char **v127;
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
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283;
  void *v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  id v315;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  void *v322;
  void *v323;
  void *v324;
  void *v325;
  void *v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  _QWORD v333[2];
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  _QWORD v350[2];
  void *v351;
  void *v352;
  void *v353;
  _QWORD v354[2];
  void *v355;
  void *v356;
  void *v357;
  _QWORD v358[2];
  void *v359;
  void *v360;
  _QWORD v361[8];
  _QWORD v362[2];
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  _QWORD v367[2];
  _QWORD v368[2];
  void *v369;
  void *v370;
  _QWORD v371[2];
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  _QWORD v378[3];
  _QWORD v379[2];
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  _QWORD v386[2];
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *v391;
  void *v392;
  void *v393;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MSU"), CFSTR("logs/MSU"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABDE0));
    v393 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v393, 1));
    objc_msgSend(v5, "addRules:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Mobile Demo"), CFSTR("logs/MobileDemo"), self));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setRuntimeChecks:", 8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/logs/MobileDemo/*.log")));
    v392 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v392, 1));
    objc_msgSend(v9, "addRules:", v11);

    objc_msgSend(v3, "addObject:", v9);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("UARP Packet Capture"), CFSTR("logs"), self));
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "setRuntimeChecks:", 9);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/tmp/com.apple.locationd/hawkeyeUARPPacketCapture.pcap")));
    v391 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v391, 1));
    objc_msgSend(v13, "addRules:", v15);

    objc_msgSend(v3, "addObject:", v13);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MobileKeybagLogs"), CFSTR("logs/MobileKeybag"), self));
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "setRuntimeChecks:", 9);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/logs/keybagd.log.*")));
    v390 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v390, 1));
    objc_msgSend(v17, "addRules:", v19);

    objc_msgSend(v3, "addObject:", v17);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("usermanagerd logs"), CFSTR("logs/UserManagement"), self));
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "setRuntimeChecks:", 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/logs/usermanagerd*.log*")));
    v389 = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v389, 1));
    objc_msgSend(v21, "addRules:", v23);

    objc_msgSend(v3, "addObject:", v21);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MailErrorConditions"), CFSTR("logs/MailErrorConditions"), self));
  v25 = v24;
  if (v24)
  {
    objc_msgSend(v24, "setRuntimeChecks:", 9);
    objc_msgSend(v25, "setMaximumSizeMB:", 30);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/CoreAnimation/mailspin*tailspin")));
    v388 = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v388, 1));
    objc_msgSend(v25, "addRules:", v27);

    objc_msgSend(v3, "addObject:", v25);
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("keyboard cache"), CFSTR("logs/keyboards"), self));
  v29 = v28;
  if (v28)
  {
    objc_msgSend(v28, "setRuntimeChecks:", 8);
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABDF8));
    v387 = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v387, 1));
    objc_msgSend(v29, "addRules:", v31);

    objc_msgSend(v3, "addObject:", v29);
  }

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("BatteryBDC"), CFSTR("logs/BatteryBDC"), self));
  v33 = v32;
  if (v32)
  {
    objc_msgSend(v32, "setRuntimeChecks:", 8);
    objc_msgSend(v33, "setMaximumSizeMB:", 13);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABE10));
    v386[0] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/db/Battery/BDC")));
    v386[1] = v35;
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v386, 2));
    objc_msgSend(v33, "addRules:", v36);

    objc_msgSend(v3, "addObject:", v33);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("AppSupport"), CFSTR("logs/AppSupport"), self));
  v38 = v37;
  if (v37)
  {
    objc_msgSend(v37, "setRuntimeChecks:", 8);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABE28));
    v385 = v39;
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v385, 1));
    objc_msgSend(v38, "addRules:", v40);

    objc_msgSend(v3, "addObject:", v38);
  }

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MediaserverdBlockageTailspins"), CFSTR("logs/mediaserverd"), self));
  v42 = v41;
  if (v41)
  {
    objc_msgSend(v41, "setRuntimeChecks:", 9);
    objc_msgSend(v42, "setMaximumSizeMB:", 25);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "dateByAddingTimeInterval:", -21600.0));
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/{mediaserverd,mediaparserd,audiomxd,mediaplaybackd,videocodecd,cameracaptured,deferredmediad,airplayd,avconferenced}_blockage_*.tailspin"), v44, 0, 1, 0, 1));
    v384 = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v384, 1));
    objc_msgSend(v42, "addRules:", v46);

    objc_msgSend(v3, "addObject:", v42);
  }

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("AVConference"), CFSTR("logs/AVConference"), self));
  v48 = v47;
  if (v47)
  {
    objc_msgSend(v47, "setRuntimeChecks:", 8);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Caches/com.apple.VideoConference/logs/")));
    v383 = v49;
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v383, 1));
    objc_msgSend(v48, "addRules:", v50);

    objc_msgSend(v3, "addObject:", v48);
  }

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("avconferenced-embedded"), CFSTR("logs/AVConference"), self));
  v52 = v51;
  if (v51)
  {
    objc_msgSend(v51, "setRuntimeChecks:", 9);
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/avconferenced.*.spindump.txt.gz")));
    v382 = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v382, 1));
    objc_msgSend(v52, "addRules:", v54);

    objc_msgSend(v3, "addObject:", v52);
  }

  v55 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("NSURLSession logs"), CFSTR("logs/NSURLSessiond"), self));
  v56 = v55;
  if (v55)
  {
    objc_msgSend(v55, "setRuntimeChecks:", 9);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/com.apple.nsurlsessiond")));
    v381 = v57;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v381, 1));
    objc_msgSend(v56, "addRules:", v58);

    objc_msgSend(v3, "addObject:", v56);
  }

  v59 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("CMCaptureTailspins"), CFSTR("logs/CMCaptureTailspins"), self));
  v60 = v59;
  if (v59)
  {
    objc_msgSend(v59, "setRuntimeChecks:", 9);
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/tmp/CMCaptureTailspins")));
    v380 = v61;
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v380, 1));
    objc_msgSend(v60, "addRules:", v62);

    objc_msgSend(v3, "addObject:", v60);
  }

  v63 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Panics"), CFSTR("crashes_and_spins/Panics"), self));
  v64 = v63;
  if (v63)
  {
    objc_msgSend(v63, "setRuntimeChecks:", 8);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/panic-*.ips")));
    v379[0] = v65;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/Retired/panic-*.ips")));
    v379[1] = v66;
    v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v379, 2));
    objc_msgSend(v64, "addRules:", v67);

    objc_msgSend(v3, "addObject:", v64);
  }

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("stackshots"), CFSTR("crashes_and_spins"), self));
  v69 = v68;
  v323 = v3;
  if (v68)
  {
    objc_msgSend(v68, "setRuntimeChecks:", 8);
    objc_msgSend(v69, "setMaximumSizeMB:", 0);
    v321 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v319 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v321, "dateByAddingTimeInterval:", -30.0));
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/logs/CrashReporter/stacks-*"), v319, 0, 0, 0, 0));
    v378[0] = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "dateByAddingTimeInterval:", -30.0));
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/stacks-*"), v72, 0, 0, 0, 0));
    v378[1] = v73;
    v74 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "dateByAddingTimeInterval:", -30.0));
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/Retired/stacks-*"), v75, 0, 0, 0, 0));
    v378[2] = v76;
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v378, 3));
    objc_msgSend(v69, "addRules:", v77);

    v3 = v323;
    objc_msgSend(v323, "addObject:", v69);
  }

  v78 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("BluetoothAccessory"), CFSTR("logs/Bluetooth"), self));
  v79 = v78;
  if (v78)
  {
    objc_msgSend(v78, "setRuntimeChecks:", 9);
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABE40));
    v377 = v80;
    v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v377, 1));
    objc_msgSend(v79, "addRules:", v81);

    objc_msgSend(v3, "addObject:", v79);
  }

  v82 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("BluetoothCoreDump"), CFSTR("logs/Bluetooth/CoreDump"), self));
  v83 = v82;
  if (v82)
  {
    objc_msgSend(v82, "setRuntimeChecks:", 9);
    v84 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/Bluetooth/bluetoothd-FWCOREDUMP*log")));
    v376 = v84;
    v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v376, 1));
    objc_msgSend(v83, "addRules:", v85);

    objc_msgSend(v3, "addObject:", v83);
  }

  v86 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("HCI"), CFSTR("logs/Bluetooth"), self));
  v87 = v86;
  if (v86)
  {
    objc_msgSend(v86, "setRuntimeChecks:", 8);
    objc_msgSend(v87, "setMaximumSizeMB:", 10);
    v88 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/Bluetooth/bluetoothd-hci*.pklg"), 0, 0, 2, 0, 0));
    v375 = v88;
    v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v375, 1));
    objc_msgSend(v87, "addRules:", v89);

    objc_msgSend(v3, "addObject:", v87);
  }

  v90 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("DataMigration"), CFSTR("logs/DataMigration"), self));
  v91 = v90;
  if (v90)
  {
    objc_msgSend(v90, "setRuntimeChecks:", 9);
    v92 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/DataMigration"), 0, 0, 0, 1, 0, 0));
    v374 = v92;
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v374, 1));
    objc_msgSend(v91, "addRules:", v93);

    objc_msgSend(v3, "addObject:", v91);
  }

  v94 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MobileLockdown"), CFSTR("logs/MobileLockdown"), self));
  v95 = v94;
  if (v94)
  {
    objc_msgSend(v94, "setRuntimeChecks:", 8);
    v96 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/logs/lockdownd.log*")));
    v373 = v96;
    v97 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v373, 1));
    objc_msgSend(v95, "addRules:", v97);

    objc_msgSend(v3, "addObject:", v95);
  }

  v98 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("CoreLocation"), CFSTR("logs/CoreLocation"), self));
  v99 = v98;
  if (v98)
  {
    objc_msgSend(v98, "setRuntimeChecks:", 9);
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABE58));
    v372 = v100;
    v101 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v372, 1));
    objc_msgSend(v99, "addRules:", v101);

    objc_msgSend(v3, "addObject:", v99);
  }

  v102 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("syslog"), CFSTR("logs/system"), self));
  v103 = v102;
  if (v102)
  {
    objc_msgSend(v102, "setRuntimeChecks:", 9);
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/db/diagnostics/system.log{,.[01].gz}")));
    v371[0] = v104;
    v105 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/db/diagnostics/system{,.[01]}.log{,.gz}")));
    v371[1] = v105;
    v106 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v371, 2));
    objc_msgSend(v103, "addRules:", v106);

    objc_msgSend(v3, "addObject:", v103);
  }

  v107 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Networking"), CFSTR("logs/Networking"), self));
  v108 = v107;
  if (v107)
  {
    objc_msgSend(v107, "setRuntimeChecks:", 8);
    v109 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABE70));
    v370 = v109;
    v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v370, 1));
    objc_msgSend(v108, "addRules:", v110);

    objc_msgSend(v3, "addObject:", v108);
  }

  v111 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("FindMyDevice"), CFSTR("logs/FindMyDevice"), self));
  v112 = v111;
  if (v111)
  {
    objc_msgSend(v111, "setRuntimeChecks:", 9);
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/tmp/findmydeviced-sysdiagnose")));
    v369 = v113;
    v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v369, 1));
    objc_msgSend(v112, "addRules:", v114);

    objc_msgSend(v3, "addObject:", v112);
  }

  v115 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("itunesstored"), CFSTR("logs/itunesstored"), self));
  v116 = v115;
  if (v115)
  {
    objc_msgSend(v115, "setRuntimeChecks:", 8);
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABE88));
    v368[0] = v117;
    v118 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/com.apple.itunesstored"), 0, 0, 0, 0, CFSTR("com.apple.itunesstored"), 0));
    v368[1] = v118;
    v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v368, 2));
    objc_msgSend(v116, "addRules:", v119);

    objc_msgSend(v3, "addObject:", v116);
  }

  v120 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("OTA"), CFSTR("logs/OTA"), self));
  v121 = v120;
  if (v120)
  {
    objc_msgSend(v120, "setRuntimeChecks:", 9);
    v122 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABEA0));
    v367[0] = v122;
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/SoftwareUpdateServices.log*"), 0, 0, 3, 0, 0));
    v367[1] = v123;
    v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v367, 2));
    objc_msgSend(v121, "addRules:", v124);

    objc_msgSend(v3, "addObject:", v121);
  }

  v125 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("LaunchServices"), CFSTR("logs/LaunchServices"), self));
  v126 = v125;
  v127 = &selRef_vibrateStart;
  if (v125)
  {
    objc_msgSend(v125, "setRuntimeChecks:", 8);
    v128 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/LaunchServices")));
    v366 = v128;
    v129 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v366, 1));
    objc_msgSend(v126, "addRules:", v129);

    objc_msgSend(v3, "addObject:", v126);
  }

  v130 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("AppConduit"), CFSTR("logs/AppConduit"), self));
  v131 = v130;
  if (v130)
  {
    objc_msgSend(v130, "setRuntimeChecks:", 8);
    v132 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/AppConduit/AppConduit.log.[0-4]")));
    v365 = v132;
    v133 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v365, 1));
    objc_msgSend(v131, "addRules:", v133);

    objc_msgSend(v3, "addObject:", v131);
  }

  v134 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Accounts"), CFSTR("logs/Accounts"), self));
  v135 = v134;
  if (v134)
  {
    objc_msgSend(v134, "setRuntimeChecks:", 8);
    v136 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Accounts")));
    v364 = v136;
    v137 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v364, 1));
    objc_msgSend(v135, "addRules:", v137);

    objc_msgSend(v3, "addObject:", v135);
  }

  v138 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Harmony"), CFSTR("/logs/harmony"), self));
  v139 = v138;
  if (v138)
  {
    objc_msgSend(v138, "setRuntimeChecks:", 9);
    v140 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/harmony/*.csv"), 0, 0, 5, 0, 0));
    v363 = v140;
    v141 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v363, 1));
    objc_msgSend(v139, "addRules:", v141);

    objc_msgSend(v3, "addObject:", v139);
  }

  v142 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Contacts"), CFSTR("logs"), self));
  v143 = v142;
  if (v142)
  {
    objc_msgSend(v142, "setRuntimeChecks:", 9);
    v144 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/com.apple.AddressBook*"), 0, 0, 0, CFSTR("Contacts"), 0));
    v362[0] = v144;
    v145 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/DataAccess/CardDAVHTTPTraffic*"), 0, 0, 0, CFSTR("DataAccess"), 0));
    v362[1] = v145;
    v146 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v362, 2));
    objc_msgSend(v143, "addRules:", v146);

    v127 = &selRef_vibrateStart;
    objc_msgSend(v3, "addObject:", v143);
  }

  v147 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Burnin"), CFSTR("logs/Burnin"), self));
  v148 = v147;
  if (v147)
  {
    objc_msgSend(v147, "setRuntimeChecks:", 11);
    objc_msgSend(v148, "setMaximumSizeMB:", 0);
    v322 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABEB8));
    v361[0] = v322;
    v320 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/logs/BurnIn")));
    v361[1] = v320;
    v318 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/logs/Earthbound"), 0, 0, 0, 0, CFSTR("Earthbound"), 0));
    v361[2] = v318;
    v317 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/logs/AppleSupport"), 0, 0, 0, 0, CFSTR("AppleSupport"), 0));
    v361[3] = v317;
    v149 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/db/Earthbound"), 0, 0, 0, 0, CFSTR("Earthbound/db"), 0));
    v361[4] = v149;
    v150 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/AppleInternal/Diags/Logs"), 0, 0, 0, 0, CFSTR("AppleInternal/Diags"), 0));
    v361[5] = v150;
    v151 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("NOT SELF contains %@"), v151));
    v153 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), 0, 0, v152, 0, CFSTR("mobile/Library/CrashReporter"), 0));
    v361[6] = v153;
    v154 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/logs/CrashReporter"), 0, 0, 0, 0, CFSTR("CrashReporter"), 0));
    v361[7] = v154;
    v155 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v361, 8));
    objc_msgSend(v148, "addRules:", v155);

    v127 = &selRef_vibrateStart;
    v3 = v323;

    objc_msgSend(v323, "addObject:", v148);
  }

  v156 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Buddy"), CFSTR("logs/Buddy"), self));
  v157 = v156;
  if (v156)
  {
    objc_msgSend(v156, "setRuntimeChecks:", 9);
    v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Buddy_*")));
    v360 = v158;
    v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v360, 1));
    objc_msgSend(v157, "addRules:", v159);

    objc_msgSend(v3, "addObject:", v157);
  }

  v160 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("ProtectedCloudStorage"), CFSTR("logs/ProtectedCloudStorage"), self));
  v161 = v160;
  if (v160)
  {
    objc_msgSend(v160, "setRuntimeChecks:", 8);
    v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ProtectedCloudStorage*.log")));
    v359 = v162;
    v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v359, 1));
    objc_msgSend(v161, "addRules:", v163);

    objc_msgSend(v3, "addObject:", v161);
  }

  v164 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MobileBackup"), CFSTR("logs/MobileBackup"), self));
  v165 = v164;
  if (v164)
  {
    objc_msgSend(v164, "setRuntimeChecks:", 8);
    v166 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABED0));
    v358[0] = v166;
    v167 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogPathArray, "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", &off_1000ABEE8, 0, 0, 0, 0, 1));
    v358[1] = v167;
    v168 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v358, 2));
    objc_msgSend(v165, "addRules:", v168);

    v127 = &selRef_vibrateStart;
    objc_msgSend(v3, "addObject:", v165);
  }

  v169 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("NanoRegistry"), CFSTR("logs/NanoRegistry"), self));
  v170 = v169;
  if (v169)
  {
    objc_msgSend(v169, "setRuntimeChecks:", 9);
    v171 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABF00));
    v357 = v171;
    v172 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v357, 1));
    objc_msgSend(v170, "addRules:", v172);

    objc_msgSend(v3, "addObject:", v170);
  }

  v173 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("ATVUpdateLog"), CFSTR("logs/ATVUpdateLog"), self));
  v174 = v173;
  if (v173)
  {
    objc_msgSend(v173, "setRuntimeChecks:", 8);
    v175 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABF18));
    v356 = v175;
    v176 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v356, 1));
    objc_msgSend(v174, "addRules:", v176);

    objc_msgSend(v3, "addObject:", v174);
  }

  v177 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("SUInfo"), CFSTR("logs"), self));
  v178 = v177;
  if (v177)
  {
    objc_msgSend(v177, "setRuntimeChecks:", 9);
    v179 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABF30));
    v355 = v179;
    v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v355, 1));
    objc_msgSend(v178, "addRules:", v180);

    objc_msgSend(v3, "addObject:", v178);
  }

  v181 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("demod"), CFSTR("logs/demod"), self));
  v182 = v181;
  if (v181)
  {
    objc_msgSend(v181, "setRuntimeChecks:", 8);
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:", CFSTR("/private/var/logs/demod/demod-*")));
    v354[0] = v183;
    v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:", CFSTR("/private/var/logs/demod/demod_helper-*")));
    v354[1] = v184;
    v185 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v354, 2));
    objc_msgSend(v182, "addRules:", v185);

    v127 = &selRef_vibrateStart;
    objc_msgSend(v3, "addObject:", v182);
  }

  v186 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("WatchConnectivity"), CFSTR("logs/WatchConnectivity"), self));
  v187 = v186;
  if (v186)
  {
    objc_msgSend(v186, "setRuntimeChecks:", 8);
    v188 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/WatchConnectivity"), 0, 0, 0, 10, 0, 0));
    v353 = v188;
    v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v353, 1));
    objc_msgSend(v187, "addRules:", v189);

    objc_msgSend(v3, "addObject:", v187);
  }

  v190 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("coremediacapture-afdebug"), CFSTR("logs/coremediacapture"), self));
  v191 = v190;
  if (v190)
  {
    objc_msgSend(v190, "setRuntimeChecks:", 9);
    v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/mediaserverd-capture-NOT-A-CRASH.afdebug-[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9].txt")));
    v352 = v192;
    v193 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v352, 1));
    objc_msgSend(v191, "addRules:", v193);

    objc_msgSend(v3, "addObject:", v191);
  }

  v194 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("BridgeActivation"), CFSTR("logs/BridgeActivation"), self));
  v195 = v194;
  if (v194)
  {
    objc_msgSend(v194, "setRuntimeChecks:", 9);
    v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Re[quest\\|sponse]*.txt")));
    v351 = v196;
    v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v351, 1));
    objc_msgSend(v195, "addRules:", v197);

    objc_msgSend(v3, "addObject:", v195);
  }

  v198 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("BridgeReporting"), CFSTR("logs/BridgeReporting"), self));
  v199 = v198;
  if (v198)
  {
    objc_msgSend(v198, "setRuntimeChecks:", 9);
    v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric/pairing_metric*/*MetricDetails.plist"), 0, 0, 10, CFSTR("MostRecent"), 0));
    v350[0] = v200;
    v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Caches/com.apple.Bridge/PairingMetric/Archived/pairing_metric*.plist"), 0, 0, 10, CFSTR("Archived"), 0));
    v350[1] = v201;
    v202 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v350, 2));
    objc_msgSend(v199, "addRules:", v202);

    v127 = &selRef_vibrateStart;
    objc_msgSend(v3, "addObject:", v199);
  }

  v203 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("HomePodSetUp"), CFSTR("logs/HomePodSetUp"), self));
  v204 = v203;
  if (v203)
  {
    objc_msgSend(v203, "setRuntimeChecks:", 9);
    v205 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/com.apple.HomePodLEDPairingData*.bin")));
    v349 = v205;
    v206 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v349, 1));
    objc_msgSend(v204, "addRules:", v206);

    objc_msgSend(v3, "addObject:", v204);
  }

  v207 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Frametracer"), CFSTR("logs/Frametracer"), self));
  v208 = v207;
  if (v207)
  {
    objc_msgSend(v207, "setRuntimeChecks:", 9);
    v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/CoreAnimation/*tailspin")));
    v348 = v209;
    v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v348, 1));
    objc_msgSend(v208, "addRules:", v210);

    objc_msgSend(v3, "addObject:", v208);
  }

  v211 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MatchTailspins"), CFSTR("logs/MatchTailspins"), self));
  v212 = v211;
  if (v211)
  {
    objc_msgSend(v211, "setRuntimeChecks:", 9);
    v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127 + 347, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/BioLog/BL*/*seq/*tailspin"), 0, 0, 10, 0, 0));
    v347 = v213;
    v214 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v347, 1));
    objc_msgSend(v212, "addRules:", v214);

    objc_msgSend(v3, "addObject:", v212);
  }

  v215 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("ForceResetTailspins"), CFSTR("logs/ForceResetTailspins"), self));
  v216 = v215;
  if (v215)
  {
    objc_msgSend(v215, "setRuntimeChecks:", 8);
    v217 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins")));
    v346 = v217;
    v218 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v346, 1));
    objc_msgSend(v216, "addRules:", v218);

    objc_msgSend(v3, "addObject:", v216);
  }

  v219 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("TetheredRestore"), CFSTR("logs/TetheredRestore"), self));
  v220 = v219;
  if (v219)
  {
    objc_msgSend(v219, "setRuntimeChecks:", 9);
    v221 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABF48));
    v345 = v221;
    v222 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v345, 1));
    objc_msgSend(v220, "addRules:", v222);

    objc_msgSend(v3, "addObject:", v220);
  }

  v223 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MobileObliteration"), CFSTR("logs/MobileObliteration"), self));
  v224 = v223;
  if (v223)
  {
    objc_msgSend(v223, "setRuntimeChecks:", 9);
    v225 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v225, "dateByAddingTimeInterval:", -432000.0));
    v227 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogPathArray, "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", &off_1000ABF60, v226, 0, 0, 0, 0));
    v344 = v227;
    v228 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v344, 1));
    objc_msgSend(v224, "addRules:", v228);

    v127 = &selRef_vibrateStart;
    objc_msgSend(v3, "addObject:", v224);
  }

  v229 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("OTAUpdateLogs"), CFSTR("logs/OTAUpdateLogs"), self));
  v230 = v229;
  if (v229)
  {
    objc_msgSend(v229, "setRuntimeChecks:", 8);
    v231 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABF78));
    v343 = v231;
    v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v343, 1));
    objc_msgSend(v230, "addRules:", v232);

    objc_msgSend(v3, "addObject:", v230);
  }

  v233 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("CommandAndControl"), CFSTR("logs/AccessibilityPrefs"), self));
  v234 = v233;
  if (v233)
  {
    objc_msgSend(v233, "setRuntimeChecks:", 8);
    v235 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABF90));
    v342 = v235;
    v236 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v342, 1));
    objc_msgSend(v234, "addRules:", v236);

    objc_msgSend(v3, "addObject:", v234);
  }

  v237 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("SiriTextToSpeech"), CFSTR("logs/SiriTextToSpeech"), self));
  v238 = v237;
  if (v237)
  {
    objc_msgSend(v237, "setRuntimeChecks:", 9);
    v239 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/SiriTTS_AudioDump")));
    v341 = v239;
    v240 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v341, 1));
    objc_msgSend(v238, "addRules:", v240);

    objc_msgSend(v3, "addObject:", v238);
  }

  v241 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("LivabilityApp"), CFSTR("logs/LivabilityApp"), self));
  v242 = v241;
  if (v241)
  {
    objc_msgSend(v241, "setRuntimeChecks:", 9);
    v243 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.Livability.plist")));
    v340 = v243;
    v244 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v340, 1));
    objc_msgSend(v242, "addRules:", v244);

    objc_msgSend(v3, "addObject:", v242);
  }

  v245 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MobileSlideShow"), CFSTR("logs/MobileSlideShow"), self));
  v246 = v245;
  if (v245)
  {
    objc_msgSend(v245, "setRuntimeChecks:", 9);
    v247 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.mobileslideshow.plist")));
    v339 = v247;
    v248 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v339, 1));
    objc_msgSend(v246, "addRules:", v248);

    objc_msgSend(v3, "addObject:", v246);
  }

  v249 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("AlishaLogs"), CFSTR("logs/AlishaLogs"), self));
  v250 = v249;
  if (v249)
  {
    objc_msgSend(v249, "setRuntimeChecks:", 9);
    v251 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABFA8));
    v338 = v251;
    v252 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v338, 1));
    objc_msgSend(v250, "addRules:", v252);

    objc_msgSend(v3, "addObject:", v250);
  }

  v253 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MobileStoreDemo"), CFSTR("logs/MobileStoreDemo"), self));
  v254 = v253;
  if (v253)
  {
    objc_msgSend(v253, "setRuntimeChecks:", 8);
    v255 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABFC0));
    v337 = v255;
    v256 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v337, 1));
    objc_msgSend(v254, "addRules:", v256);

    objc_msgSend(v3, "addObject:", v254);
  }

  v257 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("SleepCycler"), CFSTR("logs/SleepCycler"), self));
  v258 = v257;
  if (v257)
  {
    objc_msgSend(v257, "setRuntimeChecks:", 9);
    v259 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABFD8));
    v336 = v259;
    v260 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v336, 1));
    objc_msgSend(v258, "addRules:", v260);

    objc_msgSend(v3, "addObject:", v258);
  }

  v261 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Resource Exhaustion"), CFSTR("resource_exhaustion"), self));
  v262 = v261;
  if (v261)
  {
    objc_msgSend(v261, "setRuntimeChecks:", 9);
    v263 = v127 + 347;
    v264 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v265 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v264, "dateByAddingTimeInterval:", -3600.0));
    v266 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v263, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/db/spindump/Exhaustion*"), v265, 0, 0, 0, 0));
    v335 = v266;
    v267 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v335, 1));
    objc_msgSend(v262, "addRules:", v267);

    objc_msgSend(v3, "addObject:", v262);
  }

  v268 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("SystemVersion"), CFSTR("logs/SystemVersion"), self));
  v269 = v268;
  if (v268)
  {
    objc_msgSend(v268, "setRuntimeChecks:", 8);
    v270 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ABFF0));
    v334 = v270;
    v271 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v334, 1));
    objc_msgSend(v269, "addRules:", v271);

    objc_msgSend(v3, "addObject:", v269);
  }

  v272 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Recoverylogd"), CFSTR("logs/recoverylogd"), self));
  v273 = v272;
  if (v272)
  {
    objc_msgSend(v272, "setRuntimeChecks:", 8);
    v274 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/recoverylogd")));
    v333[0] = v274;
    v275 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/System/Volumes/Hardware/recoverylogd")));
    v333[1] = v275;
    v276 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v333, 2));
    objc_msgSend(v273, "addRules:", v276);

    objc_msgSend(v3, "addObject:", v273);
  }

  v277 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("RunningBoard"), CFSTR("logs/RunningBoard"), self));
  v278 = v277;
  if (v277)
  {
    objc_msgSend(v277, "setRuntimeChecks:", 9);
    objc_msgSend(v278, "setMaximumSizeMB:", 10);
    v279 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/tmp/com.apple.runningboardd/ts-*.tailspin")));
    v332 = v279;
    v280 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v332, 1));
    objc_msgSend(v278, "addRules:", v280);

    objc_msgSend(v3, "addObject:", v278);
  }

  v281 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("CacheDeleteHistory"), CFSTR("logs/CacheDelete"), self));
  v282 = v281;
  if (v281)
  {
    objc_msgSend(v281, "setRuntimeChecks:", 8);
    objc_msgSend(v282, "setMaximumSizeMB:", 10);
    v283 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC008));
    v331 = v283;
    v284 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v331, 1));
    objc_msgSend(v282, "addRules:", v284);

    objc_msgSend(v3, "addObject:", v282);
  }

  v285 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("SpaceAttributionTelemetry"), CFSTR("logs/SpaceAttribution"), self));
  v286 = v285;
  if (v285)
  {
    objc_msgSend(v285, "setRuntimeChecks:", 9);
    objc_msgSend(v286, "setMaximumSizeMB:", 2);
    v287 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC020));
    v330 = v287;
    v288 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v330, 1));
    objc_msgSend(v286, "addRules:", v288);

    objc_msgSend(v3, "addObject:", v286);
  }

  v289 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("AUDeveloperSettings"), CFSTR("logs/AUDeveloperSettings"), self));
  v290 = v289;
  if (v289)
  {
    objc_msgSend(v289, "setRuntimeChecks:", 9);
    objc_msgSend(v290, "setMaximumSizeMB:", 1);
    v291 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC038));
    v329 = v291;
    v292 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v329, 1));
    objc_msgSend(v290, "addRules:", v292);

    objc_msgSend(v3, "addObject:", v290);
  }

  v293 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("copySpringBoardStateDump"), CFSTR("logs/SpringBoard"), self));
  v294 = v293;
  if (v293)
  {
    objc_msgSend(v293, "setRuntimeChecks:", 9);
    objc_msgSend(v294, "setMaximumSizeMB:", 1);
    v295 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC050));
    v328 = v295;
    v296 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v328, 1));
    objc_msgSend(v294, "addRules:", v296);

    objc_msgSend(v3, "addObject:", v294);
  }

  v297 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("WindowServerHangs"), CFSTR("logs/WindowServer"), self));
  v298 = v297;
  if (v297)
  {
    objc_msgSend(v297, "setRuntimeChecks:", 9);
    objc_msgSend(v298, "setMaximumSizeMB:", 50);
    v299 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v300 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v299, "dateByAddingTimeInterval:", -1800.0));
    v301 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/Library/Logs/WindowServer"), 0, v300, 0, 0, 0, 0));
    v327 = v301;
    v302 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v327, 1));
    objc_msgSend(v298, "addRules:", v302);

    objc_msgSend(v3, "addObject:", v298);
  }

  v303 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("UARPEndpointPacketCaptures"), CFSTR("logs/UARPEndpointPacketCaptures"), self));
  v304 = v303;
  if (v303)
  {
    objc_msgSend(v303, "setRuntimeChecks:", 8);
    objc_msgSend(v304, "setMaximumSizeMB:", 10);
    v305 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/db/accessoryupdater/uarp/pcapfiles")));
    v326 = v305;
    v306 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v326, 1));
    objc_msgSend(v304, "addRules:", v306);

    objc_msgSend(v3, "addObject:", v304);
  }

  v307 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("DarwinInit"), CFSTR("logs/DarwinInit"), self));
  v308 = v307;
  if (v307)
  {
    objc_msgSend(v307, "setRuntimeChecks:", 8200);
    objc_msgSend(v308, "setMaximumSizeMB:", 1);
    v309 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC068));
    v325 = v309;
    v310 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v325, 1));
    objc_msgSend(v308, "addRules:", v310);

    objc_msgSend(v3, "addObject:", v308);
  }

  v311 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("AirPodPowerMetrics"), CFSTR("logs/AirPodPowerMetrics"), self));
  v312 = v311;
  if (v311)
  {
    objc_msgSend(v311, "setRuntimeChecks:", 8);
    objc_msgSend(v312, "setMaximumSizeMB:", 1);
    v313 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/db/accessoryupdater/uarp/sysdiagnose/com.apple.Bluetooth.AccessoryCase.pif_daily")));
    v324 = v313;
    v314 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v324, 1));
    objc_msgSend(v312, "addRules:", v314);

    objc_msgSend(v3, "addObject:", v312);
  }

  v315 = v3;
  return v315;
}

- (void)TSProcessSpecific_preprocess:(id)a3
{
  unsigned int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void **v28;
  uint64_t v29;
  char *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  unsigned int v46;
  __CFString *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void **v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  void *v64;
  uint64_t v65;
  SystemDiagnostic *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[3];
  _QWORD v84[4];
  _QWORD v85[4];
  uint8_t buf[4];
  unint64_t v87;
  void *v88;
  _BYTE v89[128];

  v60 = a3;
  v4 = -[SystemDiagnostic requestSource](self, "requestSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    if (-[SystemDiagnostic quickMode](self, "quickMode")
      || -[SystemDiagnostic requestSource](self, "requestSource") == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("-v"), CFSTR("-w"), 0));
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v78 != v11)
              objc_enumerationMutation(v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i), "stringValue"));
            objc_msgSend(v7, "addObject:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        }
        while (v10);
      }

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("process footprint"), 0, 0, self, 25.0));
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, "setRuntimeChecks:", 32);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/footprint"), v7, CFSTR("footprint.txt")));
        v88 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1));
        objc_msgSend(v15, "addSDTasksToContainer:", v17);

        objc_msgSend(v60, "addObject:", v15);
      }

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    v19 = (unint64_t)objc_msgSend(v18, "count");
    v20 = v19 >> 2;

    v21 = v19 & 0xFFFFFFFFFFFFFFFCLL;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    v23 = objc_msgSend(v22, "count");

    if (v21 >= (unint64_t)v23)
      v24 = v20;
    else
      v24 = v20 + 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v87 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Number of process specific time-sensitive groups: %lu", buf, 0xCu);
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v25, "log:", CFSTR("Number of process specific time-sensitive groups: %lu"), v24);

    if (v24)
    {
      v26 = 0;
      v27 = 30;
      if (v4 == 2)
        v27 = 120;
      v61 = v27;
      v28 = (void **)&AnalyticsSendEventLazy_ptr;
      v66 = self;
      v62 = v24;
      do
      {
        v29 = (4 * v26);
        v30 = (char *)(v29 + 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
        v32 = objc_msgSend(v31, "count");

        if (v29 + 4 > (unint64_t)v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
          v30 = (char *)objc_msgSend(v33, "count");

        }
        v67 = (unint64_t)v30;
        v63 = &v30[-v29];
        v65 = v26 + 1;
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28[84], "stringWithFormat:", CFSTR("Process specific container group: %d"), v26 + 1));
        v34 = &__NSArray0__struct;
        do
        {
          v35 = v34;
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "objectAtIndex:", v29));
          v38 = objc_msgSend(v37, "intValue");

          v39 = objc_claimAutoreleasedReturnValue(objc_msgSend(v28[84], "stringWithFormat:", CFSTR("%d"), v38));
          v40 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
          v75 = v29;
          v76 = v35;
          if (v40
            && (v41 = (void *)v40,
                v42 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices")),
                v43 = objc_msgSend(v42, "count"),
                v42,
                v41,
                v43))
          {
            v44 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndex:", v29));
            v46 = objc_msgSend(v45, "intValue");

            v47 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_10009DC10, "stringByAppendingFormat:", CFSTR("%s"), (char *)-[SystemDiagnostic processes](self, "processes") + 136 * (int)v46 + 48));
          }
          else
          {
            v47 = &stru_10009DC10;
          }
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28[84], "stringWithFormat:", CFSTR("<TMPOUTPUTDIR>/graph-%d-%@.memgraph"), v38, v47));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28[84], "stringWithFormat:", CFSTR("errors/leaks_ts_%d_errors.txt"), v38));
          v84[0] = CFSTR("-outputGraph");
          v84[1] = v74;
          v84[2] = v39;
          v84[3] = CFSTR("-forkCorpse");
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 4));
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/leaks"), v72, v73));
          v85[0] = v71;
          v83[0] = CFSTR("-v");
          v83[1] = CFSTR("-k");
          v83[2] = v39;
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 3));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28[84], "stringWithFormat:", CFSTR("ddt-%u-%@.txt"), v38, v47));
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/ddt"), v69, v68, 1));
          v85[1] = v48;
          v82[0] = CFSTR("procinfo");
          v82[1] = v39;
          v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 2));
          v50 = v39;
          v70 = (void *)v39;
          v51 = v28;
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28[84], "stringWithFormat:", CFSTR("launchctl-procinfo-%u-%@.txt"), v38, v47));
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/launchctl"), v49, v52));
          v85[2] = v53;
          v81[0] = CFSTR("dump-concurrency");
          v81[1] = v50;
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 2));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51[84], "stringWithFormat:", CFSTR("swift-inspect-%u-%@.txt"), v38, v47));
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/swift-inspect"), v54, v55));
          v85[3] = v56;
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 4));

          v28 = v51;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "arrayByAddingObjectsFromArray:", v57));

          v29 = v75 + 1;
          self = v66;
        }
        while (v75 + 1 < v67);
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:", v34, &__NSArray0__struct, &stru_10009DC10, v66, 1, (double)(unint64_t)((_QWORD)v63 * v61)));
        v59 = v58;
        if (v58)
        {
          objc_msgSend(v58, "setName:", v64);
          objc_msgSend(v60, "addObject:", v59);
        }

        v26 = v65;
      }
      while (v65 != v62);
    }
  }

}

- (void)filecoordination_postprocess:(id)a3 withContainerArray:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionContainer"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionContainer"));
      objc_msgSend(v7, "setDestination:", 0);

    }
  }

}

- (void)footprintAll_postprocess:(id)a3 withContainerArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint8_t v9[16];

  v6 = a3;
  v7 = a4;
  if (-[SystemDiagnostic quickMode](self, "quickMode") || -[SystemDiagnostic requestSource](self, "requestSource") == 1)
  {
    if (v6)
      objc_msgSend(v7, "removeObject:", v6);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Creating footprint...", v9, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "log:", CFSTR("Creating footprint..."));

  }
}

- (void)systemInfoTimeSensitive_postprocess:(id)a3 withContainerArray:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/kbdebug"), 0, CFSTR("kbdebug.txt")));
    v7 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    objc_msgSend(v4, "addSDTasksToContainer:", v6);

  }
}

- (id)_iOSgetLogCopyingContainers
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getCrashesAndSpinsContainer](self, "_getCrashesAndSpinsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = -[SystemDiagnostic _copyOnDemandDaemonLogsContainer](self, "_copyOnDemandDaemonLogsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = -[SystemDiagnostic _copyVideoProcessingLogs](self, "_copyVideoProcessingLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = -[SystemDiagnostic _copyThermalLogs](self, "_copyThermalLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = -[SystemDiagnostic copyCoreaudioReportingLogs](self, "copyCoreaudioReportingLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  v9 = -[SystemDiagnostic _copyAccessibilityPreferences](self, "_copyAccessibilityPreferences");
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  v10 = -[SystemDiagnostic _copyAstroLogsContainer](self, "_copyAstroLogsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getMapsSyncJournalContainer](self, "_getMapsSyncJournalContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v12 = -[SystemDiagnostic _copyCompanionSyncContainer](self, "_copyCompanionSyncContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getAGXMTLCompilerCrashLogs](self, "_getAGXMTLCompilerCrashLogs"));
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  v14 = -[SystemDiagnostic _copyNanoPreferencesSyncLogs](self, "_copyNanoPreferencesSyncLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v14);

  v15 = -[SystemDiagnostic _copyCoreCaptureBTLogsContainer](self, "_copyCoreCaptureBTLogsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getFscklogs](self, "_getFscklogs"));
  objc_msgSend(v3, "addObjectsFromArray:", v16);

  v17 = -[SystemDiagnostic _copyMobileInstallationLogsContainer](self, "_copyMobileInstallationLogsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v17);

  v18 = -[SystemDiagnostic _copyMobileActivationLogsContainer](self, "_copyMobileActivationLogsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v18);

  v19 = -[SystemDiagnostic _copyAppInstallationLogsContainer](self, "_copyAppInstallationLogsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v19);

  v20 = -[SystemDiagnostic _copyProxiedDeviceCrashLogsContainer](self, "_copyProxiedDeviceCrashLogsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v20);

  v21 = -[SystemDiagnostic _copySiriLogsContainer](self, "_copySiriLogsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v21);

  v22 = -[SystemDiagnostic _copyMobileAssetHistoryLogs](self, "_copyMobileAssetHistoryLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v22);

  v23 = -[SystemDiagnostic _copySplunkHistoryLogs](self, "_copySplunkHistoryLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v23);

  v24 = -[SystemDiagnostic _copyParsecdBagLogs](self, "_copyParsecdBagLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getCloudKitBookmarksContainer](self, "_getCloudKitBookmarksContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v25);

  v26 = -[SystemDiagnostic _copySiriAnalyticsDB](self, "_copySiriAnalyticsDB");
  objc_msgSend(v3, "addObjectsFromArray:", v26);

  v27 = -[SystemDiagnostic _copyHIDFWCrashLogs](self, "_copyHIDFWCrashLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v27);

  v28 = -[SystemDiagnostic _copySplatVersioningLogs](self, "_copySplatVersioningLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v28);

  v29 = -[SystemDiagnostic _copyHangTracerTailspinsContainer](self, "_copyHangTracerTailspinsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v29);

  v30 = -[SystemDiagnostic _copySentryPlistsContainer](self, "_copySentryPlistsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v30);

  v31 = -[SystemDiagnostic _copyMCLogs](self, "_copyMCLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v31);

  v32 = -[SystemDiagnostic _copyWatchdogTailspins](self, "_copyWatchdogTailspins");
  objc_msgSend(v3, "addObjectsFromArray:", v32);

  v33 = -[SystemDiagnostic _copyWatchdogdDDTs](self, "_copyWatchdogdDDTs");
  objc_msgSend(v3, "addObjectsFromArray:", v33);

  v34 = -[SystemDiagnostic _copyTCCLogs](self, "_copyTCCLogs");
  objc_msgSend(v3, "addObjectsFromArray:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getCalendarPrefLogs](self, "_getCalendarPrefLogs"));
  objc_msgSend(v3, "addObjectsFromArray:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getSocialLayerPlist](self, "_getSocialLayerPlist"));
  objc_msgSend(v3, "addObjectsFromArray:", v36);

  return v3;
}

- (id)_copyProxiedDeviceCrashLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("process proxied device logs"), CFSTR("logs/ProxiedDevice"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/ProxiedDevice-*/*")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", -86400.0));
    objc_msgSend(v6, "setCreatedSince:", v8);

    v11 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v5, "addRules:", v9);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_createTailspinContainerHelper:(id)a3 isRecent:(BOOL)a4 withSizeMB:(unint64_t)a5 forGlobsBlock:(id)a6
{
  _BOOL4 v8;
  id v10;
  uint64_t (**v11)(id, id);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t (**v30)(id, id);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v8 = a4;
  v10 = a3;
  v11 = (uint64_t (**)(id, id))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "dateByAddingTimeInterval:", -86400.0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dateByAddingTimeInterval:", -180.0));

  v16 = v13;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("crashes_and_spins"), "stringByAppendingPathComponent:", v10));
  if (v8)
  {
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("Recent"), "stringByAppendingString:", v10));

    v19 = v15;
    a5 = 0;
    v10 = (id)v18;
  }
  else
  {
    v19 = v16;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", v10, v17, self));
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "setMaximumSizeMB:", a5);
    objc_msgSend(v21, "setRuntimeChecks:", 8);
    v30 = v11;
    v22 = v11[2](v11, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = v23;
    if (!v8)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v32;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v32 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v28), "setCreatedUntil:", v15);
            v28 = (char *)v28 + 1;
          }
          while (v26 != v28);
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v26);
      }
    }
    objc_msgSend(v21, "addRules:", v24);

    v11 = v30;
  }

  return v21;
}

- (id)createTailspinContainer:(id)a3 withSizeMB:(unint64_t)a4 forGlobsBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _createTailspinContainerHelper:isRecent:withSizeMB:forGlobsBlock:](self, "_createTailspinContainerHelper:isRecent:withSizeMB:forGlobsBlock:", v8, 0, a4, v9));
  if (v11)
    objc_msgSend(v10, "addObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _createTailspinContainerHelper:isRecent:withSizeMB:forGlobsBlock:](self, "_createTailspinContainerHelper:isRecent:withSizeMB:forGlobsBlock:", v8, 1, a4, v9));
  if (v12)
    objc_msgSend(v10, "addObject:", v12);

  return v10;
}

- (id)_copyHangTracerTailspinsContainer
{
  return (id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic createTailspinContainer:withSizeMB:forGlobsBlock:](self, "createTailspinContainer:withSizeMB:forGlobsBlock:", CFSTR("HangTracerTailspins"), 15, &stru_100099180));
}

- (id)_copyOnDemandDaemonLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("ondemandd"), CFSTR("logs/OnDemandDaemon/"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/ondemandd/")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", -86400.0));
    objc_msgSend(v6, "setCreatedSince:", v8);

    v11 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v5, "addRules:", v9);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyCoreCaptureBTLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("CoreCaptureBT"), CFSTR("logs/MarconiBT"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    objc_msgSend(v5, "setRuntimeChecks:", (unint64_t)objc_msgSend(v5, "runtimeChecks") | 1);
    objc_msgSend(v5, "setGenerateSummary:", 1);
    objc_msgSend(v5, "setResolveHomeDirs:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:atInternalDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:atInternalDirectory:", CFSTR("/private/var/log/CoreCapture/com.apple.driver.AppleMarconiBTDriver"), CFSTR("com.apple.driver.AppleMarconiBTDriver")));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/CoreCapture/MarconiBT")));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyAppInstallationLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("appinstallation"), CFSTR("logs/appinstallation"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC0C8));
    objc_msgSend(v6, "setMobileContainer:", CFSTR("com.apple.appstored"));
    objc_msgSend(v6, "setMobileContainerClass:", 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/com.apple.appstored")));
    v10[0] = v7;
    v10[1] = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyCompanionSyncContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  void *v8;
  void *v9;
  BOOL v11;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0;
  sub_10004602C(CFSTR("LogStatistics"), CFSTR("com.apple.companionsync"), &v11);
  if (v11)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("CompanionSync"), CFSTR("logs/CompanionSync/defaults"), self));
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "setRuntimeChecks:", 8);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC0E0));
      v13 = v6;
      v7 = &v13;
LABEL_6:
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 1));
      objc_msgSend(v5, "addRules:", v9);

      objc_msgSend(v3, "addObject:", v5);
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("CompanionSync"), CFSTR("logs/CompanionSync/internal"), self));
    v5 = v8;
    if (v8)
    {
      objc_msgSend(v8, "setRuntimeChecks:", 9);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC0F8));
      v12 = v6;
      v7 = &v12;
      goto LABEL_6;
    }
  }

  return v3;
}

- (id)_copyNanoPreferencesSyncLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("NanoPreferencesSync"), CFSTR("logs/NanoPreferencesSync"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/DeviceRegistry/*/NanoPreferencesSync/NanoDomains/com.apple.nanoprefsyncd")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/DeviceRegistry/*/NanoPreferencesSync/NanoDomains/com.apple.pairedsync"), v6));
    v11[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC110));
    v11[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3));

    if (v9)
      objc_msgSend(v5, "addRules:", v9);
    objc_msgSend(v3, "addObject:", v5);

  }
  return v3;
}

- (id)_copyMCLogs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[2];
  _BYTE v21[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MCState"), CFSTR("logs/MCState"), self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(&off_1000AC128, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(&off_1000AC128);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("NOT SELF CONTAINS %@"), *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9)));
        objc_msgSend(v5, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(&off_1000AC128, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v7);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v5));
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.configurationprofiles/Library/ConfigurationProfiles/"), 0, 0, v11, 0, CFSTR("Shared"), 0));
    v20[0] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:atInternalDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:atInternalDirectory:", CFSTR("/private/var/mobile/Library/UserConfigurationProfiles"), CFSTR("User")));
    v20[1] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));
    objc_msgSend(v4, "addRules:", v14);

    objc_msgSend(v3, "addObject:", v4);
  }

  return v3;
}

- (id)_copyMobileAssetHistoryLogs
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
  _QWORD v13[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MobileAssetHistory"), CFSTR("logs/MobileAsset/history"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/MobileAsset/AssetsV2/history"), "stringByAppendingPathComponent:", CFSTR("MAAutoAsset_{Filesystem,Locker,Atomic,Error,Secure,Stager,Scheduler}_History")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR(".txt")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v7));
    v13[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingString:", CFSTR("_0[0-9].log")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v9));
    v13[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));
    objc_msgSend(v5, "addRules:", v11);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copySplunkHistoryLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("SplunkHistory"), CFSTR("logs/MobileSoftwareUpdate"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    objc_msgSend(v5, "setMaximumSizeMB:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/MobileSoftwareUpdate/Controller/SplunkHistory/"), "stringByAppendingPathComponent:", CFSTR("SUCoreSplunkHistory.log*")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v6));
    v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    objc_msgSend(v5, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copySiriLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Siri"), CFSTR("logs/Siri"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = CFSTR("self.lastPathComponent MATCHES 'OPUS_.+\\.opx|PCM-.+\\.wav'");
    if (sub_100045E60())
    {
      v15[0] = CFSTR("self.lastPathComponent MATCHES 'OPUS_.+\\.opx|PCM-.+\\.wav'");
      v15[1] = CFSTR("OR");
      v15[2] = CFSTR("self.lastPathComponent MATCHES 'PHS-.*\\.wav'");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" ")));

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs"), 0, 0, v8, 0, CFSTR("SpeechLogs"), 0));
    v14[0] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio/*.json"), 0, 0, 0, CFSTR("VoiceTrigger"), 0));
    v14[1] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio/*.wav"), 0, 0, 0, CFSTR("VoiceTrigger"), 1));
    v14[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3));
    objc_msgSend(v5, "addRules:", v12);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyParsecdBagLogs
{
  void *v3;
  NSMutableArray *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  uint8_t buf[4];
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = objc_opt_new(NSMutableArray);
  -[NSMutableArray addObject:](v4, "addObject:", CFSTR("/private/var/mobile/Library/Caches/com.apple.parsecd/skapp_data"));
  v5 = sub_100026F84(CFSTR("group.com.apple.PegasusConfiguration"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Identified app group container path for parsecd: %@", buf, 0xCu);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("config.plist")));
    -[NSMutableArray addObject:](v4, "addObject:", v7);

  }
  if (-[NSMutableArray count](v4, "count"))
  {
    v8 = -[NSMutableArray copy](v4, "copy");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("parsecd"), CFSTR("logs/parsecd"), self));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "setRuntimeChecks:", 8);
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v8));
      v14 = v11;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      objc_msgSend(v10, "addRules:", v12);

      objc_msgSend(v3, "addObject:", v10);
    }

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No parsecd paths to collect - exiting", buf, 2u);
  }

  return v3;
}

- (id)_getFscklogs
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v4, "addObject:", CFSTR("/private/var/log/fsck_apfs.log"));
  v5 = objc_msgSend(v4, "copy");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("fsck"), CFSTR("logs/fsck"), self));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setRuntimeChecks:", 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v5));
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v7, "addRules:", v9);

    objc_msgSend(v3, "addObject:", v7);
  }

  return v3;
}

- (id)_copyAccessibilityPreferences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("AccessibilityPrefs"), CFSTR("logs/AccessibilityPrefs"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    objc_msgSend(v5, "setMaximumSizeMB:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC140));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Preferences/com.apple.ClarityUI*.plist")));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyVideoProcessingLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("VideoProcessing"), CFSTR("logs/VideoProcessing"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/VideoProcessing/Stats")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addRules:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyThermalLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("ThermalLogs"), CFSTR("logs/Thermal"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    objc_msgSend(v5, "setMaximumSizeMB:", 10);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC158));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogPathArray, "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", &off_1000AC170, 0, 0, 0, 0, 1));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)copyCoreaudioReportingLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("coreaudio reporting"), CFSTR("logs/CoreaudioReporting"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", -21600.0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Audio/Reporting"), 1, v7, 0, 0, 0, 0));
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v5, "addRules:", v9);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5 withOffsets:(id)a6 sizes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", v16, v15, self));

  if (v18)
  {
    objc_msgSend(v18, "setMaximumSizeMB:", 0);
    objc_msgSend(v18, "setRuntimeChecks:", 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v12));
    objc_msgSend(v19, "setOffsets:", v13);
    objc_msgSend(v19, "setSizes:", v14);
    v22 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    objc_msgSend(v18, "addRules:", v20);

    objc_msgSend(v17, "addObject:", v18);
  }

  return v17;
}

- (id)getSimplePathArrayContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", 0));
  v18 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", 5242880));
  v17 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSimplePathArrayContainer:withContainerName:andDestination:withOffsets:sizes:](self, "getSimplePathArrayContainer:withContainerName:andDestination:withOffsets:sizes:", v10, v9, v8, v12, v14));
  return v15;
}

- (id)getSimpleDirectoryContainer:(id)a3 withContainerName:(id)a4 andDestination:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", v10, v9, self));

  if (v12)
  {
    objc_msgSend(v12, "setRuntimeChecks:", 8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", v8));
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    objc_msgSend(v12, "addRules:", v14);

    objc_msgSend(v11, "addObject:", v12);
  }

  return v11;
}

- (id)_copyAstroLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("astro"), CFSTR("logs/Astro"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 11);
    objc_msgSend(v5, "setMaximumSizeMB:", 100);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/logs/Astro")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addRules:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copySplatVersioningLogs
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Splat Versioning"), CFSTR("logs/Splat"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/preboot/Cryptexes"), "stringByAppendingPathComponent:", CFSTR("OS/System/Library/CoreServices/SystemVersion.plist")));
    v23 = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogPathArray, "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v18, 0, 0, 0, CFSTR("OS"), 0));
    v24[0] = v17;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/preboot/Cryptexes"), "stringByAppendingPathComponent:", CFSTR("OS/System/Library/CoreServices/RestoreVersion.plist")));
    v22 = v16;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogPathArray, "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v15, 0, 0, 0, CFSTR("OS"), 0));
    v24[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/preboot/Cryptexes"), "stringByAppendingPathComponent:", CFSTR("App/System/Library/CoreServices/SystemVersion.plist")));
    v21 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogPathArray, "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v8, 0, 0, 0, CFSTR("App"), 0));
    v24[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/preboot/Cryptexes"), "stringByAppendingPathComponent:", CFSTR("App/System/Library/CoreServices/RestoreVersion.plist")));
    v20 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogPathArray, "logRuleWithPaths:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v11, 0, 0, 0, CFSTR("App"), 0));
    v24[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
    objc_msgSend(v5, "addRules:", v13);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyHIDFWCrashLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("hidfw-crashlogs"), CFSTR("logs/hidfw-crashlogs"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/logs/hidfw-crashlogs/")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addRules:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_getSocialLayerPlist
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("SocialLayerPlist"), CFSTR("logs"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC188));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addRules:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_getCalendarPrefLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("CalendarPreferences"), CFSTR("logs/CalendarPreferences"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC1A0));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addRules:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_getAGXMTLCompilerCrashLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("AGXMTLCompilerCrash"), CFSTR("logs/AGXMTLCompiler"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/AGX")));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/MTLCompiler/")));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyTCCLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Accessibility"), CFSTR("logs/Accessibility"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/TCC")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addRules:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copySiriAnalyticsDB
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("SiriAnalytics"), CFSTR("logs/SiriAnalytics"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setMaximumSizeMB:", 7);
    objc_msgSend(v5, "setRuntimeChecks:", 8);
    v10 = CFSTR("/private/var/mobile/Library/Assistant/SiriAnalytics.db");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v6));
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v5, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_getCloudKitBookmarksContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", -518400.0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(pathExtension IN %@)"), &off_1000AC1B8));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("CloudKitBookmarks"), CFSTR("logs"), self));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setRuntimeChecks:", 8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/Library/Safari/CloudBookmarksMigrationCoordinator"), 0, v5, v6, 0, CFSTR("CloudKitBookmarks"), 0));
    objc_msgSend(v9, "setMobileContainer:", CFSTR("com.apple.mobilesafari"));
    objc_msgSend(v9, "setMobileContainerClass:", 2);
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v8, "addRules:", v10);

    objc_msgSend(v3, "addObject:", v8);
  }

  return v3;
}

- (id)_getMapsSyncJournalContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MapsSyncJournal"), CFSTR("logs"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC1D0));
    objc_msgSend(v6, "setMobileContainer:", CFSTR("com.apple.Maps"));
    objc_msgSend(v6, "setMobileContainerClass:", 2);
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addRules:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyMobileActivationLogsContainer
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MobileActivation"), CFSTR("logs/MobileActivation"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/mobileactivationd"), "stringByAppendingPathComponent:", CFSTR("ucrt_oob_request.txt")));
    v26[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/mobileactivationd"), "stringByAppendingPathComponent:", CFSTR("ucrt_oob_response.txt")));
    v26[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/mobileactivationd"), "stringByAppendingPathComponent:", CFSTR("collection_oob_request.txt")));
    v26[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/mobileactivationd"), "stringByAppendingPathComponent:", CFSTR("collection_oob_response.txt")));
    v26[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 4));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v10));

    v25[0] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/mobileactivationd"), "stringByAppendingPathComponent:", CFSTR("mobileactivationd.log.*")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v22));
    v25[1] = v21;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/mobileactivationd"), "stringByAppendingPathComponent:", CFSTR("*baa_request.txt")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v11));
    v25[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/mobileactivationd"), "stringByAppendingPathComponent:", CFSTR("*baa_response.txt")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v13));
    v25[3] = v14;
    v24 = v3;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/mobileactivationd"), "stringByAppendingPathComponent:", CFSTR("*baa_su_request.txt")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v15));
    v25[4] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/mobileactivationd"), "stringByAppendingPathComponent:", CFSTR("*baa_su_response.txt")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v17));
    v25[5] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 6));
    objc_msgSend(v5, "addRules:", v19);

    v3 = v24;
    objc_msgSend(v24, "addObject:", v5);

  }
  return v3;
}

- (id)_copySentryPlistsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("Sentry"), CFSTR("logs/Sentry/"), self));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC1E8));
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
    objc_msgSend(v4, "addRules:", v6);

    objc_msgSend(v4, "setRuntimeChecks:", 8);
    objc_msgSend(v3, "addObject:", v4);
  }

  return v3;
}

- (id)_copyWatchdogTailspins
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("watchdog"), CFSTR("logs/watchdog"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 9);
    objc_msgSend(v5, "setMaximumSizeMB:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateByAddingTimeInterval:", -3600.0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/watchdog*.tailspin"), v7, 0, 1, 0, 0));
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v5, "addRules:", v9);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyWatchdogdDDTs
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("watchdogd ddts"), CFSTR("logs/watchdog"), self));
  v5 = sub_100026B54(CFSTR("watchdog-*-ddt-*.txt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 9);
    objc_msgSend(v4, "setMaximumSizeMB:", 10);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dateByAddingTimeInterval:", -86400.0));

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v6, v8, 0, 0, 0, 0));
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v4, "addRules:", v10);

    objc_msgSend(v3, "addObject:", v4);
  }

  return v3;
}

- (id)_getCrashesAndSpinsContainer
{
  void *v3;
  void *v4;
  _UNKNOWN **v5;
  _UNKNOWN **v6;
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
  void *v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[3];
  NSFileAttributeKey v27;
  _UNKNOWN **v28;

  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dateByAddingTimeInterval:", -86400.0));

  if (sub_100045E60())
  {
    v5 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC218, "arrayByAddingObject:", CFSTR("ips.ca")));
    v6 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC230, "arrayByAddingObject:", CFSTR("ips.ca")));
  }
  else
  {
    v5 = &off_1000AC218;
    v6 = &off_1000AC230;
  }
  v22 = v5;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPredicateForFileTypes:withExcludedPrefixes:](self, "getPredicateForFileTypes:withExcludedPrefixes:", v5, &off_1000AC200));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPredicateForFileTypes:withExcludedPrefixes:](self, "getPredicateForFileTypes:withExcludedPrefixes:", v6, &off_1000AC200));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), "stringByAppendingPathComponent:", CFSTR("Retired")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("crashes_and_spins")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 0, 0, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("README.txt")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("The summary of all the files collected is located in <sysdiagnose_dir>/summaries/crashes_and_spins.log"), "dataUsingEncoding:", 4));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v27 = NSFilePosixPermissions;
  v28 = &off_1000ACD70;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
  objc_msgSend(v13, "createFileAtPath:contents:attributes:", v11, v12, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("crashes and spins"), CFSTR("crashes_and_spins"), self));
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "setResolveHomeDirs:", 0);
    objc_msgSend(v16, "setMaximumSizeMB:", 20);
    objc_msgSend(v16, "setMaxVariety:", 1);
    objc_msgSend(v16, "setRuntimeChecks:", 8);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter"), 1, v4, v25, 0, 0, 0));
    v26[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v7, 1, v4, v24, 0, CFSTR("Retired"), 0));
    v26[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/MemoryGraph_SpringBoard*.memgraph"), 0, 0, 1, 0, 1));
    v26[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 3));
    objc_msgSend(v16, "addRules:", v20);

    objc_msgSend(v23, "addObject:", v16);
  }

  return v23;
}

- (id)includeSyncedExtensionForFileTypes:(id)a3
{
  id v3;
  char *v4;
  char *v5;
  char *i;
  void *v7;
  void *v8;

  v3 = objc_msgSend(a3, "mutableCopy");
  v4 = (char *)objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", i));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("synced")));
      objc_msgSend(v3, "addObject:", v8);

    }
  }
  return v3;
}

- (id)getPredicateForFileTypes:(id)a3 withExcludedPrefixes:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "arrayByAddingObjectsFromArray:", &off_1000AC248));
  if ((sub_100045E60() & 1) == 0)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "arrayByAddingObjectsFromArray:", &off_1000AC260));

    v7 = (void *)v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSubPredicateForPrefixes:](self, "getSubPredicateForPrefixes:", v7));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSubPredicateForFileTypes:](self, "getSubPredicateForFileTypes:", v6));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ AND %@"), v9, v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", v11));

  return v12;
}

- (id)getSubPredicateForPrefixes:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void **v7;
  uint64_t v8;
  char *(*v9)(uint64_t, uint64_t, unint64_t);
  void *v10;
  __CFString *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000164A8;
  v18 = sub_1000164B8;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_1000164C0;
  v10 = &unk_1000991A8;
  v13 = &v14;
  v11 = CFSTR("(NOT (SELF.lastPathComponent BEGINSWITH '%@'))");
  v4 = v3;
  v12 = v4;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)"), v15[5], v7, v8, v9, v10));

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)getSubPredicateForFileTypes:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void **v7;
  uint64_t v8;
  char *(*v9)(uint64_t, uint64_t, unint64_t);
  void *v10;
  __CFString *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic includeSyncedExtensionForFileTypes:](self, "includeSyncedExtensionForFileTypes:", a3));
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000164A8;
  v18 = sub_1000164B8;
  v19 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_10001665C;
  v10 = &unk_1000991A8;
  v13 = &v14;
  v11 = CFSTR("SELF.lastPathComponent ENDSWITH '%@'");
  v4 = v3;
  v12 = v4;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@)"), v15[5], v7, v8, v9, v10));

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (id)_copyMobileInstallationLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("Library/Logs")));
  objc_msgSend(v4, "setMobileContainer:", CFSTR("systemgroup.com.apple.mobile.installationhelperlogs"));
  objc_msgSend(v4, "setMobileContainerClass:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("MobileInstallation"), CFSTR("logs/MobileInstallation"), self));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setRuntimeChecks:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/installd/Library/Logs/MobileInstallation/mobile_installation{,_helper}.log.[01234]")));
    v10[0] = v7;
    v10[1] = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v6, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v6);
  }

  return v3;
}

- (id)getLogCopyingContainers
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _iOSgetLogCopyingContainers](self, "_iOSgetLogCopyingContainers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAutogenLogCopyingContainers](self, "getAutogenLogCopyingContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (id)_iOSgetLogGenerationContainers
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
  id v61;
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
  uint8_t v82[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v82 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Log Generation start\n", v82, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v4, "log:", CFSTR("Log Generation start\n"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getACMToolContainer](self, "getACMToolContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getRemotectlContainer](self, "getRemotectlContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getInternalLogsContainer](self, "getInternalLogsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getclpcContainer](self, "getclpcContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getclpcctrlContainer](self, "getclpcctrlContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLGSystemInfoContainer](self, "getLGSystemInfoContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getGNIContainer](self, "getGNIContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getCoreDuetLogs](self, "getCoreDuetLogs"));
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getASPSnapshotsContainers](self, "getASPSnapshotsContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getProximityContainers](self, "getProximityContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSpuctlContainer](self, "getSpuctlContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getASPTraceContainers](self, "getASPTraceContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getGestaltQueryContainer](self, "getGestaltQueryContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getc26ToolContainer](self, "getc26ToolContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLibnotifyContainer](self, "getLibnotifyContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAopaudctlContainer](self, "getAopaudctlContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAHSToolContainer](self, "getAHSToolContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSysCfgContainer](self, "getSysCfgContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getMediaContainer](self, "getMediaContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSoundBoardContainer](self, "getSoundBoardContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getosvariantUtilContainer](self, "getosvariantUtilContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getFreezerctlContainer](self, "getFreezerctlContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getcontrolbitsContainer](self, "getcontrolbitsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAOPFirmwareStateContainer](self, "getAOPFirmwareStateContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getCADebugContainer](self, "getCADebugContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getEnumerateCrashReporterContainer](self, "getEnumerateCrashReporterContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSelfCtlContainer](self, "getSelfCtlContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getHomeUtilDumpAllContainer](self, "getHomeUtilDumpAllContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getHomeUtilAccessoryStateContainer](self, "getHomeUtilAccessoryStateContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v33);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getExposureNotificationContainer](self, "getExposureNotificationContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v34);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLGUtilitiesContainer](self, "getLGUtilitiesContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v35);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getIDSContainer](self, "getIDSContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getIOREGContainer](self, "getIOREGContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v37);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getHIDReportContainers](self, "getHIDReportContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getHIDRecorderdContainer](self, "getHIDRecorderdContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v39);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getStoreServicesContainer](self, "getStoreServicesContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSPIContainers](self, "getSPIContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v41);

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getCoreCaptureSPIContainer](self, "getCoreCaptureSPIContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getBaseBandContainer](self, "getBaseBandContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSoundAutoConfigContainer](self, "getSoundAutoConfigContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getMicrostackshotsWithPostContainers](self, "getMicrostackshotsWithPostContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v45);

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getDSCSYMContainer](self, "getDSCSYMContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAirPlayContainer](self, "getAirPlayContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v47);

  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getStspContainer](self, "getStspContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getCKKSCTLContainer](self, "getCKKSCTLContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v49);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getOTCTLContainer](self, "getOTCTLContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v50);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPreferencesLogs](self, "getPreferencesLogs"));
  objc_msgSend(v3, "addObjectsFromArray:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAppleInternalPreferencesLogs](self, "getAppleInternalPreferencesLogs"));
  objc_msgSend(v3, "addObjectsFromArray:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getExcResourceContainer](self, "getExcResourceContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v53);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTimezoneDBLogs](self, "getTimezoneDBLogs"));
  objc_msgSend(v3, "addObjectsFromArray:", v54);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPersonalizationLogs](self, "getPersonalizationLogs"));
  objc_msgSend(v3, "addObjectsFromArray:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getlaunchdAndCTSContainers](self, "getlaunchdAndCTSContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v56);

  v57 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getApfsStatsContainer](self, "getApfsStatsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getRunningBoardLogs](self, "getRunningBoardLogs"));
  objc_msgSend(v3, "addObjectsFromArray:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getKeyboardPrefContainer](self, "getKeyboardPrefContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v59);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAccessibilityPrefContainer](self, "getAccessibilityPrefContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v60);

  v61 = -[SystemDiagnostic _copyBTLogsContainer](self, "_copyBTLogsContainer");
  objc_msgSend(v3, "addObjectsFromArray:", v61);

  v62 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getFDRDiagnosticContainer](self, "getFDRDiagnosticContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getASPMagazineContainer](self, "getASPMagazineContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v63);

  v64 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getBatteryUIContainer](self, "getBatteryUIContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v64);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getACLogsContainer](self, "getACLogsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v65);

  v66 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTransparencyContainer](self, "getTransparencyContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSWTransparencyContainer](self, "getSWTransparencyContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v67);

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getBTPHYLogsContainer](self, "getBTPHYLogsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v68);

  v69 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getswcutilContainer](self, "getswcutilContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v69);

  v70 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTrialRolloutsContainer](self, "getTrialRolloutsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getFileProviderCTLContainer](self, "getFileProviderCTLContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v71);

  v72 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getWifiDextCorefilesContainer](self, "getWifiDextCorefilesContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v72);

  v73 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getBrctlContainer](self, "getBrctlContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v73);

  v74 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getArkitctlContainer](self, "getArkitctlContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v74);

  v75 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getDisplaytoolContainer](self, "getDisplaytoolContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v75);

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getKCSharingContainer](self, "getKCSharingContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v76);

  v77 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getRmdContainer](self, "getRmdContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v77);

  v78 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPommesStatusContainer](self, "getPommesStatusContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v78);

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getDiskTasksContainer](self, "getDiskTasksContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v79);

  v80 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPowerLogContainer](self, "getPowerLogContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v80);

  return v3;
}

- (id)getSelfCtlContainer
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
  void *v11;
  void *v14;
  _QWORD v15[7];
  _QWORD v16[7];
  _QWORD v17[2];

  v2 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v16[0] = CFSTR("tail");
  v16[1] = CFSTR("-r");
  v16[2] = CFSTR("1h");
  v16[3] = CFSTR("-f");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("<TMPOUTPUTDIR>"), "stringByAppendingPathComponent:", CFSTR("selfctl_tail.json")));
  v16[4] = v14;
  v16[5] = CFSTR("--redact-tier1");
  v16[6] = CFSTR("--mobile-stream");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 7));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/selfctl"), v3, CFSTR("selfctl_tail_stdout.txt")));
  v17[0] = v4;
  v15[0] = CFSTR("turns");
  v15[1] = CFSTR("-r");
  v15[2] = CFSTR("1h");
  v15[3] = CFSTR("-d");
  v15[4] = CFSTR("<TMPOUTPUTDIR>");
  v15[5] = CFSTR("--redact-tier1");
  v15[6] = CFSTR("--mobile-stream");
  v5 = (void *)v2;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 7));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/selfctl"), v6, CFSTR("selfctl_turns_stdout.txt")));
  v17[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 2));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:", v8, &__NSArray0__struct, CFSTR("logs/selfctl"), self, 1, 3.0));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskContainer"));
    objc_msgSend(v11, "setName:", CFSTR("selfctl"));

    objc_msgSend(v10, "setRuntimeChecks:", 17);
    objc_msgSend(v5, "addObject:", v10);
  }

  return v5;
}

- (id)getDisplaytoolContainer
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _UNKNOWN **v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (sub_10004649C())
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    v5 = objc_alloc_init((Class)NSMutableArray);
    if (sub_100045E60())
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("logs/displaytool"), "stringByAppendingPathComponent:", CFSTR("displaytool.txt")));
      v7 = CFSTR("/usr/local/bin/displaytool");
      v8 = &off_1000AC278;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("logs/displaytool"), "stringByAppendingPathComponent:", CFSTR("displaytool_rel.txt")));
      v7 = CFSTR("/usr/bin/displaytool_rel");
      v8 = &off_1000AC290;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", v7, v8, v6));
    objc_msgSend(v4, "addObject:", v9);

    if (-[SystemDiagnostic tconNvmDump](self, "tconNvmDump"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/displaytool_rel"), &off_1000AC2A8, CFSTR("errors/tconNvmDump_errors.txt")));
      objc_msgSend(v4, "addObject:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC2C0));
      objc_msgSend(v5, "addObject:", v11);

      v12 = 25;
      v13 = 210.0;
    }
    else
    {
      v13 = 5.0;
      v12 = 5;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v4, v5, CFSTR("logs/displaytool"), self, v13));
    v15 = v14;
    if (v14)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionContainer"));
      objc_msgSend(v16, "setMaximumSizeMB:", v12);

      objc_msgSend(v15, "setRuntimeChecks:", 16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "taskContainer"));
      objc_msgSend(v17, "setName:", CFSTR("displaytool"));

      objc_msgSend(v3, "addObject:", v15);
    }

  }
  return v3;
}

- (BOOL)shouldRunWifiDextCoreFilesCollection
{
  unsigned int v3;
  const char *v4;
  uint8_t *v5;
  __int16 v7;
  __int16 v8;
  uint64_t v9;

  v3 = sub_100045E60();
  if (v3)
  {
    v9 = 0;
    if (os_parse_boot_arg_int("wlan.dk", &v9) && v9 == 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 0;
        v4 = "wlan.dk boot arg set - running wifi dext log collection";
        v5 = (uint8_t *)&v8;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    v3 = -[SystemDiagnostic collectWifiDextCoreFiles](self, "collectWifiDextCoreFiles");
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v7 = 0;
        v4 = "cli argument passed - running wifi dext log collection";
        v5 = (uint8_t *)&v7;
        goto LABEL_9;
      }
LABEL_10:
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)getWifiDextCorefilesContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v11[16];
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[SystemDiagnostic shouldRunWifiDextCoreFilesCollection](self, "shouldRunWifiDextCoreFilesCollection"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/wifi_sysdiagnose.sh"), &off_1000AC2D8, CFSTR("errors/wifi_dext_errors.txt")));
    v12 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v5, &__NSArray0__struct, CFSTR("logs/wifi_dext_core_files"), self, 5.0));
    v7 = v6;
    if (v6)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionContainer"));
      objc_msgSend(v8, "setMaximumSizeMB:", 0);

      objc_msgSend(v7, "setRuntimeChecks:", 17);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "taskContainer"));
      objc_msgSend(v9, "setName:", CFSTR("wifi dext core files"));

      objc_msgSend(v3, "addObject:", v7);
    }

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Skipping wifi dext log collection", v11, 2u);
  }
  return v3;
}

- (id)getArkitctlContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("arkitctl"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/arkitctl"), &off_1000AC2F0, CFSTR("arkitctl.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getSPIContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 7, CFSTR("logs/AWD"), self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    objc_msgSend(v3, "addObject:", v5);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 30, CFSTR("logs/NetworkRelay"), self, 10.0));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v7);
  }

  return v3;
}

- (id)getHIDRecorderdContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/libexec/hidrecorderd.internal"), &off_1000AC308, 0));
  v13 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/logs/CrashReporter/hidrecorderd")));
  v12 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v5, v7, CFSTR("logs/hidrecorderd"), self, 5.0));
  if (v8)
  {
    if (sub_10002360C())
      v9 = 20;
    else
      v9 = 2048;
    if (sub_100045E60())
      v10 = 17;
    else
      v10 = v9;
    objc_msgSend(v8, "setRuntimeChecks:", v10);
    objc_msgSend(v3, "addObject:", v8);
  }

  return v3;
}

- (id)getStspContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("Stsp"), 0, 1, self, 8.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/stsp_tool"), &off_1000AC320, CFSTR("Stsp.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getExposureNotificationContainer
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001A4C0;
  v9[3] = &unk_100099238;
  v9[4] = self;
  v4 = objc_retainBlock(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithBlock:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithBlock:withTimeout:atDestination:withDelegate:", v4, CFSTR("ExposureNotification"), self, 6.0));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v7, "setMaximumSizeMB:", 100);

    objc_msgSend(v3, "addObject:", v6);
  }

  return v3;
}

- (id)getBaseBandContainer
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  SystemDiagnostic *v13;
  id v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[SystemDiagnostic requestSource](self, "requestSource") == 1)
  {
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_10001AA64;
    v12 = &unk_100099260;
    v13 = self;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/abmlite"), &off_1000AC338, CFSTR("ambtool_output.log")));
    v14 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:", CFSTR("basebandMeta"), CFSTR("logs/Baseband"), 1, self, &v9, 7.0));
    if (v5)
    {
      v15 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1, v9, v10, v11, v12, v13));
      objc_msgSend(v5, "addSDTasksToContainer:", v6);

      if (sub_100045E60())
        v7 = 2064;
      else
        v7 = 16;
      objc_msgSend(v5, "setRuntimeChecks:", v7);
      objc_msgSend(v3, "addObject:", v5);
    }

  }
  return v3;
}

- (id)getSoundAutoConfigContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithBlock:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithBlock:withTimeout:atDestination:withDelegate:", &stru_1000992A0, CFSTR("logs/SoundAutoConfig"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    objc_msgSend(v5, "setRuntimeChecks:", (unint64_t)objc_msgSend(v5, "runtimeChecks") | 0x1000);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/SoundAutoConfig/SoundAutoConfig_StateDump*.plist")));
    v10 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
    objc_msgSend(v6, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getStoreServicesContainer
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
  void *v13;
  _QWORD v14[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/asclient"), &off_1000AC350, 0));
  v14[0] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/sleep"), &off_1000AC368, 0));
  v14[1] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/asclient"), &off_1000AC380, CFSTR("asclient_dump.txt")));
  v14[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("pathExtension IN %@"), CFSTR("har")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/mobile/Library/Logs/com.apple.StoreServices/HTTPArchives"), 0, 0, v8, 0, 0, 1));
  v13 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v7, v10, CFSTR("logs/StoreServices"), self, 10.0));
  objc_msgSend(v11, "setRuntimeChecks:", (unint64_t)objc_msgSend(v11, "runtimeChecks") | 0x10);
  if (v11)
    objc_msgSend(v3, "addObject:", v11);

  return v3;
}

- (id)getHIDReportContainers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[6];
  void *v24;
  _QWORD v25[2];
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("hidreport"), 0, 0, self, 5.0));
  v5 = v4;
  if (v4)
  {
    v18 = v4;
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = objc_msgSend(&off_1000AC398, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
    if (v6)
    {
      v7 = v6;
      v17 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(&off_1000AC398);
          v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR(": \n")));
          v24 = v10;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/echo"), v11, CFSTR("hidreport.log")));
          v25[0] = v12;
          v23[0] = CFSTR("--pid");
          v23[1] = CFSTR("619");
          v23[2] = CFSTR("-u");
          v23[3] = CFSTR("0xff00,0x000b");
          v23[4] = CFSTR("get");
          v23[5] = v9;
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 6));
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/hidreport"), v13, CFSTR("hidreport.log")));
          v25[1] = v14;
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 2));
          objc_msgSend(v18, "addSDTasksToContainer:", v15);

        }
        v7 = objc_msgSend(&off_1000AC398, "countByEnumeratingWithState:objects:count:", &v19, v26, 16);
      }
      while (v7);
    }
    v5 = v18;
    objc_msgSend(v3, "addObject:", v18);
  }

  return v3;
}

- (id)getProximityContainers
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 38, CFSTR("Proximity"), self, 5.0));
  if (v4)
  {
    v5 = objc_alloc((Class)NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/Rose/")));
    v18[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/db/nearbyd/nearbyd-*.protobuf.log")));
    v18[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
    v9 = objc_msgSend(v5, "initWithArray:", v8);

    v10 = sub_100026ECC(CFSTR("systemgroup.com.apple.nearbyd.datastore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingString:", CFSTR("/Library/nearbyd-*.protobuf.log")));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v13));
      objc_msgSend(v9, "addObject:", v14);

    }
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionContainer"));
    objc_msgSend(v15, "addRules:", v9);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionContainer"));
    objc_msgSend(v16, "setGenerateSummary:", 1);

    objc_msgSend(v3, "addObject:", v4);
  }

  return v3;
}

- (id)getSpuctlContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("spuctl"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/spuctl"), &off_1000AC3B0, CFSTR("spuctl.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getBTPHYLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 11, CFSTR("BTPHY"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/mobile/Library/Logs/CrashReporter/CoreCapture/AppleBTC-BTPHY-sysdiagnose")));
    v11 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v6, "addRules:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v9, "setGenerateSummary:", 1);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getHomeUtilDumpAllContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("HomeUtilDumpAll"), 0, 1, self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/homeutil"), &off_1000AC3C8, CFSTR("homeutil_dump_all.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getHomeUtilAccessoryStateContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("HomeUtilDumpAccessoryState"), 0, 1, self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/homeutil"), &off_1000AC3E0, CFSTR("homeutil_dump_accessory_state.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getASPTraceContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 6, CFSTR("ASPSnapshots"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setGenerateSummary:", 1);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getc26ToolContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("c26tool"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/c26tool"), &off_1000AC3F8, CFSTR("c26tool.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getAHSToolContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("AHSTool"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/AHSTool"), &off_1000AC410, CFSTR("ahstool.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getMediaContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("mediaremotetool"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/mediaremotetool"), &off_1000AC428, CFSTR("mediaremote.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getSoundBoardContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("SoundBoard"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/soundboardtool"), &off_1000AC440, CFSTR("soundboard_state.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getFreezerctlContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("Freezerctl"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/freezerctl"), 0, CFSTR("freezerctl_status.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getAOPFirmwareStateContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("AOPFirmwareState"), 0, 0, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/aopvtctl"), &off_1000AC458, CFSTR("aopvtctl_dump.txt")));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/aopenvsctl"), &off_1000AC470, CFSTR("aopenvsctl_dump.txt")));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addSDTasksToContainer:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getPbctlUserprofilesContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("pbctl"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/pbctl"), &off_1000AC488, CFSTR("pbctl_userprofiles_list.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getAccessibilityPrefContainer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 1, CFSTR("Preferences"), self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getExcResourceContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 20, CFSTR("crashes_and_spins"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setMaximumSizeMB:", 10);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getEnumerateCrashReporterContainer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("Enumerate CrashReporter"), CFSTR("crashes_and_spins"), 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = sub_100026B54(0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v12[0] = v7;
    v12[1] = CFSTR("-ls");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/find"), v8, CFSTR("enumerated_CrashReporter.txt")));
    v13 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v10);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getDiskTasksContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("disks-concurrent"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/diskutil"), &off_1000AC4A0, CFSTR("diskutil_list.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getACLogsContainer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 2, CFSTR("logs/ACLogs"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getAopaudctlContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("aopaudctl"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/aopaudctl"), &off_1000AC4B8, CFSTR("aopaudctl_dump.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getACMToolContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("ACMTool"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/ACMTool"), &off_1000AC4D0, CFSTR("ACMTool.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyBTLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 13, CFSTR("logs/Bluetooth/CoreCapture"), self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setGenerateSummary:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v7, "setMaximumSizeMB:", 15);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getSysCfgContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("syscfg"), 0, 0, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/sysconfig"), &off_1000AC4E8, CFSTR("sysconfig.log")));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/sysconfig"), &off_1000AC500, CFSTR("sysconfig_debug.log")));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addSDTasksToContainer:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getLibnotifyContainer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 27, CFSTR("logs/libnotify"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getBatteryUIContainer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 10, CFSTR("logs/BatteryUIPlist"), self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getTrialRolloutsContainer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 52, CFSTR("logs/Trial"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getTimezoneDBLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 51, CFSTR("TimezoneDB"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setGenerateSummary:", 1);

    objc_msgSend(v3, "addObject:", v5);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("timezonedb"), CFSTR("TimezoneDB"), 1, self, 5.0));
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setRuntimeChecks:", 17);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/ls"), &off_1000AC518, CFSTR("timezone_db.log")));
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v8, "addSDTasksToContainer:", v10);

    objc_msgSend(v3, "addObject:", v8);
  }

  return v3;
}

- (id)getPreferencesLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 34, CFSTR("Preferences"), self, 20.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setGenerateSummary:", 1);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC530));
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    objc_msgSend(v7, "addRules:", v9);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getAppleInternalPreferencesLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 35, CFSTR("Preferences"), self, 20.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setGenerateSummary:", 1);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getPersonalizationLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 32, CFSTR("Personalization"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setGenerateSummary:", 1);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getRunningBoardLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 39, CFSTR("RunningBoard"), self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setGenerateSummary:", 1);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getRemotectlContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("remotectl"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/remotectl"), &off_1000AC548, CFSTR("remotectl_dumpstate.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getCoreDuetLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SDTask *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("coreduet"), CFSTR("logs/coreduet"), 1, self, 8.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/cdknowledgetool"), &off_1000AC560, CFSTR("cdknowledgetool.log")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/cdknowledgetool"), &off_1000AC578, CFSTR("cdknowledgetool_syncstream.log"), v6));
    v14[1] = v7;
    v8 = +[SDTask taskWithCommand:arguments:asUID:outputFile:](SDTask, "taskWithCommand:arguments:asUID:outputFile:", CFSTR("/usr/local/bin/cdknowledgetool"), &off_1000AC590, sub_1000230D8(), CFSTR("cdknowledgetool_stats.log"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v14[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/cdcontexttool"), &off_1000AC5A8, CFSTR("cdcontexttool_dumpregistrations.log")));
    v14[3] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask shellTaskWithCommand:outputFile:](SDTask, "shellTaskWithCommand:outputFile:", CFSTR("/usr/local/bin/cdinteracttool summarizeData | /usr/bin/grep -E -v \"Accounts:|Data\"), CFSTR("cdinteracttool.log")));
    v14[4] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 5));
    objc_msgSend(v5, "addSDTasksToContainer:", v12);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getlaunchdContainer
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
  _QWORD v26[3];
  _QWORD v27[7];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("launchdLogs"), CFSTR("logs/launchd"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    objc_msgSend(v5, "setMaximumSizeMB:", 20);
    v25 = v3;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/log/com.apple.xpc.launchd"), "stringByAppendingPathComponent:", CFSTR("*.crash")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v24));
    v27[0] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/log/com.apple.xpc.launchd"), "stringByAppendingPathComponent:", CFSTR("*.ips")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v22));
    v27[1] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/log/com.apple.xpc.launchd"), "stringByAppendingPathComponent:", CFSTR("*.shutdowntimeout")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v20));
    v27[2] = v19;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/log/com.apple.xpc.launchd"), "stringByAppendingPathComponent:", CFSTR("launchd.log")));
    v26[0] = v18;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/log/com.apple.xpc.launchd"), "stringByAppendingPathComponent:", CFSTR("launchd.log.1")));
    v26[1] = v17;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/log/com.apple.xpc.launchd"), "stringByAppendingPathComponent:", CFSTR("launchd.log.2")));
    v26[2] = v16;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v26, 3));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v6));
    v27[3] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("SELF.lastPathComponent MATCHES %@"), CFSTR("launches\\.\\d{4}(-\\d{2}){2}(.\\d{2}){3}\\.log")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/log/com.apple.xpc.launchd"), 0, 0, v8, 0, 0, 0));
    v27[4] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/log/com.apple.xpc.launchd"), "stringByAppendingPathComponent:", CFSTR("*.shutdownstall")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v10));
    v27[5] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/log/com.apple.xpc.launchd"), "stringByAppendingPathComponent:", CFSTR("*.tailspin")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", v12));
    v27[6] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 7));
    objc_msgSend(v5, "addRules:", v14);

    v3 = v25;
    objc_msgSend(v25, "addObject:", v5);
  }

  return v3;
}

- (id)getlaunchdAndCTSContainers
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
  void *v16;
  void *v17;
  _QWORD v18[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("launchCTL"), 0, 0, self, 10.0));
  objc_msgSend(v4, "setRuntimeChecks:", 16);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:](SDTask, "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:", CFSTR("/bin/launchctl"), &off_1000AC5C0, 0, CFSTR("launchctl-list-0.txt")));
  v18[0] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/launchctl"), &off_1000AC5D8, CFSTR("launchctl-print-system.txt")));
  v18[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/launchctl"), &off_1000AC5F0, CFSTR("launchctl-dumpstate.txt")));
  v18[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 3));
  objc_msgSend(v4, "addSDTasksToContainer:", v8);

  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getlaunchdContainer](self, "getlaunchdContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  if (sub_100045E60())
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:](SDTask, "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:", CFSTR("/usr/local/bin/ctsctl"), &off_1000AC608, 0, CFSTR("ctsctl-list-0.txt")));
    v17 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));

  }
  else
  {
    v11 = &__NSArray0__struct;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:](SDUnitLogDirectory, "logRuleWithDirectory:", CFSTR("/private/var/log/module/com.apple.xpc.activity")));
  v16 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v11, v13, &stru_10009DC10, self, 6.0));
  objc_msgSend(v14, "setRuntimeChecks:", 16);
  if (v14)
  {
    objc_msgSend(v14, "setName:", CFSTR("cts"));
    objc_msgSend(v3, "addObject:", v14);
  }

  return v3;
}

- (id)getMicrostackshotsWithPostContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[9];
  void *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateByAddingTimeInterval:", -259200.0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (uint64_t)v7));

  objc_msgSend(v5, "timeIntervalSince1970");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), (uint64_t)v9));
  v18[0] = CFSTR("-oslog");
  v18[1] = CFSTR("-microstackshots_only");
  v18[2] = CFSTR("-microstackshots_save");
  v18[3] = CFSTR("-microstackshots_datastore");
  v18[4] = CFSTR("<TMPOUTPUTDIR>/microstackshots");
  v18[5] = CFSTR("-microstackshots_starttime");
  v18[6] = v10;
  v18[7] = CFSTR("-microstackshots_endtime");
  v18[8] = v8;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/spindump"), v11, CFSTR("errors/microstackshots_errors.txt")));
  v19 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v13, &__NSArray0__struct, &stru_10009DC10, self, 45.0));
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setName:", CFSTR("microstackshots"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "collectionContainer"));
    objc_msgSend(v16, "setMaximumSizeMB:", 200);

    objc_msgSend(v15, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v15);
  }

  return v3;
}

- (id)getIOREGContainer
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
  void *v15;
  _QWORD v16[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("ioreg"), CFSTR("ioreg"), 0, self, 30.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/ioreg"), &off_1000AC620, CFSTR("IOService.txt")));
    v16[0] = v15;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/ioreg"), &off_1000AC638, CFSTR("IOACPIPlane.txt")));
    v16[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/ioreg"), &off_1000AC650, CFSTR("IOPower.txt")));
    v16[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/ioreg"), &off_1000AC668, CFSTR("IODeviceTree.txt")));
    v16[3] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/ioreg"), &off_1000AC680, CFSTR("IOUSB.txt")));
    v16[4] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/ioreg"), &off_1000AC698, CFSTR("IOFireWire.txt")));
    v16[5] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/ioreg"), &off_1000AC6B0, CFSTR("IOPort.txt")));
    v16[6] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/ioreg"), &off_1000AC6C8, CFSTR("IOReg.xml")));
    v16[7] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 8));
    objc_msgSend(v5, "addSDTasksToContainer:", v13);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getGNIContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v4, "addObject:", CFSTR("-s"));
  objc_msgSend(v4, "addObject:", CFSTR("<TMPOUTPUTDIR>"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/Frameworks/SystemConfiguration.framework/get-network-info"), v4, CFSTR("errors/get_network_info_errors.txt")));
  v11 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v6, &__NSArray0__struct, CFSTR("logs/Networking"), self, 100.0));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionContainer"));
    objc_msgSend(v9, "setMaximumSizeMB:", 10);

    objc_msgSend(v8, "setRuntimeChecks:", 17);
    objc_msgSend(v3, "addObject:", v8);
  }

  return v3;
}

- (id)getsysconfigInternalLogsContainer
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
  _QWORD v13[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("sysconfigInternalLogs"), 0, 1, self, 15.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/sbin/sysctl"), &off_1000AC6E0, CFSTR("sysctl.txt"), 17));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/sbin/nvram"), &off_1000AC6F8, CFSTR("nvram.txt"), 17, v6));
    v13[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/bin/sw_vers"), 0, CFSTR("sw_vers.txt"), 17));
    v13[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/cdcontexttool"), &off_1000AC710, CFSTR("cdcontexttool.txt"), 17));
    v13[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/darwinup"), &off_1000AC728, CFSTR("darwinup.txt"), 17));
    v13[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 5));
    objc_msgSend(v5, "addSDTasksToContainer:", v11);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getIOLogsContainer
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
  _QWORD v13[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("IOLogs"), 0, 1, self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/iordump"), 0, CFSTR("iordump.txt"), 17));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/sbin/ioalloccount"), 0, CFSTR("ioalloccount.txt"), 17, v6));
    v13[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/sbin/ioclasscount"), 0, CFSTR("ioclasscount.txt"), 17));
    v13[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/bin/tbtdiagnose"), 0, CFSTR("tbtDiagnose.txt"), 16));
    v13[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/hpmdiagnose"), 0, CFSTR("hpmDiagnose.txt")));
    v13[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 5));
    objc_msgSend(v5, "addSDTasksToContainer:", v11);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getPowerLogContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 33, CFSTR("logs/powerlogs/"), self, 20.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setMaximumSizeMB:", 0);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getaccountsInternalLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("accountInternalLogs"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/accctl"), &off_1000AC740, CFSTR("accctl.txt")));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/accounts_tool"), &off_1000AC758, CFSTR("accounts_list.txt")));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addSDTasksToContainer:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getmiscInternalLogsContainer
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
  void *v16;
  _QWORD v17[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("miscInternalLogs"), 0, 1, self, 20.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/keystorectl"), &off_1000AC770, CFSTR("lock_state.txt"), 17));
    v17[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/findmydevicetool"), &off_1000AC788, 0, 17));
    v17[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/BacklightdTester"), &off_1000AC7A0, 0, 17));
    v17[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/mbtool"), &off_1000AC7B8, CFSTR("mbtool.txt"), 17));
    v17[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 4));
    objc_msgSend(v5, "addSDTasksToContainer:", v10);

    objc_msgSend(v3, "addObject:", v5);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("lsawLogs"), 0, 1, self, 60.0));
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setRuntimeChecks:", 16);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/bin/lsdiagnose"), &__NSArray0__struct, CFSTR("lsaw.csstoredump"), 16));
    v16 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
    objc_msgSend(v12, "addSDTasksToContainer:", v14);

    objc_msgSend(v3, "addObject:", v12);
  }

  return v3;
}

- (id)getInternalLogsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getsysconfigInternalLogsContainer](self, "getsysconfigInternalLogsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getIOLogsContainer](self, "getIOLogsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getaccountsInternalLogsContainer](self, "getaccountsInternalLogsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getmiscInternalLogsContainer](self, "getmiscInternalLogsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  return v3;
}

- (id)getLGUtilitiesContainer
{
  void *v3;
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
  void *v15;
  _QWORD v17[6];
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = sub_1000230D8();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("utilities-logGen"), 0, 1, self, 25.0));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setRuntimeChecks:", 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:](SDTask, "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:", CFSTR("/usr/libexec/security-sysdiagnose"), &__NSArray0__struct, v4, CFSTR("security-sysdiagnose.txt")));
    objc_msgSend(v7, "setRuntimeChecks:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/bin/buttontool"), &off_1000AC7D0, CFSTR("buttontool.txt"), 1));
    v18 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
    objc_msgSend(v6, "addSDTasksToContainer:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/codecctl"), &off_1000AC7E8, CFSTR("codecctl.txt")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/apsclient"), &off_1000AC800, CFSTR("apsclient.txt"), 1, v10));
    v17[1] = v11;
    v17[2] = v7;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/audioDeviceDump"), &__NSArray0__struct, CFSTR("audioDeviceDump.txt"), 1));
    v17[3] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:](SDTask, "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:", CFSTR("/usr/libexec/pcsstatus"), &off_1000AC818, v4, CFSTR("pcsstatus.txt")));
    v17[4] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/hidutil"), &off_1000AC830, CFSTR("hidutil.plist")));
    v17[5] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 6));
    objc_msgSend(v6, "addSDTasksToContainer:", v15);

    objc_msgSend(v3, "addObject:", v6);
  }

  return v3;
}

- (id)getLGSystemInfoContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("systemInfo-logGen"), 0, 1, self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/kextstat"), 0, CFSTR("kextstat.txt")));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/bin/pmset"), &off_1000AC848, CFSTR("pmset_everything.txt"), 1));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addSDTasksToContainer:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getIDSContainer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = sub_1000230D8();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("idsTasks"), 0, 0, self, 20.0));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setRuntimeChecks:", 144);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/imtool"), &off_1000AC860, CFSTR("imtool_list.txt")));
    v13[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/idstool"), &off_1000AC878, CFSTR("idstool_list.txt")));
    v13[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:](SDTask, "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:", CFSTR("/usr/local/bin/imtool"), &off_1000AC890, v4, CFSTR("imtool_info.txt")));
    v13[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:](SDTask, "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:", CFSTR("/usr/local/bin/idstool"), &off_1000AC8A8, v4, CFSTR("idstool_info.txt")));
    v13[3] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 4));
    objc_msgSend(v6, "addSDTasksToContainer:", v11);

    objc_msgSend(v3, "addObject:", v6);
  }

  return v3;
}

- (id)getRmdContainer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = sub_1000230D8();
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("rmd"), CFSTR("logs/rmd"), 0, self, 5.0));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setRuntimeChecks:", 16);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/RemoteManagement.framework/rmdinspect"), &off_1000AC8C0, CFSTR("rmd_inspect_system.txt")));
    v11[0] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:asUID:outputFile:](SDTask, "taskWithCommand:arguments:asUID:outputFile:", CFSTR("/System/Library/PrivateFrameworks/RemoteManagement.framework/rmdinspect"), &off_1000AC8D8, v4, CFSTR("rmd_inspect_user.txt")));
    v11[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    objc_msgSend(v6, "addSDTasksToContainer:", v9);

    objc_msgSend(v3, "addObject:", v6);
  }

  return v3;
}

- (id)getKCSharingContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("KCSharingDiagnose"), CFSTR("logs/Security"), 1, self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/kcsharingdiagnose.py"), 0, CFSTR("kcsharingdiagnose.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getBrctlContainer
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
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];
  void *v22;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21[0] = CFSTR("diagnose");
  v21[1] = CFSTR("--sysdiagnose");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic brctl_dir](self, "brctl_dir"));
  v21[2] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/brctl"), v4, CFSTR("errors/brctl_errors.txt")));
  v22 = v5;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic brctl_dir](self, "brctl_dir"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("NOT SELF.lastPathComponent == %@"), CFSTR("brctl-dump.txt")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogDirectory logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogDirectory, "logRuleWithDirectory:withDepth:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", v6, 0, 0, v7, 0, 0, 0));
  v20[0] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic brctl_dir](self, "brctl_dir"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("brctl-dump.txt")));
  v19 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", v11));
  v20[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v20, 2));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v17, v13, CFSTR("brctl"), self, 30.0));
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "setName:", CFSTR("brctl"));
    objc_msgSend(v15, "setRuntimeChecks:", 16);

    objc_msgSend(v18, "addObject:", v15);
  }

  return v18;
}

- (id)getFileProviderCTLContainer
{
  void *v3;
  SDTask *v4;
  void *v5;
  SDTask *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = +[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:](SDTask, "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:", CFSTR("/usr/bin/fileproviderctl"), &off_1000AC8F0, sub_1000230D8(), CFSTR("fileproviderctl.log"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v13[0] = v5;
  v6 = +[SDTask taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:](SDTask, "taskWithCommand:arguments:inBootstrapDomainOfUID:outputFile:", CFSTR("/usr/bin/fileproviderctl"), &off_1000AC908, sub_1000230D8(), CFSTR("fileproviderctl.log"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v13[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 2));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v8, &__NSArray0__struct, &stru_10009DC10, self, 5.0));
  v10 = v9;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "taskContainer"));
    objc_msgSend(v11, "setName:", CFSTR("fileproviderctl"));

    objc_msgSend(v10, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v10);
  }

  return v3;
}

- (id)getGestaltQueryContainer
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("gestalt query"), 0, 1, self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    if (-[SystemDiagnostic isTestingMode](self, "isTestingMode"))
      v6 = CFSTR("-plist");
    else
      v6 = CFSTR(" ");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_1000AC920, "componentsJoinedByString:", CFSTR(" || ")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ $(%@ -listKeys | %@ 'NR == 1 || NR == 2 || %@ {next}; {print $1}')"),
                     CFSTR("/usr/local/bin/gestalt_query"),
                     v6,
                     CFSTR("/usr/local/bin/gestalt_query"),
                     CFSTR("/usr/bin/awk"),
                     v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask shellTaskWithCommand:outputFile:](SDTask, "shellTaskWithCommand:outputFile:", v8, CFSTR("gestalt_query.txt")));
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v10);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getDSCSYMContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 18, CFSTR("logs/olddsc"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setMaximumSizeMB:", 10);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getCoreCaptureSPIContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;

  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x2020000000;
  v24 = 0x4030000000000000;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 10;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 15, CFSTR("/WiFi"), self, v22[3]));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setGenerateSummary:", 1);

    v7 = v22[3];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "taskContainer"));
    objc_msgSend(v8, "setTimeout:", v7);

    v9 = v18[3];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v10, "setMaximumSizeMB:", v9);

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001FD20;
    v13[3] = &unk_1000992C8;
    v14 = v5;
    v15 = &v21;
    v16 = &v17;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:](SDLogAgentContainer, "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:", CFSTR("CoreCaptureConfig"), 14, self, 0, v13, 5.0));
    if (v11)
      objc_msgSend(v3, "addObject:", v11);

  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v3;
}

- (id)getCDDebugContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/cddebug"), &off_1000AC938, 0));
  v12 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000AC950));
  v11 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v5, v7, &stru_10009DC10, self, 3.0));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setName:", CFSTR("cdDebug"));
    objc_msgSend(v9, "setRuntimeChecks:", 17);
    objc_msgSend(v3, "addObject:", v9);
  }

  return v3;
}

- (id)getAirPlayContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("AirPlay"), CFSTR("logs/AirPlay"), 0, self, 8.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/airplayutil"), &off_1000AC968, CFSTR("AirPlay.txt")));
    v12[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/airplayutil"), &off_1000AC980, CFSTR("AirPlay.txt")));
    v12[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/airplayutil"), &off_1000AC998, CFSTR("AirPlay.txt")));
    v12[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/airplayutil"), &off_1000AC9B0, CFSTR("AirPlayPrefs.txt")));
    v12[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 4));
    objc_msgSend(v5, "addSDTasksToContainer:", v10);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getCKKSCTLContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("CKKSCTL"), 0, 1, self, 3.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/ckksctl"), &off_1000AC9C8, CFSTR("ckksctl_status.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getOTCTLContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("OTCTL"), 0, 1, self, 3.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/otctl"), &off_1000AC9E0, CFSTR("otctl_status.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getTransparencyContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("TRANSPARENCYCTL"), 0, 1, self, 3.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/transparency-sysdiagnose"), &__NSArray0__struct, CFSTR("transparency.log")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getSWTransparencyContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("swtransparency"), 0, 1, self, 3.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/swtransparency-sysdiagnose"), &__NSArray0__struct, CFSTR("logs/swtransparency.log")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getApfsStatsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("APFS_STATS"), 0, 1, self, 3.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/Filesystems/apfs.fs/apfs_stats"), 0, CFSTR("apfs_stats.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getKeyboardPrefContainer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 26, CFSTR("Preferences"), self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getswcutilContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("SWCUTIL"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/System/Library/PrivateFrameworks/SharedWebCredentials.framework/Support/swcutil"), &off_1000AC9F8, CFSTR("swcutil_show.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getosvariantUtilContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("OSVARIANTUTIL"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/osvariantutil"), &off_1000ACA10, CFSTR("osvariantutil_status.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getcontrolbitsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("controlbits"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/controlbits"), &off_1000ACA28, CFSTR("controlbits.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getclpcContainer
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
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("clpc"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/clpc"), &off_1000ACA40, CFSTR("clpc.txt")));
    v14 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("clpctop"), 0, 1, self, 5.0));
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setRuntimeChecks:", 17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/clpctop"), &off_1000ACA58, CFSTR("clpctop.txt")));
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v9, "addSDTasksToContainer:", v11);

    objc_msgSend(v3, "addObject:", v9);
  }

  return v3;
}

- (id)getclpcctrlContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("clpcctrl"), 0, 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/clpcctrl"), &off_1000ACA70, CFSTR("clpcctrl.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getASPSnapshotsContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 3, CFSTR("ASPSnapshots"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionContainer"));
    objc_msgSend(v6, "setGenerateSummary:", 1);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getCADebugContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("cadebug"), 0, 0, self, 9.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/CADebug"), &off_1000ACA88, CFSTR("CADebug_layers.txt")));
    v12[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/CADebug"), &off_1000ACAA0, CFSTR("CADebug_contexts.txt")));
    v12[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/CADebug"), &off_1000ACAB8, CFSTR("CADebug_displays.txt")));
    v12[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/CADebug"), &off_1000ACAD0, CFSTR("CADebug_display_trace.txt")));
    v12[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 4));
    objc_msgSend(v5, "addSDTasksToContainer:", v10);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getFDRDiagnosticContainer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 21, CFSTR("logs/FDR"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getASPMagazineContainer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 4, CFSTR("ASPSnapshots"), self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getPommesStatusContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("pommes_status"), CFSTR("logs/pommes"), 1, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 17);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/appleinternal/bin/pommes_status.sh"), 0, CFSTR("pommes_status.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getLogGenerationContainers
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _iOSgetLogGenerationContainers](self, "_iOSgetLogGenerationContainers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAutogenLogGenerationContainers](self, "getAutogenLogGenerationContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (BOOL)isDeviceUnlockedSinceBoot
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (id)_iOSGetTimeSensitiveContainers
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSpindumpContainers](self, "getSpindumpContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTriggerBasebandDumpContainer](self, "getTriggerBasebandDumpContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getProcessesInfoContainer](self, "getProcessesInfoContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTSSystemInfoContainer](self, "getTSSystemInfoContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getSampleContainer](self, "getSampleContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTSProcessSpecificContainers](self, "getTSProcessSpecificContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getMultiTouchContainer](self, "getMultiTouchContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getsmcDiagnoseContainer](self, "getsmcDiagnoseContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getThermHIDContainers](self, "getThermHIDContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getPowermetricsContainer](self, "getPowermetricsContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v13);

  return v3;
}

- (id)getThermHIDContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("thermhid"), 0, 0, self, 5.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 33);
    objc_msgSend(v5, "setRunByItself:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask shellTaskWithCommand:outputFile:](SDTask, "shellTaskWithCommand:outputFile:", CFSTR("/usr/local/bin/thermhid | /usr/bin/sort"), CFSTR("thermhid.log")));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask shellTaskWithCommand:outputFile:](SDTask, "shellTaskWithCommand:outputFile:", CFSTR("/usr/local/bin/thermhid -t -p | /usr/bin/sort"), CFSTR("thermhid.log")));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addSDTasksToContainer:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getUptimeContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("Uptime"), 0, 1, self, 1.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 16);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/uptime"), 0, CFSTR("uptime.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_internalSpindumpContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getStackshotContainer](self, "getStackshotContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getUptimeContainer](self, "getUptimeContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTailspinContainers](self, "getTailspinContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  objc_msgSend(v7, "addObjectsFromArray:", &off_1000ACB78);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _getSpindumpMetaContainer:](self, "_getSpindumpMetaContainer:", v7));
  if (v8)
    objc_msgSend(v3, "addObject:", v8);

  return v3;
}

- (id)getsmcDiagnoseContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("smcdiagnose"), 0, 1, self, 15.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/smcDiagnose"), &__NSArray0__struct, CFSTR("smcDiagnose.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getProcessesInfoContainer
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
  _QWORD v14[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("processesInfo"), 0, 1, self, 15.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 32);
    objc_msgSend(v5, "setBlockUntilFinished:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/ps"), &off_1000ACB90, CFSTR("ps.txt")));
    v14[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/ps"), &off_1000ACBA8, CFSTR("ps_thread.txt")));
    v14[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/jetsam_priority"), &off_1000ACBC0, CFSTR("jetsam_priority.txt")));
    v14[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/libexec/jetsam_priority"), &off_1000ACBD8, CFSTR("jetsam_priority.csv")));
    v14[3] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/vm_stat"), &off_1000ACBF0, CFSTR("vm_stat.txt")));
    v14[4] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/taskinfo"), &off_1000ACC08, CFSTR("taskinfo.txt")));
    v14[5] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 6));
    objc_msgSend(v5, "addSDTasksToContainer:", v12);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getTSSystemInfoContainer
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
  void *v16;
  void *v17;
  _QWORD v18[9];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("systemInfo-timeSensitive"), 0, 1, self, 38.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 32);
    v17 = v3;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/sbin/mount"), 0, CFSTR("mount.txt")));
    v18[0] = v16;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/df"), &off_1000ACC20, CFSTR("disks.txt")));
    v18[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/kbdebug"), 0, CFSTR("kbdebug.txt")));
    v18[2] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/sbin/lsof"), &off_1000ACC38, CFSTR("lsof_parsable.txt"), 1));
    v18[3] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/sbin/lsof"), &off_1000ACC50, CFSTR("lsof.txt"), 1));
    v18[4] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/bin/lsmp"), &off_1000ACC68, CFSTR("lsmp.txt"), 1));
    v18[5] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/bin/lskq"), &off_1000ACC80, CFSTR("lskq.txt"), 1));
    v18[6] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/IOSDebug"), &__NSArray0__struct, CFSTR("IOSDebug.txt"), 1));
    v18[7] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/zprint"), &off_1000ACC98, CFSTR("zprint.txt")));
    v18[8] = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 9));
    objc_msgSend(v5, "addSDTasksToContainer:", v14);

    v3 = v17;
    objc_msgSend(v17, "addObject:", v5);
  }

  return v3;
}

- (id)getTSProcessSpecificContainers
{
  unsigned int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;
  uint64_t v28;
  char *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  unsigned int v45;
  __CFString *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void **v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v60;
  uint64_t v61;
  unint64_t v62;
  char *v63;
  void *v64;
  uint64_t v65;
  SystemDiagnostic *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[3];
  _QWORD v84[4];
  _QWORD v85[4];
  uint8_t buf[4];
  unint64_t v87;
  void *v88;
  _BYTE v89[128];

  v60 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = -[SystemDiagnostic requestSource](self, "requestSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    if (-[SystemDiagnostic quickMode](self, "quickMode")
      || -[SystemDiagnostic requestSource](self, "requestSource") == 1)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", CFSTR("-v"), CFSTR("-w"), 0));
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v78;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v78 != v10)
              objc_enumerationMutation(v7);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i), "stringValue"));
            objc_msgSend(v6, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v77, v89, 16);
        }
        while (v9);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("process footprint"), 0, 1, self, 25.0));
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "setRuntimeChecks:", 32);
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/footprint"), v6, CFSTR("footprint.txt")));
        v88 = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v88, 1));
        objc_msgSend(v14, "addSDTasksToContainer:", v16);

        objc_msgSend(v60, "addObject:", v14);
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    v18 = (unint64_t)objc_msgSend(v17, "count");
    v19 = v18 >> 2;

    v20 = v18 & 0xFFFFFFFFFFFFFFFCLL;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    v22 = objc_msgSend(v21, "count");

    if (v20 >= (unint64_t)v22)
      v23 = v19;
    else
      v23 = v19 + 1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v87 = v23;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Number of process specific time-sensitive groups: %lu", buf, 0xCu);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v24, "log:", CFSTR("Number of process specific time-sensitive groups: %lu"), v23);

    if (v23)
    {
      v25 = 0;
      v26 = 30;
      if (v3 == 2)
        v26 = 120;
      v61 = v26;
      v27 = (void **)&AnalyticsSendEventLazy_ptr;
      v66 = self;
      v62 = v23;
      do
      {
        v28 = (4 * v25);
        v29 = (char *)(v28 + 4);
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
        v31 = objc_msgSend(v30, "count");

        if (v28 + 4 > (unint64_t)v31)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
          v29 = (char *)objc_msgSend(v32, "count");

        }
        v67 = (unint64_t)v29;
        v63 = &v29[-v28];
        v65 = v25 + 1;
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27[84], "stringWithFormat:", CFSTR("Process specific container group: %d"), v25 + 1));
        v33 = &__NSArray0__struct;
        do
        {
          v34 = v33;
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectAtIndex:", v28));
          v37 = objc_msgSend(v36, "intValue");

          v38 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27[84], "stringWithFormat:", CFSTR("%d"), v37));
          v39 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
          v75 = v28;
          v76 = v34;
          if (v39
            && (v40 = (void *)v39,
                v41 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices")),
                v42 = objc_msgSend(v41, "count"),
                v41,
                v40,
                v42))
          {
            v43 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
            v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "objectAtIndex:", v28));
            v45 = objc_msgSend(v44, "intValue");

            v46 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(&stru_10009DC10, "stringByAppendingFormat:", CFSTR("%s"), (char *)-[SystemDiagnostic processes](self, "processes") + 136 * (int)v45 + 48));
          }
          else
          {
            v46 = &stru_10009DC10;
          }
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27[84], "stringWithFormat:", CFSTR("<TMPOUTPUTDIR>/graph-%d-%@.memgraph"), v37, v46));
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27[84], "stringWithFormat:", CFSTR("errors/leaks_highmem_%d_errors.txt"), v37));
          v84[0] = CFSTR("-outputGraph");
          v84[1] = v74;
          v84[2] = v38;
          v84[3] = CFSTR("-forkCorpse");
          v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v84, 4));
          v71 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/leaks"), v72, v73));
          v85[0] = v71;
          v83[0] = CFSTR("-v");
          v83[1] = CFSTR("-k");
          v83[2] = v38;
          v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v83, 3));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27[84], "stringWithFormat:", CFSTR("ddt-%u-%@.txt"), v37, v46));
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:withRuntimeChecks:](SDTask, "taskWithCommand:arguments:outputFile:withRuntimeChecks:", CFSTR("/usr/local/bin/ddt"), v69, v68, 1));
          v85[1] = v47;
          v82[0] = CFSTR("procinfo");
          v82[1] = v38;
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v82, 2));
          v49 = v38;
          v70 = (void *)v38;
          v50 = v27;
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27[84], "stringWithFormat:", CFSTR("launchctl-procinfo-%u-%@.txt"), v37, v46));
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/launchctl"), v48, v51));
          v85[2] = v52;
          v81[0] = CFSTR("dump-concurrency");
          v81[1] = v49;
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v81, 2));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50[84], "stringWithFormat:", CFSTR("swift-inspect-%u-%@.txt"), v37, v46));
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/swift-inspect"), v53, v54));
          v85[3] = v55;
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v85, 4));

          v27 = v50;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "arrayByAddingObjectsFromArray:", v56));

          v28 = v75 + 1;
          self = v66;
        }
        while (v75 + 1 < v67);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:isConcurrent:", v33, &__NSArray0__struct, &stru_10009DC10, v66, 1, (double)(unint64_t)((_QWORD)v63 * v61)));
        v58 = v57;
        if (v57)
        {
          objc_msgSend(v57, "setName:", v64);
          objc_msgSend(v60, "addObject:", v58);
        }

        v25 = v65;
      }
      while (v65 != v62);
    }
  }
  return v60;
}

- (id)getSampleContainer
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
  void *v13;
  _QWORD v14[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sample-%@.txt"), v4));

  v14[0] = CFSTR("<PID>");
  v14[1] = CFSTR("2");
  v14[2] = CFSTR("-f");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("<TMPOUTPUTDIR>"), "stringByAppendingPathComponent:", v5));
  v14[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/sample"), v7, v5));
  v13 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithTasks:withTimeout:withRules:atDestination:withDelegate:", v9, &__NSArray0__struct, &stru_10009DC10, self, 5.0));
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "setName:", CFSTR("sample-targeted"));
    objc_msgSend(v11, "setRuntimeChecks:", 544);
    objc_msgSend(v3, "addObject:", v11);
  }

  return v3;
}

- (id)getMultiTouchContainer
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002BCD0;
  v9[3] = &unk_100099238;
  v9[4] = self;
  v4 = objc_retainBlock(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithBlock:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithBlock:withTimeout:atDestination:withDelegate:", v4, CFSTR("mtrecorder"), self, 6.0));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setRuntimeChecks:", 33);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionContainer"));
    objc_msgSend(v7, "setMaximumSizeMB:", 15);

    objc_msgSend(v3, "addObject:", v6);
  }

  return v3;
}

- (id)getPowermetricsContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("powermetrics"), 0, 1, self, 10.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 32);
    objc_msgSend(v5, "setRunByItself:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/local/bin/powermetrics"), &off_1000ACCC8, CFSTR("powermetrics.txt")));
    v9 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v5, "addSDTasksToContainer:", v7);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getTriggerBasebandDumpContainer
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 57, &stru_10009DC10, self, 1.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 32);
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getSpindumpContainers
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
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getASPSnapshotContainer](self, "getASPSnapshotContainer"));
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _internalSpindumpContainers](self, "_internalSpindumpContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("tailspin-history"), CFSTR("logs/tailspindb"), self));
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setMaximumSizeMB:", 0);
    objc_msgSend(v7, "setRuntimeChecks:", 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dateByAddingTimeInterval:", -120.0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:](SDUnitLogGlob, "logRuleWithGlob:withDate:withFilter:newestFileCount:atInternalDirectory:withRuntimeChecks:", CFSTR("/private/var/db/spindump/tailspin-trace*"), v9, 0, 0, 0, 0));
    v13 = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    objc_msgSend(v7, "addRules:", v11);

    objc_msgSend(v3, "addObject:", v7);
  }

  return v3;
}

- (id)getASPSnapshotContainer
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 5, CFSTR("ASPSnapshots"), self, 5.0));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "setRuntimeChecks:", 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionContainer"));
    objc_msgSend(v4, "setGenerateSummary:", 1);

  }
  return v3;
}

- (id)getTimeSensitiveContainers
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic _iOSGetTimeSensitiveContainers](self, "_iOSGetTimeSensitiveContainers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getAutogenTimeSensitiveContainers](self, "getAutogenTimeSensitiveContainers"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return v3;
}

- (id)getTailspinContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  NSFileAttributeKey v23;
  _UNKNOWN **v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("tailspin-save/")));

  v23 = NSFilePosixPermissions;
  v24 = &off_1000ACE18;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
  v22 = 0;
  v8 = objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 0, v7, &v22);
  v9 = v22;

  if ((v8 & 1) != 0)
  {
    v10 = (double)sub_100025544(0);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002C8B0;
    v20[3] = &unk_100099A00;
    v20[4] = self;
    v21 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:](SDLogAgentContainer, "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:", v21, 50, self, 0, v20, v10));
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "setRuntimeChecks:", 32);
      objc_msgSend(v12, "setName:", CFSTR("tailspin-save-ts"));
      objc_msgSend(v12, "setBlockUntilFinished:", 1);
      objc_msgSend(v3, "addObject:", v12);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", 46, &stru_10009DC10, self, 10.0));
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "setRuntimeChecks:", 32);
      objc_msgSend(v14, "setName:", CFSTR("tailspin-info-ts"));
      v15 = sub_100025178(0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "collectionContainer"));
      objc_msgSend(v16, "setMaximumSizeMB:", v15);

      objc_msgSend(v3, "addObject:", v14);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005FE14();
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v17, "stderrWrite:", CFSTR("Unable to create intermediate tailspin save directory %@: %@"), v6, v9);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v18, "log:", CFSTR("Unable to create intermediate tailspin save directory %@: %@"), v6, v9);

  }
  return v3;
}

- (id)getStackshotContainer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (-[SystemDiagnostic requestSource](self, "requestSource") == 1)
    v4 = 41;
  else
    v4 = 40;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDComplexContainer complexContainerWithSPITask:withTimeout:atDestination:withDelegate:](SDComplexContainer, "complexContainerWithSPITask:withTimeout:atDestination:withDelegate:", v4, &stru_10009DC10, self, 5.0));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setName:", CFSTR("time-sensitive-stackshot"));
    objc_msgSend(v6, "setRuntimeChecks:", 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "taskContainer"));
    objc_msgSend(v7, "setBlockUntilFinished:", 1);

    objc_msgSend(v3, "addObject:", v6);
  }

  return v3;
}

- (id)_getSpindumpMetaContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  void *v23;
  _QWORD v24[2];
  NSFileAttributeKey v25;
  _UNKNOWN **v26;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("spindump/")));

  v25 = NSFilePosixPermissions;
  v26 = &off_1000ACE18;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v22 = 0;
  v9 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 0, v8, &v22);
  v10 = v22;

  if ((v9 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("<TMPOUTPUTDIR>"), "stringByAppendingPathComponent:", CFSTR("spindump-nosymbols.txt")));
    v24[0] = CFSTR("-file");
    v24[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 2));
    objc_msgSend(v4, "addObjectsFromArray:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/sbin/spindump"), v4, CFSTR("errors/spindump_nosym_errors.txt")));
    objc_msgSend(v13, "setSlowTimeout:", 1);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002CD88;
    v20[3] = &unk_100099260;
    v20[4] = self;
    v14 = v7;
    v21 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:withCompletionBlock:", CFSTR("spindump-meta"), &stru_10009DC10, 1, self, v20, 30.0));
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "setRuntimeChecks:", 32);
      objc_msgSend(v16, "setBlockUntilFinished:", 1);
      v23 = v13;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
      objc_msgSend(v16, "addSDTasksToContainer:withTmpOutputDir:", v17, v14);

    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005FE80();
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v18, "stderrWrite:", CFSTR("Unable to create intermediate spindump directory %@: %@"), v7, v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v11, "log:", CFSTR("Unable to create intermediate spindump directory %@: %@"), v7, v10);
    v16 = 0;
  }

  return v16;
}

- (SystemDiagnostic)init
{
  SystemDiagnostic *v2;
  SystemDiagnostic *v3;
  NSString *rootPath;
  uint64_t v5;
  NSString *baseDirectory;
  SDArchive *archive;
  NSMutableDictionary *v8;
  NSMutableDictionary *metricsDict;
  NSDictionary *overrideContainers;
  NSMutableDictionary *v11;
  NSMutableDictionary *executedContainers;
  NSFileHandle *summaryHandle;
  NSString *frontmostBundleID;
  NSDictionary *capOverride;
  id v16;
  uint64_t v17;
  NSString *diagnosticID;
  OS_xpc_object *coSysdiagnoseParameters;
  NSString *changedDiagnosticProperties;
  uint64_t v21;
  NSMutableArray *pidIndices;
  NSArray *onlyRunContainersWithNames;
  NSString *completedOutputDirectory;
  NSString *completedTarballPath;
  NSNumber *totalTime;
  dispatch_group_t v27;
  OS_dispatch_group *completionDispatchGroup;
  uint64_t v29;
  NSString *brctl_dir;
  objc_super v32;
  char v33[1024];

  v32.receiver = self;
  v32.super_class = (Class)SystemDiagnostic;
  v2 = -[SystemDiagnostic init](&v32, "init");
  v3 = v2;
  if (v2)
  {
    rootPath = v2->_rootPath;
    v2->_rootPath = (NSString *)CFSTR("/");

    v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic defaultBaseDirectory](v3, "defaultBaseDirectory"));
    baseDirectory = v3->_baseDirectory;
    v3->_baseDirectory = (NSString *)v5;

    v3->_quickMode = 0;
    *(_DWORD *)&v3->_shouldRunTimeSensitiveTasks = 16843009;
    *(_WORD *)&v3->_shouldGetFeedbackData = 0;
    v3->_verbose = 0;
    *(_DWORD *)&v3->_earlyPrompt = 16843009;
    *(_WORD *)&v3->_shouldRemoveTemporaryDirectory = 1;
    v3->_requestSource = 0;
    archive = v3->_archive;
    v3->_archive = 0;

    v3->_shouldStreamToTar = 1;
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    metricsDict = v3->_metricsDict;
    v3->_metricsDict = v8;

    overrideContainers = v3->_overrideContainers;
    v3->_overrideContainers = 0;

    v11 = objc_opt_new(NSMutableDictionary);
    executedContainers = v3->_executedContainers;
    v3->_executedContainers = v11;

    v3->_disableStreamTar = 0;
    v3->_coSysdiagnose = 0;
    v3->_coSysdiagnoseOnly = 0;
    v3->_disableUIFeedback = 0;
    summaryHandle = v3->_summaryHandle;
    v3->_summaryHandle = 0;

    frontmostBundleID = v3->_frontmostBundleID;
    v3->_frontmostBundleID = 0;

    v3->_shouldPostProcess = 1;
    capOverride = v3->_capOverride;
    v3->_capOverride = 0;

    v3->_didComplete = 0;
    v16 = sub_100023B9C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    diagnosticID = v3->_diagnosticID;
    v3->_diagnosticID = (NSString *)v17;

    coSysdiagnoseParameters = v3->_coSysdiagnoseParameters;
    v3->_coSysdiagnoseParameters = 0;

    changedDiagnosticProperties = v3->_changedDiagnosticProperties;
    v3->_changedDiagnosticProperties = (NSString *)&stru_10009DC10;

    v3->_summaryFD = 0;
    v3->_isTestingMode = 0;
    v21 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pidIndices = v3->_pidIndices;
    v3->_pidIndices = (NSMutableArray *)v21;

    v3->_useParallelCompression = 0;
    v3->_deShowFeedback = 0;
    onlyRunContainersWithNames = v3->_onlyRunContainersWithNames;
    v3->_onlyRunContainersWithNames = 0;

    completedOutputDirectory = v3->_completedOutputDirectory;
    v3->_completedOutputDirectory = 0;

    completedTarballPath = v3->_completedTarballPath;
    v3->_completedTarballPath = 0;

    totalTime = v3->_totalTime;
    v3->_totalTime = 0;

    v27 = dispatch_group_create();
    completionDispatchGroup = v3->_completionDispatchGroup;
    v3->_completionDispatchGroup = (OS_dispatch_group *)v27;

    sub_100045A80(v33, 0x400uLL, "/private/var/mobile/Library/Logs/CrashReporter/Cloud/clouddocs", 0, 0);
    v29 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v33));
    brctl_dir = v3->_brctl_dir;
    v3->_brctl_dir = (NSString *)v29;

    *(_WORD *)&v3->_tconNvmDump = 0;
    -[SystemDiagnostic populateProcesses](v3, "populateProcesses");
  }
  return v3;
}

- (void)prompt
{
  __assert_rtn("-[SystemDiagnostic prompt]", "SystemDiagnostic.m", 157, "0 && \"Must use a concrete subclass\");
}

- (void)setSkipBTLogs
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
  objc_msgSend(v2, "setShouldGatherBTLogs:", 0);

}

- (id)prepareCoSysdiagnoseParams
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint8_t buf[16];
  _QWORD applier[4];
  id v12;
  id v13;

  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic coSysdiagnoseParameters](self, "coSysdiagnoseParameters"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", CFSTR("stdout"), CFSTR("stdin"), CFSTR("stderr"), CFSTR("coSysdiagnose"), CFSTR("coSysdiagnoseOnly"), CFSTR("clientPID"), CFSTR("SDRequestSourceShell"), CFSTR("baseDirectory"), CFSTR("shouldCreateTarBall"), CFSTR("warnProcAllowlist"), CFSTR("archiveName"), CFSTR("remoteUUIDs"), 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic coSysdiagnoseParameters](self, "coSysdiagnoseParameters"));
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_100047C9C;
    applier[3] = &unk_100099DF8;
    v12 = v5;
    v13 = v3;
    v7 = v5;
    xpc_dictionary_apply(v6, applier);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No co-sysdiagnose paramateres exist. Creating now", buf, 2u);
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "log:", CFSTR("No co-sysdiagnose paramateres exist. Creating now"));

    xpc_dictionary_set_BOOL(v3, "generatePlist", -[SystemDiagnostic generatePlist](self, "generatePlist"));
    xpc_dictionary_set_BOOL(v3, "quickMode", -[SystemDiagnostic quickMode](self, "quickMode"));
    xpc_dictionary_set_BOOL(v3, "shouldRunLogCopyTasks", -[SystemDiagnostic shouldRunLogCopyTasks](self, "shouldRunLogCopyTasks"));
    xpc_dictionary_set_BOOL(v3, "shouldRunLogGenerationTasks", -[SystemDiagnostic shouldRunLogGenerationTasks](self, "shouldRunLogGenerationTasks"));
    xpc_dictionary_set_BOOL(v3, "shouldRunTimeSensitiveTasks", -[SystemDiagnostic shouldRunTimeSensitiveTasks](self, "shouldRunTimeSensitiveTasks"));
    xpc_dictionary_set_BOOL(v3, "shouldRunOSLogArchive", -[SystemDiagnostic shouldRunOSLogArchive](self, "shouldRunOSLogArchive"));
    xpc_dictionary_set_BOOL(v3, "disableStreamTar", -[SystemDiagnostic disableStreamTar](self, "disableStreamTar"));
  }
  return v3;
}

- (NSString)defaultBaseDirectory
{
  __assert_rtn("-[SystemDiagnostic defaultBaseDirectory]", "SystemDiagnostic.m", 230, "0 && \"Must use a concrete subclass.\");
}

- (BOOL)makeOutputDirectory
{
  __assert_rtn("-[SystemDiagnostic makeOutputDirectory]", "SystemDiagnostic.m", 235, "0 && \"Must use a concrete subclass.\");
}

- (void)gatherDiagnostic
{
  __assert_rtn("-[SystemDiagnostic gatherDiagnostic]", "SystemDiagnostic.m", 240, "0 && \"Must use a concrete subclass.\");
}

- (void)populateProcesses
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  int *v10;
  char *v11;
  int v12;
  unsigned int v13;
  const char *v14;
  size_t v15;
  int v16;
  int v17[2];

  *(_QWORD *)v17 = 0x600000001;
  if (-[SystemDiagnostic processes](self, "processes", 4))
    return;
  v16 = 0;
  if (sysctl(v17, 2u, &v16, &v15, 0, 0) == -1)
  {
    v14 = "sysctl(... kern.maxproc ...)";
LABEL_17:
    perror(v14);
    return;
  }
  v3 = malloc_type_malloc(4 * v16, 0x100004052888210uLL);
  if (!v3)
  {
    v14 = "malloc";
    goto LABEL_17;
  }
  v4 = v3;
  v5 = proc_listallpids(v3, 4 * v16);
  if (v5 == -1)
  {
    perror("proc_listallpids");
    free(v4);
  }
  else
  {
    LODWORD(v6) = v5;
    v7 = (char *)malloc_type_malloc(136 * v5, 0x1000040B5CA6940uLL);
    v8 = v7;
    if ((int)v6 < 1)
    {
      v9 = 0;
    }
    else
    {
      LODWORD(v9) = 0;
      v10 = (int *)v4;
      v11 = v7;
      v6 = v6;
      do
      {
        v12 = *v10++;
        v13 = proc_pidinfo(v12, 3, 0, v11, 136);
        if (v13 <= 0x87)
          v9 = v9;
        else
          v9 = (v9 + 1);
        v11 += 136 * (v13 > 0x87);
        --v6;
      }
      while (v6);
    }
    free(v4);
    -[SystemDiagnostic setProcesses:](self, "setProcesses:", v8);
    -[SystemDiagnostic setProcessCount:](self, "setProcessCount:", v9);
  }
}

- (int)pidForProcessName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (!-[SystemDiagnostic processCount](self, "processCount"))
    -[SystemDiagnostic populateProcesses](self, "populateProcesses");
  if (-[SystemDiagnostic processCount](self, "processCount") < 1)
    return -1;
  v5 = 0;
  v6 = 0;
  while (strncmp((const char *)-[SystemDiagnostic processes](self, "processes") + v5 + 48, v4, 0xFuLL))
  {
    ++v6;
    v5 += 136;
    if (v6 >= -[SystemDiagnostic processCount](self, "processCount"))
      return -1;
  }
  return *(_DWORD *)((char *)-[SystemDiagnostic processes](self, "processes") + v5 + 12);
}

- (BOOL)_processIsTargeted:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (sub_100046230(*(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), v4))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

- (BOOL)mailIsTargeted
{
  return -[SystemDiagnostic _processIsTargeted:](self, "_processIsTargeted:", CFSTR("/Applications/Mail.app/Contents/MacOS/Mail"));
}

- (BOOL)safariIsTargeted
{
  return -[SystemDiagnostic _processIsTargeted:](self, "_processIsTargeted:", CFSTR("/Applications/Safari.app/Contents/MacOS/Safari"));
}

- (BOOL)prepareOutput
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  FILE *v18;
  FILE *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  const char *v24;
  FILE *v25;
  FILE *v26;
  FILE *v27;
  size_t v28;
  size_t v29;
  _BYTE *v30;
  size_t v31;
  void *v32;
  void *v33;
  _BYTE v35[1008];
  uint8_t buf[4];
  void *v37;

  v3 = -[SystemDiagnostic prepareOutputDirectory](self, "prepareOutputDirectory");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    v7 = objc_msgSend(v4, "setUpSysdiagnoseLog:withID:", v5, v6);

    if ((v7 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set up sysdiagnose.log with SDResourceManager.", buf, 2u);
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v8, "log:", CFSTR("Failed to set up sysdiagnose.log with SDResourceManager."));

    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic changedDiagnosticProperties](self, "changedDiagnosticProperties"));
      *(_DWORD *)buf = 138412290;
      v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The following properties were changed from default:\n%@", buf, 0xCu);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic changedDiagnosticProperties](self, "changedDiagnosticProperties"));
    objc_msgSend(v10, "log:", CFSTR("The following properties were changed from default:\n%@"), v11);

    if (sub_100045E60())
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](self, "warnProcessAllowlist"));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic warnProcessAllowlist](self, "warnProcessAllowlist"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingPathComponent:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "stringByAppendingString:", CFSTR("_WARNING.log")));

        v17 = objc_retainAutorelease(v16);
        v18 = fopen((const char *)objc_msgSend(v17, "fileSystemRepresentation"), "wx");
        if (v18)
        {
          v19 = v18;
          fputs(off_1000B9480, v18);
          fclose(v19);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create warning for disallowed process", buf, 2u);
          }
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v20, "stdoutWrite:", CFSTR("Unable to create warning for disallowed process"));

          v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v21, "log:", CFSTR("Unable to create warning for disallowed process"));

        }
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("tailspin-README.txt"))));
      v24 = (const char *)objc_msgSend(v23, "fileSystemRepresentation");

      v25 = fopen("/AppleInternal/tailspin/tailspin-README.txt", "r");
      if (v25)
      {
        v26 = fopen(v24, "wx");
        if (v26)
        {
          v27 = v26;
          v28 = fread(v35, 1uLL, 0x400uLL, v25);
          if (v28)
          {
            v29 = v28;
            v30 = v35;
            do
            {
              do
              {
                v31 = fwrite(v30, 1uLL, v29, v27);
                v30 += v31;
                v29 -= v31;
              }
              while (v29);
              v29 = fread(v35, 1uLL, 0x400uLL, v25);
              v30 = v35;
            }
            while (v29);
          }
          fclose(v27);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to create tailspin-README.rtf", buf, 2u);
          }
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v32, "stdoutWrite:", CFSTR("Unable to create tailspin-README.rtf"));

          v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v33, "log:", CFSTR("Unable to create tailspin-README.rtf"));

        }
      }
      fclose(v25);
    }
  }
  return v3;
}

- (void)completeTarball
{
  void *v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  int v23;
  void *v24;
  char v25;
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
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));

    if (!v4)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "The tarball wasn't safely created. Something's wrong.", buf, 2u);
      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v28, "stdoutWrite:", CFSTR("The tarball wasn't safely created. Something's wrong."));

      v17 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v17, "log:", CFSTR("The tarball wasn't safely created. Something's wrong."));
      goto LABEL_16;
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
    v6 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v5, 0);

    if ((v6 & 1) != 0)
    {
      v7 = -[SystemDiagnostic didComplete](self, "didComplete");
      v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
      if ((v7 & 1) != 0)
      {
        if (v8)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
          *(_DWORD *)buf = 138412546;
          v42 = v9;
          v43 = 2112;
          v44 = v10;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Moving tarball '%@' to final location '%@'", buf, 0x16u);

        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        objc_msgSend(v11, "log:", CFSTR("Moving tarball '%@' to final location '%@'"), v12, v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        v39 = 0;
        v16 = objc_msgSend(v3, "moveItemAtPath:toPath:error:", v14, v15, &v39);
        v17 = v39;

        if ((v16 & 1) != 0)
          goto LABEL_12;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100061E94(self, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedDescription"));
        objc_msgSend(v18, "log:", CFSTR("Failed to move tarball '%@' to final location '%@': %@"), v19, v20, v21);

        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath")));
        v23 = sub_1000259F0((const char *)objc_msgSend(v22, "fileSystemRepresentation"), -[SystemDiagnostic isDeviceUnlockedSinceBoot](self, "isDeviceUnlockedSinceBoot"));

        if (v23 == -1)
          goto LABEL_26;
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
        v25 = sub_100025764((int)objc_msgSend(v24, "archiveFD"), v23);

        if ((v25 & 1) != 0)
        {
LABEL_12:
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
          -[SystemDiagnostic setTarballPath:](self, "setTarballPath:", v26);

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
          sub_100026CA4();

        }
        else
        {
LABEL_26:
          -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0);
        }
LABEL_16:

        goto LABEL_23;
      }
      if (v8)
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        *(_DWORD *)buf = 138412290;
        v42 = v32;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sysdiagnose was cancelled. Remove tarball at %@.", buf, 0xCu);

      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
      objc_msgSend(v33, "log:", CFSTR("Sysdiagnose was cancelled. Remove tarball at %@."), v34);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
      v40 = 0;
      objc_msgSend(v3, "removeItemAtPath:error:", v35, &v40);
      v36 = v40;

      -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
        *(_DWORD *)buf = 138412290;
        v42 = v29;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Tarball at %@ doesn't exist. Something's wrong", buf, 0xCu);

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
      objc_msgSend(v30, "log:", CFSTR("Tarball at %@ doesn't exist. Something's wrong"), v31);

      -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0);
    }
  }
LABEL_23:
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));

  if (v37)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
    objc_msgSend(v38, "closeArchive");

  }
}

- (void)markFoldersAsComplete
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  void *v23;
  char *v24;
  void *v25;
  void *v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  id v33;
  int v34;
  int *v35;
  char *v36;
  void *v37;
  int *v38;
  void *v39;
  unsigned __int8 v40;
  id v41;
  _BOOL4 v42;
  char *v43;
  void *v44;
  void *v45;
  char *v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint8_t buf[4];
  char *v53;
  __int16 v54;
  id v55;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
  v51 = 0;
  v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v51);
  v6 = v51;

  if ((v5 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
      *(_DWORD *)buf = 138412546;
      v53 = v7;
      v54 = 2112;
      v55 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove tmpOutputDir %@ upon completion: %@", buf, 0x16u);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tmpOutputDirectory](self, "tmpOutputDirectory"));
    objc_msgSend(v8, "log:", CFSTR("Failed to remove tmpOutputDir %@ upon completion: %@"), v9, v6);

    v6 = 0;
  }
  if (-[SystemDiagnostic shouldRemoveTemporaryDirectory](self, "shouldRemoveTemporaryDirectory"))
    v10 = -[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall");
  else
    v10 = 0;
  if (!-[SystemDiagnostic didComplete](self, "didComplete") || v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v50 = v6;
    v12 = objc_msgSend(v3, "removeItemAtPath:error:", v11, &v50);
    v13 = v50;

    if ((v12 & 1) != 0)
    {
      v6 = v13;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        *(_DWORD *)buf = 138412546;
        v53 = v14;
        v54 = 2112;
        v55 = v13;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove outputDir %@ upon completion: %@", buf, 0x16u);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      objc_msgSend(v15, "log:", CFSTR("Failed to remove outputDir %@ upon completion: %@"), v16, v13);

      v6 = 0;
    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v18 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v17, 0);

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
    v49 = v6;
    v21 = objc_msgSend(v3, "moveItemAtPath:toPath:error:", v19, v20, &v49);
    v22 = v49;

    if ((v21 & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
      -[SystemDiagnostic setOutputDirectory:](self, "setOutputDirectory:", v23);

      v6 = v22;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        *(_DWORD *)buf = 138412546;
        v53 = v27;
        v54 = 2112;
        v55 = v22;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to rename outputDir %@ upon completion: %@", buf, 0x16u);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      objc_msgSend(v28, "log:", CFSTR("Failed to rename outputDir %@ upon completion: %@"), v29, v22);

      -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0);
      v6 = 0;
    }
  }
  else if (((!-[SystemDiagnostic didComplete](self, "didComplete") | v10) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      *(_DWORD *)buf = 138412290;
      v53 = v24;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Output dir at %@ doesn't exist. Something's wrong", buf, 0xCu);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    objc_msgSend(v25, "log:", CFSTR("Output dir at %@ doesn't exist. Something's wrong"), v26);

    -[SystemDiagnostic setCanDisplayTarBall:](self, "setCanDisplayTarBall:", 0);
  }
  -[SystemDiagnostic completeTarball](self, "completeTarball");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic defaultBaseDirectory](self, "defaultBaseDirectory"));
  v32 = objc_msgSend(v30, "isEqualToString:", v31);

  if (v32)
  {
    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory")));
    v34 = sub_100053B0C((const char *)objc_msgSend(v33, "UTF8String"), 0x1F5u, 0x1F5u);

    if (v34 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v35 = __error();
        v36 = strerror(*v35);
        *(_DWORD *)buf = 136315138;
        v53 = v36;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set permissions for base directory: %s", buf, 0xCu);
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v38 = __error();
      objc_msgSend(v37, "log:", CFSTR("Failed to set permissions for base directory: %s"), strerror(*v38));

    }
  }
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic brctl_dir](self, "brctl_dir"));
  v48 = v6;
  v40 = objc_msgSend(v3, "removeItemAtPath:error:", v39, &v48);
  v41 = v48;

  v42 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((v40 & 1) != 0)
  {
    if (v42)
    {
      v43 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic brctl_dir](self, "brctl_dir"));
      *(_DWORD *)buf = 138412290;
      v53 = v43;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully removed brctl dir %@", buf, 0xCu);

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic brctl_dir](self, "brctl_dir"));
    objc_msgSend(v44, "log:", CFSTR("Successfully removed brctl dir %@"), v45, v47);
  }
  else
  {
    if (v42)
    {
      v46 = (char *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic brctl_dir](self, "brctl_dir"));
      *(_DWORD *)buf = 138412546;
      v53 = v46;
      v54 = 2112;
      v55 = v41;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to remove brctl dir %@ upon completion: %@", buf, 0x16u);

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic brctl_dir](self, "brctl_dir"));
    objc_msgSend(v44, "log:", CFSTR("Failed to remove brctl dir %@ upon completion: %@"), v45, v41);
  }

}

- (BOOL)isPromptEligible
{
  return !-[SystemDiagnostic disableUIFeedback](self, "disableUIFeedback")
      && (-[SystemDiagnostic requestSource](self, "requestSource") == 1
       || -[SystemDiagnostic requestSource](self, "requestSource") == 4);
}

- (void)run
{
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  id v10;
  NSString *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  void *v16;
  NSString *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  _QWORD v52[6];
  uint8_t buf[8];
  uint8_t *v54;
  uint64_t v55;
  char v56;
  os_activity_scope_state_s state;
  uint8_t v58[4];
  id v59;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v3, "registerDiagnosticObject:", self);

  v4 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completionDispatchGroup](self, "completionDispatchGroup"));
  dispatch_group_enter(v4);

  v5 = sub_100026BC4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SDObjSetup", "[run] run function begins", buf, 2u);
  }

  nullsub_3(1);
  sub_1000266D0(300.0);
  v7 = _os_activity_create((void *)&_mh_execute_header, "Directory setup", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  *(_QWORD *)buf = 0;
  v54 = buf;
  v55 = 0x2020000000;
  v56 = 0;
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100049C50;
  v52[3] = &unk_100098FB0;
  v52[4] = self;
  v52[5] = buf;
  v8 = +[SystemDiagnostic _runBlock:withTimeout:](SystemDiagnostic, "_runBlock:withTimeout:", v52, 3.0);
  if (v54[24])
  {
    v9 = v8;
    v10 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = sub_1000469F0();
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)v58 = 138412290;
      v59 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@", v58, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v14 = sub_1000469F0();
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v13, "stdoutWrite:", CFSTR("%@"), v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v17 = sub_1000469F0();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "log:", CFSTR("%@"), v18);

    +[SystemDiagnostic _runBlock:withTimeout:](SystemDiagnostic, "_runBlock:withTimeout:", &stru_100099E18, 0.25);
    v19 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = sub_100023950(-[SystemDiagnostic requestSource](self, "requestSource"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)v58 = 138412290;
      v59 = v21;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Request source: %@", v58, 0xCu);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v23 = sub_100023950(-[SystemDiagnostic requestSource](self, "requestSource"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(v22, "log:", CFSTR("Request source: %@"), v24);

    v25 = sub_100026BC4();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)v58 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SDObjSetup", "[run] setup ended! gather diagnostic logs...", v58, 2u);
    }

    if (v9)
    {
      if (!-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v58 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Disabling streaming into tar as we are not creating tarball", v58, 2u);
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v27, "log:", CFSTR("Disabling streaming into tar as we are not creating tarball"));

        -[SystemDiagnostic setDisableStreamTar:](self, "setDisableStreamTar:", 1);
      }
      if (!-[SystemDiagnostic shouldRunIDSDump](self, "shouldRunIDSDump"))
        -[SystemDiagnostic setShouldRunIDSDump:](self, "setShouldRunIDSDump:", sub_100022C98());
      v28 = sub_100026BC4();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)v58 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SDObjGatherDiagnostic", "[run] gather diagnostic phase function begins", v58, 2u);
      }

      kdebug_trace(27525125, 0, 0, 0, 0);
      -[SystemDiagnostic initStreaming](self, "initStreaming");
      -[SystemDiagnostic gatherDiagnostic](self, "gatherDiagnostic");
      kdebug_trace(27525126, 0, 0, 0, 0);
      -[SystemDiagnostic markFoldersAsComplete](self, "markFoldersAsComplete");
      -[SystemDiagnostic sendCoreAnalytics](self, "sendCoreAnalytics");
      -[SystemDiagnostic closeTaskSummaryHandle](self, "closeTaskSummaryHandle");
      if (-[SystemDiagnostic requestSource](self, "requestSource") == 2)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v30, "closeCLI");

      }
      v31 = sub_100026BC4();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_signpost_enabled(v32))
      {
        *(_WORD *)v58 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v32, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SDObjGatherDiagnostic", "[run] gather diagnostic ended!", v58, 2u);
      }

      if (!-[SystemDiagnostic earlyPrompt](self, "earlyPrompt")
        && -[SystemDiagnostic isPromptEligible](self, "isPromptEligible"))
      {
        -[SystemDiagnostic prompt](self, "prompt");
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v58 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Timed out preparing sysdiagnose output. Cleaning up", v58, 2u);
      }
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
      objc_msgSend(v35, "setUpDiagnosticID:", v36);

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
      objc_msgSend(v38, "setOutputDirectory:", v37);

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogAgentContainer containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:](SDLogAgentContainer, "containerAtLocation:forTaskType:withTimeout:withDelegate:withMsgContents:withReplyBlock:", v39, 49, self, 0, 0, 10.0));
      v41 = v40;
      if (v40)
      {
        objc_msgSend(v40, "setRuntimeChecks:", 0);
        objc_msgSend(v41, "setName:", CFSTR("tailspin-save-output-dir-timeout"));
        objc_msgSend(v41, "execute");
      }
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "paths"));
      v43 = objc_msgSend(v42, "count");

      if (v43 == (id)1)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "paths"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "objectAtIndexedSubscript:", 0));

      }
      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v58 = 134217984;
          v59 = v43;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "output dir timeout tailspin task returned wrong number of paths (%ld)", v58, 0xCu);
        }
        v45 = 0;
      }
      -[SystemDiagnostic setShouldCreateTarBall:](self, "setShouldCreateTarBall:", 1);
      -[SystemDiagnostic setDidComplete:](self, "setDidComplete:", 1);
      -[SystemDiagnostic setTarballPath:](self, "setTarballPath:", v45);
      if (-[SystemDiagnostic requestSource](self, "requestSource") == 2)
      {
        v46 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v46, "closeCLI");

      }
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v47, "closeSysdiagnoseLog");

    }
    if (-[SystemDiagnostic requestSource](self, "requestSource") != 2)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v48, "closeSysdiagnoseSession");

    }
    sub_100026790();
    v34 = objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    -[NSObject transferFileToHostIfNecessary:forDiagnosticID:](v34, "transferFileToHostIfNecessary:forDiagnosticID:", v49, v50);

  }
  else
  {
    v33 = sub_100026BC4();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_signpost_enabled(v34))
    {
      *(_WORD *)v58 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SDObjSetup", "[run] setup ended! gather diagnostic logs...", v58, 2u);
    }
  }

  v51 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completionDispatchGroup](self, "completionDispatchGroup"));
  dispatch_group_leave(v51);

  nullsub_3(0);
  _Block_object_dispose(buf, 8);
  os_activity_scope_leave(&state);

}

- (id)getDefaultArchiveName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const void *Value;
  void *v11;
  const void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("-")));
    v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%@"), v3, v6));

    v3 = (void *)v7;
  }
  v8 = (const __CFDictionary *)_CFCopySupplementalVersionDictionary();
  if (v8)
  {
    v9 = v8;
    Value = CFDictionaryGetValue(v8, _kCFSystemVersionProductNameKey);
    v11 = (void *)objc_claimAutoreleasedReturnValue(Value);
    v12 = CFDictionaryGetValue(v9, _kCFSystemVersionBuildVersionKey);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v3));
    if (v11)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("-")));
      objc_msgSend(v14, "addObject:", v15);

    }
    v16 = (__CFString *)MGCopyAnswer(CFSTR("DeviceClass"), 0);
    if (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("AudioAccessory")))
    {

      v16 = CFSTR("HomePod");
    }
    else if (!v16)
    {
LABEL_10:
      if (-[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("HomePod")))
      {
        v17 = sub_1000294A4();
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        objc_msgSend(v14, "addObject:", v18);

      }
      if (v13)
        objc_msgSend(v14, "addObject:", v13);
      v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", CFSTR("_")));

      CFRelease(v9);
      v3 = (void *)v19;
      return v3;
    }
    objc_msgSend(v14, "addObject:", v16);
    goto LABEL_10;
  }
  return v3;
}

- (id)getArchiveExtension
{
  if (-[SystemDiagnostic useParallelCompression](self, "useParallelCompression"))
    return CFSTR(".aar");
  else
    return CFSTR(".tar.gz");
}

- (BOOL)preparePaths
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
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getDefaultArchiveName](self, "getDefaultArchiveName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IN_PROGRESS_"), "stringByAppendingString:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getArchiveExtension](self, "getArchiveExtension"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/db/sysdiagnose/com.apple.sysdiagnose"), "stringByAppendingPathComponent:", v4));
  -[SystemDiagnostic setOutputDirectory:](self, "setOutputDirectory:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@.tmp"), v7, v4));
  -[SystemDiagnostic setTmpOutputDirectory:](self, "setTmpOutputDirectory:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v5));
  -[SystemDiagnostic setTarballPath:](self, "setTarballPath:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  if (!v11)
  {
    -[SystemDiagnostic setArchiveName:](self, "setArchiveName:", v3);
LABEL_9:
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "stringByAppendingPathComponent:", v27));
    -[SystemDiagnostic setCompletedOutputDirectory:](self, "setCompletedOutputDirectory:", v28);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingString:", v5));

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingPathComponent:", v30));
    -[SystemDiagnostic setCompletedTarballPath:](self, "setCompletedTarballPath:", v32);

    v25 = 1;
    goto LABEL_10;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  v13 = objc_msgSend(v12, "hasSuffix:", v5);

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringToIndex:", (_BYTE *)objc_msgSend(v15, "length") - (_BYTE *)objc_msgSend(v5, "length")));
    -[SystemDiagnostic setArchiveName:](self, "setArchiveName:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastPathComponent"));
  v20 = objc_msgSend(v17, "isEqualToString:", v19);

  if ((v20 & 1) != 0)
    goto LABEL_9;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100061F74(self);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  objc_msgSend(v21, "stderrWrite:", CFSTR("Archive name invalid: %@"), v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
  objc_msgSend(v23, "log:", CFSTR("Archive name invalid: %@"), v24);

  v25 = 0;
LABEL_10:

  return v25;
}

- (BOOL)makeTargetDirectory:(id)a3
{
  const char *v3;
  int v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;

  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v4 = mkpath_np(v3, 0x1E8u);
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v9 = v3;
      v10 = 2080;
      v11 = strerror(v4);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create %s: %s", buf, 0x16u);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v5, "stdoutWrite:", CFSTR("Failed to create %s: %s"), v3, strerror(v4));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v6, "log:", CFSTR("Failed to create %s: %s"), v3, strerror(v4));

  }
  return v4 == 0;
}

- (BOOL)prepareOutputDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v31;
  unsigned __int8 v32;
  id v33;
  void *v34;
  void *v35;
  unsigned int v36;
  id v37;
  int v38;
  void *v39;
  NSData *v40;
  void *v41;
  void *v42;
  unsigned __int8 v43;
  int *v44;
  char *v45;
  void *v46;
  int *v47;
  void *v48;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  NSFileAttributeKey v63;
  _UNKNOWN **v64;
  uint8_t buf[4];
  char *v66;
  NSFileAttributeKey v67;
  _UNKNOWN **v68;
  NSFileAttributeKey v69;
  _UNKNOWN **v70;
  NSFileAttributeKey v71;
  _UNKNOWN **v72;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));

  if (!v3)
  {
    if (!-[SystemDiagnostic preparePaths](self, "preparePaths"))
      return 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
    objc_msgSend(v4, "setUpDiagnosticID:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v8 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v7, 0);

  if (!v8)
  {
    if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
      v15 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v14, 0);

      if (v15)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_10006206C(self);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        v11 = CFSTR("Output archive already exists: %@\n");
        objc_msgSend(v16, "stderrWrite:", CFSTR("Output archive already exists: %@\n"), v17);

        v12 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedTarballPath](self, "completedTarballPath"));
        goto LABEL_17;
      }
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
      v19 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v18, 0);

      if (v19)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          sub_100062234(self);
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
        v11 = CFSTR("Output directory already exists: %@\n");
        objc_msgSend(v20, "stderrWrite:", CFSTR("Output directory already exists: %@\n"), v21);

        v12 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
        goto LABEL_17;
      }
    }
    if (!-[SystemDiagnostic makeOutputDirectory](self, "makeOutputDirectory"))
    {
      v23 = 0;
      goto LABEL_20;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "stringByAppendingPathComponent:", CFSTR("errors")));
    v71 = NSFilePosixPermissions;
    v72 = &off_1000ACEA8;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1));
    v62 = 0;
    v28 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v26, 0, v27, &v62);
    v12 = v62;

    if ((v28 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000621CC();
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v53, "stderrWrite:", CFSTR("Unable to create errors directory: %@"), v12);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v22, "log:", CFSTR("Unable to create errors directory: %@"), v12);
      goto LABEL_18;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "stringByAppendingPathComponent:", CFSTR("summaries")));
    v69 = NSFilePosixPermissions;
    v70 = &off_1000ACEA8;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1));
    v61 = v12;
    v32 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v30, 0, v31, &v61);
    v33 = v61;

    if ((v32 & 1) != 0)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic defaultBaseDirectory](self, "defaultBaseDirectory"));
      v36 = objc_msgSend(v34, "isEqualToString:", v35);

      if (!v36
        || (v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"))),
            v38 = sub_100053B0C((const char *)objc_msgSend(v37, "UTF8String"), 0, 0x1F5u),
            v37,
            v38 != -1))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "stringByAppendingPathComponent:", CFSTR("README.txt")));

        v40 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", off_1000B9478, strlen(off_1000B9478));
        v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
        v67 = NSFilePosixPermissions;
        v68 = &off_1000ACEC0;
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
        v43 = objc_msgSend(v6, "createFileAtPath:contents:attributes:", v22, v41, v42);

        if ((v43 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v44 = __error();
            v45 = strerror(*v44);
            *(_DWORD *)buf = 136315138;
            v66 = v45;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create README file: %s", buf, 0xCu);
          }
          v46 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          v47 = __error();
          objc_msgSend(v46, "log:", CFSTR("Failed to create README file: %s"), strerror(*v47));

        }
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringByAppendingPathComponent:", CFSTR("taskSummary.csv")));

        v63 = NSFilePosixPermissions;
        v64 = &off_1000ACEC0;
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1));
        v51 = objc_msgSend(v6, "createFileAtPath:contents:attributes:", v49, 0, v50);

        if ((v51 & 1) != 0)
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", v49));
          -[SystemDiagnostic setSummaryHandle:](self, "setSummaryHandle:", v52);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Summary file couldn't be created", buf, 2u);
          }
          v52 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v52, "log:", CFSTR("Summary file couldn't be created"));
        }

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
        if (v55)
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
          objc_msgSend(v56, "seekToEndOfFile");

          v57 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
          sub_100026870(v57, 0, CFSTR("Command,Exit description,Execution Time,Intended Timeout, MAX RSS (MB)\n"), CFSTR("writing summary file header"));
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't get a valid file handle to write to task summary", buf, 2u);
          }
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v57, "log:", CFSTR("Couldn't get a valid file handle to write to task summary"));
        }

        v23 = 1;
        goto LABEL_51;
      }
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000620E8(self);
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v59 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
      objc_msgSend(v58, "stderrWrite:", CFSTR("Failed to set attributes on %@"), v59);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic baseDirectory](self, "baseDirectory"));
      objc_msgSend(v22, "log:", CFSTR("Failed to set attributes on %@"), v60);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100062164();
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v54, "stderrWrite:", CFSTR("Unable to create summaries directory: %@"), v33);

      v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v22, "log:", CFSTR("Unable to create summaries directory: %@"), v33);
    }
    v23 = 0;
LABEL_51:
    v12 = v33;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100061FF0(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v11 = CFSTR("Internal output directory already exists: %@\n");
  objc_msgSend(v9, "stderrWrite:", CFSTR("Internal output directory already exists: %@\n"), v10);

  v12 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
LABEL_17:
  v22 = (void *)v13;
  objc_msgSend(v12, "log:", v11, v13);
LABEL_18:
  v23 = 0;
LABEL_19:

LABEL_20:
  return v23;
}

- (void)closeTaskSummaryHandle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("\nTotal tasks:"), "stringByAppendingFormat:", CFSTR("%lu\n"), objc_msgSend(v3, "totalTasks")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
  sub_100026870(v4, 0, v7, CFSTR("writing summary file footer"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
  objc_msgSend(v5, "closeFile");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  objc_msgSend(v6, "setPushBufferDelegate:", 0);

  -[SystemDiagnostic setSummaryHandle:](self, "setSummaryHandle:", 0);
}

- (BOOL)previouslyRunningInstancesOfDiagnostic
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  BOOL v7;

  v3 = getprogname();
  if (-[SystemDiagnostic processCount](self, "processCount") < 1)
    return 0;
  v4 = 0;
  v5 = 48;
  do
  {
    v6 = strncmp((const char *)-[SystemDiagnostic processes](self, "processes") + v5, v3, 0x10uLL);
    v7 = v6 == 0;
    if (!v6)
      break;
    ++v4;
    v5 += 136;
  }
  while (v4 < -[SystemDiagnostic processCount](self, "processCount"));
  return v7;
}

- (void)getCaseInsensitiveMatches:(id)a3 forString:(const char *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  char *v17;
  __int16 v18;
  int v19;

  v6 = a3;
  if (-[SystemDiagnostic processCount](self, "processCount") >= 1)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      if (sub_1000461BC(a4, (const char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v9 = (char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48;
          v10 = *(_DWORD *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12);
          *(_DWORD *)buf = 136315394;
          v17 = v9;
          v18 = 1024;
          v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found partial match %s, targeting pid [%d]", buf, 0x12u);
        }
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v11, "stdoutWrite:", CFSTR("Found partial match %s, targeting pid [%d]"), (char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48, *(unsigned int *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12));

        v12 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
        objc_msgSend(v12, "log:", CFSTR("Found partial match %s, targeting pid [%d]"), (char *)-[SystemDiagnostic processes](self, "processes") + v7 + 48, *(unsigned int *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12));

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)((char *)-[SystemDiagnostic processes](self, "processes") + v7 + 12)));
        objc_msgSend(v6, "addObject:", v13);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v8));
        objc_msgSend(v14, "addObject:", v15);

      }
      ++v8;
      v7 += 136;
    }
    while (v8 < -[SystemDiagnostic processCount](self, "processCount"));
  }

}

- (void)populateProcessInfoForInput
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  unsigned __int8 *v13;
  void *v14;
  id v15;
  unint64_t v16;
  unsigned int v17;
  BOOL v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  uint8_t v41[16];
  uint8_t v42[16];
  uint8_t v43[16];
  uint8_t v44[16];
  uint8_t v45[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("0")))
  {

LABEL_4:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Provided kernel_task as target. Ignored.", buf, 2u);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v6, "log:", CFSTR("Provided kernel_task as target. Ignored."));

    -[SystemDiagnostic setTargetPIDs:](self, "setTargetPIDs:", &off_1000ACCE0);
    return;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("kernel_task"));

  if (v5)
    goto LABEL_4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("launchd")))
  {

LABEL_10:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Warning: Provided no target or launchd and/or its children as targets. Ignored.", v45, 2u);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v10, "log:", CFSTR("Warning: Provided no target or launchd and/or its children as targets. Ignored."));

    return;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  v9 = objc_msgSend(v8, "isEqualToString:", &stru_10009DC10);

  if (v9)
    goto LABEL_10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess")));
  v13 = (unsigned __int8 *)objc_msgSend(v12, "cStringUsingEncoding:", 4);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    v16 = 0;
    do
    {
      v17 = v13[v16] - 58;
      v18 = v17 < 0xFFFFFFF6;
      if (v17 <= 0xFFFFFFF5)
        break;
      ++v16;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
      v20 = objc_msgSend(v19, "length");

    }
    while ((unint64_t)v20 > v16);
  }
  else
  {
    v18 = 0;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess"));
  v22 = objc_msgSend(v21, "intValue");

  if ((_DWORD)v22 && !v18)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v22));
    objc_msgSend(v11, "addObject:", v23);

  }
  if (objc_msgSend(v11, "count"))
  {
    if (-[SystemDiagnostic processCount](self, "processCount") >= 1)
    {
      v24 = 0;
      v25 = 0;
      v26 = 0;
      do
      {
        if (*(_DWORD *)((char *)-[SystemDiagnostic processes](self, "processes") + v24 + 12) == (_DWORD)v22)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v25));
          objc_msgSend(v27, "addObject:", v28);

          if (!strncmp((const char *)-[SystemDiagnostic processes](self, "processes") + v24 + 48, "launchd", 7uLL))
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v44 = 0;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Warning: Targeting launchd or its children. Ignored.", v44, 2u);
            }
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            v30 = v29;
            v31 = CFSTR("Warning: Targeting launchd or its children. Ignored.");
            goto LABEL_46;
          }
          v26 = 1;
        }
        ++v25;
        v24 += 136;
      }
      while (v25 < -[SystemDiagnostic processCount](self, "processCount"));
      if ((v26 & 1) != 0)
        goto LABEL_36;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v43 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Warning: Supplied invalid target pid.", v43, 2u);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v30 = v29;
    v31 = CFSTR("Warning: Supplied invalid target pid.");
LABEL_46:
    objc_msgSend(v29, "log:", v31);

  }
  else
  {
    v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic providedPIDorProcess](self, "providedPIDorProcess")));
    v33 = objc_msgSend(v32, "cStringUsingEncoding:", 4);

    -[SystemDiagnostic getCaseInsensitiveMatches:forString:](self, "getCaseInsensitiveMatches:forString:", v11, v33);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v42 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "", v42, 2u);
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v34, "stdoutWrite:", &stru_10009DC10);

    v35 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v35, "log:", &stru_10009DC10);

LABEL_36:
    if (objc_msgSend(v11, "count") && -[SystemDiagnostic requestSource](self, "requestSource") != 1)
      -[SystemDiagnostic setTargetPIDs:](self, "setTargetPIDs:", v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic pidIndices](self, "pidIndices"));
    v37 = objc_msgSend(v36, "count");
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic targetPIDs](self, "targetPIDs"));
    v39 = objc_msgSend(v38, "count");

    if (v37 != v39)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v41 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "pindIndices mismatch with targetpids.", v41, 2u);
      }
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v40, "log:", CFSTR("pindIndices mismatch with targetpids."));

      -[SystemDiagnostic setPidIndices:](self, "setPidIndices:", 0);
    }
  }

}

+ (BOOL)_runBlock:(id)a3 withTimeout:(double)a4
{
  id v5;
  dispatch_block_t v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD block[4];
  id v12;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004B7B8;
  block[3] = &unk_100099E40;
  v12 = a3;
  v5 = v12;
  v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  dispatch_async(v8, v6);

  v9 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  LOBYTE(v8) = dispatch_block_wait(v6, v9) == 0;

  return (char)v8;
}

- (BOOL)waitUntilComplete:(unint64_t)a3
{
  SystemDiagnostic *v4;
  dispatch_time_t v5;
  NSObject *v6;
  intptr_t v7;
  void *v8;

  v4 = self;
  objc_sync_enter(v4);
  v5 = dispatch_time(0, 1000000000 * a3);
  v6 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completionDispatchGroup](v4, "completionDispatchGroup"));
  v7 = dispatch_group_wait(v6, v5);

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_1000622B0();
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "log:", CFSTR("Timed out waiting for sysdiagnose to complete. Timeout: %llus"), a3);

  }
  objc_sync_exit(v4);

  return v7 == 0;
}

- (int64_t)_sizeOutputDirectoryAndGenerateDiagnosticSummary
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  int64_t v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  char *v21;
  char *v22;
  __sFILE *v23;
  void *v24;
  void *v25;
  FILE *v26;
  void *v28;
  uint64_t v29;
  id v30;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  _BYTE v43[128];
  _QWORD v44[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v3 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v2, 1));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v44[0] = NSURLTotalFileSizeKey;
  v44[1] = NSURLIsDirectoryKey;
  v44[2] = NSURLNameKey;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v44, 3));
  v28 = (void *)v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v5, 0, 0));

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v38;
    v29 = *(_QWORD *)v38;
    v30 = v7;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        v14 = objc_autoreleasePoolPush();
        v36 = 0;
        objc_msgSend(v13, "getResourceValue:forKey:error:", &v36, NSURLIsDirectoryKey, 0);
        v15 = v36;
        v16 = objc_retainAutorelease(v13);
        if (sub_100053B0C((const char *)objc_msgSend(v16, "fileSystemRepresentation"), 0x1F5u, 0x1F5u) == -1)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
          {
            v17 = objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation");
            *(_DWORD *)buf = 136315138;
            v42 = v17;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set attributes on %s", buf, 0xCu);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
          objc_msgSend(v18, "log:", CFSTR("Failed to set attributes on %s"), objc_msgSend(objc_retainAutorelease(v16), "fileSystemRepresentation"));

        }
        if ((objc_msgSend(v15, "BOOLValue") & 1) == 0)
        {
          v33 = v14;
          v35 = 0;
          objc_msgSend(v16, "getResourceValue:forKey:error:", &v35, NSURLTotalFileSizeKey, 0);
          v19 = v35;
          v20 = v19;
          if (v19)
          {
            v10 += (int64_t)objc_msgSend(v19, "longValue");
            v34 = 0;
            objc_msgSend(v16, "getResourceValue:forKey:error:", &v34, NSURLNameKey, 0);
            if (v34)
            {
              v32 = v34;
              v21 = (char *)objc_msgSend(v20, "longLongValue");
              v22 = &v21[v10];
              v23 = -[SystemDiagnostic summaryFD](self, "summaryFD");
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "path"));

              v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
              v26 = v23;
              v10 = (int64_t)v22;
              v11 = v29;
              sub_1000261D4(v26, v24, v25, v21, 0);

              v7 = v30;
            }
          }

          v14 = v33;
        }

        objc_autoreleasePoolPop(v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)waitAndCollectAirPodLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  const char *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  char *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  char *v36;
  _BYTE v37[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SystemDiagnosticBT sharedInstance](SystemDiagnosticBT, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waitForAirPodLogsIfAvailable"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("AirPodLogs")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v30 = 0;
    if ((objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v6, &v30) & 1) == 0
      && (objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0) & 1) == 0)
    {
      NSLog(CFSTR("Error: Create folder failed %@"), v6);
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v23 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      v24 = v8;
      v25 = v7;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v7, "fileExistsAtPath:", v13))
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastPathComponent"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v14));

            v16 = objc_retainAutorelease(v13);
            v17 = (const char *)objc_msgSend(v16, "fileSystemRepresentation");
            v18 = objc_retainAutorelease(v15);
            if (sub_100053BC4(v17, (const char *)objc_msgSend(v18, "fileSystemRepresentation"), 0xFu) == -1)
            {
              v19 = *__error();
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                v22 = strerror(v19);
                *(_DWORD *)buf = 138412802;
                v32 = v16;
                v33 = 2112;
                v34 = v18;
                v35 = 2080;
                v36 = v22;
                _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to copy file %@ -> %@: %s", buf, 0x20u);
              }
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              objc_msgSend(v20, "stderrWrite:", CFSTR("Unable to copy file %@ -> %@: %s"), v16, v18, strerror(v19));

              v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
              objc_msgSend(v21, "log:", CFSTR("Unable to copy file %@ -> %@: %s"), v16, v18, strerror(v19));

              v8 = v24;
              v7 = v25;
            }

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v37, 16);
      }
      while (v10);
    }

    v4 = v23;
  }

}

- (void)waitForRemoteLogs
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  objc_msgSend(v3, "waitForCoSysdiagnosesForDiagnosticID:", v4);

  -[SystemDiagnostic waitAndCollectAirPodLogs](self, "waitAndCollectAirPodLogs");
}

- (void)initStreaming
{
  SystemDiagnostic *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  SDArchive *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  void *v20;

  if (!-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall")
    || -[SystemDiagnostic disableStreamTar](self, "disableStreamTar"))
  {
    v3 = self;
    v4 = 0;
LABEL_4:
    -[SystemDiagnostic setShouldStreamToTar:](v3, "setShouldStreamToTar:", v4);
    goto LABEL_5;
  }
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath")));
  v9 = sub_1000259F0((const char *)objc_msgSend(v8, "fileSystemRepresentation"), -[SystemDiagnostic isDeviceUnlockedSinceBoot](self, "isDeviceUnlockedSinceBoot"));

  v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v9 != -1)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Streaming to tar enabled", buf, 2u);
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v11, "log:", CFSTR("Streaming to tar enabled"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archiveName](self, "archiveName"));
    v13 = sub_10002558C(v9, 0, v12, 1, -[SystemDiagnostic useParallelCompression](self, "useParallelCompression"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    -[SystemDiagnostic setArchive:](self, "setArchive:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
    -[SystemDiagnostic setDpClass:](self, "setDpClass:", objc_msgSend(v15, "getProtectionClass"));

    v3 = self;
    v4 = 1;
    goto LABEL_4;
  }
  if (v10)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
    *(_DWORD *)buf = 138412290;
    v20 = v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Couldn't create archive at location %@", buf, 0xCu);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
  objc_msgSend(v17, "log:", CFSTR("Couldn't create archive at location %@"), v18);

  -[SystemDiagnostic setShouldStreamToTar:](self, "setShouldStreamToTar:", 0);
  -[SystemDiagnostic setArchive:](self, "setArchive:", 0);
LABEL_5:
  if (!-[SystemDiagnostic shouldStreamToTar](self, "shouldStreamToTar"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("/summaries/diagnostic_summary.log")));

    v7 = objc_retainAutorelease(v6);
    self->_summaryFD = fopen((const char *)objc_msgSend(v7, "fileSystemRepresentation"), "wx");

  }
}

- (void)executeOSLogArchiveContainers
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10004C2E0;
  v2[3] = &unk_100099E68;
  v2[4] = self;
  -[SystemDiagnostic executeContainersInPhase:withCompletionBlock:](self, "executeContainersInPhase:withCompletionBlock:", 3, v2);
}

- (void)sendCoreAnalytics
{
  id v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
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
  id v36;
  _QWORD v37[4];
  id v38;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", metricTotalSize));
  v6 = v5 / 0x3E8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic totalTime](self, "totalTime"));
  objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("totalDuration"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", metricTimeSensitive));
  objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("timeSensitiveDuration"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", metricLogGeneration));
  objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("generationDuration"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", metricLogCopying));
  objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("copyingDuration"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", metricOSLogarchiveGeneration));
  objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("libtraceDuration"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v6));
  objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("size"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall")));
  objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("isArchived"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", -[SystemDiagnostic didComplete](self, "didComplete") ^ 1));
  objc_msgSend(v3, "setValue:forKey:", v18, CFSTR("isCancelled"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", -[SystemDiagnostic requestSource](self, "requestSource")));
  objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("startedBy"));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "totalFailedTasks")));
  objc_msgSend(v3, "setValue:forKey:", v21, CFSTR("numberOfFailedTasks"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v22, "totalTimeouts")));
  objc_msgSend(v3, "setValue:forKey:", v23, CFSTR("numberOfTimeouts"));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", metricPersistLookback));
  objc_msgSend(v3, "setValue:forKey:", v25, CFSTR("peristLookback"));

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", metricSpecialLookback));
  objc_msgSend(v3, "setValue:forKey:", v27, CFSTR("specialLookback"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKeyedSubscript:", metricSignpostLookback));
  objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("signpostLookback"));

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", metricPersistSize));
  objc_msgSend(v3, "setValue:forKey:", v31, CFSTR("peristSize"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", metricSpecialSize));
  objc_msgSend(v3, "setValue:forKey:", v33, CFSTR("specialSize"));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", metricSignpostSize));
  objc_msgSend(v3, "setValue:forKey:", v35, CFSTR("signpostSize"));

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10004C924;
  v37[3] = &unk_100099E90;
  v38 = v3;
  v36 = v3;
  AnalyticsSendEventLazy(CFSTR("com.apple.sysdiagnose"), v37);

}

- (void)outputMetrics
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  double v45;
  double v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  uint64_t v78;
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
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  id v94;
  uint8_t buf[4];
  double v96;
  __int16 v97;
  id v98;
  __int16 v99;
  uint64_t v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  double v104;
  __int16 v105;
  id v106;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
  -[SystemDiagnostic setTotalTime:](self, "setTotalTime:", v7);

  if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
    v9 = objc_msgSend(v8, "getUncompressedSize");

  }
  else
  {
    v9 = -[SystemDiagnostic _sizeOutputDirectoryAndGenerateDiagnosticSummary](self, "_sizeOutputDirectoryAndGenerateDiagnosticSummary");
  }
  v94 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v12 = metricTotalSize;
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, metricTotalSize);

  v93 = v12;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v90 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    v13 = metricGetTimeSensitive;
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "objectForKeyedSubscript:", metricGetTimeSensitive));
    objc_msgSend(v88, "doubleValue");
    v15 = v14;
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    v16 = metricGetLogGeneration;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "objectForKeyedSubscript:", metricGetLogGeneration));
    objc_msgSend(v17, "doubleValue");
    v19 = v18;
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    v21 = metricGetLogCopying;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectForKeyedSubscript:", metricGetLogCopying));
    objc_msgSend(v22, "doubleValue");
    v24 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    v26 = metricGetOSLogArchive;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", metricGetOSLogArchive));
    objc_msgSend(v27, "doubleValue");
    *(_DWORD *)buf = 134218752;
    v96 = v15;
    v97 = 2048;
    v98 = v19;
    v99 = 2048;
    v100 = v24;
    v101 = 2048;
    v102 = v28;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nGetting time sensitive containers: %0.2f\nGetting log generation containers: %0.2f\nGetting log copying containers: %0.2f\nGetting OS log archive containers: %0.2f\n", buf, 0x2Au);

  }
  else
  {
    v13 = metricGetTimeSensitive;
    v16 = metricGetLogGeneration;
    v21 = metricGetLogCopying;
    v26 = metricGetOSLogArchive;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", v13));
  objc_msgSend(v31, "doubleValue");
  v33 = v32;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "objectForKeyedSubscript:", v16));
  objc_msgSend(v35, "doubleValue");
  v37 = v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", v21));
  objc_msgSend(v39, "doubleValue");
  v41 = v40;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v26));
  objc_msgSend(v43, "doubleValue");
  objc_msgSend(v29, "log:", CFSTR("\nGetting time sensitive containers: %0.2f\nGetting log generation containers: %0.2f\nGetting log copying containers: %0.2f\nGetting OS log archive containers: %0.2f\n"), v33, v37, v41, v44);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    v85 = metricTimeSensitive;
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "objectForKeyedSubscript:"));
    objc_msgSend(v89, "doubleValue");
    v46 = v45;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    v47 = metricLogCopying;
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "objectForKeyedSubscript:", metricLogCopying));
    objc_msgSend(v84, "doubleValue");
    v49 = v48;
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    v50 = metricLogGeneration;
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "objectForKeyedSubscript:", metricLogGeneration));
    objc_msgSend(v51, "doubleValue");
    v53 = v52;
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    v55 = metricOSLogarchiveGeneration;
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", metricOSLogarchiveGeneration));
    objc_msgSend(v56, "doubleValue");
    v58 = v57;
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
    v60 = v93;
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "objectForKeyedSubscript:", v93));
    v62 = objc_msgSend(v61, "longLongValue");
    *(_DWORD *)buf = 134219264;
    v96 = v46;
    v97 = 2048;
    v98 = v49;
    v99 = 2048;
    v100 = v53;
    v101 = 2048;
    v102 = v58;
    v103 = 2048;
    v104 = v6;
    v105 = 2048;
    v106 = v62;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nTime Sensitive: %0.2f \nLog Copying: %0.2f \nLog Generation: %0.2f \nOSLogArchive Generation: %0.2f \nTotal: %0.2f seconds, %llu bytes", buf, 0x3Eu);

    v63 = v85;
  }
  else
  {
    v63 = metricTimeSensitive;
    v47 = metricLogCopying;
    v50 = metricLogGeneration;
    v55 = metricOSLogarchiveGeneration;
    v60 = v93;
  }
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "objectForKeyedSubscript:", v63));
  objc_msgSend(v65, "doubleValue");
  v67 = v66;
  v68 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "objectForKeyedSubscript:", v47));
  objc_msgSend(v69, "doubleValue");
  v71 = v70;
  v72 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "objectForKeyedSubscript:", v50));
  objc_msgSend(v73, "doubleValue");
  v75 = v74;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "objectForKeyedSubscript:", v55));
  objc_msgSend(v77, "doubleValue");
  v79 = v78;
  v80 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "objectForKeyedSubscript:", v60));
  objc_msgSend(v64, "log:", CFSTR("\nTime Sensitive: %0.2f \nLog Copying: %0.2f \nLog Generation: %0.2f \nOSLogArchive Generation: %0.2f \nTotal: %0.2f seconds, %llu bytes"), v67, v71, v75, v79, *(_QWORD *)&v6, objc_msgSend(v81, "longLongValue"));

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v96 = v6;
    v97 = 2048;
    v98 = v94;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resource Usage: Gathering diagnostics took %f.1 seconds for %lld bytes (uncompressed)", buf, 0x16u);
  }
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v82, "log:", CFSTR("Resource Usage: Gathering diagnostics took %f.1 seconds for %lld bytes (uncompressed)"), *(_QWORD *)&v6, v94);

}

- (void)createOnlyRunContainersWithNamesArray:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  SystemDiagnostic *v28;
  uint8_t v29;
  _BYTE v30[15];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic onlyRunContainersWithNames](self, "onlyRunContainersWithNames"));

    if (v5)
    {
      v6 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v6)
        sub_10006238C(v6, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v9, "stderrWrite:", CFSTR("Resetting only run containers with names array"));

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v10, "log:", CFSTR("Resetting only run containers with names array"));

    }
    v28 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(",")));
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v32;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v32 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByTrimmingCharactersInSet:", v18));

          if (objc_msgSend(v19, "length"))
          {
            objc_msgSend(v11, "addObject:", v19);
          }
          else
          {
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              sub_100062354(&v29, v30, v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v21, "stderrWrite:", CFSTR("Invalid name passed to onlyRunContainersWithNames"));

            v22 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
            objc_msgSend(v22, "log:", CFSTR("Invalid name passed to onlyRunContainersWithNames"));

          }
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v14);
    }

    v23 = objc_msgSend(v11, "copy");
    -[SystemDiagnostic setOnlyRunContainersWithNames:](v28, "setOnlyRunContainersWithNames:", v23);

  }
  else
  {
    v24 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v24)
      sub_100062318(v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v27, "stderrWrite:", CFSTR("Nil names string passed to setOnlyRunContainersWithNames"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v11, "log:", CFSTR("Nil names string passed to setOnlyRunContainersWithNames"));
  }

}

- (id)filterDiagnosticContainers:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic onlyRunContainersWithNames](self, "onlyRunContainersWithNames"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic onlyRunContainersWithNames](self, "onlyRunContainersWithNames")),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6,
        v8))
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v20 = v4;
    v10 = v4;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic onlyRunContainersWithNames](self, "onlyRunContainersWithNames"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "name"));
          v18 = objc_msgSend(v16, "containsObject:", v17);

          if (v18)
            objc_msgSend(v9, "addObject:", v15);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v12);
    }

    v4 = v20;
  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (id)getDiagnosticContainers:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;

  v3 = *(_QWORD *)&a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic overrideContainers](self, "overrideContainers"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringForPhaseID:", v3));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "getDiagnosticContainers found override containers. Returning new values for phase '%@'", (uint8_t *)&v17, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic overrideContainers](self, "overrideContainers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v3));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v10));

    if (v11)
      v12 = objc_msgSend(v11, "mutableCopy");
    else
      v12 = v5;
    v14 = v12;

  }
  else
  {
    switch((int)v3)
    {
      case 0:
        v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getTimeSensitiveContainers](self, "getTimeSensitiveContainers"));
        goto LABEL_14;
      case 1:
        v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogGenerationContainers](self, "getLogGenerationContainers"));
        goto LABEL_14;
      case 2:
        v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogCopyingContainers](self, "getLogCopyingContainers"));
        goto LABEL_14;
      case 3:
        v13 = objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLibtraceContainers](self, "getLibtraceContainers"));
LABEL_14:
        v15 = (void *)v13;

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic filterDiagnosticContainers:](self, "filterDiagnosticContainers:", v15));
        v5 = v15;
        break;
      default:
        v5 = v5;
        v14 = v5;
        break;
    }
  }

  return v14;
}

- (void)logContainerAsExecuted:(id)a3 inPhase:(int)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char isKindOfClass;
  id v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  NSMutableArray *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[3];
  _QWORD v39[3];
  _BYTE v40[128];

  v4 = a3;
  v6 = objc_opt_class(SDComplexContainer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v8 = v4;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskContainer"));
    v11 = objc_opt_class(SDTaskDepotContainer, v10);
    isKindOfClass = objc_opt_isKindOfClass(v9, v11);

    if ((isKindOfClass & 1) != 0)
      v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "taskContainer"));
    else
      v13 = 0;

    if (!v13)
      goto LABEL_26;
  }
  else
  {
    v14 = objc_opt_class(SDTaskDepotContainer, v7);
    if ((objc_opt_isKindOfClass(v4, v14) & 1) == 0)
      goto LABEL_26;
    v13 = v4;
    if (!v13)
      goto LABEL_26;
  }
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v16 = v15;
  if (!v15 || -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR(".")))
  {

    v16 = &stru_10009DC10;
  }
  v17 = objc_opt_new(NSMutableArray);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "units"));
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v19; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "stdoutPath"));
        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingPathComponent:](v16, "stringByAppendingPathComponent:", v22));

          if (objc_msgSend(v23, "characterAtIndex:", 0) == 47)
          {
            do
            {
              v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringFromIndex:", 1));

              v23 = v24;
            }
            while (objc_msgSend(v24, "characterAtIndex:", 0) == 47);
          }
          else
          {
            v24 = v23;
          }
          -[NSMutableArray addObject:](v17, "addObject:", v24);

        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v19);
  }

  v38[0] = CFSTR("paths");
  v25 = -[NSMutableArray copy](v17, "copy");
  v39[0] = v25;
  v38[1] = CFSTR("isConcurrent");
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v13, "isConcurrent")));
  v39[1] = v26;
  v38[2] = CFSTR("phase");
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a4));
  v39[2] = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 3));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
  objc_sync_enter(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
  objc_msgSend(v30, "setObject:forKeyedSubscript:", v28, v31);

  objc_sync_exit(v29);
LABEL_26:

}

- (void)setupTaskDepotForPhase:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  unsigned __int8 v9;
  double v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  os_activity_t v15;
  id v16;
  SystemDiagnostic *v17;
  int v18;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_10004DC08;
  v14 = &unk_100099EB8;
  v15 = _os_activity_create((void *)&_mh_execute_header, "Ending task", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v7 = v6;
  v16 = v7;
  v17 = self;
  v18 = v3;
  v8 = v15;
  objc_msgSend(v5, "setTaskCompletionBlock:", &v11);
  v9 = -[SystemDiagnostic isTestingMode](self, "isTestingMode", v11, v12, v13, v14);
  v10 = 0.0;
  if ((v9 & 1) == 0)
    objc_msgSend(v7, "getMinimumTimeBeforeTimeoutsForPhaseID:", v3, 0.0);
  objc_msgSend(v5, "setMinimumTimeBeforeTimeouts:", v10);

}

- (void)endTaskDepotForPhase:(int)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot", *(_QWORD *)&a3));
  objc_msgSend(v3, "setMinimumTimeBeforeTimeouts:", 0.0);
  objc_msgSend(v3, "setTaskCompletionBlock:", 0);

}

- (void)executeContainers:(id)a3 inPhase:(int)a4 withCompletionBlock:(id)a5
{
  uint64_t v6;
  id v8;
  void (**v9)(id, void *, id);
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void (**v22)(void);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  void *v32;
  uint8_t buf[16];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  if (objc_msgSend(v8, "count"))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = v8;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
          -[SystemDiagnostic logContainerAsExecuted:inPhase:](self, "logContainerAsExecuted:inPhase:", v14, v6);
          v15 = objc_autoreleasePoolPush();
          if (!objc_msgSend(v32, "mayStartExecuting"))
          {
            objc_autoreleasePoolPop(v15);
            goto LABEL_23;
          }
          v16 = objc_msgSend(v14, "execute");
          v18 = objc_opt_class(SDTaskContainer, v17);
          if ((objc_opt_isKindOfClass(v14, v18) & 1) == 0)
          {
            v20 = objc_opt_class(SDComplexContainer, v19);
            if ((objc_opt_isKindOfClass(v14, v20) & 1) == 0)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "taskCompletionBlock"));

              if (v21)
              {
                v22 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "taskCompletionBlock"));
                v22[2]();

              }
            }
          }
          if (v9)
            v9[2](v9, v14, v16);
          objc_autoreleasePoolPop(v15);
        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v11)
          continue;
        break;
      }
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringForPhaseID:", v6));

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Main thread waiting for tasks to finish", buf, 2u);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v24, "stdoutWrite:", CFSTR("Main thread waiting for tasks to finish"));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v25, "log:", CFSTR("Main thread waiting for tasks to finish"));

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
    v27 = objc_msgSend(v26, "waitUntilAllTasksComplete:", 600);

    if ((v27 & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000623C8();
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v28, "stderrWrite:", CFSTR("[%@ phase] failed to complete in time. The tasks may continue to run, but continuing to the next phase."), obj);

      v29 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v29, "log:", CFSTR("[%@ phase] failed to complete in time. The tasks may continue to run, but continuing to the next phase."), obj);

    }
LABEL_23:
    v8 = v30;

  }
}

- (void)executeContainersInPhase:(int)a3 withCompletionBlock:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
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
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  uint8_t buf[4];
  void *v31;

  v4 = *(_QWORD *)&a3;
  v28 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringForPhaseID:", v4));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v8 = sub_100026BC4();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Phase", "%@", buf, 0xCu);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Begin %@ Phase", buf, 0xCu);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v10, "stdoutWrite:", CFSTR("Begin %@ Phase"), v7);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v11, "log:", CFSTR("Begin %@ Phase"), v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getDiagnosticContainers:](self, "getDiagnosticContainers:", v4));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "getContainersMetricForPhaseId:", v4));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v14, "timeIntervalSinceDate:", v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v13);

  objc_msgSend(v6, "setupProgressTotal:forPhase:", objc_msgSend(v12, "count"), v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic diagnosticID](self, "diagnosticID"));
  objc_msgSend(v6, "registerActivityWithID:", v17);

  -[SystemDiagnostic setupTaskDepotForPhase:](self, "setupTaskDepotForPhase:", v4);
  -[SystemDiagnostic executeContainers:inPhase:withCompletionBlock:](self, "executeContainers:inPhase:withCompletionBlock:", v12, v4, v28);

  -[SystemDiagnostic endTaskDepotForPhase:](self, "endTaskDepotForPhase:", v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "elapsedMetricForPhaseID:", v4));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v19, "timeIntervalSinceDate:", v29);
  v21 = v20;

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v18);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "End %@ Phase", buf, 0xCu);
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v24, "stdoutWrite:", CFSTR("End %@ Phase"), v7);

  v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v25, "log:", CFSTR("End %@ Phase"), v7);

  v26 = sub_100026BC4();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Phase", ", buf, 2u);
  }

}

- (void)summarizeErrorsWithinSDTask:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  SystemDiagnostic *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSMutableSet *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *i;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  SystemDiagnostic *v28;
  id v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  v4 = a3;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));

  obj = (id)v6;
  v7 = (void *)v6;
  v8 = self;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v37;
    v27 = *(_QWORD *)v37;
    v28 = self;
    do
    {
      v12 = 0;
      v29 = v10;
      do
      {
        if (*(_QWORD *)v37 != v11)
          objc_enumerationMutation(obj);
        v31 = v12;
        v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](v8, "executedContainers"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v13));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("isConcurrent")));
        v17 = objc_msgSend(v16, "BOOLValue");

        if (v17)
        {
          v18 = objc_opt_new(NSMutableSet);
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("paths")));
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
          v21 = v15;
          if (v20)
          {
            v22 = v20;
            v23 = *(_QWORD *)v33;
            do
            {
              for (i = 0; i != v22; i = (char *)i + 1)
              {
                if (*(_QWORD *)v33 != v23)
                  objc_enumerationMutation(v19);
                v25 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
                if (-[NSMutableSet containsObject:](v18, "containsObject:", v25))
                {
                  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Non-serial container '%@' writes to '%@' in parallel"), v13, v25));
                  objc_msgSend(v4, "addObject:", v26);

                }
                else
                {
                  -[NSMutableSet addObject:](v18, "addObject:", v25);
                }
              }
              v22 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
            }
            while (v22);
          }

          v11 = v27;
          v10 = v29;
          v15 = v21;
          v8 = v28;
        }

        v12 = v31 + 1;
      }
      while ((id)(v31 + 1) != v10);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v10);
  }

}

- (void)summarizeErrorsAcrossSDTasks:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *j;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  NSMutableDictionary *v37;
  void *v38;
  char *v39;
  void *v40;
  id obj;
  char *obja;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];

  v4 = a3;
  v37 = objc_opt_new(NSMutableDictionary);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic executedContainers](self, "executedContainers"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", v11));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("phase")));
        v15 = objc_msgSend(v14, "intValue");

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("paths")));
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v37, "setObject:forKeyedSubscript:", v17, v11);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v8);
  }

  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v32 = -[NSMutableDictionary copy](v37, "copy");
  v30 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "allKeys"));
  v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v52;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(v30);
        v34 = v18;
        v19 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v18);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectForKeyedSubscript:", v19));
        -[NSMutableDictionary removeObjectForKey:](v37, "removeObjectForKey:", v19);
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v35 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v37, "allKeys"));
        v39 = (char *)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
        if (v39)
        {
          v36 = *(_QWORD *)v48;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v48 != v36)
                objc_enumerationMutation(v35);
              obja = v20;
              v21 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v20);
              v22 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v21));
              v23 = objc_msgSend(v38, "mutableCopy");
              v40 = (void *)v22;
              objc_msgSend(v23, "intersectSet:", v22);
              v45 = 0u;
              v46 = 0u;
              v43 = 0u;
              v44 = 0u;
              v24 = v23;
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v44;
                do
                {
                  for (j = 0; j != v26; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v44 != v27)
                      objc_enumerationMutation(v24);
                    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Container '%@' writes to file '%@', which is also written by container '%@'"), v19, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j), v21));
                    objc_msgSend(v4, "addObject:", v29);

                  }
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v59, 16);
                }
                while (v26);
              }

              v20 = obja + 1;
            }
            while (obja + 1 != v39);
            v39 = (char *)objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
          }
          while (v39);
        }

        v18 = v34 + 1;
      }
      while ((id)(v34 + 1) != v33);
      v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
    }
    while (v33);
  }

}

- (void)summarizeErrorsForExecutedContainers
{
  NSMutableArray *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;

  v3 = objc_opt_new(NSMutableArray);
  -[SystemDiagnostic summarizeErrorsWithinSDTask:](self, "summarizeErrorsWithinSDTask:", v3);
  -[SystemDiagnostic summarizeErrorsAcrossSDTasks:](self, "summarizeErrorsAcrossSDTasks:", v3);
  v4 = -[NSMutableArray count](v3, "count");
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("errors/SDTaskWriteErrors.txt")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v3, "componentsJoinedByString:", CFSTR("\n")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataUsingEncoding:", 4));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v15 = v5;
      v16 = 2080;
      v17 = objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found %lu SDTask write errors. Adding to error file %s", buf, 0x16u);
    }
    v13 = 0;
    objc_msgSend(v9, "writeToFile:options:error:", v7, 0, &v13);
    v10 = v13;
    if (v10 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription")));
      v12 = objc_msgSend(v11, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to create error file for writing with error: %s", buf, 0xCu);

    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "No executed container errors found, not writing error file", buf, 2u);
  }

}

- (void)executeDiagnosticContainers
{
  void *v3;
  void *v4;
  dispatch_queue_global_t global_queue;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[8];
  _QWORD block[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[SystemDiagnostic setStartDiagnosticTime:](self, "setStartDiagnosticTime:", v4);

  -[SystemDiagnostic setStartDiagnosticTimeClockNS:](self, "setStartDiagnosticTimeClockNS:", clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW));
  if (!-[SystemDiagnostic startDiagnosticTimeClockNS](self, "startDiagnosticTimeClockNS")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100062430();
  }
  objc_msgSend(v3, "initPeerProgressHandler");
  if (-[SystemDiagnostic shouldRunTimeSensitiveTasks](self, "shouldRunTimeSensitiveTasks"))
    -[SystemDiagnostic executeContainersInPhase:withCompletionBlock:](self, "executeContainersInPhase:withCompletionBlock:", 0, 0);
  if (-[SystemDiagnostic earlyPrompt](self, "earlyPrompt")
    && -[SystemDiagnostic isPromptEligible](self, "isPromptEligible"))
  {
    global_queue = dispatch_get_global_queue(33, 0);
    v6 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10004EFA8;
    block[3] = &unk_100098F88;
    block[4] = self;
    dispatch_async(v6, block);

  }
  if (-[SystemDiagnostic shouldRunLogGenerationTasks](self, "shouldRunLogGenerationTasks"))
    -[SystemDiagnostic executeContainersInPhase:withCompletionBlock:](self, "executeContainersInPhase:withCompletionBlock:", 1, 0);
  if (-[SystemDiagnostic shouldRunLogCopyTasks](self, "shouldRunLogCopyTasks"))
    -[SystemDiagnostic executeContainersInPhase:withCompletionBlock:](self, "executeContainersInPhase:withCompletionBlock:", 2, 0);
  if (-[SystemDiagnostic shouldRunOSLogArchive](self, "shouldRunOSLogArchive"))
    -[SystemDiagnostic executeOSLogArchiveContainers](self, "executeOSLogArchiveContainers");
  -[SystemDiagnostic waitForRemoteLogs](self, "waitForRemoteLogs");
  -[SystemDiagnostic summarizeErrorsForExecutedContainers](self, "summarizeErrorsForExecutedContainers");
  objc_msgSend(v3, "sendProgress:phase:toPeers:", 3, 0, 100.0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nCompleted all phases. Wrapping up.", v9, 2u);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v7, "stdoutWrite:", CFSTR("\nCompleted all phases. Wrapping up."));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v8, "log:", CFSTR("\nCompleted all phases. Wrapping up."));

  -[SystemDiagnostic outputMetrics](self, "outputMetrics");
  -[SystemDiagnostic endDiagnostics](self, "endDiagnostics");

}

- (void)recordDiagnosticsMetrics:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  double v32;
  __int16 v33;
  double v34;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v4);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic startDiagnosticTime](self, "startDiagnosticTime"));
  objc_msgSend(v5, "timeIntervalSinceDate:", v8);
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, metricCompression);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, metricStartToTar);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Took %f seconds for finishing the tar\n", buf, 0xCu);
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  objc_msgSend(v15, "log:", CFSTR("Took %f seconds for finishing the tar\n"), *(_QWORD *)&v7);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
  v30 = 0;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "attributesOfItemAtPath:error:", v17, &v30));
  v19 = v30;

  if (v18)
  {
    v20 = objc_msgSend(v18, "fileSize");
    if (v20)
    {
      v21 = (unint64_t)v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic metricsDict](self, "metricsDict"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectForKeyedSubscript:", metricTotalSize));
      v24 = objc_msgSend(v23, "longLongValue");

      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v32 = *(double *)&v21;
        v33 = 2048;
        v34 = (double)(uint64_t)v24 / (double)v21;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resource Usage - post tarring: Gathering diagnostics is %lld bytes (compressed) with %.1fX compression ratio", buf, 0x16u);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v25, "log:", CFSTR("Resource Usage - post tarring: Gathering diagnostics is %lld bytes (compressed) with %.1fX compression ratio"), v21, (double)(uint64_t)v24 / (double)v21);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to read tarball file size post tarring", buf, 2u);
      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v25, "log:", CFSTR("Unable to read tarball file size post tarring"), v28, v29);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
      *(_DWORD *)buf = 138412290;
      v32 = *(double *)&v26;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unable to read tarball file attributes post tarring: %@", buf, 0xCu);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
    objc_msgSend(v25, "log:", CFSTR("Unable to read tarball file attributes post tarring: %@"), v27);

  }
}

- (void)endDiagnostics
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;

  if (-[SystemDiagnostic coSysdiagnoseOnly](self, "coSysdiagnoseOnly"))
  {
    -[SystemDiagnostic setDidComplete:](self, "setDidComplete:", 1);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepot sharedTaskDepot](SDTaskDepot, "sharedTaskDepot"));
    -[SystemDiagnostic setDidComplete:](self, "setDidComplete:", objc_msgSend(v3, "mayStartExecuting"));

  }
  if (!-[SystemDiagnostic coSysdiagnoseOnly](self, "coSysdiagnoseOnly"))
  {
    v4 = +[SDTaskDepot stopTasks](SDTaskDepot, "stopTasks");
    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_1000624CC();
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v6, "log:", CFSTR("%lu tasks were still running after the generation phases ended."), v5);

    }
  }
  if (-[SystemDiagnostic shouldCreateTarBall](self, "shouldCreateTarBall"))
  {
    v7 = -[SystemDiagnostic useParallelCompression](self, "useParallelCompression");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic tarballPath](self, "tarballPath"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
    if (v7)
      v12 = 5;
    else
      v12 = 1;
    -[SystemDiagnostic setDpClass:](self, "setDpClass:", sub_100025B9C(v9, v10, v12, v11));

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "closeSysdiagnoseLog");

    -[SystemDiagnostic recordDiagnosticsMetrics:](self, "recordDiagnosticsMetrics:", v8);
  }
  else
  {
    if (-[SystemDiagnostic summaryFD](self, "summaryFD"))
      fclose(-[SystemDiagnostic summaryFD](self, "summaryFD"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v8, "closeSysdiagnoseLog");
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v16 = objc_msgSend(v14, "fileExistsAtPath:isDirectory:", v15, 0);

  if (v16)
  {
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory")));
    if (sub_100053B0C((const char *)objc_msgSend(v17, "UTF8String"), 0x1F5u, 0x1F5u) == -1)
    {

    }
    else
    {
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory")));
      v19 = sub_100053B70((const char *)objc_msgSend(v18, "UTF8String"), 0x1EDu);

      if (v19 != -1)
        goto LABEL_25;
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Failed to set file attributes on %@", buf, 0xCu);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    objc_msgSend(v21, "log:", CFSTR("Failed to set file attributes on %@"), v22);

  }
LABEL_25:
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
    *(_DWORD *)buf = 138412290;
    v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "\nOutput available at '%@'.", buf, 0xCu);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic completedOutputDirectory](self, "completedOutputDirectory"));
  objc_msgSend(v24, "log:", CFSTR("\nOutput available at '%@'."), v25);

}

- (id)getLogarchiveSummaryContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDTaskDepotContainer containerWithName:destination:withTimeout:withConcurrency:withDelegate:](SDTaskDepotContainer, "containerWithName:destination:withTimeout:withConcurrency:withDelegate:", CFSTR("logarchive summary"), 0, 1, self, 35.0));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", (unint64_t)objc_msgSend(v4, "runtimeChecks") | 0x40);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/usr/bin/log"), &off_1000ACCF8, CFSTR("libtrace/oslog_status.log")));
    v12[0] = CFSTR("-lRsh");
    v12[1] = CFSTR("/private/var/db/diagnostics");
    v13[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/ls"), v7, CFSTR("libtrace/oslog_contents.log")));
    v13[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDTask taskWithCommand:arguments:outputFile:](SDTask, "taskWithCommand:arguments:outputFile:", CFSTR("/bin/ls"), &off_1000ACD10, CFSTR("libtrace/oslog_uuidtext.log")));
    v13[2] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 3));
    objc_msgSend(v5, "addSDTasksToContainer:", v10);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getLogarchiveCollectionContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogArchiveContainer containerWithName:destination:withTimeout:withTargetArchive:withDelegate:](SDLogArchiveContainer, "containerWithName:destination:withTimeout:withTargetArchive:withDelegate:", CFSTR("logarchive"), v4, v5, self, 300.0));

  if (v6)
  {
    objc_msgSend(v6, "setRuntimeChecks:", 64);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    objc_msgSend(v7, "setValue:forKey:", &off_1000ACEF0, OSLogConstructHighVolumeSizeLimit);
    objc_msgSend(v7, "setValue:forKey:", &off_1000ACF08, OSLogConstructSignpostSizeLimit);
    objc_msgSend(v7, "setValue:forKey:", &off_1000ACF20, OSLogConstructSpecialSizeLimit);
    objc_msgSend(v7, "setValue:forKey:", &off_1000ACF38, OSLogConstructPersistSizeLimit);
    objc_msgSend(v7, "setValue:forKey:", &off_1000ACF50, OSLogConstructHighVolumeAgeLimit);
    objc_msgSend(v7, "setValue:forKey:", &off_1000ACF68, OSLogConstructSignpostAgeLimit);
    objc_msgSend(v7, "setValue:forKey:", &off_1000ACF80, OSLogConstructSpecialAgeLimit);
    objc_msgSend(v7, "setValue:forKey:", &off_1000ACF98, OSLogConstructPersistAgeLimit);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogArchiveUnit logArchiveUnitWithDictionary:](SDLogArchiveUnit, "logArchiveUnitWithDictionary:", v7));
    objc_msgSend(v6, "setLogArchiveUnit:", v8);

    objc_msgSend(v3, "addObject:", v6);
  }

  return v3;
}

- (id)getLogStreamFilterContainer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[SDLogCollectionContainer containerWithName:destination:withDelegate:](SDLogCollectionContainer, "containerWithName:destination:withDelegate:", CFSTR("LogStreamFilter"), CFSTR("libtrace"), self));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setRuntimeChecks:", 9);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogPathArray logRuleWithPaths:](SDUnitLogPathArray, "logRuleWithPaths:", &off_1000ACD28));
    v10[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDUnitLogGlob logRuleWithGlob:](SDUnitLogGlob, "logRuleWithGlob:", CFSTR("/private/var/db/diagnostics/logd.[01].log")));
    v10[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
    objc_msgSend(v5, "addRules:", v8);

    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)getLibtraceContainers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogarchiveSummaryContainer](self, "getLogarchiveSummaryContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogarchiveCollectionContainer](self, "getLogarchiveCollectionContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic getLogStreamFilterContainer](self, "getLogStreamFilterContainer"));
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  free(-[SystemDiagnostic processes](self, "processes"));
  v3.receiver = self;
  v3.super_class = (Class)SystemDiagnostic;
  -[SystemDiagnostic dealloc](&v3, "dealloc");
}

- (void)writeReportForTasks:(id)a3 withTimeout:(double)a4 concurrently:(BOOL)a5 withDepotName:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  const __CFString *v11;
  id v12;
  id v13;
  const __CFString *v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  id v19;
  NSString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  __CFString *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  int *v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  __CFString *v55;
  void *v56;
  id obj;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];

  v7 = a5;
  v9 = a3;
  v55 = (__CFString *)a6;
  v10 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", &stru_10009DC10);
  if ((unint64_t)objc_msgSend(v9, "count") >= 2)
  {
    if (v7)
      v11 = CFSTR("\nConcurrent ");
    else
      v11 = CFSTR("\nSequential ");
    objc_msgSend(v10, "appendString:", v11);
    objc_msgSend(v10, "appendFormat:", CFSTR("group with total timeout %f sec\n"), *(_QWORD *)&a4);
  }
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
  if (v12)
  {
    v13 = v12;
    v14 = CFSTR("\"%@\",");
    v15 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v74 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v17, "started") & 1) == 0)
        {
          v21 = v14;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arguments"));
          if (v22
            && (v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arguments")),
                (objc_msgSend(v58, "isEqualToArray:", &__NSArray0__struct) & 1) == 0))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "launchPath"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "arguments"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "componentsJoinedByString:", CFSTR(" ")));
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v25, v27));

          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "launchPath"));
            if (!v22)
              goto LABEL_25;
          }

LABEL_25:
          v14 = v21;
          objc_msgSend(v10, "appendFormat:", v21, v23);
          objc_msgSend(v10, "appendString:", CFSTR("Never got executed,"));
          objc_msgSend(v10, "appendFormat:", CFSTR("0.00,%f\n"), *(_QWORD *)&a4, v52, v53);
          goto LABEL_33;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "executionLine"));
        objc_msgSend(v10, "appendFormat:", v14, v18);

        v19 = objc_msgSend(v17, "endStatus");
        if ((v19 & 0x7F) != 0)
        {
          if ((v19 & 0x7F) == 0x7F)
          {
            if ((int)v19 >> 8 == 19)
              v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown status %04x"), v19);
            else
              v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("stopped due to signal: %s"), strsignal((int)v19 >> 8));
          }
          else
          {
            v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("terminated due to signal: %s"), strsignal(v19 & 0x7F));
          }
          v23 = (void *)objc_claimAutoreleasedReturnValue(v20);
          objc_msgSend(v10, "appendFormat:", v14, v23);
        }
        else
        {
          v24 = BYTE1(v19);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("exited with status %d"), BYTE1(v19)));
          objc_msgSend(v10, "appendFormat:", v14, v23);
          if (!v24)
            goto LABEL_29;
        }
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "executionLine"));
        objc_msgSend(v17, "executionTime");
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@ in %.1f seconds.\n"), v28, v23, v29));

        objc_msgSend(v56, "addObject:", v30);
LABEL_29:
        objc_msgSend(v17, "executionTime");
        v32 = v31;
        if (v17)
        {
          objc_msgSend(v17, "rusage_details");
          v33 = v66;
        }
        else
        {
          v33 = 0;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v67 = 0u;
          v68 = 0u;
          v65 = 0u;
          v66 = 0u;
          v64 = 0u;
        }
        objc_msgSend(v10, "appendFormat:", CFSTR("%f,%f,%f\n"), v32, *(_QWORD *)&a4, (float)((float)((float)v33 * 0.00097656) * 0.00097656));
LABEL_33:

      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v78, 16);
    }
    while (v13);
  }

  if ((unint64_t)objc_msgSend(obj, "count") >= 2)
    objc_msgSend(v10, "appendString:", CFSTR("\n"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic summaryHandle](self, "summaryHandle"));
  sub_100026870(v34, 0, v10, CFSTR("writing summary file report"));

  if (objc_msgSend(v56, "count"))
  {
    v35 = v55;
    if (!v55)
      v35 = CFSTR("unnamed");
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic outputDirectory](self, "outputDirectory"));
    v55 = v35;
    v37 = sub_100027590(v36, v35);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

    v39 = objc_retainAutorelease(v38);
    v40 = sub_100053A44((const char *)objc_msgSend(v39, "fileSystemRepresentation"), 1, 0x1A4u);
    if ((_DWORD)v40 == -1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        sub_100062534((uint64_t)v39);
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v50 = __error();
      objc_msgSend(v49, "stderrWrite:", CFSTR("Unable to create %@: %s"), v39, strerror(*v50));

      v41 = (id)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      v51 = __error();
      objc_msgSend(v41, "log:", CFSTR("Unable to create %@: %s"), v39, strerror(*v51));
    }
    else
    {
      v59 = v39;
      v41 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v40, 1);
      v60 = 0u;
      v61 = 0u;
      v62 = 0u;
      v63 = 0u;
      v42 = v56;
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
      if (v43)
      {
        v44 = v43;
        v45 = *(_QWORD *)v61;
LABEL_43:
        v46 = 0;
        while (1)
        {
          if (*(_QWORD *)v61 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("writing %@'s error report"), v55));
          LODWORD(v47) = sub_100026870(v41, 0, v47, v48);

          if (!(_DWORD)v47)
            break;
          if (v44 == (id)++v46)
          {
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v60, v77, 16);
            if (v44)
              goto LABEL_43;
            break;
          }
        }
      }

      v39 = v59;
    }

  }
}

- (void)streamArchiveFile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  SystemDiagnostic *v18;
  id v19;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Invalid archive file", buf, 2u);
    }
    v11 = objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v7 = v11;
    v12 = CFSTR("Invalid archive file");
    goto LABEL_21;
  }
  if (!-[SystemDiagnostic shouldStreamToTar](self, "shouldStreamToTar"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Should not stream to tar, something's wrong", buf, 2u);
    }
    v11 = objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v7 = v11;
    v12 = CFSTR("Should not stream to tar, something's wrong");
    goto LABEL_21;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));

  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Archive not created before", buf, 2u);
    }
    v11 = objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v7 = v11;
    v12 = CFSTR("Archive not created before");
LABEL_21:
    -[NSObject log:](v11, "log:", v12);
    goto LABEL_22;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tarQueue"));

  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      sub_1000625CC(v4);
    v14 = _NSConcreteStackBlock;
    v15 = 3221225472;
    v16 = sub_100050708;
    v17 = &unk_100099260;
    v18 = self;
    v19 = v4;
    dispatch_async(v7, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SystemDiagnostic archive](self, "archive", v14, v15, v16, v17, v18));
    v9 = objc_msgSend(v8, "archiveStatus");

    if (v9 == (id)-30)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDArchive failed, will not remove outputDirectory", buf, 2u);
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
      objc_msgSend(v10, "log:", CFSTR("SDArchive failed, will not remove outputDirectory"));

      -[SystemDiagnostic setShouldRemoveTemporaryDirectory:](self, "setShouldRemoveTemporaryDirectory:", 0);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Can't add files to archive, dispatch queue not created\n", buf, 2u);
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    objc_msgSend(v13, "log:", CFSTR("Can't add files to archive, dispatch queue not created\n"));

  }
LABEL_22:

}

- (BOOL)logCollectionContainer:(id)a3 shouldContinueAfterEncounteringError:(id)a4 path:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSErrorDomain v10;
  NSErrorDomain v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (NSErrorDomain)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
  v11 = v10;
  if (v10 != NSCocoaErrorDomain)
  {

LABEL_3:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      *(_DWORD *)buf = 138412802;
      v20 = v12;
      v21 = 2112;
      v22 = v8;
      v23 = 2112;
      v24 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "LOGS: %@: error: %@, path: %@", buf, 0x20u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    objc_msgSend(v13, "log:", CFSTR("LOGS: %@: error: %@, path: %@"), v14, v8, v9);
    goto LABEL_12;
  }
  if (objc_msgSend(v8, "code") == (id)4)
  {

  }
  else
  {
    v15 = objc_msgSend(v8, "code");

    if (v15 != (id)260)
      goto LABEL_3;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
    *(_DWORD *)buf = 138412546;
    v20 = v16;
    v21 = 2112;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "LOGS: %@: file at path '%@' does not exist", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDResourceManager sharedResourceManager](SDResourceManager, "sharedResourceManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  objc_msgSend(v13, "log:", CFSTR("LOGS: %@: file at path '%@' does not exist"), v14, v9, v18);
LABEL_12:

  return 1;
}

- (NSDate)startDiagnosticTime
{
  return self->_startDiagnosticTime;
}

- (void)setStartDiagnosticTime:(id)a3
{
  self->_startDiagnosticTime = (NSDate *)a3;
}

- (int64_t)startDiagnosticTimeClockNS
{
  return self->_startDiagnosticTimeClockNS;
}

- (void)setStartDiagnosticTimeClockNS:(int64_t)a3
{
  self->_startDiagnosticTimeClockNS = a3;
}

- (NSDate)oldestDateCreatedCutoff
{
  return self->_oldestDateCreatedCutoff;
}

- (void)setOldestDateCreatedCutoff:(id)a3
{
  self->_oldestDateCreatedCutoff = (NSDate *)a3;
}

- (__sFILE)summaryFD
{
  return self->_summaryFD;
}

- (void)setSummaryFD:(__sFILE *)a3
{
  self->_summaryFD = a3;
}

- (NSString)outputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOutputDirectory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSString)tmpOutputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTmpOutputDirectory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (NSString)baseDirectory
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBaseDirectory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (NSString)diagnosticID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setDiagnosticID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)archiveName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setArchiveName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (NSArray)onlyRunContainersWithNames
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setOnlyRunContainersWithNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSString)tarballPath
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTarballPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSString)completedOutputDirectory
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setCompletedOutputDirectory:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSString)completedTarballPath
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setCompletedTarballPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSString)rootPath
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (void)setRootPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSFileHandle)summaryHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 160, 1);
}

- (void)setSummaryHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSString)frontmostBundleID
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (void)setFrontmostBundleID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 168);
}

- (NSString)changedDiagnosticProperties
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (void)setChangedDiagnosticProperties:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 176);
}

- (OS_dispatch_group)completionDispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 184, 1);
}

- (void)setCompletionDispatchGroup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSArray)targetPIDs
{
  return (NSArray *)objc_getProperty(self, a2, 192, 1);
}

- (void)setTargetPIDs:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSMutableArray)pidIndices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPidIndices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)warnProcessAllowlist
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setWarnProcessAllowlist:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)providedPIDorProcess
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setProvidedPIDorProcess:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)remoteSysdiagnoseID
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setRemoteSysdiagnoseID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 224);
}

- (unsigned)requestSource
{
  return self->_requestSource;
}

- (void)setRequestSource:(unsigned __int16)a3
{
  self->_requestSource = a3;
}

- (NSDictionary)capOverride
{
  return (NSDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setCapOverride:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSNumber)totalTime
{
  return (NSNumber *)objc_getProperty(self, a2, 240, 1);
}

- (void)setTotalTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSMutableDictionary)metricsDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (NSDictionary)overrideContainers
{
  return (NSDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)setOverrideContainers:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 256);
}

- (SDArchive)archive
{
  return (SDArchive *)objc_getProperty(self, a2, 264, 1);
}

- (void)setArchive:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (BOOL)didComplete
{
  return self->_didComplete;
}

- (void)setDidComplete:(BOOL)a3
{
  self->_didComplete = a3;
}

- (BOOL)shouldStreamToTar
{
  return self->_shouldStreamToTar;
}

- (void)setShouldStreamToTar:(BOOL)a3
{
  self->_shouldStreamToTar = a3;
}

- (BOOL)disableStreamTar
{
  return self->_disableStreamTar;
}

- (void)setDisableStreamTar:(BOOL)a3
{
  self->_disableStreamTar = a3;
}

- (BOOL)shouldPostProcess
{
  return self->_shouldPostProcess;
}

- (void)setShouldPostProcess:(BOOL)a3
{
  self->_shouldPostProcess = a3;
}

- (BOOL)isTestingMode
{
  return self->_isTestingMode;
}

- (void)setIsTestingMode:(BOOL)a3
{
  self->_isTestingMode = a3;
}

- (BOOL)disableUIFeedback
{
  return self->_disableUIFeedback;
}

- (void)setDisableUIFeedback:(BOOL)a3
{
  self->_disableUIFeedback = a3;
}

- (BOOL)deShowFeedback
{
  return self->_deShowFeedback;
}

- (void)setDeShowFeedback:(BOOL)a3
{
  self->_deShowFeedback = a3;
}

- (proc_bsdinfo)processes
{
  return self->_processes;
}

- (void)setProcesses:(proc_bsdinfo *)a3
{
  self->_processes = a3;
}

- (int)processCount
{
  return self->_processCount;
}

- (void)setProcessCount:(int)a3
{
  self->_processCount = a3;
}

- (OS_xpc_object)coSysdiagnoseParameters
{
  return self->_coSysdiagnoseParameters;
}

- (void)setCoSysdiagnoseParameters:(id)a3
{
  objc_storeStrong((id *)&self->_coSysdiagnoseParameters, a3);
}

- (BOOL)quickMode
{
  return self->_quickMode;
}

- (void)setQuickMode:(BOOL)a3
{
  self->_quickMode = a3;
}

- (BOOL)useParallelCompression
{
  return self->_useParallelCompression;
}

- (void)setUseParallelCompression:(BOOL)a3
{
  self->_useParallelCompression = a3;
}

- (BOOL)shouldRunTimeSensitiveTasks
{
  return self->_shouldRunTimeSensitiveTasks;
}

- (void)setShouldRunTimeSensitiveTasks:(BOOL)a3
{
  self->_shouldRunTimeSensitiveTasks = a3;
}

- (BOOL)shouldRunLogGenerationTasks
{
  return self->_shouldRunLogGenerationTasks;
}

- (void)setShouldRunLogGenerationTasks:(BOOL)a3
{
  self->_shouldRunLogGenerationTasks = a3;
}

- (BOOL)shouldRunLogCopyTasks
{
  return self->_shouldRunLogCopyTasks;
}

- (void)setShouldRunLogCopyTasks:(BOOL)a3
{
  self->_shouldRunLogCopyTasks = a3;
}

- (BOOL)shouldRunOSLogArchive
{
  return self->_shouldRunOSLogArchive;
}

- (void)setShouldRunOSLogArchive:(BOOL)a3
{
  self->_shouldRunOSLogArchive = a3;
}

- (BOOL)shouldGetFeedbackData
{
  return self->_shouldGetFeedbackData;
}

- (void)setShouldGetFeedbackData:(BOOL)a3
{
  self->_shouldGetFeedbackData = a3;
}

- (BOOL)shouldRunIDSDump
{
  return self->_shouldRunIDSDump;
}

- (void)setShouldRunIDSDump:(BOOL)a3
{
  self->_shouldRunIDSDump = a3;
}

- (BOOL)verbose
{
  return self->_verbose;
}

- (void)setVerbose:(BOOL)a3
{
  self->_verbose = a3;
}

- (BOOL)earlyPrompt
{
  return self->_earlyPrompt;
}

- (void)setEarlyPrompt:(BOOL)a3
{
  self->_earlyPrompt = a3;
}

- (BOOL)shouldCreateTarBall
{
  return self->_shouldCreateTarBall;
}

- (void)setShouldCreateTarBall:(BOOL)a3
{
  self->_shouldCreateTarBall = a3;
}

- (BOOL)shouldDisplayTarBall
{
  return self->_shouldDisplayTarBall;
}

- (void)setShouldDisplayTarBall:(BOOL)a3
{
  self->_shouldDisplayTarBall = a3;
}

- (BOOL)canDisplayTarBall
{
  return self->_canDisplayTarBall;
}

- (void)setCanDisplayTarBall:(BOOL)a3
{
  self->_canDisplayTarBall = a3;
}

- (BOOL)shouldRemoveTemporaryDirectory
{
  return self->_shouldRemoveTemporaryDirectory;
}

- (void)setShouldRemoveTemporaryDirectory:(BOOL)a3
{
  self->_shouldRemoveTemporaryDirectory = a3;
}

- (BOOL)generatePlist
{
  return self->_generatePlist;
}

- (void)setGeneratePlist:(BOOL)a3
{
  self->_generatePlist = a3;
}

- (int64_t)coSysdiagnose
{
  return self->_coSysdiagnose;
}

- (void)setCoSysdiagnose:(int64_t)a3
{
  self->_coSysdiagnose = a3;
}

- (BOOL)coSysdiagnoseOnly
{
  return self->_coSysdiagnoseOnly;
}

- (void)setCoSysdiagnoseOnly:(BOOL)a3
{
  self->_coSysdiagnoseOnly = a3;
}

- (int)dpClass
{
  return self->_dpClass;
}

- (void)setDpClass:(int)a3
{
  self->_dpClass = a3;
}

- (NSString)brctl_dir
{
  return (NSString *)objc_getProperty(self, a2, 296, 1);
}

- (void)setBrctl_dir:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 296);
}

- (BOOL)tconNvmDump
{
  return self->_tconNvmDump;
}

- (void)setTconNvmDump:(BOOL)a3
{
  self->_tconNvmDump = a3;
}

- (BOOL)collectWifiDextCoreFiles
{
  return self->_collectWifiDextCoreFiles;
}

- (void)setCollectWifiDextCoreFiles:(BOOL)a3
{
  self->_collectWifiDextCoreFiles = a3;
}

- (NSMutableDictionary)executedContainers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 304, 1);
}

- (void)setExecutedContainers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executedContainers, 0);
  objc_storeStrong((id *)&self->_brctl_dir, 0);
  objc_storeStrong((id *)&self->_coSysdiagnoseParameters, 0);
  objc_storeStrong((id *)&self->_archive, 0);
  objc_storeStrong((id *)&self->_overrideContainers, 0);
  objc_storeStrong((id *)&self->_metricsDict, 0);
  objc_storeStrong((id *)&self->_totalTime, 0);
  objc_storeStrong((id *)&self->_capOverride, 0);
  objc_storeStrong((id *)&self->_remoteSysdiagnoseID, 0);
  objc_storeStrong((id *)&self->_providedPIDorProcess, 0);
  objc_storeStrong((id *)&self->_warnProcessAllowlist, 0);
  objc_storeStrong((id *)&self->_pidIndices, 0);
  objc_storeStrong((id *)&self->_targetPIDs, 0);
  objc_storeStrong((id *)&self->_completionDispatchGroup, 0);
  objc_storeStrong((id *)&self->_changedDiagnosticProperties, 0);
  objc_storeStrong((id *)&self->_frontmostBundleID, 0);
  objc_storeStrong((id *)&self->_summaryHandle, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_completedTarballPath, 0);
  objc_storeStrong((id *)&self->_completedOutputDirectory, 0);
  objc_storeStrong((id *)&self->_tarballPath, 0);
  objc_storeStrong((id *)&self->_onlyRunContainersWithNames, 0);
  objc_storeStrong((id *)&self->_archiveName, 0);
  objc_storeStrong((id *)&self->_diagnosticID, 0);
  objc_storeStrong((id *)&self->_baseDirectory, 0);
  objc_storeStrong((id *)&self->_tmpOutputDirectory, 0);
  objc_storeStrong((id *)&self->_outputDirectory, 0);
}

@end
