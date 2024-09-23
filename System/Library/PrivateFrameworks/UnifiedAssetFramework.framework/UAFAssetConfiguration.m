@implementation UAFAssetConfiguration

+ (BOOL)isValid:(id)a3 validUsageTypes:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void **v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void **v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void **v40;
  uint64_t *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void **v53;
  uint64_t *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void **v63;
  uint64_t *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void **v71;
  uint64_t *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void **v81;
  uint64_t *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void **v88;
  uint64_t *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void **v96;
  uint64_t *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  void *v121;
  _QWORD v122[2];
  _QWORD v123[2];
  uint8_t buf[4];
  const char *v125;
  __int16 v126;
  void *v127;
  __int16 v128;
  void *v129;
  uint64_t v130;
  void *v131;
  _QWORD v132[2];
  _QWORD v133[2];
  _BYTE v134[128];
  uint64_t v135;
  void *v136;
  _QWORD v137[2];
  _QWORD v138[2];
  uint64_t v139;
  void *v140;
  _QWORD v141[2];
  _QWORD v142[2];
  uint64_t v143;
  void *v144;
  _QWORD v145[2];
  _QWORD v146[2];
  uint64_t v147;
  void *v148;
  _QWORD v149[2];
  _QWORD v150[2];
  uint64_t v151;
  void *v152;
  _QWORD v153[2];
  _QWORD v154[2];
  uint64_t v155;
  void *v156;
  _QWORD v157[2];
  _QWORD v158[2];
  uint64_t v159;
  void *v160;
  _QWORD v161[2];
  _QWORD v162[4];

  v162[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("AssetName"), objc_opt_class(), 1, a5))
  {
    if (a5)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      if (*a5)
      {
        v161[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown Asset is invalid"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v161[1] = *MEMORY[0x24BDD1398];
        v162[0] = v22;
        v162[1] = *a5;
        v23 = (void *)MEMORY[0x24BDBCE70];
        v24 = (void **)v162;
        v25 = v161;
        v26 = 2;
      }
      else
      {
        v159 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown Asset is invalid"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = v22;
        v23 = (void *)MEMORY[0x24BDBCE70];
        v24 = &v160;
        v25 = &v159;
        v26 = 1;
      }
      objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, v26);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v43);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
      _os_log_impl(&dword_229282000, v15, OS_LOG_TYPE_DEFAULT, "%s Unknown Asset is invalid", buf, 0xCu);
    }
    goto LABEL_77;
  }
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("TrialNamespace"), objc_opt_class(), 0, a5))
  {
    if (a5)
    {
      v27 = (void *)MEMORY[0x24BDD1540];
      if (*a5)
      {
        v157[0] = *MEMORY[0x24BDD0FC8];
        v28 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v157[1] = *MEMORY[0x24BDD1398];
        v158[0] = v30;
        v158[1] = *a5;
        v31 = (void *)MEMORY[0x24BDBCE70];
        v32 = (void **)v158;
        v33 = v157;
        v34 = 2;
      }
      else
      {
        v155 = *MEMORY[0x24BDD0FC8];
        v44 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v156 = v30;
        v31 = (void *)MEMORY[0x24BDBCE70];
        v32 = &v156;
        v33 = &v155;
        v34 = 1;
      }
      objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, v34);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v45);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_77;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
    v126 = 2112;
    v127 = v46;
    goto LABEL_76;
  }
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("TrialMAAssetType"), objc_opt_class(), 0, a5))
  {
    if (a5)
    {
      v35 = (void *)MEMORY[0x24BDD1540];
      if (*a5)
      {
        v153[0] = *MEMORY[0x24BDD0FC8];
        v36 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v153[1] = *MEMORY[0x24BDD1398];
        v154[0] = v38;
        v154[1] = *a5;
        v39 = (void *)MEMORY[0x24BDBCE70];
        v40 = (void **)v154;
        v41 = v153;
        v42 = 2;
      }
      else
      {
        v151 = *MEMORY[0x24BDD0FC8];
        v56 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v152 = v38;
        v39 = (void *)MEMORY[0x24BDBCE70];
        v40 = &v152;
        v41 = &v151;
        v42 = 1;
      }
      objc_msgSend(v39, "dictionaryWithObjects:forKeys:count:", v40, v41, v42);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v57);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_77;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
    v126 = 2112;
    v127 = v46;
    goto LABEL_76;
  }
  v9 = 0;
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("IgnoreOSCompatibility"), objc_opt_class(), 0, a5))goto LABEL_79;
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("TrialMATargetingTemplate"), objc_opt_class(), 0, a5))
  {
    if (a5)
    {
      v47 = (void *)MEMORY[0x24BDD1540];
      if (*a5)
      {
        v149[0] = *MEMORY[0x24BDD0FC8];
        v48 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v149[1] = *MEMORY[0x24BDD1398];
        v51 = *a5;
        v150[0] = v50;
        v150[1] = v51;
        v52 = (void *)MEMORY[0x24BDBCE70];
        v53 = (void **)v150;
        v54 = v149;
        v55 = 2;
      }
      else
      {
        v147 = *MEMORY[0x24BDD0FC8];
        v74 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = v50;
        v52 = (void *)MEMORY[0x24BDBCE70];
        v53 = &v148;
        v54 = &v147;
        v55 = 1;
      }
      objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, v55);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v75);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_77;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
    v126 = 2112;
    v127 = v46;
    goto LABEL_76;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TrialMATargetingTemplate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TrialMATargetingTemplate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v11, CFSTR("MetadataAttribute"), objc_opt_class(), 1, a5);

    if (!v12)
    {
      if (a5)
      {
        v58 = (void *)MEMORY[0x24BDD1540];
        if (*a5)
        {
          v145[0] = *MEMORY[0x24BDD0FC8];
          v59 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v145[1] = *MEMORY[0x24BDD1398];
          v146[0] = v61;
          v146[1] = *a5;
          v62 = (void *)MEMORY[0x24BDBCE70];
          v63 = (void **)v146;
          v64 = v145;
          v65 = 2;
        }
        else
        {
          v143 = *MEMORY[0x24BDD0FC8];
          v99 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = v61;
          v62 = (void *)MEMORY[0x24BDBCE70];
          v63 = &v144;
          v64 = &v143;
          v65 = 1;
        }
        objc_msgSend(v62, "dictionaryWithObjects:forKeys:count:", v63, v64, v65);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v100);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      UAFGetLogCategory((id *)&UAFLogContextConfiguration);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_77;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
      v126 = 2112;
      v127 = v46;
      goto LABEL_76;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("TrialMATargetingTemplate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = +[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v13, CFSTR("ValueExpansion"), objc_opt_class(), 1, a5);

    if (!v14)
    {
      if (a5)
      {
        v76 = (void *)MEMORY[0x24BDD1540];
        if (*a5)
        {
          v141[0] = *MEMORY[0x24BDD0FC8];
          v77 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v141[1] = *MEMORY[0x24BDD1398];
          v142[0] = v79;
          v142[1] = *a5;
          v80 = (void *)MEMORY[0x24BDBCE70];
          v81 = (void **)v142;
          v82 = v141;
          v83 = 2;
        }
        else
        {
          v139 = *MEMORY[0x24BDD0FC8];
          v103 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v103, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v140 = v79;
          v80 = (void *)MEMORY[0x24BDBCE70];
          v81 = &v140;
          v82 = &v139;
          v83 = 1;
        }
        objc_msgSend(v80, "dictionaryWithObjects:forKeys:count:", v81, v82, v83);
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v104);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      UAFGetLogCategory((id *)&UAFLogContextConfiguration);
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        goto LABEL_77;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
      v126 = 2112;
      v127 = v46;
      goto LABEL_76;
    }
  }
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("Expansions"), objc_opt_class(), 0, a5))
  {
    if (a5)
    {
      v66 = (void *)MEMORY[0x24BDD1540];
      if (*a5)
      {
        v137[0] = *MEMORY[0x24BDD0FC8];
        v67 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v137[1] = *MEMORY[0x24BDD1398];
        v138[0] = v69;
        v138[1] = *a5;
        v70 = (void *)MEMORY[0x24BDBCE70];
        v71 = (void **)v138;
        v72 = v137;
        v73 = 2;
      }
      else
      {
        v135 = *MEMORY[0x24BDD0FC8];
        v101 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = v69;
        v70 = (void *)MEMORY[0x24BDBCE70];
        v71 = &v136;
        v72 = &v135;
        v73 = 1;
      }
      objc_msgSend(v70, "dictionaryWithObjects:forKeys:count:", v71, v72, v73);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v102);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_77;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
    v126 = 2112;
    v127 = v46;
LABEL_76:
    _os_log_impl(&dword_229282000, v15, OS_LOG_TYPE_DEFAULT, "%s Asset \"%@\" is invalid", buf, 0x16u);

LABEL_77:
    v9 = 0;
    goto LABEL_78;
  }
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Expansions"));
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
  if (!v16)
  {
    v9 = 1;
    goto LABEL_78;
  }
  v17 = v16;
  v18 = *(_QWORD *)v117;
  while (2)
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v117 != v18)
        objc_enumerationMutation(v15);
      v20 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a5)
        {
          v115 = (void *)MEMORY[0x24BDD1540];
          if (*a5)
          {
            v132[0] = *MEMORY[0x24BDD0FC8];
            v84 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "stringWithFormat:", CFSTR("Asset \"%@\" is not expected kind \"%@\"), v85, objc_opt_class());
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v132[1] = *MEMORY[0x24BDD1398];
            v133[0] = v86;
            v133[1] = *a5;
            v87 = (void *)MEMORY[0x24BDBCE70];
            v88 = (void **)v133;
            v89 = v132;
            v90 = 2;
          }
          else
          {
            v130 = *MEMORY[0x24BDD0FC8];
            v106 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "stringWithFormat:", CFSTR("Asset \"%@\" is not expected kind \"%@\"), v85, objc_opt_class());
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v131 = v86;
            v87 = (void *)MEMORY[0x24BDBCE70];
            v88 = &v131;
            v89 = &v130;
            v90 = 1;
          }
          objc_msgSend(v87, "dictionaryWithObjects:forKeys:count:", v88, v89, v90);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v107);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v108 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = (void *)objc_opt_class();
          *(_DWORD *)buf = 136315650;
          v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
          v126 = 2112;
          v127 = v109;
          v128 = 2112;
          v129 = v110;
          v111 = v110;
          _os_log_impl(&dword_229282000, v108, OS_LOG_TYPE_DEFAULT, "%s Asset \"%@\" is not expected kind \"%@\", buf, 0x20u);

        }
        goto LABEL_88;
      }
      if (!+[UAFAssetExpansion isValid:validUsageTypes:error:](UAFAssetExpansion, "isValid:validUsageTypes:error:", v20, v8, a5))
      {
        if (a5)
        {
          v91 = (void *)MEMORY[0x24BDD1540];
          if (*a5)
          {
            v122[0] = *MEMORY[0x24BDD0FC8];
            v92 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v92, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v122[1] = *MEMORY[0x24BDD1398];
            v123[0] = v94;
            v123[1] = *a5;
            v95 = (void *)MEMORY[0x24BDBCE70];
            v96 = (void **)v123;
            v97 = v122;
            v98 = 2;
          }
          else
          {
            v120 = *MEMORY[0x24BDD0FC8];
            v112 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "stringWithFormat:", CFSTR("Asset \"%@\" is invalid"), v93);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = v94;
            v95 = (void *)MEMORY[0x24BDBCE70];
            v96 = &v121;
            v97 = &v120;
            v98 = 1;
          }
          objc_msgSend(v95, "dictionaryWithObjects:forKeys:count:", v96, v97, v98);
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v113);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v108 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AssetName"));
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v125 = "+[UAFAssetConfiguration isValid:validUsageTypes:error:]";
          v126 = 2112;
          v127 = v114;
          _os_log_impl(&dword_229282000, v108, OS_LOG_TYPE_DEFAULT, "%s Asset \"%@\" is invalid", buf, 0x16u);

        }
LABEL_88:

        goto LABEL_77;
      }
    }
    v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v116, v134, 16);
    v9 = 1;
    if (v17)
      continue;
    break;
  }
LABEL_78:

LABEL_79:
  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)trialNamespace
{
  return self->_trialNamespace;
}

- (NSString)trialMAAssetType
{
  return self->_trialMAAssetType;
}

- (id)getTrialFactorName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UAFAssetConfiguration expansions](self, "expansions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "getTrialFactorName:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)getAutoAssetSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UAFAssetConfiguration expansions](self, "expansions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "getAutoAssetSpecifier:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (NSArray)expansions
{
  return self->_expansions;
}

- (UAFAssetConfiguration)initWithDictionary:(id)a3
{
  id v4;
  UAFAssetConfiguration *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *trialNamespace;
  uint64_t v10;
  NSString *trialMAAssetType;
  uint64_t v12;
  NSDictionary *trialMATargetingTemplate;
  void *v14;
  NSArray *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UAFAssetExpansion *v21;
  NSArray *expansions;
  UAFAssetConfiguration *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)UAFAssetConfiguration;
  v5 = -[UAFAssetConfiguration init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AssetName"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrialNamespace"));
    v8 = objc_claimAutoreleasedReturnValue();
    trialNamespace = v5->_trialNamespace;
    v5->_trialNamespace = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrialMAAssetType"));
    v10 = objc_claimAutoreleasedReturnValue();
    trialMAAssetType = v5->_trialMAAssetType;
    v5->_trialMAAssetType = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TrialMATargetingTemplate"));
    v12 = objc_claimAutoreleasedReturnValue();
    trialMATargetingTemplate = v5->_trialMATargetingTemplate;
    v5->_trialMATargetingTemplate = (NSDictionary *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("IgnoreOSCompatibility"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_ignoreOSCompatibility = objc_msgSend(v14, "BOOLValue");
    v15 = (NSArray *)objc_opt_new();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Expansions"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v26;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v26 != v19)
            objc_enumerationMutation(v16);
          v21 = -[UAFAssetExpansion initWithDictionary:]([UAFAssetExpansion alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v20));
          -[NSArray addObject:](v15, "addObject:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v18);
    }

    expansions = v5->_expansions;
    v5->_expansions = v15;

    v23 = v5;
  }

  return v5;
}

- (id)getTrialFactorFallbackName:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UAFAssetConfiguration expansions](self, "expansions", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "getTrialFactorFallbackName:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialMATargetingTemplate, 0);
  objc_storeStrong((id *)&self->_expansions, 0);
  objc_storeStrong((id *)&self->_trialMAAssetType, 0);
  objc_storeStrong((id *)&self->_trialNamespace, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setTrialNamespace:(id)a3
{
  objc_storeStrong((id *)&self->_trialNamespace, a3);
}

- (void)setTrialMAAssetType:(id)a3
{
  objc_storeStrong((id *)&self->_trialMAAssetType, a3);
}

- (BOOL)ignoreOSCompatibility
{
  return self->_ignoreOSCompatibility;
}

- (void)setIgnoreOSCompatibility:(BOOL)a3
{
  self->_ignoreOSCompatibility = a3;
}

- (void)setExpansions:(id)a3
{
  objc_storeStrong((id *)&self->_expansions, a3);
}

- (NSDictionary)trialMATargetingTemplate
{
  return self->_trialMATargetingTemplate;
}

- (void)setTrialMATargetingTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_trialMATargetingTemplate, a3);
}

@end
