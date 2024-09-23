@implementation PFParallaxLayerStackArchiver

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__PFParallaxLayerStackArchiver_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, block);
}

+ (BOOL)saveCompoundLayerStack:(id)a3 toURL:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  CFDictionaryRef DictionaryRepresentation;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
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
  BOOL v55;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  id obj;
  id v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, void *);
  void *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, void *);
  void *v104;
  unint64_t v105;
  id v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  void *v110;
  _QWORD v111[3];
  _QWORD v112[3];
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD v115[4];
  _QWORD v116[4];
  uint64_t v117;
  void *v118;
  _BYTE v119[128];
  uint64_t v120;
  void *v121;
  _BYTE v122[128];
  uint64_t v123;
  _QWORD v124[3];
  CGRect v125;

  v124[1] = *MEMORY[0x1E0C80C00];
  v80 = a3;
  v84 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0;
  v8 = objc_msgSend(v79, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v84, 0, 0, &v106);
  v9 = v106;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v80, "portraitLayerStack");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v101 = MEMORY[0x1E0C809B0];
    v102 = 3221225472;
    v103 = __75__PFParallaxLayerStackArchiver_saveCompoundLayerStack_toURL_options_error___block_invoke;
    v104 = &__block_descriptor_40_e25_B16__0__PFParallaxLayer_8l;
    v105 = a5;
    PFFilter();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v80, "landscapeLayerStack");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v12;
    v97 = 3221225472;
    v98 = __75__PFParallaxLayerStackArchiver_saveCompoundLayerStack_toURL_options_error___block_invoke_2;
    v99 = &__block_descriptor_40_e25_B16__0__PFParallaxLayer_8l;
    v100 = a5;
    PFFilter();
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v78);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v81, "count"));
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    obj = v13;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v122, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v93;
LABEL_4:
      v19 = 0;
      v20 = v9;
      while (1)
      {
        if (*(_QWORD *)v93 != v18)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v19);
        objc_msgSend(v21, "makeUniqueFileNameWithFileNames:orientation:", v16, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "URLByAppendingPathComponent:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v91 = v20;
        LOBYTE(v21) = objc_msgSend(v21, "saveToURL:error:", v23, &v91);
        v9 = v91;

        if ((v21 & 1) == 0)
          break;
        objc_msgSend(v16, "addObject:", v22);

        ++v19;
        v20 = v9;
        if (v17 == v19)
        {
          v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v122, 16);
          if (v17)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      if (a6)
      {
        v57 = (void *)MEMORY[0x1E0CB35C8];
        v120 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write layer contents: %@"), v9);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = v76;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v121, &v120, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v54);
        v55 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        v82 = obj;
        goto LABEL_42;
      }
      v55 = 0;
      v82 = obj;
      goto LABEL_43;
    }
LABEL_10:

    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v82 = v78;
    v24 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v87, v119, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v88;
LABEL_12:
      v26 = 0;
      v27 = v9;
      while (1)
      {
        if (*(_QWORD *)v88 != v25)
          objc_enumerationMutation(v82);
        v28 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v26);
        objc_msgSend(v28, "makeUniqueFileNameWithFileNames:orientation:", v16, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "URLByAppendingPathComponent:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v86 = v27;
        LOBYTE(v28) = objc_msgSend(v28, "saveToURL:error:", v23, &v86);
        v9 = v86;

        if ((v28 & 1) == 0)
          break;
        objc_msgSend(v16, "addObject:", v22);

        ++v26;
        v27 = v9;
        if (v24 == v26)
        {
          v24 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v87, v119, 16);
          if (v24)
            goto LABEL_12;
          goto LABEL_18;
        }
      }
      if (a6)
      {
        v58 = (void *)MEMORY[0x1E0CB35C8];
        v117 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to write layer contents: %@"), v9);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = v76;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v54);
        v55 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_42;
      }
      v55 = 0;
LABEL_43:

      goto LABEL_44;
    }
LABEL_18:

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v81, "count"));
    v82 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v81, "count"))
    {
      v29 = 0;
      do
      {
        objc_msgSend(v81, "objectAtIndexedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v116[0] = v31;
        v115[0] = CFSTR("filename");
        v115[1] = CFSTR("frame");
        objc_msgSend(v30, "frame");
        DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v125);
        v116[1] = DictionaryRepresentation;
        v115[2] = CFSTR("zPosition");
        v33 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v30, "zPosition");
        objc_msgSend(v33, "numberWithDouble:");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v116[2] = v34;
        v115[3] = CFSTR("identifier");
        objc_msgSend(v30, "identifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v116[3] = v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 4);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "addObject:", v36);

        ++v29;
      }
      while (v29 < objc_msgSend(v81, "count"));
    }
    v37 = objc_alloc(MEMORY[0x1E0C99E08]);
    v113[0] = CFSTR("portraitLayout");
    objc_msgSend(v80, "portraitLayerStack");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "layout");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "dictionaryRepresentation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v114[0] = v72;
    v113[1] = CFSTR("depthEnabled");
    v38 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v80, "portraitLayerStack");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "numberWithBool:", objc_msgSend(v71, "depthEnabled"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v114[1] = v70;
    v113[2] = CFSTR("settlingEffectEnabled");
    v39 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v80, "portraitLayerStack");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "numberWithBool:", objc_msgSend(v69, "settlingEffectEnabled"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v114[2] = v68;
    v113[3] = CFSTR("parallaxDisabled");
    v40 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v80, "portraitLayerStack");
    v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "numberWithBool:", objc_msgSend((id)v41, "parallaxDisabled"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v114[3] = v42;
    v113[4] = CFSTR("clockAreaLuminance");
    v43 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v80, "portraitLayerStack");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "clockAreaLuminance");
    objc_msgSend(v43, "numberWithDouble:");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v114[4] = v45;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 5);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v37, "initWithDictionary:", v46);

    objc_msgSend(v80, "landscapeLayerStack");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v41) = v47 == 0;

    if ((v41 & 1) == 0)
    {
      objc_msgSend(v80, "landscapeLayerStack");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "layout");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "dictionaryRepresentation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v50, CFSTR("landscapeLayout"));

      v51 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v80, "landscapeLayerStack");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "numberWithBool:", objc_msgSend(v52, "depthEnabled"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v53, CFSTR("depthEnabled-landscape"));

    }
    v111[0] = CFSTR("version");
    v111[1] = CFSTR("layers");
    v112[0] = &unk_1E45CA298;
    v112[1] = v82;
    v111[2] = CFSTR("properties");
    v112[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v112, v111, 3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "URLByAppendingPathComponent:", CFSTR("Contents.json"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = v9;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v23, 1, &v85);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = v85;

    if (v54)
    {
      if ((objc_msgSend(v54, "writeToURL:atomically:", v76, 1) & 1) != 0)
      {
        v55 = 1;
        goto LABEL_41;
      }
      if (a6)
      {
        v62 = (void *)MEMORY[0x1E0CB35C8];
        v107 = *MEMORY[0x1E0CB2938];
        v63 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v76, "path");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "stringWithFormat:", CFSTR("Failed to write layer stack contents to file: %@"), v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = v65;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v66);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (a6)
      {
        v59 = (void *)MEMORY[0x1E0CB35C8];
        v109 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to serialize layer stack contents: %@"), v74);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v110 = v60;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v61);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v54 = 0;
    }
    v55 = 0;
LABEL_41:
    v9 = v74;
LABEL_42:

    goto LABEL_43;
  }
  if (a6)
  {
    v56 = (void *)MEMORY[0x1E0CB35C8];
    v123 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create layer stack directory: %@"), v9);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v124[0] = obj;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v124, &v123, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v78);
    v55 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_44:

    goto LABEL_45;
  }
  v55 = 0;
LABEL_45:

  return v55;
}

+ (id)loadCompoundLayerStackFromURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
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
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PFWallpaperCompoundLayerStack *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  _BOOL4 v45;
  _BOOL4 v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  CGSize v51;
  void *v52;
  int v53;
  NSObject *v54;
  NSObject *v55;
  os_signpost_id_t v56;
  BOOL v57;
  id v58;
  NSObject *v59;
  NSObject *v60;
  os_signpost_id_t v61;
  PFParallaxImageLayer *v62;
  id v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  void *v70;
  int v71;
  void *v72;
  PFParallaxVideoLayer *v73;
  double v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  _BOOL4 v104;
  unsigned int v105;
  unsigned int v106;
  unsigned int v107;
  uint64_t v108;
  unsigned int v109;
  PFParallaxImageLayer *v110;
  void *v111;
  void *v112;
  id v113;
  PFParallaxLayerStack *obj;
  uint64_t v115;
  id v116;
  uint64_t v117;
  void *v118;
  void *v119;
  void *v120;
  CFDictionaryRef dict;
  CFDictionaryRef dicta;
  CFDictionaryRef dictb;
  uint64_t v124;
  uint64_t v125;
  PFParallaxLayerStack *v126;
  void *v127;
  void *v128;
  void *v130;
  void *v131;
  id v132;
  CGRect rect;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  void *v149;
  uint64_t v150;
  CFDictionaryRef v151;
  uint64_t v152;
  void *v153;
  _BYTE v154[128];
  uint64_t v155;
  id v156;
  uint64_t v157;
  id v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  id v162;
  uint64_t v163;
  id v164;
  uint64_t v165;
  void *v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  void *v170;
  uint64_t v171;
  void *v172;
  uint64_t v173;
  void *v174;
  uint64_t v175;
  void *v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  void *v180;
  uint64_t v181;
  void *v182;
  uint64_t v183;
  void *v184;
  uint64_t v185;
  uint8_t buf[8];
  id v187[3];

  v187[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("Contents.json"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  rect.origin.x = 0.0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 0, &rect);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(id *)&rect.origin.x;
  if (v8)
  {
    v187[0] = v9;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v8, 0, v187);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v187[0];

    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v10;
        v12 = 0;
        v9 = v11;
        v13 = v10;
        goto LABEL_9;
      }
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v185 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid JSON contents"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v185, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v21);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v185 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to deserialize JSON data: %@"), v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v185, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v18);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v10 = 0;
    }
    v13 = 0;
    v9 = v11;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    *(_QWORD *)buf = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load data: %@"), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v187[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v187, buf, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 8, v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
  }
LABEL_9:

  v22 = v12;
  if (v13)
  {
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("version"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      if (a5)
      {
        v35 = (void *)MEMORY[0x1E0CB35C8];
        v181 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid version info: %@"), v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v182 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v182, &v181, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v26);
        v34 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
    }
    else
    {
      v24 = objc_msgSend(v23, "unsignedIntegerValue");
      if (v24 < 0xB)
      {
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("properties"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (v24 < 6)
          {
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("layout"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:](PFPosterOrientedLayout, "layoutWithDictionaryRepresentation:", v26);
              v125 = objc_claimAutoreleasedReturnValue();
              if (v125)
              {
                v127 = 0;
                goto LABEL_49;
              }
              if (a5)
              {
                v42 = (void *)MEMORY[0x1E0CB35C8];
                v165 = *MEMORY[0x1E0CB2938];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't decode portraitLayout: %@"), v26);
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                v166 = v127;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v42, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_45;
              }
            }
            else if (a5)
            {
              v40 = (void *)MEMORY[0x1E0CB35C8];
              v167 = *MEMORY[0x1E0CB2938];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid portraitLayout dictionary: %@"), v26);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v168 = v127;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_45;
            }
          }
          else
          {
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("portraitLayout"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:](PFPosterOrientedLayout, "layoutWithDictionaryRepresentation:", v26);
              v125 = objc_claimAutoreleasedReturnValue();
              if (v125)
              {
                objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("landscapeLayout"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (a5)
                    {
                      v131 = (void *)MEMORY[0x1E0CB35C8];
                      v171 = *MEMORY[0x1E0CB2938];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid landscapeLayout dictionary: %@"), v27);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v172 = v28;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v172, &v171, 1);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v131, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v29);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      goto LABEL_128;
                    }
LABEL_129:

                    v32 = 0;
                    v127 = v26;
LABEL_149:
                    v26 = (void *)v125;
                    goto LABEL_150;
                  }
                  +[PFPosterOrientedLayout layoutWithDictionaryRepresentation:](PFPosterOrientedLayout, "layoutWithDictionaryRepresentation:", v27);
                  v127 = (void *)objc_claimAutoreleasedReturnValue();
                  if (!v127)
                  {
                    if (a5)
                    {
                      v130 = (void *)MEMORY[0x1E0CB35C8];
                      v169 = *MEMORY[0x1E0CB2938];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't decode landscapeLayout: %@"), v27);
                      v28 = (void *)objc_claimAutoreleasedReturnValue();
                      v170 = v28;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v170, &v169, 1);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v130, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v29);
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_128:
                      *a5 = v30;

                      goto LABEL_129;
                    }
                    goto LABEL_129;
                  }
                }
                else
                {
                  v127 = 0;
                }

LABEL_49:
                objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("parallaxDisabled"));
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  if (!a5)
                  {
                    v32 = 0;
LABEL_148:

                    goto LABEL_149;
                  }
                  v47 = (void *)MEMORY[0x1E0CB35C8];
                  v163 = *MEMORY[0x1E0CB2938];
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parallax flag: %@"), v118);
                  v116 = (id)objc_claimAutoreleasedReturnValue();
                  v164 = v116;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1);
                  v112 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v112);
                  v32 = 0;
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_147:
                  goto LABEL_148;
                }
                v109 = objc_msgSend(v118, "BOOLValue");
                v43 = -1.0;
                v107 = v109 ^ 1;
                if (v24 < 2)
                {
                  v105 = v109 ^ 1;
                }
                else
                {
                  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("depthEnabled"));
                  v116 = (id)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                  {
                    if (!a5)
                      goto LABEL_162;
                    v89 = (void *)MEMORY[0x1E0CB35C8];
                    v161 = *MEMORY[0x1E0CB2938];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid depth flag: %@"), v116);
                    v113 = (id)objc_claimAutoreleasedReturnValue();
                    v162 = v113;
                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v89, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v90);
                    *a5 = (id)objc_claimAutoreleasedReturnValue();

                    goto LABEL_133;
                  }
                  v105 = objc_msgSend(v116, "BOOLValue");

                  if (v24 >= 3)
                  {
                    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("clockAreaLuminance"));
                    v116 = (id)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) == 0)
                    {
                      if (!a5)
                        goto LABEL_162;
                      v98 = (void *)MEMORY[0x1E0CB35C8];
                      v159 = *MEMORY[0x1E0CB2938];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid clockLuminanceValue: %@"), v116);
                      v113 = (id)objc_claimAutoreleasedReturnValue();
                      v160 = v113;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
                      v99 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v98, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v99);
                      *a5 = (id)objc_claimAutoreleasedReturnValue();

                      goto LABEL_133;
                    }
                    objc_msgSend(v116, "doubleValue");
                    v43 = v44;

                    if (v24 >= 5)
                    {
                      objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("settlingEffectEnabled"));
                      v116 = (id)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v106 = objc_msgSend(v116, "BOOLValue");

                        if (v127)
                          v45 = v24 > 5;
                        else
                          v45 = 0;
                        if (!v45)
                        {
                          v104 = v127 != 0;
                          goto LABEL_67;
                        }
                        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("depthEnabled-landscape"));
                        v116 = (id)objc_claimAutoreleasedReturnValue();
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v107 = objc_msgSend(v116, "BOOLValue");

                          v46 = 1;
LABEL_66:
                          v104 = v46;
LABEL_67:
                          v116 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                          v113 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                          v136 = 0u;
                          v137 = 0u;
                          v134 = 0u;
                          v135 = 0u;
                          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("layers"));
                          obj = (PFParallaxLayerStack *)objc_claimAutoreleasedReturnValue();
                          v117 = -[PFParallaxLayerStack countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v134, v154, 16);
                          if (v117)
                          {
                            v115 = *(_QWORD *)v135;
                            v108 = *MEMORY[0x1E0CB2938];
                            do
                            {
                              v48 = 0;
                              do
                              {
                                if (*(_QWORD *)v135 != v115)
                                {
                                  v49 = v48;
                                  objc_enumerationMutation(obj);
                                  v48 = v49;
                                }
                                v124 = v48;
                                v50 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * v48);
                                objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("identifier"));
                                v126 = (PFParallaxLayerStack *)objc_claimAutoreleasedReturnValue();
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) == 0)
                                {
                                  if (a5)
                                  {
                                    v91 = (void *)MEMORY[0x1E0CB35C8];
                                    v152 = v108;
                                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid layer identifier: %@"), v126);
                                    v120 = (void *)objc_claimAutoreleasedReturnValue();
                                    v153 = v120;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v153, &v152, 1);
                                    dicta = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v91, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, dicta);
                                    *a5 = (id)objc_claimAutoreleasedReturnValue();

                                    goto LABEL_143;
                                  }
LABEL_144:
                                  v32 = 0;
                                  goto LABEL_145;
                                }
                                if (LayerIDMatchesOptions(v126, a4))
                                {
                                  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("filename"));
                                  v120 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (a5)
                                    {
                                      v92 = (void *)MEMORY[0x1E0CB35C8];
                                      v150 = v108;
                                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid filename: %@"), v120);
                                      dictb = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
                                      v151 = dictb;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v151, &v150, 1);
                                      v93 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v92, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v93);
                                      *a5 = (id)objc_claimAutoreleasedReturnValue();

                                    }
                                    goto LABEL_143;
                                  }
                                  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("frame"));
                                  dict = (CFDictionaryRef)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) == 0)
                                  {
                                    if (a5)
                                    {
                                      v94 = (void *)MEMORY[0x1E0CB35C8];
                                      v148 = v108;
                                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid frame info: %@"), dict);
                                      v95 = (void *)objc_claimAutoreleasedReturnValue();
                                      v149 = v95;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v149, &v148, 1);
                                      v96 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v94, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v96);
                                      *a5 = (id)objc_claimAutoreleasedReturnValue();

                                    }
LABEL_143:

                                    goto LABEL_144;
                                  }
                                  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("zPosition"));
                                  v119 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v51 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
                                    rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
                                    rect.size = v51;
                                    if (CGRectMakeWithDictionaryRepresentation(dict, &rect))
                                    {
                                      objc_msgSend(v6, "URLByAppendingPathComponent:", v120);
                                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v111, "pathExtension");
                                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                                      v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("HEIC"));

                                      if (v53)
                                      {
                                        v187[0] = 0;
                                        v54 = (id)s_log;
                                        v55 = v54;
                                        v56 = s_signpost;
                                        if ((unint64_t)(s_signpost - 1) <= 0xFFFFFFFFFFFFFFFDLL
                                          && os_signpost_enabled(v54))
                                        {
                                          *(_WORD *)buf = 0;
                                          _os_signpost_emit_with_name_impl(&dword_1A16EE000, v55, OS_SIGNPOST_INTERVAL_BEGIN, v56, "PFParallaxLayer.read", (const char *)&unk_1A17C945B, buf, 2u);
                                        }

                                        v132 = v22;
                                        v57 = ReadImageFromURL((uint64_t)v187, v111, (a4 >> 16) & 1, &v132);
                                        v58 = v132;

                                        v59 = (id)s_log;
                                        v60 = v59;
                                        v61 = s_signpost;
                                        if ((unint64_t)(s_signpost - 1) <= 0xFFFFFFFFFFFFFFFDLL
                                          && os_signpost_enabled(v59))
                                        {
                                          *(_WORD *)buf = 0;
                                          _os_signpost_emit_with_name_impl(&dword_1A16EE000, v60, OS_SIGNPOST_INTERVAL_END, v61, "PFParallaxLayer.read", (const char *)&unk_1A17C945B, buf, 2u);
                                        }

                                        if (v57)
                                        {
                                          v62 = [PFParallaxImageLayer alloc];
                                          v63 = v187[0];
                                          objc_msgSend(v119, "doubleValue");
                                          v110 = -[PFParallaxImageLayer initWithImage:frame:zPosition:identifier:](v62, "initWithImage:frame:zPosition:identifier:", v63, v126, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v64);
                                          CVPixelBufferRelease((CVPixelBufferRef)v187[0]);
                                          goto LABEL_94;
                                        }
                                        if (a5)
                                        {
                                          v80 = (void *)MEMORY[0x1E0CB35C8];
                                          v142 = v108;
                                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't decode layer image: %@"), v58);
                                          v81 = (void *)objc_claimAutoreleasedReturnValue();
                                          v143 = v81;
                                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v143, &v142, 1);
                                          v82 = (void *)objc_claimAutoreleasedReturnValue();
                                          objc_msgSend(v80, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v82);
                                          *a5 = (id)objc_claimAutoreleasedReturnValue();

                                        }
                                        v110 = 0;
LABEL_104:
                                        v69 = 1;
                                        goto LABEL_107;
                                      }
                                      objc_msgSend(v111, "pathExtension");
                                      v70 = (void *)objc_claimAutoreleasedReturnValue();
                                      v71 = objc_msgSend(v70, "isEqualToString:", CFSTR("MOV"));

                                      if (v71)
                                      {
                                        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v111);
                                        v72 = (void *)objc_claimAutoreleasedReturnValue();
                                        v73 = [PFParallaxVideoLayer alloc];
                                        objc_msgSend(v119, "doubleValue");
                                        v110 = -[PFParallaxVideoLayer initWithVideoData:frame:zPosition:identifier:](v73, "initWithVideoData:frame:zPosition:identifier:", v72, v126, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height, v74);

                                        v58 = v22;
LABEL_94:
                                        if (v24 < 6)
                                        {
                                          objc_msgSend(v116, "addObject:", v110);
                                        }
                                        else
                                        {
                                          objc_msgSend(v111, "lastPathComponent");
                                          v75 = (void *)objc_claimAutoreleasedReturnValue();
                                          v76 = objc_msgSend(v75, "hasPrefix:", CFSTR("landscape-"));

                                          if (v76)
                                            goto LABEL_96;
                                          objc_msgSend(v111, "lastPathComponent");
                                          v83 = (void *)objc_claimAutoreleasedReturnValue();
                                          v84 = objc_msgSend(v83, "hasPrefix:", CFSTR("portrait-"));

                                          if (!v84)
                                          {
                                            if (a5)
                                            {
                                              v85 = (void *)MEMORY[0x1E0CB35C8];
                                              v138 = v108;
                                              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid content file prefix: %@"), v120);
                                              v86 = (void *)objc_claimAutoreleasedReturnValue();
                                              v139 = v86;
                                              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v139, &v138, 1);
                                              v87 = (void *)objc_claimAutoreleasedReturnValue();
                                              objc_msgSend(v85, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v87);
                                              *a5 = (id)objc_claimAutoreleasedReturnValue();

                                            }
                                            goto LABEL_104;
                                          }
                                          objc_msgSend(v116, "addObject:", v110);
                                          if (v24 > 6)
                                          {
                                            if (-[PFParallaxLayer isBackfill](v110, "isBackfill"))
                                              objc_msgSend(v113, "addObject:", v110);
                                            if (v24 >= 8
                                              && -[PFParallaxLayer isSettlingEffect](v110, "isSettlingEffect"))
                                            {
LABEL_96:
                                              objc_msgSend(v113, "addObject:", v110);
                                            }
                                          }
                                        }
                                        v69 = 0;
LABEL_107:

                                        v22 = v58;
LABEL_108:

                                        if (v69)
                                          goto LABEL_144;
                                        goto LABEL_109;
                                      }
                                      if (a5)
                                      {
                                        v77 = (void *)MEMORY[0x1E0CB35C8];
                                        v140 = v108;
                                        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid content file extension: %@"), v120);
                                        v78 = (void *)objc_claimAutoreleasedReturnValue();
                                        v141 = v78;
                                        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1);
                                        v79 = (void *)objc_claimAutoreleasedReturnValue();
                                        objc_msgSend(v77, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v79);
                                        *a5 = (id)objc_claimAutoreleasedReturnValue();

                                      }
                                      v110 = 0;
LABEL_100:
                                      v69 = 1;
                                      v58 = v22;
                                      goto LABEL_107;
                                    }
                                    if (a5)
                                    {
                                      v68 = (void *)MEMORY[0x1E0CB35C8];
                                      v144 = v108;
                                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid layer frame: %@"), dict);
                                      v111 = (void *)objc_claimAutoreleasedReturnValue();
                                      v145 = v111;
                                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
                                      v110 = (PFParallaxImageLayer *)objc_claimAutoreleasedReturnValue();
                                      objc_msgSend(v68, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v110);
                                      *a5 = (id)objc_claimAutoreleasedReturnValue();
                                      goto LABEL_100;
                                    }
                                  }
                                  else if (a5)
                                  {
                                    v65 = (void *)MEMORY[0x1E0CB35C8];
                                    v146 = v108;
                                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid zPosition value: %@"), v119);
                                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                                    v147 = v66;
                                    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v147, &v146, 1);
                                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_msgSend(v65, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v67);
                                    *a5 = (id)objc_claimAutoreleasedReturnValue();

                                  }
                                  v69 = 1;
                                  goto LABEL_108;
                                }
LABEL_109:

                                v48 = v124 + 1;
                              }
                              while (v117 != v124 + 1);
                              v88 = -[PFParallaxLayerStack countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v134, v154, 16);
                              v117 = v88;
                            }
                            while (v88);
                          }

                          obj = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:]([PFParallaxLayerStack alloc], "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v116, v125, v105, v109, v106, v43);
                          if (v24 != 9)
                            -[PFParallaxLayerStack markMayContainBakedHeadroom](obj, "markMayContainBakedHeadroom");
                          if (v104)
                          {
                            v126 = -[PFParallaxLayerStack initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:]([PFParallaxLayerStack alloc], "initWithLayers:layout:depthEnabled:parallaxDisabled:clockAreaLuminance:settlingEffectEnabled:", v113, v127, v107, v109, v106, v43);
                            if (v24 != 9)
                              -[PFParallaxLayerStack markMayContainBakedHeadroom](v126, "markMayContainBakedHeadroom");
                          }
                          else
                          {
                            v126 = 0;
                          }
                          v32 = -[PFWallpaperCompoundLayerStack initWithPortraitLayerStack:landscapeLayerStack:]([PFWallpaperCompoundLayerStack alloc], "initWithPortraitLayerStack:landscapeLayerStack:", obj, v126);
LABEL_145:

                          goto LABEL_146;
                        }
                        if (a5)
                        {
                          v102 = (void *)MEMORY[0x1E0CB35C8];
                          v155 = *MEMORY[0x1E0CB2938];
                          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid depth flag: %@"), v116);
                          v113 = (id)objc_claimAutoreleasedReturnValue();
                          v156 = v113;
                          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
                          v103 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v102, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v103);
                          *a5 = (id)objc_claimAutoreleasedReturnValue();

                          goto LABEL_133;
                        }
LABEL_162:
                        v32 = 0;
                        goto LABEL_147;
                      }
                      if (!a5)
                        goto LABEL_162;
                      v100 = (void *)MEMORY[0x1E0CB35C8];
                      v157 = *MEMORY[0x1E0CB2938];
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid settlingEffect flag: %@"), v116);
                      v113 = (id)objc_claimAutoreleasedReturnValue();
                      v158 = v113;
                      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1);
                      v101 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v100, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v101);
                      *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_133:
                      v32 = 0;
LABEL_146:

                      goto LABEL_147;
                    }
                  }
                }
                v106 = 0;
                v46 = v127 != 0;
                goto LABEL_66;
              }
              if (a5)
              {
                v41 = (void *)MEMORY[0x1E0CB35C8];
                v173 = *MEMORY[0x1E0CB2938];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Couldn't decode portraitLayout: %@"), v26);
                v127 = (void *)objc_claimAutoreleasedReturnValue();
                v174 = v127;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v174, &v173, 1);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                goto LABEL_45;
              }
              goto LABEL_46;
            }
            if (a5)
            {
              v37 = (void *)MEMORY[0x1E0CB35C8];
              v175 = *MEMORY[0x1E0CB2938];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid portraitLayout dictionary: %@"), v26);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v176 = v127;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v176, &v175, 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_45:
              *a5 = v39;

              v32 = 0;
LABEL_150:

              goto LABEL_151;
            }
          }
LABEL_46:
          v32 = 0;
          goto LABEL_151;
        }
        if (a5)
        {
          v36 = (void *)MEMORY[0x1E0CB35C8];
          v177 = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid properties dictionary: %@"), v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v178 = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v178, &v177, 1);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v128);
          v32 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_151;
        }
        v32 = 0;
LABEL_152:

        goto LABEL_153;
      }
      if (a5)
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v179 = *MEMORY[0x1E0CB2938];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported layer stack version: %@"), v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v180 = v25;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v180, &v179, 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v26);
        v34 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
        v32 = 0;
        *a5 = v34;
LABEL_151:

        goto LABEL_152;
      }
    }
    v32 = 0;
LABEL_153:

    goto LABEL_154;
  }
  if (a5)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v183 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to read layer stack contents: %@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v184, &v183, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.PhotosFormats"), 7, v25);
    v32 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_152;
  }
  v32 = 0;
LABEL_154:

  return v32;
}

uint64_t __75__PFParallaxLayerStackArchiver_saveCompoundLayerStack_toURL_options_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = LayerIDMatchesOptions(v3, *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __75__PFParallaxLayerStackArchiver_saveCompoundLayerStack_toURL_options_error___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32) & 0xFFFFFFFFFFFFFFBDLL;
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = LayerIDMatchesOptions(v3, v2);

  return v4;
}

os_signpost_id_t __42__PFParallaxLayerStackArchiver_initialize__block_invoke(uint64_t a1)
{
  os_log_t v2;
  void *v3;
  os_signpost_id_t result;

  v2 = os_log_create("com.apple.photos.PhotosFormats", "layerStackArchiver");
  v3 = (void *)s_log;
  s_log = (uint64_t)v2;

  result = os_signpost_id_make_with_pointer((os_log_t)s_log, *(const void **)(a1 + 32));
  s_signpost = result;
  return result;
}

@end
