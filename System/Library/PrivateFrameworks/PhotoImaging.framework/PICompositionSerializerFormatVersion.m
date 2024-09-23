@implementation PICompositionSerializerFormatVersion

+ (id)locallySupportedFormatVersions
{
  if (locallySupportedFormatVersions_onceToken != -1)
    dispatch_once(&locallySupportedFormatVersions_onceToken, &__block_literal_global_12613);
  return (id)locallySupportedFormatVersions_locallySupportedFormatVersions;
}

+ (id)currentFormatVersion
{
  return CFSTR("1.9.1");
}

+ (BOOL)adjustmentHasPerspective:(id)a3 settings:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v5 = a4;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("Crop")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pitch"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("pitch"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "floatValue");
      v9 = NUIsRoughlyEqual();

      if (!v9)
        goto LABEL_9;
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("yaw"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_6;
    v11 = (void *)v10;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("yaw"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v13 = NUIsRoughlyEqual();

    if (!v13)
    {
LABEL_9:
      v16 = 1;
    }
    else
    {
LABEL_6:
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("smart"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("smart"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

      }
      else
      {
        v16 = 0;
      }

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_versionRules
{
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
  _QWORD v45[5];
  _QWORD v46[5];
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  void *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  void *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  const __CFString *v101;
  const __CFString *v102;
  const __CFString *v103;
  const __CFString *v104;
  const __CFString *v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  const __CFString *v111;
  const __CFString *v112;
  const __CFString *v113;
  const __CFString *v114;
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  const __CFString *v118;
  const __CFString *v119;
  const __CFString *v120;
  _QWORD v121[37];
  _QWORD v122[39];

  v122[37] = *MEMORY[0x1E0C80C00];
  v121[0] = CFSTR("apertureRedEye");
  v119 = CFSTR("version");
  v120 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v44;
  v121[1] = CFSTR("autoLoop");
  v117 = CFSTR("version");
  v118 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = v43;
  v121[2] = CFSTR("cropStraighten");
  v3 = MEMORY[0x1E0C809B0];
  v115 = CFSTR("dynamic");
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __53__PICompositionSerializerFormatVersion__versionRules__block_invoke;
  v46[3] = &__block_descriptor_40_e32___NSString_16__0__NUAdjustment_8l;
  v46[4] = a1;
  v42 = (void *)MEMORY[0x1A85C0174](v46);
  v116 = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v122[2] = v41;
  v121[3] = CFSTR("curves");
  v113 = CFSTR("version");
  v114 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v122[3] = v40;
  v121[4] = CFSTR("definition");
  v111 = CFSTR("version");
  v112 = CFSTR("1.5");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v122[4] = v39;
  v121[5] = CFSTR("depthEffect");
  v109 = CFSTR("dynamic");
  v110 = &__block_literal_global_50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v122[5] = v38;
  v121[6] = CFSTR("effect");
  v107 = CFSTR("dynamic");
  v108 = &__block_literal_global_61;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v122[6] = v37;
  v121[7] = CFSTR("effect3D");
  v105 = CFSTR("dynamic");
  v106 = &__block_literal_global_66;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v122[7] = v36;
  v121[8] = CFSTR("grain");
  v103 = CFSTR("version");
  v104 = CFSTR("1.6");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v122[8] = v35;
  v121[9] = CFSTR("highResFusion");
  v101 = CFSTR("version");
  v102 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v122[9] = v34;
  v121[10] = CFSTR("levels");
  v99 = CFSTR("version");
  v100 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v100, &v99, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v122[10] = v33;
  v121[11] = CFSTR("livePhotoKeyFrame");
  v97 = CFSTR("version");
  v98 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v98, &v97, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v122[11] = v32;
  v121[12] = CFSTR("mute");
  v95 = CFSTR("version");
  v96 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v122[12] = v31;
  v121[13] = CFSTR("noiseReduction");
  v93 = CFSTR("dynamic");
  v94 = &__block_literal_global_79;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v122[13] = v30;
  v121[14] = CFSTR("orientation");
  v91 = CFSTR("version");
  v92 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v122[14] = v29;
  v121[15] = CFSTR("portraitEffect");
  v89 = CFSTR("dynamic");
  v90 = &__block_literal_global_86;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v122[15] = v28;
  v121[16] = CFSTR("raw");
  v87 = CFSTR("dynamic");
  v88 = &__block_literal_global_103;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v122[16] = v27;
  v121[17] = CFSTR("rawNoiseReduction");
  v85 = CFSTR("version");
  v86 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v122[17] = v26;
  v121[18] = CFSTR("redEye");
  v83 = CFSTR("dynamic");
  v84 = &__block_literal_global_110;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v84, &v83, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v122[18] = v25;
  v121[19] = CFSTR("retouch");
  v81 = CFSTR("dynamic");
  v45[0] = v3;
  v45[1] = 3221225472;
  v45[2] = __53__PICompositionSerializerFormatVersion__versionRules__block_invoke_9;
  v45[3] = &__block_descriptor_40_e32___NSString_16__0__NUAdjustment_8l;
  v45[4] = a1;
  v24 = (void *)MEMORY[0x1A85C0174](v45);
  v82 = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v122[19] = v23;
  v121[20] = CFSTR("selectiveColor");
  v79 = CFSTR("version");
  v80 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v122[20] = v22;
  v121[21] = CFSTR("sharpen");
  v77 = CFSTR("version");
  v78 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v122[21] = v21;
  v121[22] = CFSTR("slomo");
  v75 = CFSTR("version");
  v76 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v122[22] = v20;
  v121[23] = CFSTR("smartBlackAndWhite");
  v73 = CFSTR("version");
  v74 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v122[23] = v19;
  v121[24] = CFSTR("smartColor");
  v71 = CFSTR("version");
  v72 = CFSTR("1.5");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v122[24] = v18;
  v121[25] = CFSTR("smartTone");
  v69 = CFSTR("dynamic");
  v70 = &__block_literal_global_135;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v122[25] = v17;
  v121[26] = CFSTR("source");
  v67 = CFSTR("version");
  v68 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v122[26] = v16;
  v121[27] = CFSTR("trim");
  v65 = CFSTR("version");
  v66 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v122[27] = v15;
  v121[28] = CFSTR("videoPosterFrame");
  v63 = CFSTR("version");
  v64 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v122[28] = v14;
  v121[29] = CFSTR("vignette");
  v61 = CFSTR("version");
  v62 = CFSTR("1.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v122[29] = v4;
  v121[30] = CFSTR("whiteBalance");
  v59 = CFSTR("dynamic");
  v60 = &__block_literal_global_146;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v122[30] = v5;
  v121[31] = CFSTR("videoStabilize");
  v57 = CFSTR("version");
  v58 = CFSTR("1.7");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v122[31] = v6;
  v121[32] = CFSTR("videoCrossfadeLoop");
  v55 = CFSTR("version");
  v56 = CFSTR("1.7");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v122[32] = v7;
  v121[33] = CFSTR("semanticEnhance");
  v53 = CFSTR("version");
  v54 = CFSTR("1.8");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v122[33] = v8;
  v121[34] = CFSTR("semanticStyle");
  v51 = CFSTR("version");
  v52 = CFSTR("1.12");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v122[34] = v9;
  v121[35] = CFSTR("portraitVideo");
  v49 = CFSTR("dynamic");
  v50 = &__block_literal_global_161;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v122[35] = v10;
  v121[36] = CFSTR("cinematicAudio");
  v47 = CFSTR("version");
  v48 = CFSTR("1.12");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v122[36] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 37);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)versionRules
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PICompositionSerializerFormatVersion_versionRules__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (versionRules_onceToken != -1)
    dispatch_once(&versionRules_onceToken, block);
  return (id)versionRules_versionRules;
}

+ (id)formatVersionForAdjustment:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "versionRules");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_7;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("version"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dynamic"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v11)
    {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v6);
      v13 = objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v10 = (void *)v13;

        goto LABEL_8;
      }
    }

LABEL_7:
    objc_msgSend(a1, "currentFormatVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v10;
}

+ (id)adjustmentDataFormatVersionForComposition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  __CFString *v21;
  id obj;
  __CFString *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "schema");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = CFSTR("1.4");
  if (objc_msgSend(v4, "mediaType") == 2)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("autoLoop"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      v8 = CFSTR("1.6");
  }
  objc_msgSend(a1, "locallySupportedFormatVersions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (__CFString *)v8;
  v11 = objc_msgSend(v10, "indexOfObject:", v8);

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v7;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          objc_msgSend(a1, "formatVersionForAdjustment:identifier:", v17, v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "locallySupportedFormatVersions");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "indexOfObject:", v18);

          if (v11 != 0x7FFFFFFFFFFFFFFFLL && v11 < v20)
          {
            v21 = v18;

            v11 = v20;
            v24 = v21;
          }

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

  return v24;
}

void __52__PICompositionSerializerFormatVersion_versionRules__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_versionRules");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)versionRules_versionRules;
  versionRules_versionRules = v1;

}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_opt_class();
  objc_msgSend(v2, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v3) = objc_msgSend(v3, "adjustmentHasPerspective:settings:", CFSTR("Crop"), v4);
  if ((_DWORD)v3)
    return CFSTR("1.6");
  else
    return CFSTR("1.4");
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const __CFString *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  unint64_t v18;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "locallySupportedFormatVersions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("1.4");
  v6 = objc_msgSend(v4, "indexOfObject:", CFSTR("1.4"));

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inputStrokes"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("mode"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = PIRetouchModeFromString(v12);

        if (v13 == 2)
          v14 = CFSTR("1.7");
        else
          v14 = CFSTR("1.4");
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("clipRect"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NUPixelRectFromArray();

        if (NUPixelRectIsNull())
          v16 = v14;
        else
          v16 = CFSTR("1.9");
        objc_msgSend(*(id *)(a1 + 32), "locallySupportedFormatVersions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "indexOfObject:", v16);

        if (v6 != 0x7FFFFFFFFFFFFFFFLL && v6 < v18)
        {
          v6 = v18;
          v5 = v16;
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  return v5;
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_12(uint64_t a1, void *a2)
{
  void *v2;
  const __CFString *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("renderingVersionAtCapture"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "unsignedIntegerValue") <= 1)
    v3 = CFSTR("1.9");
  else
    v3 = CFSTR("1.10");

  return v3;
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_11(uint64_t a1, void *a2)
{
  void *v2;
  const __CFString *v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("colorType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("warmTint")))
    v3 = CFSTR("1.5.1");
  else
    v3 = CFSTR("1.4");

  return v3;
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_10()
{
  return CFSTR("1.5");
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("inputCorrectionInfo"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = CFSTR("1.5");
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v5)
        objc_enumerationMutation(v2);
      objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "objectForKeyedSubscript:", CFSTR("convexHull"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
        break;
      if (v4 == ++v7)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          goto LABEL_3;
        v6 = CFSTR("1.4");
        break;
      }
    }
  }
  else
  {
    v6 = CFSTR("1.4");
  }

  return v6;
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("boostVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return CFSTR("1.9.1");
  else
    return CFSTR("1.4");
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("spillMatteAllowed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = CFSTR("1.8");
  }
  else
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("kind"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("StudioV2")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("ContourV2")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("StageV2")) & 1) != 0)
    {
      v4 = CFSTR("1.5");
    }
    else
    {
      v4 = CFSTR("1.5");
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("StageMonoV2")) & 1) == 0
        && !objc_msgSend(v5, "isEqualToString:", CFSTR("StageWhite")))
      {
        v4 = CFSTR("1.4");
      }
    }

  }
  return v4;
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  float v3;
  const __CFString *v4;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("radius"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatValue");
  if (v3 <= 5.0)
    v4 = CFSTR("1.4");
  else
    v4 = CFSTR("1.5");

  return v4;
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  float v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("intensity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = CFSTR("1.4");
  if (v3)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("intensity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    if (v6 < 1.0)
      v4 = CFSTR("1.6");

  }
  return v4;
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  const __CFString *v4;
  void *v5;
  float v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("intensity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = CFSTR("1.4");
  if (v3)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("intensity"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "floatValue");
    if (v6 < 1.0)
      v4 = CFSTR("1.6");

  }
  return v4;
}

const __CFString *__53__PICompositionSerializerFormatVersion__versionRules__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("depthInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SDOFRenderingVersion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("focusRect"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = CFSTR("1.11");
  if (!v6 && v5 <= 6)
  {
    if (v5 <= 5)
    {
      if (v5 == 5)
      {
        v7 = CFSTR("1.9");
      }
      else
      {
        objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("glassesMatteAllowed"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          v7 = CFSTR("1.8");
        else
          v7 = CFSTR("1.5");
      }
    }
    else
    {
      v7 = CFSTR("1.10");
    }
  }

  return v7;
}

void __70__PICompositionSerializerFormatVersion_locallySupportedFormatVersions__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[13];

  v2[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("1.3");
  v2[1] = CFSTR("1.4");
  v2[2] = CFSTR("1.5");
  v2[3] = CFSTR("1.5.1");
  v2[4] = CFSTR("1.6");
  v2[5] = CFSTR("1.7");
  v2[6] = CFSTR("1.8");
  v2[7] = CFSTR("1.9");
  v2[8] = CFSTR("1.9.1");
  v2[9] = CFSTR("1.10");
  v2[10] = CFSTR("1.11");
  v2[11] = CFSTR("1.12");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)locallySupportedFormatVersions_locallySupportedFormatVersions;
  locallySupportedFormatVersions_locallySupportedFormatVersions = v0;

}

@end
