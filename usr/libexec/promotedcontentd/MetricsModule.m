@implementation MetricsModule

+ (void)rotateIdentifiers
{
  _objc_msgSend((id)qword_100269AC8, "rotateIDAccount");
}

+ (APMetricReceiving)storage
{
  return (APMetricReceiving *)(id)qword_100269AC8;
}

+ (void)_setupDefaultRoutes
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
  objc_class *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  void *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  id v47;
  uint64_t v48;
  NSObject *v49;
  void *v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  id v55;
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
  uint8_t buf[4];
  void *v91;
  __int16 v92;
  id v93;
  const __CFString *v94;
  _UNKNOWN **v95;
  const __CFString *v96;
  void *v97;
  _QWORD v98[4];
  _QWORD v99[4];
  const __CFString *v100;
  _UNKNOWN **v101;
  const __CFString *v102;
  _UNKNOWN **v103;
  const __CFString *v104;
  _UNKNOWN **v105;
  _QWORD v106[3];
  _QWORD v107[3];
  _QWORD v108[4];
  _QWORD v109[4];
  const __CFString *v110;
  _UNKNOWN **v111;
  const __CFString *v112;
  void *v113;
  _QWORD v114[3];
  _QWORD v115[3];
  const __CFString *v116;
  _UNKNOWN **v117;
  const __CFString *v118;
  void *v119;
  _QWORD v120[3];
  _QWORD v121[3];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[2];
  _QWORD v127[2];
  _QWORD v128[3];
  _QWORD v129[3];
  _QWORD v130[4];
  _QWORD v131[4];
  const __CFString *v132;
  _UNKNOWN **v133;
  const __CFString *v134;
  _UNKNOWN **v135;
  const __CFString *v136;
  _UNKNOWN **v137;
  const __CFString *v138;
  _UNKNOWN **v139;
  const __CFString *v140;
  _UNKNOWN **v141;
  const __CFString *v142;
  _UNKNOWN **v143;
  const __CFString *v144;
  _UNKNOWN **v145;
  const __CFString *v146;
  _UNKNOWN **v147;
  const __CFString *v148;
  _UNKNOWN **v149;
  const __CFString *v150;
  _UNKNOWN **v151;
  const __CFString *v152;
  _UNKNOWN **v153;
  const __CFString *v154;
  _UNKNOWN **v155;
  const __CFString *v156;
  _UNKNOWN **v157;
  const __CFString *v158;
  _UNKNOWN **v159;
  const __CFString *v160;
  _UNKNOWN **v161;
  const __CFString *v162;
  _UNKNOWN **v163;
  const __CFString *v164;
  _UNKNOWN **v165;
  const __CFString *v166;
  _UNKNOWN **v167;
  const __CFString *v168;
  _UNKNOWN **v169;
  const __CFString *v170;
  _UNKNOWN **v171;
  const __CFString *v172;
  _UNKNOWN **v173;
  const __CFString *v174;
  _UNKNOWN **v175;
  const __CFString *v176;
  _UNKNOWN **v177;
  const __CFString *v178;
  _UNKNOWN **v179;
  const __CFString *v180;
  _UNKNOWN **v181;
  const __CFString *v182;
  _UNKNOWN **v183;
  const __CFString *v184;
  _UNKNOWN **v185;
  const __CFString *v186;
  _UNKNOWN **v187;
  const __CFString *v188;
  _UNKNOWN **v189;
  const __CFString *v190;
  _UNKNOWN **v191;
  const __CFString *v192;
  _UNKNOWN **v193;
  const __CFString *v194;
  _UNKNOWN **v195;
  const __CFString *v196;
  _UNKNOWN **v197;
  const __CFString *v198;
  _UNKNOWN **v199;
  const __CFString *v200;
  _UNKNOWN **v201;
  const __CFString *v202;
  _UNKNOWN **v203;
  const __CFString *v204;
  _UNKNOWN **v205;
  _QWORD v206[37];
  _QWORD v207[37];
  _QWORD v208[4];
  _QWORD v209[4];

  v208[0] = CFSTR("name");
  v208[1] = CFSTR("purpose");
  v209[0] = CFSTR("EC");
  v209[1] = &off_100229B88;
  v209[2] = CFSTR("ECRouter");
  v208[2] = CFSTR("dest");
  v208[3] = CFSTR("metrics");
  v206[0] = CFSTR("received");
  v204 = CFSTR("value");
  v205 = &off_100229BA0;
  v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v205, &v204, 1));
  v207[0] = v87;
  v206[1] = CFSTR("daemon_discarded");
  v202 = CFSTR("value");
  v203 = &off_100229BB8;
  v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v203, &v202, 1));
  v207[1] = v85;
  v206[2] = CFSTR("conversion");
  v200 = CFSTR("value");
  v201 = &off_100229BD0;
  v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v201, &v200, 1));
  v207[2] = v83;
  v206[3] = CFSTR("downloaded");
  v198 = CFSTR("value");
  v199 = &off_100229BE8;
  v82 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v199, &v198, 1));
  v207[3] = v82;
  v206[4] = CFSTR("request_failed");
  v196 = CFSTR("value");
  v197 = &off_100229C00;
  v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v197, &v196, 1));
  v207[4] = v81;
  v206[5] = CFSTR("delivered");
  v194 = CFSTR("value");
  v195 = &off_100229C18;
  v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v195, &v194, 1));
  v207[5] = v80;
  v206[6] = CFSTR("discarded");
  v192 = CFSTR("value");
  v193 = &off_100229C30;
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v193, &v192, 1));
  v207[6] = v79;
  v206[7] = CFSTR("not_consumed");
  v190 = CFSTR("value");
  v191 = &off_100229C48;
  v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v191, &v190, 1));
  v207[7] = v78;
  v206[8] = CFSTR("unused");
  v188 = CFSTR("value");
  v189 = &off_100229C60;
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1));
  v207[8] = v77;
  v206[9] = CFSTR("created");
  v186 = CFSTR("value");
  v187 = &off_100229C78;
  v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v187, &v186, 1));
  v207[9] = v76;
  v206[10] = CFSTR("replaced");
  v184 = CFSTR("value");
  v185 = &off_100229C90;
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v185, &v184, 1));
  v207[10] = v75;
  v206[11] = CFSTR("loaded");
  v182 = CFSTR("value");
  v183 = &off_100229CA8;
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v183, &v182, 1));
  v207[11] = v74;
  v206[12] = CFSTR("placed");
  v180 = CFSTR("value");
  v181 = &off_100229CC0;
  v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v181, &v180, 1));
  v207[12] = v73;
  v206[13] = CFSTR("ready");
  v178 = CFSTR("value");
  v179 = &off_100229CD8;
  v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1));
  v207[13] = v72;
  v206[14] = CFSTR("on_screen");
  v176 = CFSTR("value");
  v177 = &off_100229CF0;
  v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v177, &v176, 1));
  v207[14] = v71;
  v206[15] = CFSTR("visible");
  v174 = CFSTR("value");
  v175 = &off_100229D08;
  v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v175, &v174, 1));
  v207[15] = v70;
  v206[16] = CFSTR("off_screen");
  v172 = CFSTR("value");
  v173 = &off_100229D20;
  v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v173, &v172, 1));
  v207[16] = v69;
  v206[17] = CFSTR("interacted");
  v170 = CFSTR("value");
  v171 = &off_100229D38;
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v171, &v170, 1));
  v207[17] = v68;
  v206[18] = CFSTR("quick_return");
  v168 = CFSTR("value");
  v169 = &off_100229D50;
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v169, &v168, 1));
  v207[18] = v67;
  v206[19] = CFSTR("ad_marker_interacted");
  v166 = CFSTR("value");
  v167 = &off_100229D68;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v167, &v166, 1));
  v207[19] = v66;
  v206[20] = CFSTR("get_app");
  v164 = CFSTR("value");
  v165 = &off_100229D80;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v165, &v164, 1));
  v207[20] = v65;
  v206[21] = CFSTR("unloaded");
  v162 = CFSTR("value");
  v163 = &off_100229D98;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v163, &v162, 1));
  v207[21] = v64;
  v206[22] = CFSTR("media_loaded");
  v160 = CFSTR("value");
  v161 = &off_100229DB0;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v161, &v160, 1));
  v207[22] = v63;
  v206[23] = CFSTR("video_chosen");
  v158 = CFSTR("value");
  v159 = &off_100229DC8;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1));
  v207[23] = v62;
  v206[24] = CFSTR("media_played");
  v156 = CFSTR("value");
  v157 = &off_100229DE0;
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1));
  v207[24] = v61;
  v206[25] = CFSTR("media_paused");
  v154 = CFSTR("value");
  v155 = &off_100229DF8;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1));
  v207[25] = v60;
  v206[26] = CFSTR("media_skipped");
  v152 = CFSTR("value");
  v153 = &off_100229E10;
  v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1));
  v207[26] = v59;
  v206[27] = CFSTR("media_volume_changed");
  v150 = CFSTR("value");
  v151 = &off_100229E28;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1));
  v207[27] = v58;
  v206[28] = CFSTR("media_expanded");
  v148 = CFSTR("value");
  v149 = &off_100229E40;
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1));
  v207[28] = v57;
  v206[29] = CFSTR("media_contracted");
  v146 = CFSTR("value");
  v147 = &off_100229E58;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1));
  v207[29] = v56;
  v206[30] = CFSTR("media_show_controls");
  v144 = CFSTR("value");
  v145 = &off_100229E70;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1));
  v207[30] = v2;
  v206[31] = CFSTR("media_progress");
  v142 = CFSTR("value");
  v143 = &off_100229E88;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1));
  v207[31] = v3;
  v206[32] = CFSTR("served");
  v140 = CFSTR("value");
  v141 = &off_100229EA0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
  v207[32] = v4;
  v206[33] = CFSTR("impressed");
  v138 = CFSTR("value");
  v139 = &off_100229EB8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1));
  v207[33] = v5;
  v206[34] = CFSTR("missed_opportunity");
  v136 = CFSTR("value");
  v137 = &off_100229ED0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v137, &v136, 1));
  v207[34] = v6;
  v206[35] = CFSTR("confirmed_interaction");
  v134 = CFSTR("value");
  v135 = &off_100229EE8;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v135, &v134, 1));
  v207[35] = v7;
  v206[36] = CFSTR("commerce_added_to_account");
  v132 = CFSTR("value");
  v133 = &off_100229F00;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v133, &v132, 1));
  v207[36] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v207, v206, 37));
  v209[3] = v9;
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v209, v208, 4));

  v130[0] = CFSTR("name");
  v130[1] = CFSTR("purpose");
  v131[0] = CFSTR("Diagnostic");
  v131[1] = &off_100229F18;
  v131[2] = CFSTR("ECRouter");
  v130[2] = CFSTR("dest");
  v130[3] = CFSTR("metrics");
  v128[0] = CFSTR("load_failed");
  v126[0] = CFSTR("value");
  v126[1] = CFSTR("dnu");
  v127[0] = &off_100229F30;
  v127[1] = &__kCFBooleanTrue;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v127, v126, 2));
  v129[0] = v10;
  v128[1] = CFSTR("template_metric");
  v124[0] = CFSTR("value");
  v124[1] = CFSTR("dnu");
  v125[0] = &off_100229F48;
  v125[1] = &__kCFBooleanTrue;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v125, v124, 2));
  v129[1] = v11;
  v128[2] = CFSTR("media_playback_failed");
  v122[0] = CFSTR("value");
  v122[1] = CFSTR("dnu");
  v123[0] = &off_100229F60;
  v123[1] = &__kCFBooleanTrue;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v123, v122, 2));
  v129[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v129, v128, 3));
  v131[3] = v13;
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v131, v130, 4));

  v120[0] = CFSTR("name");
  v120[1] = CFSTR("purpose");
  v121[0] = CFSTR("Internal");
  v121[1] = &off_100229F78;
  v120[2] = CFSTR("metrics");
  v118 = CFSTR("rate_limit_ad_requests");
  v116 = CFSTR("value");
  v117 = &off_100229F90;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1));
  v119 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1));
  v121[2] = v15;
  v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v121, v120, 3));

  v114[0] = CFSTR("name");
  v114[1] = CFSTR("purpose");
  v115[0] = CFSTR("Internal");
  v115[1] = &off_100229FA8;
  v114[2] = CFSTR("metrics");
  v112 = CFSTR("validation_failed");
  v110 = CFSTR("value");
  v111 = &off_100229FC0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1));
  v113 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v113, &v112, 1));
  v115[2] = v17;
  v84 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v115, v114, 3));

  v108[0] = CFSTR("name");
  v108[1] = CFSTR("purpose");
  v109[0] = CFSTR("EC");
  v109[1] = &off_100229FD8;
  v109[2] = CFSTR("ECRouter");
  v108[2] = CFSTR("dest");
  v108[3] = CFSTR("metrics");
  v104 = CFSTR("value");
  v105 = &off_100229FF0;
  v106[0] = CFSTR("communication_errors_report");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v105, &v104, 1));
  v107[0] = v18;
  v106[1] = CFSTR("hourly_report");
  v102 = CFSTR("value");
  v103 = &off_10022A008;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v103, &v102, 1));
  v107[1] = v19;
  v106[2] = CFSTR("daily_report");
  v100 = CFSTR("value");
  v101 = &off_10022A020;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1));
  v107[2] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v107, v106, 3));
  v109[3] = v21;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v109, v108, 4));

  v98[0] = CFSTR("name");
  v98[1] = CFSTR("purpose");
  v99[0] = CFSTR("Report");
  v99[1] = &off_10022A038;
  v99[2] = CFSTR("ECRouter");
  v98[2] = CFSTR("dest");
  v98[3] = CFSTR("metrics");
  v94 = CFSTR("value");
  v95 = &off_10022A050;
  v96 = CFSTR("integrity_report");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1));
  v97 = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1));
  v99[3] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v99, v98, 4));

  v26 = +[MetricsModuleClasses purposeClass](MetricsModuleClasses, "purposeClass");
  v27 = objc_msgSend([v26 alloc], "initWithPurposeDefinition:", v89);
  v28 = objc_msgSend([v26 alloc], "initWithPurposeDefinition:", v88);
  v29 = objc_msgSend([v26 alloc], "initWithPurposeDefinition:", v86);
  v30 = objc_msgSend([v26 alloc], "initWithPurposeDefinition:", v84);
  v31 = objc_msgSend([v26 alloc], "initWithPurposeDefinition:", v22);
  v32 = objc_msgSend([v26 alloc], "initWithPurposeDefinition:", v25);
  v33 = APLogForCategory(29);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
    *(_DWORD *)buf = 138543618;
    v91 = v35;
    v92 = 2050;
    v93 = objc_msgSend(v27, "purpose");
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);

  }
  v36 = APLogForCategory(29);
  v37 = objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "name"));
    v39 = objc_msgSend(v28, "purpose");
    *(_DWORD *)buf = 138543618;
    v91 = v38;
    v92 = 2050;
    v93 = v39;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);

  }
  v40 = APLogForCategory(29);
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "name"));
    v43 = objc_msgSend(v29, "purpose");
    *(_DWORD *)buf = 138543618;
    v91 = v42;
    v92 = 2050;
    v93 = v43;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);

  }
  v44 = APLogForCategory(29);
  v45 = objc_claimAutoreleasedReturnValue(v44);
  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "name"));
    v47 = objc_msgSend(v30, "purpose");
    *(_DWORD *)buf = 138543618;
    v91 = v46;
    v92 = 2050;
    v93 = v47;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);

  }
  v48 = APLogForCategory(29);
  v49 = objc_claimAutoreleasedReturnValue(v48);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "name"));
    v51 = objc_msgSend(v31, "purpose");
    *(_DWORD *)buf = 138543618;
    v91 = v50;
    v92 = 2050;
    v93 = v51;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);

  }
  v52 = APLogForCategory(29);
  v53 = objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "name"));
    v55 = objc_msgSend(v32, "purpose");
    *(_DWORD *)buf = 138543618;
    v91 = v54;
    v92 = 2050;
    v93 = v55;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "Registered purpose %{public}@ (%{public}ld)!", buf, 0x16u);

  }
}

+ (void)setup
{
  id v2;
  void *v3;
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012B594;
  block[3] = &unk_100215C20;
  block[4] = a1;
  if (qword_100269AE0 != -1)
    dispatch_once(&qword_100269AE0, block);
  if (!qword_100269AC8)
  {
    v2 = objc_alloc_init(+[MetricsModuleClasses storageClass](MetricsModuleClasses, "storageClass"));
    v3 = (void *)qword_100269AC8;
    qword_100269AC8 = (uint64_t)v2;

    objc_msgSend((id)qword_100269AC8, "setup");
  }
}

+ (void)start
{
  void *v2;
  unsigned __int8 v3;
  APMetricListener *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "isRunningTests");

  if ((v3 & 1) == 0 && !qword_100269AD0)
  {
    v4 = objc_alloc_init(APMetricListener);
    v5 = (void *)qword_100269AD0;
    qword_100269AD0 = (uint64_t)v4;

  }
}

+ (void)clearStorage
{
  void *v2;
  unsigned int v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "isRunningTests");

  if (v3)
  {
    v4 = (void *)qword_100269AC8;
    qword_100269AC8 = 0;

  }
}

@end
