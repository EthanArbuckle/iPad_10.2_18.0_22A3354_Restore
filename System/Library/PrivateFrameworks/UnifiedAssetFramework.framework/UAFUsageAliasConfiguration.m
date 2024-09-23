@implementation UAFUsageAliasConfiguration

+ (id)supportedFileVersions
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("1.0.0");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)isValid:(id)a3 assetSetManager:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void **v53;
  uint64_t *v54;
  uint64_t v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void **v65;
  uint64_t *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void **v72;
  uint64_t *v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void **v82;
  uint64_t *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  NSObject *v87;
  const char *v88;
  NSObject *v89;
  uint32_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void **v95;
  uint64_t *v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  NSObject *v102;
  void *context;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  NSObject *v111;
  void *v112;
  NSObject *obj;
  void *v114;
  void *v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;
  void *v133;
  _QWORD v134[2];
  _QWORD v135[2];
  uint8_t v136[128];
  uint8_t buf[4];
  const char *v138;
  __int16 v139;
  void *v140;
  __int16 v141;
  void *v142;
  __int16 v143;
  void *v144;
  __int16 v145;
  void *v146;
  uint64_t v147;
  void *v148;
  _QWORD v149[2];
  _QWORD v150[2];
  _BYTE v151[128];
  uint64_t v152;
  void *v153;
  _QWORD v154[2];
  _QWORD v155[2];
  _BYTE v156[128];
  uint64_t v157;
  void *v158;
  _QWORD v159[2];
  _QWORD v160[2];
  uint64_t v161;
  void *v162;
  _QWORD v163[2];
  _QWORD v164[2];
  _BYTE v165[128];
  uint64_t v166;

  v166 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  +[UAFUsageAliasConfiguration supportedFileVersions](UAFUsageAliasConfiguration, "supportedFileVersions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[UAFConfiguration isValid:fileType:fileVersions:error:](UAFConfiguration, "isValid:fileType:fileVersions:error:", v7, CFSTR("UsageAliasConfiguration"), v9, a5);

  if (!v10)
    goto LABEL_59;
  if (!+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("UsageAliasName"), objc_opt_class(), 1, a5)|| !+[UAFConfiguration isValidValue:key:kind:required:error:](UAFConfiguration, "isValidValue:key:kind:required:error:", v7, CFSTR("UsageAliasValues"), objc_opt_class(), 1, a5))
  {
    LOBYTE(v10) = 0;
    goto LABEL_59;
  }
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UsageAliasValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v128, v165, 16);
  if (!v12)
  {
    LOBYTE(v10) = 1;
    goto LABEL_58;
  }
  v13 = *(_QWORD *)v129;
  v107 = *(_QWORD *)v129;
  while (2)
  {
    v14 = 0;
    v108 = v12;
    do
    {
      if (*(_QWORD *)v129 != v13)
        objc_enumerationMutation(v11);
      v110 = v14;
      v15 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v14);
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UsageAliasValues"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v115 = v15;
      if ((isKindOfClass & 1) == 0)
      {
        if (a5)
        {
          v61 = (void *)MEMORY[0x24BDD1540];
          if (*a5)
          {
            v163[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageAliasValues entry for \"%@\" is not expected kind \"%@\"), v15, objc_opt_class());
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v163[1] = *MEMORY[0x24BDD1398];
            v63 = *a5;
            v164[0] = v62;
            v164[1] = v63;
            v64 = (void *)MEMORY[0x24BDBCE70];
            v65 = (void **)v164;
            v66 = v163;
            v67 = 2;
          }
          else
          {
            v161 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageAliasValues entry for \"%@\" is not expected kind \"%@\"), v15, objc_opt_class());
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v162 = v62;
            v64 = (void *)MEMORY[0x24BDBCE70];
            v65 = &v162;
            v66 = &v161;
            v67 = 1;
          }
          objc_msgSend(v64, "dictionaryWithObjects:forKeys:count:", v65, v66, v67);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v85);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v15 = v115;
        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          goto LABEL_57;
        v86 = (void *)objc_opt_class();
        *(_DWORD *)buf = 136315650;
        v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
        v139 = 2112;
        v140 = v15;
        v141 = 2112;
        v142 = v86;
        v87 = v86;
        v88 = "%s UsageAliasValues entry for \"%@\" is not expected kind \"%@\";
        v89 = v20;
        v90 = 32;
        goto LABEL_77;
      }
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("UsageAliasValues"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", v15);
      v20 = objc_claimAutoreleasedReturnValue();

      if (!-[NSObject count](v20, "count"))
      {
        if (a5)
        {
          v68 = (void *)MEMORY[0x24BDD1540];
          if (*a5)
          {
            v159[0] = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageAliasValues asset sets for \"%@\" has no values"), v15);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v159[1] = *MEMORY[0x24BDD1398];
            v70 = *a5;
            v160[0] = v69;
            v160[1] = v70;
            v71 = (void *)MEMORY[0x24BDBCE70];
            v72 = (void **)v160;
            v73 = v159;
            v74 = 2;
          }
          else
          {
            v157 = *MEMORY[0x24BDD0FC8];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageAliasValues asset sets for \"%@\" has no values"), v15);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v158 = v69;
            v71 = (void *)MEMORY[0x24BDBCE70];
            v72 = &v158;
            v73 = &v157;
            v74 = 1;
          }
          objc_msgSend(v71, "dictionaryWithObjects:forKeys:count:", v72, v73, v74);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v91);
          *a5 = (id)objc_claimAutoreleasedReturnValue();

          v15 = v115;
        }
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v87 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
          goto LABEL_78;
        *(_DWORD *)buf = 136315394;
        v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
        v139 = 2112;
        v140 = v15;
        v88 = "%s UsageAliasValues asset sets for \"%@\" has no values";
        v89 = v87;
        v90 = 22;
LABEL_77:
        _os_log_impl(&dword_229282000, v89, OS_LOG_TYPE_DEFAULT, v88, buf, v90);
LABEL_78:

LABEL_57:
        LOBYTE(v10) = 0;
        goto LABEL_58;
      }
      v126 = 0u;
      v127 = 0u;
      v124 = 0u;
      v125 = 0u;
      v20 = v20;
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v124, v156, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v125;
        v111 = v20;
        v112 = v11;
        v105 = *(_QWORD *)v125;
        while (2)
        {
          v23 = 0;
          v106 = v21;
          do
          {
            if (*(_QWORD *)v125 != v22)
              objc_enumerationMutation(v20);
            v109 = v23;
            v24 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * v23);
            -[NSObject objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v26 = objc_opt_isKindOfClass();

            if ((v26 & 1) == 0)
            {
              if (a5)
              {
                v75 = v24;
                v76 = v20;
                v77 = v8;
                v78 = (void *)MEMORY[0x24BDD1540];
                if (*a5)
                {
                  v154[0] = *MEMORY[0x24BDD0FC8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageAliasValues usages for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"), v24, v115, objc_opt_class());
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  v154[1] = *MEMORY[0x24BDD1398];
                  v80 = *a5;
                  v155[0] = v79;
                  v155[1] = v80;
                  v81 = (void *)MEMORY[0x24BDBCE70];
                  v82 = (void **)v155;
                  v83 = v154;
                  v84 = 2;
                }
                else
                {
                  v152 = *MEMORY[0x24BDD0FC8];
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageAliasValues usages for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"), v24, v115, objc_opt_class());
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  v153 = v79;
                  v81 = (void *)MEMORY[0x24BDBCE70];
                  v82 = &v153;
                  v83 = &v152;
                  v84 = 1;
                }
                objc_msgSend(v81, "dictionaryWithObjects:forKeys:count:", v82, v83, v84);
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v98);
                *a5 = (id)objc_claimAutoreleasedReturnValue();

                v8 = v77;
                v20 = v76;
                v24 = v75;
              }
              UAFGetLogCategory((id *)&UAFLogContextConfiguration);
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                v99 = (void *)objc_opt_class();
                *(_DWORD *)buf = 136315906;
                v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
                v139 = 2112;
                v140 = v24;
                v141 = 2112;
                v142 = v115;
                v143 = 2112;
                v144 = v99;
                v100 = v99;
                _os_log_impl(&dword_229282000, v28, OS_LOG_TYPE_DEFAULT, "%s UsageAliasValues usages for asset set \"%@\" for value \"%@\" is not expected kind \"%@\", buf, 0x2Au);

              }
              goto LABEL_56;
            }
            v114 = v24;
            -[NSObject objectForKeyedSubscript:](v20, "objectForKeyedSubscript:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = 0u;
            v121 = 0u;
            v122 = 0u;
            v123 = 0u;
            v28 = v27;
            v29 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v120, v151, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v121;
              while (2)
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v121 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * i);
                  -[NSObject objectForKeyedSubscript:](v28, "objectForKeyedSubscript:", v33);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v35 = objc_opt_isKindOfClass();

                  if ((v35 & 1) == 0)
                  {
                    if (a5)
                    {
                      v48 = v8;
                      v49 = (void *)MEMORY[0x24BDD1540];
                      if (*a5)
                      {
                        v149[0] = *MEMORY[0x24BDD0FC8];
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageAliasValues usage value for usage \"%@\" for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"), v33, v114, v115, objc_opt_class());
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
                        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageAliasValues usage value for usage \"%@\" for asset set \"%@\" for value \"%@\" is not expected kind \"%@\"), v33, v114, v115, objc_opt_class());
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        v148 = v50;
                        v52 = (void *)MEMORY[0x24BDBCE70];
                        v53 = &v148;
                        v54 = &v147;
                        v55 = 1;
                      }
                      objc_msgSend(v52, "dictionaryWithObjects:forKeys:count:", v53, v54, v55);
                      v56 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v56);
                      *a5 = (id)objc_claimAutoreleasedReturnValue();

                      v8 = v48;
                    }
                    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
                    v57 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                    {
                      v58 = (void *)objc_opt_class();
                      *(_DWORD *)buf = 136316162;
                      v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
                      v139 = 2112;
                      v140 = v33;
                      v141 = 2112;
                      v142 = v114;
                      v143 = 2112;
                      v144 = v115;
                      v145 = 2112;
                      v146 = v58;
                      v59 = v58;
                      _os_log_impl(&dword_229282000, v57, OS_LOG_TYPE_DEFAULT, "%s UsageAliasValues usage value for usage \"%@\" for asset set \"%@\" for value \"%@\" is not expected kind \"%@\", buf, 0x34u);

                    }
                    v20 = v111;
                    goto LABEL_56;
                  }
                }
                v30 = -[NSObject countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v120, v151, 16);
                v15 = v115;
                if (v30)
                  continue;
                break;
              }
            }

            if (v8)
            {
              v36 = MEMORY[0x22E2C6BC8]();
              objc_msgSend(v8, "getAssetSet:", v114);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              context = (void *)v36;
              if (v37)
              {
                v38 = 0;
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UsageAliasValues asset set \"%@\" for value \"%@\" can't be found"), v114, v15);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
              }
              v104 = v8;
              v118 = 0u;
              v119 = 0u;
              v116 = 0u;
              v117 = 0u;
              obj = v28;
              v39 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
              if (v39)
              {
                v40 = v39;
                v41 = *(_QWORD *)v117;
LABEL_31:
                v42 = 0;
                while (1)
                {
                  if (*(_QWORD *)v117 != v41)
                    objc_enumerationMutation(obj);
                  if (v38)
                    break;
                  v43 = *(_QWORD *)(*((_QWORD *)&v116 + 1) + 8 * v42);
                  objc_msgSend(v37, "usageTypes");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = objc_msgSend(v44, "containsObject:", v43);

                  if ((v45 & 1) != 0)
                  {
                    v38 = 0;
                  }
                  else
                  {
                    v46 = (void *)MEMORY[0x24BDD17C8];
                    objc_msgSend(v37, "usageTypes");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "stringWithFormat:", CFSTR("UsageAliasValues usage \"%@\" in asset set \"%@\" for value \"%@\" not in valid usage types for set \"%@\"), v43, v114, v115, v47, context);
                    v38 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  if (v40 == ++v42)
                  {
                    v40 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v116, v136, 16);
                    if (v40)
                      goto LABEL_31;
                    break;
                  }
                }
              }

              objc_autoreleasePoolPop(context);
              v8 = v104;
              v15 = v115;
              if (v38)
              {
                if (a5)
                {
                  v92 = (void *)MEMORY[0x24BDD1540];
                  if (*a5)
                  {
                    v134[0] = *MEMORY[0x24BDD0FC8];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v38);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    v134[1] = *MEMORY[0x24BDD1398];
                    v135[0] = v93;
                    v135[1] = *a5;
                    v94 = (void *)MEMORY[0x24BDBCE70];
                    v95 = (void **)v135;
                    v96 = v134;
                    v97 = 2;
                  }
                  else
                  {
                    v132 = *MEMORY[0x24BDD0FC8];
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v38);
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    v133 = v93;
                    v94 = (void *)MEMORY[0x24BDBCE70];
                    v95 = &v133;
                    v96 = &v132;
                    v97 = 1;
                  }
                  objc_msgSend(v94, "dictionaryWithObjects:forKeys:count:", v95, v96, v97);
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v101);
                  *a5 = (id)objc_claimAutoreleasedReturnValue();

                  v8 = v104;
                }
                UAFGetLogCategory((id *)&UAFLogContextConfiguration);
                v102 = objc_claimAutoreleasedReturnValue();
                v20 = v111;
                if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315394;
                  v138 = "+[UAFUsageAliasConfiguration isValid:assetSetManager:error:]";
                  v139 = 2112;
                  v140 = v38;
                  _os_log_impl(&dword_229282000, v102, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
                }

                v28 = obj;
LABEL_56:

                v11 = v112;
                goto LABEL_57;
              }
            }

            v23 = v109 + 1;
            v22 = v105;
            v20 = v111;
            v11 = v112;
          }
          while (v109 + 1 != v106);
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v111, "countByEnumeratingWithState:objects:count:", &v124, v156, 16);
          if (v21)
            continue;
          break;
        }
      }

      v14 = v110 + 1;
      v13 = v107;
    }
    while (v110 + 1 != v108);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v128, v165, 16);
    LOBYTE(v10) = 1;
    if (v12)
      continue;
    break;
  }
LABEL_58:

LABEL_59:
  return v10;
}

+ (id)fromContentsOfURL:(id)a3 assetSetManager:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void **v16;
  uint64_t *v17;
  uint64_t v18;
  UAFUsageAliasConfiguration *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  void *v31;
  id v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (a5)
    *a5 = 0;
  v33 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v7, &v33);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v33;
  v11 = v10;
  if (a5)
  {
    v12 = objc_retainAutorelease(v10);
    *a5 = v12;
    if (v9)
    {
      if (!+[UAFUsageAliasConfiguration isValid:assetSetManager:error:](UAFUsageAliasConfiguration, "isValid:assetSetManager:error:", v9, v8, a5))
      {
        v13 = (void *)MEMORY[0x24BDD1540];
        if (*a5)
        {
          v36[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to validate UAFUsageAliasConfiguration dictionary from \"%@\"), v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v36[1] = *MEMORY[0x24BDD1398];
          v37[0] = v14;
          v37[1] = *a5;
          v15 = (void *)MEMORY[0x24BDBCE70];
          v16 = (void **)v37;
          v17 = v36;
          v18 = 2;
        }
        else
        {
          v34 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to validate UAFUsageAliasConfiguration dictionary from \"%@\"), v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v14;
          v15 = (void *)MEMORY[0x24BDBCE70];
          v16 = &v35;
          v17 = &v34;
          v18 = 1;
        }
        objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, v18);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v31);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_19;
      }
      goto LABEL_10;
    }
    v20 = (void *)MEMORY[0x24BDD1540];
    if (v12)
    {
      v46[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to load UAFUsageAliasConfiguration dictionary from \"%@\": %@"), v7, v12);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v46[1] = *MEMORY[0x24BDD1398];
      v47[0] = v21;
      v47[1] = *a5;
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = (void **)v47;
      v24 = v46;
      v25 = 2;
    }
    else
    {
      v44 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Failed to load UAFUsageAliasConfiguration dictionary from \"%@\": %@"), v7, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v21;
      v22 = (void *)MEMORY[0x24BDBCE70];
      v23 = &v45;
      v24 = &v44;
      v25 = 1;
    }
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v26);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
LABEL_20:

      v19 = 0;
      goto LABEL_21;
    }
    *(_DWORD *)buf = 136315650;
    v39 = "+[UAFUsageAliasConfiguration fromContentsOfURL:assetSetManager:error:]";
    v40 = 2112;
    v41 = v7;
    v42 = 2112;
    v43 = v11;
    v28 = "%s Failed to load UAFUsageAliasConfiguration dictionary from \"%@\": %@";
    v29 = v27;
    v30 = 32;
LABEL_23:
    _os_log_error_impl(&dword_229282000, v29, OS_LOG_TYPE_ERROR, v28, buf, v30);
    goto LABEL_20;
  }
  if (!v9)
    goto LABEL_15;
  if (!+[UAFUsageAliasConfiguration isValid:assetSetManager:error:](UAFUsageAliasConfiguration, "isValid:assetSetManager:error:", v9, v8, 0))
  {
LABEL_19:
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v27 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      goto LABEL_20;
    *(_DWORD *)buf = 136315394;
    v39 = "+[UAFUsageAliasConfiguration fromContentsOfURL:assetSetManager:error:]";
    v40 = 2112;
    v41 = v7;
    v28 = "%s Failed to validate UAFUsageAliasConfiguration dictionary from \"%@\";
    v29 = v27;
    v30 = 22;
    goto LABEL_23;
  }
LABEL_10:
  v19 = -[UAFUsageAliasConfiguration initWithDictionary:assetSetManager:]([UAFUsageAliasConfiguration alloc], "initWithDictionary:assetSetManager:", v9, v8);
LABEL_21:

  return v19;
}

- (UAFUsageAliasConfiguration)initWithDictionary:(id)a3 assetSetManager:(id)a4
{
  id v6;
  id v7;
  UAFUsageAliasConfiguration *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSDictionary *values;
  UAFUsageAliasConfiguration *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)UAFUsageAliasConfiguration;
  v8 = -[UAFUsageAliasConfiguration init](&v15, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UsageAliasName"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UsageAliasValues"));
    v11 = objc_claimAutoreleasedReturnValue();
    values = v8->_values;
    v8->_values = (NSDictionary *)v11;

    objc_storeStrong((id *)&v8->_assetSetManager, a4);
    v13 = v8;
  }

  return v8;
}

- (id)getTrialAssets:(id)a3
{
  return -[UAFUsageAliasConfiguration getAssets:withSource:](self, "getAssets:withSource:", a3, CFSTR("Trial"));
}

- (id)getAutoAssets:(id)a3
{
  return -[UAFUsageAliasConfiguration getAssets:withSource:](self, "getAssets:withSource:", a3, CFSTR("AutoAsset"));
}

- (id)getAssets:(id)a3
{
  return -[UAFUsageAliasConfiguration getAssets:withSource:](self, "getAssets:withSource:", a3, CFSTR("All"));
}

- (id)getAssetSetAssets:(id)a3 usageValue:(id)a4 withSource:(id)a5
{
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  int v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  NSObject *v33;
  __int16 v34;
  NSObject *v35;
  __int16 v36;
  NSObject *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[UAFUsageAliasConfiguration values](self, "values");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[UAFUsageAliasConfiguration assetSetManager](self, "assetSetManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[UAFUsageAliasConfiguration assetSetManager](self, "assetSetManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "getAssetSet:", v8);
      v15 = objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        UAFGetLogCategory((id *)&UAFLogContextConfiguration);
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          -[UAFUsageAliasConfiguration name](self, "name");
          v25 = objc_claimAutoreleasedReturnValue();
          v28 = 136316162;
          v29 = "-[UAFUsageAliasConfiguration getAssetSetAssets:usageValue:withSource:]";
          v30 = 2112;
          v31 = v10;
          v32 = 2112;
          v33 = v9;
          v34 = 2112;
          v35 = v25;
          v36 = 2112;
          v37 = v8;
          _os_log_impl(&dword_229282000, v24, OS_LOG_TYPE_DEFAULT, "%s Can't get %@ assets for usage value \"%@\" in usage alias \"%@\": Unable to get asset config for asset set \"%@\", (uint8_t *)&v28, 0x34u);

        }
        v15 = 0;
        goto LABEL_15;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("AutoAsset")))
      {
        -[UAFUsageAliasConfiguration values](self, "values");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject getAutoAssets:](v15, "getAutoAssets:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v26 = (void *)v19;

        goto LABEL_21;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("Trial")))
      {
        -[UAFUsageAliasConfiguration values](self, "values");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject getTrialAssets:](v15, "getTrialAssets:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if (objc_msgSend(v10, "isEqualToString:", CFSTR("All")))
      {
        -[UAFUsageAliasConfiguration values](self, "values");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject getAssets:](v15, "getAssets:", v18);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      UAFGetLogCategory((id *)&UAFLogContextConfiguration);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v28 = 136315650;
        v29 = "-[UAFUsageAliasConfiguration getAssetSetAssets:usageValue:withSource:]";
        v30 = 2112;
        v31 = v10;
        v32 = 2112;
        v33 = v8;
        _os_log_error_impl(&dword_229282000, v20, OS_LOG_TYPE_ERROR, "%s Unknown asset source %@ for %@", (uint8_t *)&v28, 0x20u);
      }
      goto LABEL_11;
    }
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[UAFUsageAliasConfiguration name](self, "name");
      v20 = objc_claimAutoreleasedReturnValue();
      v28 = 136315650;
      v29 = "-[UAFUsageAliasConfiguration getAssetSetAssets:usageValue:withSource:]";
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v20;
      v21 = "%s Can't get %@ assets: No asset manager present usage alias \"%@\";
      v22 = v15;
      v23 = 32;
      goto LABEL_10;
    }
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextConfiguration);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[UAFUsageAliasConfiguration name](self, "name");
      v20 = objc_claimAutoreleasedReturnValue();
      v28 = 136315906;
      v29 = "-[UAFUsageAliasConfiguration getAssetSetAssets:usageValue:withSource:]";
      v30 = 2112;
      v31 = v10;
      v32 = 2112;
      v33 = v9;
      v34 = 2112;
      v35 = v20;
      v21 = "%s Can't get %@ assets: Unknown usage value \"%@\" in usage alias \"%@\";
      v22 = v15;
      v23 = 42;
LABEL_10:
      _os_log_impl(&dword_229282000, v22, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v28, v23);
LABEL_11:

    }
  }
LABEL_15:
  v26 = 0;
LABEL_21:

  return v26;
}

- (id)getAssets:(id)a3 withSource:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  UAFUsageAliasConfiguration *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v22 = self;
  v23 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[UAFUsageAliasConfiguration values](self, "values");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v6;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v8);
        -[UAFUsageAliasConfiguration getAssetSetAssets:usageValue:withSource:](v22, "getAssetSetAssets:usageValue:withSource:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v24, v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v15; ++j)
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              if (!v11)
                v11 = (void *)objc_opt_new();
              objc_msgSend(v13, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v18);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v15);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)values
{
  return self->_values;
}

- (void)setValues:(id)a3
{
  objc_storeStrong((id *)&self->_values, a3);
}

- (UAFConfigurationManager)assetSetManager
{
  return self->_assetSetManager;
}

- (void)setAssetSetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetSetManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSetManager, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
