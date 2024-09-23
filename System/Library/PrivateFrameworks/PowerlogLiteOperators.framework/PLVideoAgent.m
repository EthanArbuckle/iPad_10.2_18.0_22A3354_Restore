@implementation PLVideoAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLVideoAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  uint64_t v2;
  uint64_t v3;
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
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[2];
  _QWORD v20[2];
  const __CFString *v21;
  _QWORD v22[3];

  v22[1] = *MEMORY[0x1E0C80C00];
  v21 = CFSTR("Video");
  v19[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D802A8];
  v17[0] = *MEMORY[0x1E0D80318];
  v17[1] = v2;
  v18[0] = &unk_1E8653140;
  v18[1] = MEMORY[0x1E0C9AAA0];
  v3 = *MEMORY[0x1E0D80250];
  v17[2] = *MEMORY[0x1E0D80300];
  v17[3] = v3;
  v18[2] = MEMORY[0x1E0C9AAA0];
  v18[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v4;
  v19[1] = *MEMORY[0x1E0D802F0];
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance", CFSTR("clientPID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_IntegerFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v15[1] = CFSTR("clientDisplayID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_StringFormat_withBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v15[2] = CFSTR("State");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)entryEventBackwardDefinitions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
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
  uint64_t v41;
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
  _QWORD v107[4];
  _QWORD v108[4];
  _QWORD v109[5];
  _QWORD v110[5];
  _QWORD v111[2];
  _QWORD v112[2];
  _QWORD v113[6];
  _QWORD v114[6];
  _QWORD v115[5];
  _QWORD v116[5];
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[8];
  _QWORD v120[8];
  _QWORD v121[4];
  uint64_t v122;
  _QWORD v123[5];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[10];
  _QWORD v127[10];
  _QWORD v128[2];
  uint64_t v129;
  _QWORD v130[3];
  _QWORD v131[2];
  _QWORD v132[2];
  _QWORD v133[11];
  _QWORD v134[11];
  _QWORD v135[2];
  uint64_t v136;
  _QWORD v137[3];
  uint64_t v138;
  uint64_t v139;
  _QWORD v140[2];
  _QWORD v141[5];
  _QWORD v142[7];

  v142[5] = *MEMORY[0x1E0C80C00];
  v141[0] = CFSTR("VTSession");
  v138 = *MEMORY[0x1E0D80298];
  v2 = v138;
  v4 = *MEMORY[0x1E0D802A8];
  v135[0] = *MEMORY[0x1E0D80318];
  v3 = v135[0];
  v135[1] = v4;
  v137[0] = &unk_1E8653150;
  v137[1] = MEMORY[0x1E0C9AAA0];
  v136 = *MEMORY[0x1E0D80300];
  v41 = v136;
  v137[2] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v137, v135, 3);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v140[0] = v106;
  v139 = *MEMORY[0x1E0D802F0];
  v5 = v139;
  v133[0] = CFSTR("logID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v105, "commonTypeDict_StringFormat");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v104;
  v133[1] = CFSTR("videoCodecType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "commonTypeDict_IntegerFormat");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v102;
  v133[2] = CFSTR("resHeight");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v101, "commonTypeDict_IntegerFormat");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v100;
  v133[3] = CFSTR("numFramesDecoded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "commonTypeDict_IntegerFormat");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v134[3] = v98;
  v133[4] = CFSTR("numFramesEncoded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v97, "commonTypeDict_IntegerFormat");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v134[4] = v96;
  v133[5] = CFSTR("resWidth");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "commonTypeDict_IntegerFormat");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v134[5] = v94;
  v133[6] = CFSTR("isHDR");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "commonTypeDict_BoolFormat");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v134[6] = v92;
  v133[7] = CFSTR("processID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "commonTypeDict_IntegerFormat");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v134[7] = v90;
  v133[8] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "commonTypeDict_StringFormat_withBundleID");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v134[8] = v88;
  v133[9] = CFSTR("numFramesDropped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "commonTypeDict_IntegerFormat");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v134[9] = v86;
  v133[10] = CFSTR("sessionDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v85, "commonTypeDict_IntegerFormat");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v134[10] = v84;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v134, v133, 11);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v140[1] = v83;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v140, &v138, 2);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v142[0] = v82;
  v141[1] = CFSTR("VTTile");
  v131[0] = v2;
  v128[0] = v3;
  v128[1] = v4;
  v130[0] = &unk_1E8653140;
  v130[1] = MEMORY[0x1E0C9AAA0];
  v129 = *MEMORY[0x1E0D80250];
  v6 = v129;
  v22 = v129;
  v7 = MEMORY[0x1E0C9AAB0];
  v130[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v130, v128, 3);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v132[0] = v81;
  v131[1] = v5;
  v126[0] = CFSTR("videoCodecType");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "commonTypeDict_IntegerFormat");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v127[0] = v79;
  v126[1] = CFSTR("resHeight");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "commonTypeDict_IntegerFormat");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v127[1] = v77;
  v126[2] = CFSTR("numFramesDecoded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "commonTypeDict_IntegerFormat");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v127[2] = v75;
  v126[3] = CFSTR("numFramesEncoded");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "commonTypeDict_IntegerFormat");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v127[3] = v73;
  v126[4] = CFSTR("resWidth");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "commonTypeDict_IntegerFormat");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v127[4] = v71;
  v126[5] = CFSTR("isHDR");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "commonTypeDict_BoolFormat");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v127[5] = v69;
  v126[6] = CFSTR("processID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "commonTypeDict_IntegerFormat");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v127[6] = v67;
  v126[7] = CFSTR("BundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "commonTypeDict_StringFormat_withBundleID");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v127[7] = v65;
  v126[8] = CFSTR("numFramesDropped");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "commonTypeDict_IntegerFormat");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v127[8] = v63;
  v126[9] = CFSTR("sessionDuration");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "commonTypeDict_IntegerFormat");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v127[9] = v61;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 10);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v132[1] = v60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v132, v131, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v142[1] = v59;
  v141[2] = CFSTR("CMHls");
  v124[0] = v2;
  v121[0] = v3;
  v121[1] = v4;
  v123[0] = &unk_1E8653160;
  v8 = MEMORY[0x1E0C9AAA0];
  v123[1] = MEMORY[0x1E0C9AAA0];
  v121[2] = v41;
  v121[3] = v6;
  v123[2] = MEMORY[0x1E0C9AAA0];
  v123[3] = v7;
  v122 = *MEMORY[0x1E0D802A0];
  v9 = v122;
  v123[4] = &unk_1E8650888;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v123, v121, 5);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = v58;
  v124[1] = v5;
  v119[0] = CFSTR("logID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "commonTypeDict_StringFormat");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v56;
  v119[1] = CFSTR("TWOBR");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "commonTypeDict_IntegerFormat");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v54;
  v119[2] = CFSTR("TWIBR");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "commonTypeDict_IntegerFormat");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v52;
  v119[3] = CFSTR("IfTy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "commonTypeDict_IntegerFormat");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v120[3] = v50;
  v119[4] = CFSTR("AuOn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "commonTypeDict_BoolFormat");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v120[4] = v48;
  v119[5] = CFSTR("TWVaRk");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "commonTypeDict_IntegerFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v120[5] = v46;
  v119[6] = CFSTR("PlayTimeWC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "commonTypeDict_IntegerFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v120[6] = v44;
  v119[7] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "commonTypeDict_StringFormat_withProcessName");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v120[7] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v120, v119, 8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v125[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v142[2] = v38;
  v141[3] = CFSTR("CMFile");
  v117[0] = v2;
  v115[0] = v3;
  v115[1] = v4;
  v116[0] = &unk_1E8653160;
  v116[1] = v8;
  v115[2] = v41;
  v115[3] = v22;
  v116[2] = v8;
  v116[3] = MEMORY[0x1E0C9AAB0];
  v115[4] = v9;
  v116[4] = &unk_1E86508A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v118[0] = v37;
  v117[1] = v5;
  v113[0] = CFSTR("logID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "commonTypeDict_StringFormat");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v114[0] = v35;
  v113[1] = CFSTR("TWIABR");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "commonTypeDict_IntegerFormat");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v33;
  v113[2] = CFSTR("PlayTimeWC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "commonTypeDict_RealFormat");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v114[2] = v31;
  v113[3] = CFSTR("AuOn");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "commonTypeDict_BoolFormat");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v114[3] = v29;
  v113[4] = CFSTR("StallCount");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "commonTypeDict_IntegerFormat");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v114[4] = v27;
  v113[5] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "commonTypeDict_StringFormat_withProcessName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v114[5] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 6);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v118[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v118, v117, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v142[3] = v21;
  v141[4] = CFSTR("CMCrabs");
  v111[0] = v2;
  v109[0] = v3;
  v109[1] = v4;
  v110[0] = &unk_1E8653160;
  v110[1] = v8;
  v109[2] = v41;
  v109[3] = v22;
  v110[2] = v8;
  v110[3] = MEMORY[0x1E0C9AAB0];
  v109[4] = v9;
  v110[4] = &unk_1E86508B8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v110, v109, 5);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v42;
  v111[1] = v5;
  v107[0] = CFSTR("IfTy");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "commonTypeDict_IntegerFormat");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v108[0] = v10;
  v107[1] = CFSTR("PlayTimeWC");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "commonTypeDict_IntegerFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v108[1] = v12;
  v107[2] = CFSTR("IBR");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "commonTypeDict_IntegerFormat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v108[2] = v14;
  v107[3] = CFSTR("ProcessName");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "commonTypeDict_StringFormat_withProcessName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v108[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v108, v107, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v112[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v142[4] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v142, v141, 5);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  return v20;
}

+ (id)entryEventIntervalDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("GroupSession");
  objc_msgSend(a1, "entryEventIntervalDefinitionGroupSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventIntervalDefinitionGroupSession
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80250];
  v13[0] = *MEMORY[0x1E0D80318];
  v13[1] = v2;
  v14[0] = &unk_1E8653140;
  v14[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v3;
  v15[1] = *MEMORY[0x1E0D802F0];
  v11[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_DateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = CFSTR("BundleID");
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLVideoAgent)init
{
  PLVideoAgent *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLVideoAgent;
    self = -[PLAgent init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[5];

  v3 = objc_alloc(MEMORY[0x1E0D80090]);
  v4 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke;
  v18[3] = &unk_1E8578610;
  v18[4] = self;
  v5 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C6C0, v18);
  -[PLVideoAgent setNotification:](self, "setNotification:", v5);

  v17[0] = v4;
  v17[1] = 3221225472;
  v17[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_96;
  v17[3] = &unk_1E8578610;
  v17[4] = self;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C6E8, v17);
  -[PLVideoAgent setCMFileListener:](self, "setCMFileListener:", v6);

  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_102;
  v16[3] = &unk_1E8578610;
  v16[4] = self;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C710, v16);
  -[PLVideoAgent setCMHlsListener:](self, "setCMHlsListener:", v7);

  v15[0] = v4;
  v15[1] = 3221225472;
  v15[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_108;
  v15[3] = &unk_1E8578610;
  v15[4] = self;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C738, v15);
  -[PLVideoAgent setCMCrabsListener:](self, "setCMCrabsListener:", v8);

  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_114;
  v14[3] = &unk_1E8578610;
  v14[4] = self;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C760, v14);
  -[PLVideoAgent setVTSessionListener:](self, "setVTSessionListener:", v9);

  v13[0] = v4;
  v13[1] = 3221225472;
  v13[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_120;
  v13[3] = &unk_1E8578610;
  v13[4] = self;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C788, v13);
  -[PLVideoAgent setVTTileListener:](self, "setVTTileListener:", v10);

  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __40__PLVideoAgent_initOperatorDependancies__block_invoke_127;
  v12[3] = &unk_1E8578610;
  v12[4] = self;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80090]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864C7B0, v12);
  -[PLVideoAgent setGroupSessionListener:](self, "setGroupSessionListener:", v11);

}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138412290;
    v14 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationVideo: payload=%@", (uint8_t *)&v13, 0xCu);
  }

  +[PLOperator entryKeyForType:andName:](PLVideoAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Video"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v8, v6);
  v10 = (void *)objc_opt_class();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("State"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stateEnumForStateString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("State"));

  objc_msgSend(*(id *)(a1 + 32), "logEventForwardVideoWithEntry:", v9);
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_96(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationCMFile: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardCMFileWithEntry:", v6);
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_102(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationCMHls: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardCMHlsWithEntry:", v6);
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationCMCrabs: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardCMCrabsWithEntry:", v6);
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideoAgentRegistrationVTSession: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardVTSessionWithEntry:", v6);
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "PLVideoAgent::kPLVideAgentEventBackwardVTTile: payload=%@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "logEventBackwardVTTileWithEntry:", v6);
}

void __40__PLVideoAgent_initOperatorDependancies__block_invoke_127(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t block;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __40__PLVideoAgent_initOperatorDependancies__block_invoke_2;
    v17 = &__block_descriptor_40_e5_v8__0lu32l8;
    v18 = v7;
    if (qword_1ED883568 != -1)
      dispatch_once(&qword_1ED883568, &block);
    if (_MergedGlobals_1_36)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLVideoAgent::kPLVideoAgentRegistrationGroupSession: payload=%@"), v6, block, v15, v16, v17, v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLVideoAgent.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLVideoAgent initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 318);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "logEventIntervalGroupSession:", v6);

}

uint64_t __40__PLVideoAgent_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_36 = result;
  return result;
}

- (void)logEventForwardVideoWithEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("State"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientDisplayID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[PLOperator logEntry:](self, "logEntry:", v5);
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("State"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "integerValue");

        if (v11 == 1)
        {
          v12 = 0;
          v13 = v9;
        }
        else
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("State"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "integerValue");

          if (v15 != 2)
          {
LABEL_12:

            goto LABEL_13;
          }
          v13 = 0;
          v12 = v9;
        }
        v16 = v9;
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientDisplayID"));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = CFSTR("video-unknown");
        if (v17 && -[__CFString length](v17, "length"))
          v19 = v18;
        v20 = v19;

        objc_msgSend(MEMORY[0x1E0D7FED8], "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v20;
        v24[0] = &unk_1E8653140;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v21, "createDistributionEventForwardWithDistributionID:withChildNodeNameToWeight:withStartDate:", 9, v22, v16);
        goto LABEL_12;
      }
    }
  }
LABEL_13:

}

- (void)logEventBackwardCMFileWithEntry:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLVideoAgent, "entryKeyForType:andName:", v4, CFSTR("CMFile"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v14, v5);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("logID"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TWIABR"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      v11 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TWIABR"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "roundToSigFig:withSigFig:", objc_msgSend(v12, "intValue"), 2));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("TWIABR"));

      -[PLOperator logEntry:](self, "logEntry:", v6);
    }
  }

}

- (void)logEventBackwardCMHlsWithEntry:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
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
  id v22;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLVideoAgent, "entryKeyForType:andName:", v4, CFSTR("CMHls"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v22, v5);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("logID"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_8;
  v8 = (void *)v7;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PlayTimeWC"));
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_7:

    goto LABEL_8;
  }
  v10 = (void *)v9;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TWIBR"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {

    goto LABEL_7;
  }
  v12 = (void *)v11;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TWOBR"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TWIBR"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithInt:", objc_msgSend(v15, "roundToSigFig:withSigFig:", objc_msgSend(v16, "intValue"), 2));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("TWIBR"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    v19 = (void *)MEMORY[0x1E0D80078];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TWOBR"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberWithInt:", objc_msgSend(v19, "roundToSigFig:withSigFig:", objc_msgSend(v20, "intValue"), 2));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("TWOBR"));

    -[PLOperator logEntry:](self, "logEntry:", v6);
  }
LABEL_8:

}

- (void)logEventBackwardCMCrabsWithEntry:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLVideoAgent, "entryKeyForType:andName:", v4, CFSTR("CMCrabs"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v14, v5);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("logID"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IBR"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      v11 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("IBR"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "roundToSigFig:withSigFig:", objc_msgSend(v12, "intValue"), 2));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("IBR"));

      -[PLOperator logEntry:](self, "logEntry:", v6);
    }
  }

}

- (void)logEventBackwardVTSessionWithEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD block[5];
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLOperator entryKeyForType:andName:](PLVideoAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("VTSession"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v5, v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("processID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(MEMORY[0x1E0D80078], "bundleIDFromPid:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D7FFA0], "liteMode") & 1) != 0
    || objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    if ((objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple")) & 1) != 0
      || objc_msgSend(&unk_1E86508D0, "containsObject:", v9))
    {
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("BundleID"));
      v10 = (void *)MEMORY[0x1E0CB37E8];
      v11 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numFramesDecoded"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberWithLong:", objc_msgSend(v11, "roundToSigFig:withSigFig:", objc_msgSend(v12, "intValue"), 3));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("numFramesDecoded"));

      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = (void *)MEMORY[0x1E0D80078];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numFramesEncoded"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithLong:", objc_msgSend(v15, "roundToSigFig:withSigFig:", objc_msgSend(v16, "intValue"), 3));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("numFramesEncoded"));

    }
    else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v19 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PLVideoAgent_logEventBackwardVTSessionWithEntry___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v19;
      if (qword_1ED883570 != -1)
        dispatch_once(&qword_1ED883570, block);
      if (byte_1ED883561)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("the appBundleID is not approved and pid is %d"), v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLVideoAgent.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLVideoAgent logEventBackwardVTSessionWithEntry:]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 453);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v20;
          _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80078], "bundleIDFromPid:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("BundleID"));

  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

uint64_t __51__PLVideoAgent_logEventBackwardVTSessionWithEntry___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED883561 = result;
  return result;
}

- (void)logEventBackwardVTTileWithEntry:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v4 = *MEMORY[0x1E0D80370];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLVideoAgent, "entryKeyForType:andName:", v4, CFSTR("VTTile"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v7, v5);

  -[PLOperator logEntry:](self, "logEntry:", v6);
}

- (void)logEventIntervalGroupSession:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = *MEMORY[0x1E0D80380];
  v5 = a3;
  +[PLOperator entryKeyForType:andName:](PLVideoAgent, "entryKeyForType:andName:", v4, CFSTR("GroupSession"));
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v14, v5);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntryDate:", v8);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertFromSystemToMonotonic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("timestampEnd"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("BundleID"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("timestampEnd"));

  }
  -[PLOperator logEntry:](self, "logEntry:", v6);

}

+ (id)stateEnumForStateString:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_1ED883580;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_1ED883580, &__block_literal_global_31);
  objc_msgSend((id)qword_1ED883578, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __40__PLVideoAgent_stateEnumForStateString___block_invoke()
{
  void *v0;

  v0 = (void *)qword_1ED883578;
  qword_1ED883578 = (uint64_t)&unk_1E864C7D8;

}

- (PLXPCListenerOperatorComposition)notification
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PLXPCListenerOperatorComposition)cMFileListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCMFileListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLXPCListenerOperatorComposition)cMHlsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCMHlsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLXPCListenerOperatorComposition)cMCrabsListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCMCrabsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLXPCListenerOperatorComposition)vTSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setVTSessionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLXPCListenerOperatorComposition)vTTileListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setVTTileListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (PLXPCListenerOperatorComposition)groupSessionListener
{
  return (PLXPCListenerOperatorComposition *)objc_getProperty(self, a2, 96, 1);
}

- (void)setGroupSessionListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupSessionListener, 0);
  objc_storeStrong((id *)&self->_vTTileListener, 0);
  objc_storeStrong((id *)&self->_vTSessionListener, 0);
  objc_storeStrong((id *)&self->_cMCrabsListener, 0);
  objc_storeStrong((id *)&self->_cMHlsListener, 0);
  objc_storeStrong((id *)&self->_cMFileListener, 0);
  objc_storeStrong((id *)&self->_notification, 0);
}

@end
