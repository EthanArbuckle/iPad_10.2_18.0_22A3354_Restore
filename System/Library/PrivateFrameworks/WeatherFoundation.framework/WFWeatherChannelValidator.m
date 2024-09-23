@implementation WFWeatherChannelValidator

+ (id)expectedStructure
{
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
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[2];
  _QWORD v131[2];
  const __CFString *v132;
  void *v133;
  const __CFString *v134;
  void *v135;
  _QWORD v136[18];
  _QWORD v137[18];
  const __CFString *v138;
  void *v139;
  const __CFString *v140;
  void *v141;
  _QWORD v142[20];
  _QWORD v143[20];
  _QWORD v144[2];
  _QWORD v145[2];
  _QWORD v146[2];
  _QWORD v147[2];
  _QWORD v148[13];
  _QWORD v149[13];
  void *v150;
  _QWORD v151[2];
  _QWORD v152[2];
  _QWORD v153[20];
  _QWORD v154[20];
  void *v155;
  _QWORD v156[2];
  _QWORD v157[2];
  _QWORD v158[16];
  _QWORD v159[16];
  _QWORD v160[2];
  _QWORD v161[2];
  _QWORD v162[5];
  _QWORD v163[5];
  _QWORD v164[5];
  _QWORD v165[5];
  _QWORD v166[9];
  _QWORD v167[9];
  _QWORD v168[3];
  _QWORD v169[5];

  v169[3] = *MEMORY[0x24BDAC8D0];
  v168[0] = CFSTR("version");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v169[0] = v2;
  v168[1] = CFSTR("transaction_id");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v169[1] = v3;
  v168[2] = CFSTR("expire_time_gmt");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v169[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v169, v168, 3);
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  v166[0] = CFSTR("vis");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v167[0] = v5;
  v166[1] = CFSTR("temp");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v167[1] = v6;
  v166[2] = CFSTR("max_temp");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v167[2] = v7;
  v166[3] = CFSTR("min_temp");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v167[3] = v8;
  v166[4] = CFSTR("feels_like");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v167[4] = v9;
  v166[5] = CFSTR("dewpt");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v167[5] = v10;
  v166[6] = CFSTR("pressure");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v167[6] = v11;
  v166[7] = CFSTR("wspd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v167[7] = v12;
  v166[8] = CFSTR("gust");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v167[8] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v167, v166, 9);
  v127 = (void *)objc_claimAutoreleasedReturnValue();

  v164[0] = CFSTR("vis");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v165[0] = v14;
  v164[1] = CFSTR("dewpt");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v165[1] = v15;
  v164[2] = CFSTR("gust");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v165[2] = v16;
  v164[3] = CFSTR("temp");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v165[3] = v17;
  v164[4] = CFSTR("wspd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v165[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v165, v164, 5);
  v126 = (void *)objc_claimAutoreleasedReturnValue();

  v162[0] = CFSTR("conditionsshort");
  v160[0] = CFSTR("observation");
  v158[0] = CFSTR("class");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v159[0] = v124;
  v158[1] = CFSTR("obs_id");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  v159[1] = v123;
  v158[2] = CFSTR("obs_name");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v159[2] = v122;
  v158[3] = CFSTR("valid_time_gmt");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  v159[3] = v121;
  v158[4] = CFSTR("wx_icon");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v159[4] = v120;
  v158[5] = CFSTR("wx_phrase");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v159[5] = v119;
  v158[6] = CFSTR("rh");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  v159[6] = v118;
  v158[7] = CFSTR("pressure_desc");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v159[7] = v117;
  v158[8] = CFSTR("pressure_tend");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v159[8] = v116;
  v158[9] = CFSTR("wdir");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v159[9] = v115;
  v158[10] = CFSTR("wdir_cardinal");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v159[10] = v114;
  v158[11] = CFSTR("uv_index");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v159[11] = v113;
  v158[12] = CFSTR("uv_desc");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v159[12] = v112;
  v158[13] = CFSTR("qualifier");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v159[13] = v111;
  v159[14] = v127;
  v158[14] = CFSTR("imperial");
  v158[15] = CFSTR("metric");
  v159[15] = v127;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v159, v158, 16);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v160[1] = CFSTR("metadata");
  v161[0] = v110;
  v161[1] = v125;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v161, v160, 2);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v163[0] = v109;
  v162[1] = CFSTR("fcsthourly24short");
  v156[0] = CFSTR("forecasts");
  v153[0] = CFSTR("class");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v108;
  v153[1] = CFSTR("phrase_22char");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v154[1] = v107;
  v153[2] = CFSTR("precip_type");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v154[2] = v106;
  v153[3] = CFSTR("fcst_valid_local");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  v154[3] = v105;
  v153[4] = CFSTR("fcst_valid");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v154[4] = v104;
  v153[5] = CFSTR("rh");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v154[5] = v103;
  v153[6] = CFSTR("icon_extd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v154[6] = v102;
  v153[7] = CFSTR("wdir");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v154[7] = v101;
  v153[8] = CFSTR("wdir_cardinal");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v154[8] = v100;
  v153[9] = CFSTR("num");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v154[9] = v99;
  v153[10] = CFSTR("phrase_32char");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v154[10] = v98;
  v153[11] = CFSTR("dow");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v154[11] = v97;
  v153[12] = CFSTR("icon_cd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v154[12] = v96;
  v153[13] = CFSTR("uv_desc");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v154[13] = v95;
  v153[14] = CFSTR("uv_index");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v154[14] = v94;
  v153[15] = CFSTR("day_ind");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v154[15] = v93;
  v153[16] = CFSTR("phrase_12char");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v154[16] = v92;
  v153[17] = CFSTR("pop");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v154[17] = v91;
  v154[18] = v126;
  v153[18] = CFSTR("imperial");
  v153[19] = CFSTR("metric");
  v154[19] = v126;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v154, v153, 20);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = v90;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v155, 1);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v156[1] = CFSTR("metadata");
  v157[0] = v89;
  v157[1] = v125;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v157, v156, 2);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v163[1] = v88;
  v162[2] = CFSTR("fcstdaily10short");
  v151[0] = CFSTR("forecasts");
  v148[0] = CFSTR("class");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  v149[0] = v87;
  v148[1] = CFSTR("num");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v149[1] = v86;
  v148[2] = CFSTR("moonrise");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v149[2] = v85;
  v148[3] = CFSTR("fcst_valid_local");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v149[3] = v84;
  v148[4] = CFSTR("fcst_valid");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v149[4] = v83;
  v148[5] = CFSTR("sunrise");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v149[5] = v82;
  v148[6] = CFSTR("dow");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v149[6] = v81;
  v148[7] = CFSTR("sunset");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v149[7] = v80;
  v148[8] = CFSTR("moonset");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v149[8] = v79;
  v148[9] = CFSTR("imperial");
  v146[0] = CFSTR("max_temp");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  v147[0] = v78;
  v146[1] = CFSTR("min_temp");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v147[1] = v77;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v147, v146, 2);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v149[9] = v76;
  v148[10] = CFSTR("metric");
  v144[0] = CFSTR("max_temp");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v145[0] = v75;
  v144[1] = CFSTR("min_temp");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v145[1] = v74;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v145, v144, 2);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v149[10] = v73;
  v148[11] = CFSTR("day");
  v142[0] = CFSTR("fcst_valid_local");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v143[0] = v72;
  v142[1] = CFSTR("rh");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v143[1] = v71;
  v142[2] = CFSTR("icon_extd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v143[2] = v70;
  v142[3] = CFSTR("wdir");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v143[3] = v69;
  v142[4] = CFSTR("wdir_cardinal");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v143[4] = v68;
  v142[5] = CFSTR("num");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v143[5] = v67;
  v142[6] = CFSTR("daypart_name");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v143[6] = v66;
  v142[7] = CFSTR("icon_cd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v143[7] = v65;
  v142[8] = CFSTR("alt_daypart_name");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v143[8] = v64;
  v142[9] = CFSTR("phrase_12char");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v143[9] = v63;
  v142[10] = CFSTR("pop");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v143[10] = v62;
  v142[11] = CFSTR("phrase_22char");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v143[11] = v61;
  v142[12] = CFSTR("precip_type");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v143[12] = v60;
  v142[13] = CFSTR("fcst_valid");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v143[13] = v59;
  v142[14] = CFSTR("long_daypart_name");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v143[14] = v58;
  v142[15] = CFSTR("phrase_32char");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v143[15] = v57;
  v142[16] = CFSTR("uv_desc");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v143[16] = v56;
  v142[17] = CFSTR("uv_index");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v143[17] = v55;
  v142[18] = CFSTR("imperial");
  v140 = CFSTR("wspd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = v54;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v143[18] = v53;
  v142[19] = CFSTR("metric");
  v138 = CFSTR("wspd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = v52;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v143[19] = v51;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v143, v142, 20);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v149[11] = v50;
  v148[12] = CFSTR("night");
  v136[0] = CFSTR("fcst_valid_local");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v137[0] = v49;
  v136[1] = CFSTR("rh");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v137[1] = v48;
  v136[2] = CFSTR("icon_extd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v137[2] = v47;
  v136[3] = CFSTR("wdir");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v137[3] = v46;
  v136[4] = CFSTR("wdir_cardinal");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v137[4] = v45;
  v136[5] = CFSTR("num");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v137[5] = v44;
  v136[6] = CFSTR("daypart_name");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v137[6] = v43;
  v136[7] = CFSTR("icon_cd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v137[7] = v42;
  v136[8] = CFSTR("alt_daypart_name");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v137[8] = v41;
  v136[9] = CFSTR("phrase_12char");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v137[9] = v40;
  v136[10] = CFSTR("pop");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v137[10] = v39;
  v136[11] = CFSTR("phrase_22char");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v137[11] = v38;
  v136[12] = CFSTR("precip_type");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v137[12] = v37;
  v136[13] = CFSTR("fcst_valid");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v137[13] = v36;
  v136[14] = CFSTR("long_daypart_name");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v137[14] = v35;
  v136[15] = CFSTR("phrase_32char");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v137[15] = v34;
  v136[16] = CFSTR("imperial");
  v134 = CFSTR("wspd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v135 = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v137[16] = v32;
  v136[17] = CFSTR("metric");
  v132 = CFSTR("wspd");
  +[WFJSONStructureLeafNode optionalLeafNode](WFJSONStructureLeafNode, "optionalLeafNode");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v31;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v137[17] = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v137, v136, 18);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v149[12] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v149, v148, 13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = v28;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v150, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v151[1] = CFSTR("metadata");
  v152[0] = v19;
  v152[1] = v125;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v152, v151, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v163[2] = v20;
  v162[3] = CFSTR("nowlinks");
  v130[0] = CFSTR("links");
  v128[0] = CFSTR("ios");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v21;
  v128[1] = CFSTR("web");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v129[1] = v22;
  v128[2] = CFSTR("mobile");
  +[WFJSONStructureLeafNode requiredLeafNode](WFJSONStructureLeafNode, "requiredLeafNode");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v129[2] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, v128, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v130[1] = CFSTR("metadata");
  v131[0] = v24;
  v131[1] = v125;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v131, v130, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v162[4] = CFSTR("metadata");
  v163[3] = v25;
  v163[4] = v125;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v163, v162, 5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (BOOL)isLeafNodeType:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_opt_class();
    v4 = objc_opt_isKindOfClass() ^ 1;
  }

  return v4 & 1;
}

- (BOOL)validateResponseData:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  uint64_t v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[WFWeatherChannelValidator expectedStructure](WFWeatherChannelValidator, "expectedStructure");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFWeatherChannelValidator validateDictionary:expectedStructure:](self, "validateDictionary:expectedStructure:", v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)validateDictionary:(id)a3 expectedStructure:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  BOOL v31;
  BOOL v32;
  id v33;
  uint64_t v34;
  void *v35;
  char v36;
  char v37;
  BOOL v38;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDBCF20];
  v12 = v6;
  objc_msgSend(v6, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "isSubsetOfSet:", v14);

  if (!v15)
  {
    v38 = 0;
    goto LABEL_39;
  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v7, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (!v43)
  {
    v38 = 1;
    goto LABEL_38;
  }
  v17 = *(_QWORD *)v49;
  v40 = v7;
  v41 = v12;
  v42 = *(_QWORD *)v49;
  while (2)
  {
    for (i = 0; i != v43; ++i)
    {
      if (*(_QWORD *)v49 != v17)
        objc_enumerationMutation(v16);
      v19 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
      objc_msgSend(v12, "objectForKey:", v19, v40, v41);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_36;
        v22 = -[WFWeatherChannelValidator validateDictionary:expectedStructure:](self, "validateDictionary:expectedStructure:", v20, v21);

        if (!v22)
          goto LABEL_37;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_36;
          v23 = v16;
          v24 = v20;
          objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v47 = 0u;
          v26 = v24;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          if (!v27)
          {

            v17 = v42;
LABEL_28:

            continue;
          }
          v28 = v27;
          v29 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v28; ++j)
            {
              if (*(_QWORD *)v45 != v29)
                objc_enumerationMutation(v26);
              v31 = -[WFWeatherChannelValidator validateDictionary:expectedStructure:](self, "validateDictionary:expectedStructure:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j), v25);
            }
            v32 = v31;
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
          }
          while (v28);

          v7 = v40;
          v12 = v41;
          v16 = v23;
          v17 = v42;
          if (!v32)
            goto LABEL_37;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_28;
          v33 = v21;
          if (objc_msgSend(v33, "isRequired"))
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v34 = objc_claimAutoreleasedReturnValue();
            if (v20 == (void *)v34)
            {

LABEL_36:
LABEL_37:
              v38 = 0;
              goto LABEL_38;
            }
            v35 = (void *)v34;
            v36 = objc_msgSend((id)objc_opt_class(), "isLeafNodeType:", v20);

            if ((v36 & 1) == 0)
              goto LABEL_37;
          }
          else
          {
            v37 = objc_msgSend((id)objc_opt_class(), "isLeafNodeType:", v20);

            if ((v37 & 1) == 0)
              goto LABEL_37;
          }
        }
      }
    }
    v38 = 1;
    v43 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v43)
      continue;
    break;
  }
LABEL_38:

LABEL_39:
  return v38;
}

@end
