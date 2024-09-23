@implementation PXAnimationTracker

+ (void)scrollAnimationDidBegin:(int64_t)a3
{
  objc_msgSend(a1, "_scrollAnimationOccurred:isBegin:", a3, 1);
}

+ (void)scrollAnimationDidEnd:(int64_t)a3
{
  objc_msgSend(a1, "_scrollAnimationOccurred:isBegin:", a3, 0);
}

+ (void)_scrollAnimationOccurred:(int64_t)a3 isBegin:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  os_signpost_type_t v12;
  __int16 v13;
  __int16 v14;
  uint8_t buf[2];
  __int16 v16;
  __int16 v17;
  __int16 v18;

  v4 = a4;
  if (a3 != 3)
  {
    if (a3 == 2)
    {
      PLAnimationTelemetryGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      v10 = os_signpost_enabled(v5);
      if (v4)
      {
        if (v10)
        {
          v16 = 0;
          v7 = "ScrollAlbums";
          v8 = (uint8_t *)&v16;
          goto LABEL_13;
        }
        goto LABEL_22;
      }
      if (!v10)
        goto LABEL_22;
      *(_WORD *)buf = 0;
      v7 = "ScrollAlbums";
      v8 = buf;
    }
    else
    {
      if (a3 != 1)
        return;
      PLAnimationTelemetryGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_signpost_enabled(v5);
      if (v4)
      {
        if (v6)
        {
          v18 = 0;
          v7 = "ScrollForYou";
          v8 = (uint8_t *)&v18;
LABEL_13:
          v11 = v5;
          v12 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_21:
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v11, v12, 0xEEEEB0B5B2B2EEEELL, v7, " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (!v6)
        goto LABEL_22;
      v17 = 0;
      v7 = "ScrollForYou";
      v8 = (uint8_t *)&v17;
    }
LABEL_20:
    v11 = v5;
    v12 = OS_SIGNPOST_INTERVAL_END;
    goto LABEL_21;
  }
  PLAnimationTelemetryGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v5);
  if (!v4)
  {
    if (!v9)
      goto LABEL_22;
    v13 = 0;
    v7 = "ScrollSearch";
    v8 = (uint8_t *)&v13;
    goto LABEL_20;
  }
  if (v9)
  {
    v14 = 0;
    v7 = "ScrollSearch";
    v8 = (uint8_t *)&v14;
    goto LABEL_13;
  }
LABEL_22:

}

+ (void)transitionPreparationDidBegin:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5
{
  objc_msgSend(a1, "_transitionPreparationOccurred:fromOrigin:transitionObject:isBegin:", a3, a4, a5, 1);
}

+ (void)_transitionPreparationOccurred:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5 isBegin:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  os_signpost_id_t v57;
  NSObject *v58;
  os_signpost_id_t v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  NSObject *v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  NSObject *v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  NSObject *v124;
  NSObject *v125;
  NSObject *v126;
  NSObject *v127;
  NSObject *v128;
  NSObject *v129;
  NSObject *v130;
  NSObject *v131;
  NSObject *v132;
  NSObject *v133;
  NSObject *v134;
  NSObject *v135;
  NSObject *v136;
  NSObject *v137;
  NSObject *v138;
  NSObject *v139;
  NSObject *v140;
  NSObject *v141;
  NSObject *v142;
  NSObject *v143;
  NSObject *v144;
  NSObject *v145;
  NSObject *v146;
  NSObject *v147;
  NSObject *v148;
  NSObject *v149;
  NSObject *v150;
  NSObject *v151;
  NSObject *v152;
  NSObject *v153;
  NSObject *v154;
  NSObject *v155;
  NSObject *v156;
  NSObject *v157;
  NSObject *v158;
  NSObject *v159;
  NSObject *v160;
  NSObject *v161;
  NSObject *v162;
  NSObject *v163;
  NSObject *v164;
  NSObject *v165;
  NSObject *v166;
  NSObject *v167;
  NSObject *v168;
  NSObject *v169;
  NSObject *v170;
  NSObject *v171;
  NSObject *v172;
  NSObject *v173;
  NSObject *v174;
  NSObject *v175;
  NSObject *v176;
  NSObject *v177;
  NSObject *v178;
  NSObject *v179;
  NSObject *v180;
  NSObject *v181;
  NSObject *v182;
  NSObject *v183;
  NSObject *v184;
  NSObject *v185;
  os_signpost_id_t v186;
  NSObject *v187;
  NSObject *v188;
  os_signpost_id_t v189;
  NSObject *v190;
  NSObject *v191;
  os_signpost_id_t v192;
  NSObject *v193;
  NSObject *v194;
  NSObject *v195;
  NSObject *v196;
  os_signpost_type_t v197;
  NSObject *v198;
  NSObject *v199;
  NSObject *v200;
  NSObject *v201;
  NSObject *v202;
  NSObject *v203;
  os_signpost_type_t v204;
  NSObject *v205;
  NSObject *v206;
  NSObject *v207;
  NSObject *v208;
  NSObject *v209;
  NSObject *v210;
  NSObject *v211;
  NSObject *v212;
  NSObject *v213;
  NSObject *v214;
  NSObject *v215;
  os_signpost_id_t v216;
  uint8_t v217[16];

  v6 = a6;
  v9 = a5;
  switch(a4)
  {
    case 0:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v11, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromUndefinedPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromUndefinedPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v64 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v64, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromUndefinedPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromUndefinedPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v65 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v65, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v66 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v66, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 1:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v14, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromMomentsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromMomentsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v67 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v67, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromMomentsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromMomentsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v68 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v68, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v69 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v69, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 2:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v15, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromCollectionsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromCollectionsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v70 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v70, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromCollectionsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromCollectionsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v71 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v71, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v72 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v72, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 3:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v16, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromYearsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromYearsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v73 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v73, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromYearsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromYearsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v74 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v74, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v75 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v75, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 4:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v17, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromRecentsAlbumPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromRecentsAlbumPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v76 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v76, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromRecentsAlbumPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromRecentsAlbumPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v77 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v77, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v78 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v78, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 5:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v18, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromFavoritesAlbumPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromFavoritesAlbumPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v79 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v79, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromFavoritesAlbumPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromFavoritesAlbumPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v80 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v80, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v81 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v81, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 6:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v19, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromSharedAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromSharedAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v82 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v82, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromSharedAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromSharedAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v83 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v83, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v84 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v84, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 7:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v22, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromPlacesAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromPlacesAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v85 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v85, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromPlacesAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromPlacesAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v86 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v86, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v87 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v87, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 8:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v23, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromMediaTypeAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromMediaTypeAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v88 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v88, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromMediaTypeAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromMediaTypeAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v89 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v89, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v90 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v90, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 9:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v24, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromUserAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromUserAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v91 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v91, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromUserAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromUserAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v92 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v92, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v93 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v93, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 10:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v25, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromImportsAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromImportsAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v94 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v94, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromImportsAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromImportsAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v95 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v95, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v96 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v96, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 11:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v26, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromHiddenAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromHiddenAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v97 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v97, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromHiddenAlbumPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromHiddenAlbumPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v98 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v98, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v99 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v99, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 12:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v27, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromRecentlyDeletedPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromRecentlyDeletedPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v100 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v100, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromRecentlyDeletedPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromRecentlyDeletedPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v101 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v101, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v102 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v102, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 13:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v28, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromSharedAlbumsActivityFeedPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromSharedAlbumsActivityFeedPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v103 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v103, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromSharedAlbumsActivityFeedPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromSharedAlbumsActivityFeedPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v104 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v104, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v105 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v105, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 14:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v29, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromForYouSharedAlbumsActivityPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromForYouSharedAlbumsActivityPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v106 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v106, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromForYouSharedAlbumsActivityPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromForYouSharedAlbumsActivityPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v107 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v107, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v108 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v108, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 15:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v30, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromForYouFeaturedSuggestionPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromForYouFeaturedSuggestionPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v109 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v109, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromForYouFeaturedSuggestionPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromForYouFeaturedSuggestionPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v110 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v110, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v111 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v111, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 16:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v31, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromForYouContentSyndicationPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromForYouContentSyndicationPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v112 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v112, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromForYouContentSyndicationPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromForYouContentSyndicationPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v113 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v113, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v114 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v114, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 17:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v32, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromCompleteMyMomentPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromCompleteMyMomentPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v115 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v115, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromCompleteMyMomentPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromCompleteMyMomentPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v116 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v116, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v117 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v117, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 18:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v33, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromMomentsDetailPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromMomentsDetailPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v118 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v118, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromMomentsDetailPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromMomentsDetailPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v119 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v119, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v120 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v120, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 19:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v34, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromMomentsDetailShowMorePreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromMomentsDetailShowMorePreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v121 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v121, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromMomentsDetailShowMorePreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromMomentsDetailShowMorePreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v122 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v122, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v123 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v123, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 20:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v35, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromCollectionsDetailPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromCollectionsDetailPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v124 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v124, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromCollectionsDetailPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromCollectionsDetailPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v125 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v125, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v126 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v126, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 21:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v36 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v36, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromCollectionsDetailShowMorePreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromCollectionsDetailShowMorePreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v127 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v127, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromCollectionsDetailShowMorePreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromCollectionsDetailShowMorePreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v128 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v128, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v129 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v129, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 22:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v37 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v37, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromYearsDetailPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromYearsDetailPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v130 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v130, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromYearsDetailPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromYearsDetailPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v131 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v131, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v132 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v132, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 23:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v38, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromYearsDetailShowMorePreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromYearsDetailShowMorePreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v133 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v133, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromYearsDetailShowMorePreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromYearsDetailShowMorePreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v134 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v134, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v135 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v135, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 24:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v39 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v39, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromMemoriesDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromMemoriesDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v136 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v136, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromMemoriesDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromMemoriesDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v137 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v137, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v138 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v138, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetailsPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetailsPreparation";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 25:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v40 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v40, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromMemoriesDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromMemoriesDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v139 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v139, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromMemoriesDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromMemoriesDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v140 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v140, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v141 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v141, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 26:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v41 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v41, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromRelatedDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromRelatedDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v142 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v142, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromRelatedDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromRelatedDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v143 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v143, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v144 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v144, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 27:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v42 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v42, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromRelatedDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromRelatedDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v145 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v145, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromRelatedDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromRelatedDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v146 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v146, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v147 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v147, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 28:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v43 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v43, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromPeopleDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromPeopleDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v148 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v148, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromPeopleDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromPeopleDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v149 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v149, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v150 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v150, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 29:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v44 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v44, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromPeopleDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromPeopleDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v151 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v151, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromPeopleDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromPeopleDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v152 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v152, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v153 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v153, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 30:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v45 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v45, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromUserAlbumDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromUserAlbumDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v154 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v154, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromUserAlbumDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromUserAlbumDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v155 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v155, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v156 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v156, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 31:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v46 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v46, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromUserAlbumDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromUserAlbumDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v157 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v157, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromUserAlbumDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromUserAlbumDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v158 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v158, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v159 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v159, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 32:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v62 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v62, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromPlacesDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromPlacesDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v211 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v211, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromPlacesDetailPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromPlacesDetailPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v206 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v206, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v207 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v207, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 33:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v47 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v47, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromPlacesDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromPlacesDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v160 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v160, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromPlacesDetailShowMorePreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromPlacesDetailShowMorePreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v161 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v161, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v162 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v162, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 34:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v48 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v48, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromSearchTopResultsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromSearchTopResultsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v163 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v163, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromSearchTopResultsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromSearchTopResultsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v164 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v164, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v165 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v165, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 35:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v63 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v63, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromSearchResultsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromSearchResultsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v208 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v208, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromSearchResultsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromSearchResultsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v209 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v209, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v210 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v210, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 37:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v49 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v49, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromCameraPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromCameraPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v166 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v166, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromCameraPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromCameraPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v167 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v167, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v168 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v168, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 38:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v50 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v50, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromNotificationPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromNotificationPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v169 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v169, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromNotificationPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromNotificationPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v170 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v170, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v171 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v171, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 39:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v51 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v51, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromCuratedLibraryDaysPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromCuratedLibraryDaysPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v172 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v172, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromCuratedLibraryDaysPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromCuratedLibraryDaysPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v173 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v173, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v174 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v174, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 40:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v52 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v52, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromAllPhotosOneColumnPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromAllPhotosOneColumnPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v175 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v175, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromAllPhotosOneColumnPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromAllPhotosOneColumnPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v176 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v176, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v177 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v177, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 41:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v53 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v53, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromAllPhotosThreeColumnsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromAllPhotosThreeColumnsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v178 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v178, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromAllPhotosThreeColumnsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromAllPhotosThreeColumnsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v179 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v179, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v180 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v180, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 42:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v54 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v54, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromAllPhotosFiveColumnsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromAllPhotosFiveColumnsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v181 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v181, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromAllPhotosFiveColumnsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromAllPhotosFiveColumnsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v182 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v182, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v183 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v183, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 43:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v55 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = os_signpost_id_make_with_pointer(v56, v9);

          if (v6)
          {
            if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
            {
              *(_WORD *)v217 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v57, "EnterOneUpFromAllPhotosOtherPreparation", " enableTelemetry=YES ", v217, 2u);
            }

            goto LABEL_210;
          }
          if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
          {
            *(_WORD *)v217 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v55, OS_SIGNPOST_INTERVAL_END, v57, "EnterOneUpFromAllPhotosOtherPreparation", " enableTelemetry=YES ", v217, 2u);
          }

          goto LABEL_915;
        case 2:
          PLAnimationTelemetryGetLog();
          v184 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v185 = objc_claimAutoreleasedReturnValue();
          v186 = os_signpost_id_make_with_pointer(v185, v9);

          if (v6)
          {
            if (v186 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v184))
            {
              *(_WORD *)v217 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v184, OS_SIGNPOST_INTERVAL_BEGIN, v186, "ExitOneUpFromAllPhotosOtherPreparation", " enableTelemetry=YES ", v217, 2u);
            }

            goto LABEL_729;
          }
          if (v186 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v184))
          {
            *(_WORD *)v217 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v184, OS_SIGNPOST_INTERVAL_END, v186, "ExitOneUpFromAllPhotosOtherPreparation", " enableTelemetry=YES ", v217, 2u);
          }

          goto LABEL_1291;
        case 3:
          PLAnimationTelemetryGetLog();
          v187 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v188 = objc_claimAutoreleasedReturnValue();
          v189 = os_signpost_id_make_with_pointer(v188, v9);

          if (v6)
          {
            if (v189 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v187))
            {
              *(_WORD *)v217 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v187, OS_SIGNPOST_INTERVAL_BEGIN, v189, "EnterDetailsPreparation", " enableTelemetry=YES ", v217, 2u);
            }

            goto LABEL_733;
          }
          if (v189 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v187))
          {
            *(_WORD *)v217 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v187, OS_SIGNPOST_INTERVAL_END, v189, "EnterDetailsPreparation", " enableTelemetry=YES ", v217, 2u);
          }

          goto LABEL_1298;
        case 4:
          PLAnimationTelemetryGetLog();
          v190 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v191 = objc_claimAutoreleasedReturnValue();
          v192 = os_signpost_id_make_with_pointer(v191, v9);

          if (v6)
          {
            if (v192 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v190))
            {
              *(_WORD *)v217 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v190, OS_SIGNPOST_INTERVAL_BEGIN, v192, "ExitDetailsPreparation", " enableTelemetry=YES ", v217, 2u);
            }

            goto LABEL_737;
          }
          if (v192 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v190))
          {
            *(_WORD *)v217 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v190, OS_SIGNPOST_INTERVAL_END, v192, "ExitDetailsPreparation", " enableTelemetry=YES ", v217, 2u);
          }

          break;
        default:
          goto LABEL_1355;
      }
LABEL_1305:
      PLAnimationTelemetryGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      PLAnimationTelemetryGetLog();
      v215 = objc_claimAutoreleasedReturnValue();
      v59 = os_signpost_id_make_with_pointer(v215, v9);

      if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
        goto LABEL_1354;
      *(_WORD *)v217 = 0;
      v13 = "ExitDetailsPreparation";
LABEL_1308:
      v196 = v10;
      v197 = OS_SIGNPOST_INTERVAL_END;
LABEL_1309:
      v216 = v59;
LABEL_1353:
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v196, v197, v216, v13, " enableTelemetry=YES ", v217, 2u);
      goto LABEL_1354;
    case 44:
      switch(a3)
      {
        case 1:
          if (v6)
          {
LABEL_210:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v58 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v58, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromDuplicatesAlbumPreparation";
              goto LABEL_740;
            }
          }
          else
          {
LABEL_915:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v212 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v212, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromDuplicatesAlbumPreparation";
              goto LABEL_1308;
            }
          }
          goto LABEL_1354;
        case 2:
          if (v6)
          {
LABEL_729:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v193 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v193, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromDuplicatesAlbumPreparation";
              goto LABEL_740;
            }
          }
          else
          {
LABEL_1291:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v213 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v213, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromDuplicatesAlbumPreparation";
              goto LABEL_1308;
            }
          }
          goto LABEL_1354;
        case 3:
          if (!v6)
          {
LABEL_1298:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v214 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v214, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_1308;
            }
            goto LABEL_1354;
          }
LABEL_733:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v194 = objc_claimAutoreleasedReturnValue();
          v59 = os_signpost_id_make_with_pointer(v194, v9);

          if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
            goto LABEL_1354;
          *(_WORD *)v217 = 0;
          v13 = "EnterDetailsPreparation";
LABEL_740:
          v196 = v10;
          v197 = OS_SIGNPOST_INTERVAL_BEGIN;
          break;
        case 4:
          if (!v6)
            goto LABEL_1305;
LABEL_737:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v195 = objc_claimAutoreleasedReturnValue();
          v59 = os_signpost_id_make_with_pointer(v195, v9);

          if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
            goto LABEL_1354;
          *(_WORD *)v217 = 0;
          v13 = "ExitDetailsPreparation";
          goto LABEL_740;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1309;
    case 45:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v60 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v60, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromSharedLibraryAlbumPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromSharedLibraryAlbumPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v198 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v198, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromSharedLibraryAlbumPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromSharedLibraryAlbumPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v199 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v199, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetailsPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v200 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v200, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 46:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v61 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v61, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromForYouSharedLibrarySharingSuggestionPreparation";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromForYouSharedLibrarySharingSuggestionPreparation";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v201 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v201, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromForYouSharedLibrarySharingSuggestionPreparation";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromForYouSharedLibrarySharingSuggestionPreparation";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v202 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v202, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetailsPreparation";
LABEL_761:
              v203 = v10;
              v204 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_1326:
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v203, v204, v20, v21, " enableTelemetry=YES ", v217, 2u);
              goto LABEL_1354;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetailsPreparation";
LABEL_1325:
            v203 = v10;
            v204 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_1326;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v205 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v205, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetailsPreparation";
LABEL_790:
              v196 = v10;
              v197 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_1352:
              v216 = v12;
              goto LABEL_1353;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetailsPreparation";
LABEL_1351:
            v196 = v10;
            v197 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_1352;
          }
LABEL_1354:

LABEL_1355:
          return;
        default:
          goto LABEL_1355;
      }
    default:
      goto LABEL_1355;
  }
}

+ (void)transitionAnimationDidBegin:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5
{
  id v8;

  v8 = a5;
  objc_msgSend(a1, "_transitionPreparationOccurred:fromOrigin:transitionObject:isBegin:", a3, a4, v8, 0);
  objc_msgSend(a1, "_transitionAnimationOccurred:fromOrigin:transitionObject:isBegin:", a3, a4, v8, 1);

}

+ (void)transitionAnimationDidEnd:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5
{
  objc_msgSend(a1, "_transitionAnimationOccurred:fromOrigin:transitionObject:isBegin:", a3, a4, a5, 0);
}

+ (void)_transitionAnimationOccurred:(int64_t)a3 fromOrigin:(int64_t)a4 transitionObject:(id)a5 isBegin:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  const char *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  os_signpost_id_t v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  NSObject *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  os_signpost_id_t v57;
  NSObject *v58;
  os_signpost_id_t v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  NSObject *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSObject *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  NSObject *v84;
  NSObject *v85;
  NSObject *v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  NSObject *v94;
  NSObject *v95;
  NSObject *v96;
  NSObject *v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  NSObject *v103;
  NSObject *v104;
  NSObject *v105;
  NSObject *v106;
  NSObject *v107;
  NSObject *v108;
  NSObject *v109;
  NSObject *v110;
  NSObject *v111;
  NSObject *v112;
  NSObject *v113;
  NSObject *v114;
  NSObject *v115;
  NSObject *v116;
  NSObject *v117;
  NSObject *v118;
  NSObject *v119;
  NSObject *v120;
  NSObject *v121;
  NSObject *v122;
  NSObject *v123;
  NSObject *v124;
  NSObject *v125;
  NSObject *v126;
  NSObject *v127;
  NSObject *v128;
  NSObject *v129;
  NSObject *v130;
  NSObject *v131;
  NSObject *v132;
  NSObject *v133;
  NSObject *v134;
  NSObject *v135;
  NSObject *v136;
  NSObject *v137;
  NSObject *v138;
  NSObject *v139;
  NSObject *v140;
  NSObject *v141;
  NSObject *v142;
  NSObject *v143;
  NSObject *v144;
  NSObject *v145;
  NSObject *v146;
  NSObject *v147;
  NSObject *v148;
  NSObject *v149;
  NSObject *v150;
  NSObject *v151;
  NSObject *v152;
  NSObject *v153;
  NSObject *v154;
  NSObject *v155;
  NSObject *v156;
  NSObject *v157;
  NSObject *v158;
  NSObject *v159;
  NSObject *v160;
  NSObject *v161;
  NSObject *v162;
  NSObject *v163;
  NSObject *v164;
  NSObject *v165;
  NSObject *v166;
  NSObject *v167;
  NSObject *v168;
  NSObject *v169;
  NSObject *v170;
  NSObject *v171;
  NSObject *v172;
  NSObject *v173;
  NSObject *v174;
  NSObject *v175;
  NSObject *v176;
  NSObject *v177;
  NSObject *v178;
  NSObject *v179;
  NSObject *v180;
  NSObject *v181;
  NSObject *v182;
  NSObject *v183;
  NSObject *v184;
  NSObject *v185;
  os_signpost_id_t v186;
  NSObject *v187;
  NSObject *v188;
  os_signpost_id_t v189;
  NSObject *v190;
  NSObject *v191;
  os_signpost_id_t v192;
  NSObject *v193;
  NSObject *v194;
  NSObject *v195;
  NSObject *v196;
  os_signpost_type_t v197;
  NSObject *v198;
  NSObject *v199;
  NSObject *v200;
  NSObject *v201;
  NSObject *v202;
  NSObject *v203;
  os_signpost_type_t v204;
  NSObject *v205;
  NSObject *v206;
  NSObject *v207;
  NSObject *v208;
  NSObject *v209;
  NSObject *v210;
  NSObject *v211;
  NSObject *v212;
  NSObject *v213;
  NSObject *v214;
  NSObject *v215;
  os_signpost_id_t v216;
  uint8_t v217[16];

  v6 = a6;
  v9 = a5;
  switch(a4)
  {
    case 0:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v11 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v11, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromUndefined";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromUndefined";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v64 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v64, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromUndefined";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromUndefined";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v65 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v65, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v66 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v66, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 1:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v14, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromMoments";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromMoments";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v67 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v67, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromMoments";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromMoments";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v68 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v68, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v69 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v69, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 2:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v15 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v15, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromCollections";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromCollections";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v70 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v70, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromCollections";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromCollections";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v71 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v71, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v72 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v72, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 3:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v16, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromYears";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromYears";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v73 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v73, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromYears";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromYears";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v74 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v74, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v75 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v75, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 4:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v17, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromRecentsAlbum";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromRecentsAlbum";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v76 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v76, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromRecentsAlbum";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromRecentsAlbum";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v77 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v77, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v78 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v78, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 5:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v18, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromFavoritesAlbum";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromFavoritesAlbum";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v79 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v79, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromFavoritesAlbum";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromFavoritesAlbum";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v80 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v80, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v81 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v81, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 6:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v19, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromSharedAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromSharedAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v82 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v82, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromSharedAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromSharedAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v83 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v83, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v84 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v84, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 7:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v22, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromPlacesAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromPlacesAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v85 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v85, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromPlacesAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromPlacesAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v86 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v86, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v87 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v87, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 8:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v23, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromMediaTypeAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromMediaTypeAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v88 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v88, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromMediaTypeAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromMediaTypeAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v89 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v89, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v90 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v90, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 9:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v24 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v24, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromUserAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromUserAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v91 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v91, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromUserAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromUserAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v92 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v92, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v93 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v93, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 10:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v25, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromImportsAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromImportsAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v94 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v94, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromImportsAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromImportsAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v95 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v95, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v96 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v96, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 11:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v26, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromHiddenAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromHiddenAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v97 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v97, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromHiddenAlbum";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromHiddenAlbum";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v98 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v98, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v99 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v99, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 12:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v27, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromRecentlyDeleted";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromRecentlyDeleted";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v100 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v100, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromRecentlyDeleted";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromRecentlyDeleted";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v101 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v101, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v102 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v102, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 13:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v28 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v28, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromSharedAlbumsActivityFeed";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromSharedAlbumsActivityFeed";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v103 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v103, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromSharedAlbumsActivityFeed";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromSharedAlbumsActivityFeed";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v104 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v104, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v105 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v105, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 14:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v29, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromForYouSharedAlbumsActivity";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromForYouSharedAlbumsActivity";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v106 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v106, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromForYouSharedAlbumsActivity";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromForYouSharedAlbumsActivity";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v107 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v107, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v108 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v108, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 15:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v30 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v30, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromForYouFeaturedSuggestion";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromForYouFeaturedSuggestion";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v109 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v109, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromForYouFeaturedSuggestion";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromForYouFeaturedSuggestion";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v110 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v110, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v111 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v111, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 16:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v31, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromForYouContentSyndication";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromForYouContentSyndication";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v112 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v112, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromForYouContentSyndication";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromForYouContentSyndication";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v113 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v113, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v114 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v114, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 17:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v32 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v32, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromCompleteMyMoment";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromCompleteMyMoment";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v115 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v115, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromCompleteMyMoment";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromCompleteMyMoment";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v116 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v116, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v117 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v117, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 18:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v33 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v33, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromMomentsDetail";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromMomentsDetail";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v118 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v118, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromMomentsDetail";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromMomentsDetail";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v119 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v119, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v120 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v120, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 19:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v34 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v34, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromMomentsDetailShowMore";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromMomentsDetailShowMore";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v121 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v121, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromMomentsDetailShowMore";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromMomentsDetailShowMore";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v122 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v122, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v123 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v123, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 20:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v35 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v35, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromCollectionsDetail";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromCollectionsDetail";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v124 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v124, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromCollectionsDetail";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromCollectionsDetail";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v125 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v125, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v126 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v126, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 21:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v36 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v36, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromCollectionsDetailShowMore";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromCollectionsDetailShowMore";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v127 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v127, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromCollectionsDetailShowMore";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromCollectionsDetailShowMore";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v128 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v128, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v129 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v129, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 22:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v37 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v37, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromYearsDetail";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromYearsDetail";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v130 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v130, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromYearsDetail";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromYearsDetail";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v131 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v131, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v132 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v132, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 23:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v38, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterOneUpFromYearsDetailShowMore";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterOneUpFromYearsDetailShowMore";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v133 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v133, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromYearsDetailShowMore";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromYearsDetailShowMore";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v134 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v134, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v135 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v135, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 24:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v39 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v39, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromMemoriesDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromMemoriesDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v136 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v136, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromMemoriesDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromMemoriesDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v137 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v137, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v138 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v138, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitDetails";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitDetails";
            goto LABEL_1325;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 25:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v40 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v40, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromMemoriesDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromMemoriesDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v139 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v139, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromMemoriesDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromMemoriesDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v140 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v140, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v141 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v141, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 26:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v41 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v41, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromRelatedDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromRelatedDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v142 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v142, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromRelatedDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromRelatedDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v143 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v143, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v144 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v144, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 27:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v42 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v42, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromRelatedDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromRelatedDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v145 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v145, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromRelatedDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromRelatedDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v146 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v146, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v147 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v147, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 28:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v43 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v43, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromPeopleDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromPeopleDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v148 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v148, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromPeopleDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromPeopleDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v149 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v149, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v150 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v150, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 29:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v44 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v44, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromPeopleDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromPeopleDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v151 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v151, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromPeopleDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromPeopleDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v152 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v152, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v153 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v153, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 30:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v45 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v45, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromUserAlbumDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromUserAlbumDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v154 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v154, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromUserAlbumDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromUserAlbumDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v155 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v155, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v156 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v156, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 31:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v46 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v46, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromUserAlbumDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromUserAlbumDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v157 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v157, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromUserAlbumDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromUserAlbumDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v158 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v158, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v159 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v159, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 32:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v62 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v62, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromPlacesDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromPlacesDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v211 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v211, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromPlacesDetail";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromPlacesDetail";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v206 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v206, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v207 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v207, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 33:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v47 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v47, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromPlacesDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromPlacesDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v160 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v160, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromPlacesDetailShowMore";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromPlacesDetailShowMore";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v161 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v161, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v162 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v162, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 34:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v48 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v48, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromSearchTopResults";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromSearchTopResults";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v163 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v163, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromSearchTopResults";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromSearchTopResults";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v164 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v164, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v165 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v165, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 35:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v63 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v63, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromSearchResults";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromSearchResults";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v208 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v208, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromSearchResults";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromSearchResults";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v209 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v209, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v210 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v210, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 37:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v49 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v49, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromCamera";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromCamera";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v166 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v166, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromCamera";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromCamera";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v167 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v167, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v168 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v168, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 38:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v50 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v50, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromNotification";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromNotification";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v169 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v169, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromNotification";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromNotification";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v170 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v170, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v171 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v171, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 39:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v51 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v51, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromCuratedLibraryDays";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromCuratedLibraryDays";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v172 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v172, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromCuratedLibraryDays";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromCuratedLibraryDays";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v173 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v173, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v174 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v174, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 40:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v52 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v52, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromAllPhotosOneColumn";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromAllPhotosOneColumn";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v175 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v175, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromAllPhotosOneColumn";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromAllPhotosOneColumn";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v176 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v176, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v177 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v177, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 41:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v53 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v53, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromAllPhotosThreeColumns";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromAllPhotosThreeColumns";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v178 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v178, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromAllPhotosThreeColumns";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromAllPhotosThreeColumns";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v179 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v179, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v180 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v180, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 42:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v54 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v54, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromAllPhotosFiveColumns";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromAllPhotosFiveColumns";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v181 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v181, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromAllPhotosFiveColumns";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromAllPhotosFiveColumns";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v182 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v182, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v183 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v183, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 43:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v55 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v56 = objc_claimAutoreleasedReturnValue();
          v57 = os_signpost_id_make_with_pointer(v56, v9);

          if (v6)
          {
            if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
            {
              *(_WORD *)v217 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v57, "EnterOneUpFromAllPhotosOther", " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
            }

            goto LABEL_210;
          }
          if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v55))
          {
            *(_WORD *)v217 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v55, OS_SIGNPOST_INTERVAL_END, v57, "EnterOneUpFromAllPhotosOther", " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
          }

          goto LABEL_915;
        case 2:
          PLAnimationTelemetryGetLog();
          v184 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v185 = objc_claimAutoreleasedReturnValue();
          v186 = os_signpost_id_make_with_pointer(v185, v9);

          if (v6)
          {
            if (v186 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v184))
            {
              *(_WORD *)v217 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v184, OS_SIGNPOST_INTERVAL_BEGIN, v186, "ExitOneUpFromAllPhotosOther", " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
            }

            goto LABEL_729;
          }
          if (v186 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v184))
          {
            *(_WORD *)v217 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v184, OS_SIGNPOST_INTERVAL_END, v186, "ExitOneUpFromAllPhotosOther", " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
          }

          goto LABEL_1291;
        case 3:
          PLAnimationTelemetryGetLog();
          v187 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v188 = objc_claimAutoreleasedReturnValue();
          v189 = os_signpost_id_make_with_pointer(v188, v9);

          if (v6)
          {
            if (v189 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v187))
            {
              *(_WORD *)v217 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v187, OS_SIGNPOST_INTERVAL_BEGIN, v189, "EnterDetails", " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
            }

            goto LABEL_733;
          }
          if (v189 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v187))
          {
            *(_WORD *)v217 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v187, OS_SIGNPOST_INTERVAL_END, v189, "EnterDetails", " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
          }

          goto LABEL_1298;
        case 4:
          PLAnimationTelemetryGetLog();
          v190 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v191 = objc_claimAutoreleasedReturnValue();
          v192 = os_signpost_id_make_with_pointer(v191, v9);

          if (v6)
          {
            if (v192 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v190))
            {
              *(_WORD *)v217 = 0;
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v190, OS_SIGNPOST_INTERVAL_BEGIN, v192, "ExitDetails", " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
            }

            goto LABEL_737;
          }
          if (v192 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v190))
          {
            *(_WORD *)v217 = 0;
            _os_signpost_emit_with_name_impl(&dword_1A6789000, v190, OS_SIGNPOST_INTERVAL_END, v192, "ExitDetails", " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
          }

          break;
        default:
          goto LABEL_1355;
      }
LABEL_1305:
      PLAnimationTelemetryGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      PLAnimationTelemetryGetLog();
      v215 = objc_claimAutoreleasedReturnValue();
      v59 = os_signpost_id_make_with_pointer(v215, v9);

      if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
        goto LABEL_1354;
      *(_WORD *)v217 = 0;
      v13 = "ExitDetails";
LABEL_1308:
      v196 = v10;
      v197 = OS_SIGNPOST_INTERVAL_END;
LABEL_1309:
      v216 = v59;
LABEL_1353:
      _os_signpost_emit_with_name_impl(&dword_1A6789000, v196, v197, v216, v13, " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
      goto LABEL_1354;
    case 44:
      switch(a3)
      {
        case 1:
          if (v6)
          {
LABEL_210:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v58 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v58, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromDuplicatesAlbum";
              goto LABEL_740;
            }
          }
          else
          {
LABEL_915:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v212 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v212, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromDuplicatesAlbum";
              goto LABEL_1308;
            }
          }
          goto LABEL_1354;
        case 2:
          if (v6)
          {
LABEL_729:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v193 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v193, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromDuplicatesAlbum";
              goto LABEL_740;
            }
          }
          else
          {
LABEL_1291:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v213 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v213, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromDuplicatesAlbum";
              goto LABEL_1308;
            }
          }
          goto LABEL_1354;
        case 3:
          if (!v6)
          {
LABEL_1298:
            PLAnimationTelemetryGetLog();
            v10 = objc_claimAutoreleasedReturnValue();
            PLAnimationTelemetryGetLog();
            v214 = objc_claimAutoreleasedReturnValue();
            v59 = os_signpost_id_make_with_pointer(v214, v9);

            if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_1308;
            }
            goto LABEL_1354;
          }
LABEL_733:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v194 = objc_claimAutoreleasedReturnValue();
          v59 = os_signpost_id_make_with_pointer(v194, v9);

          if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
            goto LABEL_1354;
          *(_WORD *)v217 = 0;
          v13 = "EnterDetails";
LABEL_740:
          v196 = v10;
          v197 = OS_SIGNPOST_INTERVAL_BEGIN;
          break;
        case 4:
          if (!v6)
            goto LABEL_1305;
LABEL_737:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v195 = objc_claimAutoreleasedReturnValue();
          v59 = os_signpost_id_make_with_pointer(v195, v9);

          if (v59 - 1 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v10))
            goto LABEL_1354;
          *(_WORD *)v217 = 0;
          v13 = "ExitDetails";
          goto LABEL_740;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1309;
    case 45:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v60 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v60, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromSharedLibraryAlbum";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromSharedLibraryAlbum";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v198 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v198, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitOneUpFromSharedLibraryAlbum";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitOneUpFromSharedLibraryAlbum";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v199 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v199, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterDetails";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v200 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v200, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
            goto LABEL_1351;
          }
          break;
        default:
          goto LABEL_1355;
      }
      goto LABEL_1354;
    case 46:
      switch(a3)
      {
        case 1:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v61 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v61, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "EnterOneUpFromForYouSharedLibrarySharingSuggestion";
              goto LABEL_790;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "EnterOneUpFromForYouSharedLibrarySharingSuggestion";
            goto LABEL_1351;
          }
          goto LABEL_1354;
        case 2:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v201 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v201, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "ExitOneUpFromForYouSharedLibrarySharingSuggestion";
              goto LABEL_761;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "ExitOneUpFromForYouSharedLibrarySharingSuggestion";
            goto LABEL_1325;
          }
          goto LABEL_1354;
        case 3:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v202 = objc_claimAutoreleasedReturnValue();
          v20 = os_signpost_id_make_with_pointer(v202, v9);

          if (v6)
          {
            if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v21 = "EnterDetails";
LABEL_761:
              v203 = v10;
              v204 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_1326:
              _os_signpost_emit_with_name_impl(&dword_1A6789000, v203, v204, v20, v21, " enableTelemetry=YES  isAnimation=YES ", v217, 2u);
              goto LABEL_1354;
            }
          }
          else if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v21 = "EnterDetails";
LABEL_1325:
            v203 = v10;
            v204 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_1326;
          }
          goto LABEL_1354;
        case 4:
          PLAnimationTelemetryGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          PLAnimationTelemetryGetLog();
          v205 = objc_claimAutoreleasedReturnValue();
          v12 = os_signpost_id_make_with_pointer(v205, v9);

          if (v6)
          {
            if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
            {
              *(_WORD *)v217 = 0;
              v13 = "ExitDetails";
LABEL_790:
              v196 = v10;
              v197 = OS_SIGNPOST_INTERVAL_BEGIN;
LABEL_1352:
              v216 = v12;
              goto LABEL_1353;
            }
          }
          else if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)v217 = 0;
            v13 = "ExitDetails";
LABEL_1351:
            v196 = v10;
            v197 = OS_SIGNPOST_INTERVAL_END;
            goto LABEL_1352;
          }
LABEL_1354:

LABEL_1355:
          return;
        default:
          goto LABEL_1355;
      }
    default:
      goto LABEL_1355;
  }
}

@end
