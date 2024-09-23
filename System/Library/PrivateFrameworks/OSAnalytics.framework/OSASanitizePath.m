@implementation OSASanitizePath

void __OSASanitizePath_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
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
  id v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v0 = dispatch_queue_create("com.apple.osanalytics.sanitizer", 0);
  v1 = (void *)OSASanitizePath_domain_queue;
  OSASanitizePath_domain_queue = (uint64_t)v0;

  v2 = (void *)objc_opt_new();
  v24[0] = CFSTR("KPX");
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "addObject:", CFSTR("/var/mobile"));
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_72);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __OSASanitizePath_block_invoke_cold_1(v3);
  v24[1] = CFSTR("MSK");
  v25[0] = v3;
  v25[1] = CFSTR("/Users/USER");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("HomeDirectory"));

  v22[0] = CFSTR("KPX");
  getVolumes(0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("MSK");
  v23[0] = v5;
  v23[1] = CFSTR("/Volumes/NETWORK");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("NetworkVolume"));

  v20[0] = CFSTR("KPX");
  v7 = (void *)objc_opt_new();
  v20[1] = CFSTR("MSK");
  v21[0] = v7;
  v21[1] = &stru_1E4DEECB8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("SystemVolume"));

  v18[0] = CFSTR("KPX");
  v9 = (void *)objc_opt_new();
  v18[1] = CFSTR("MSK");
  v19[0] = v9;
  v19[1] = CFSTR("/Volumes/VOLUME");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("MountedVolume"));

  v16 = CFSTR("KPX");
  getVolumes(1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("StagedVolume"));

  v13 = (void *)OSASanitizePath_domainInfos;
  OSASanitizePath_domainInfos = (uint64_t)v2;
  v14 = v2;

  v15 = (void *)OSASanitizePath_orderedDomainList;
  OSASanitizePath_orderedDomainList = (uint64_t)&unk_1E4DFEEB8;

}

void __OSASanitizePath_block_invoke_33(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  __objc2_class *v14;
  uint64_t v15;
  char v16;
  __CFString *v17;
  char v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  id v34;
  __CFString *v35;
  uint64_t v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  int v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  __int128 v61;
  uint64_t v62;
  id v63;
  void *v64;
  __CFString *v65;
  uint64_t v66;
  __CFString *v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  stat buf;
  _QWORD v78[2];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __OSASanitizePath_block_invoke_33_cold_2(a1, v2, v3, v4, v5, v6, v7, v8);
  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v9 = (id)OSASanitizePath_orderedDomainList;
  v66 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
  if (v66)
  {
    v11 = a1 + 48;
    v12 = *(_QWORD *)v74;
    v13 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v10 = 138413058;
    v61 = v10;
    v14 = OSADiagnosticsReporterSupport;
    v62 = *(_QWORD *)v74;
    v63 = v9;
    v68 = a1 + 48;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v74 != v12)
          objc_enumerationMutation(v9);
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v11 + 8) + 40), *(id *)(*((_QWORD *)&v73 + 1) + 8 * v15));
        v16 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v11 + 8) + 40), "isEqualToString:", CFSTR("StagedVolume"));
        v17 = CFSTR("MountedVolume");
        if ((v16 & 1) == 0)
        {
          v18 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v11 + 8) + 40), "isEqualToString:", CFSTR("SystemVolume"));
          v17 = CFSTR("MountedVolume");
          if ((v18 & 1) == 0)
            v17 = *(__CFString **)(*(_QWORD *)(*(_QWORD *)v11 + 8) + 40);
        }
        v19 = v17;
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v13;
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          v31 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v11 + 8) + 40);
          if (v20)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v32 = objc_msgSend(v20, "BOOLValue");
            else
              v32 = 0;
          }
          else
          {
            v32 = 1;
          }
          buf.st_dev = v61;
          *(_QWORD *)&buf.st_mode = v31;
          WORD2(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v19;
          HIWORD(buf.st_gid) = 2112;
          *(_QWORD *)&buf.st_rdev = v20;
          LOWORD(buf.st_atimespec.tv_sec) = 1024;
          *(_DWORD *)((char *)&buf.st_atimespec.tv_sec + 2) = v32;
          _os_log_debug_impl(&dword_1A4D21000, v13, OS_LOG_TYPE_DEBUG, "evaluate domain %@ (%@) option %@ check %d", (uint8_t *)&buf, 0x26u);
          v12 = v62;
        }

        if (!v20 || (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v20, "BOOLValue"))
        {
          v65 = v19;
          -[__objc2_class_ro objectForKeyedSubscript:](v14[26].info, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v11 + 8) + 40), v61);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("KPX"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v23 = v22;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v70;
            while (2)
            {
              v27 = 0;
              do
              {
                if (*(_QWORD *)v70 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v27);
                if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
                {
                  v30 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v68 + 8) + 40);
                  buf.st_dev = 138412546;
                  *(_QWORD *)&buf.st_mode = v30;
                  WORD2(buf.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v28;
                  _os_log_debug_impl(&dword_1A4D21000, v13, OS_LOG_TYPE_DEBUG, "checking domain %@ prefix '%@'", (uint8_t *)&buf, 0x16u);
                }
                if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "hasPrefix:", v28))
                {
                  v29 = objc_msgSend(v28, "length");
                  if (v29 == objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "length")
                    || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "characterAtIndex:", objc_msgSend(v28, "length")) == 47)
                  {
                    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                      __OSASanitizePath_block_invoke_33_cold_1(v68, v38, v39, v40, v41, v42, v43, v44);
                    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "substringFromIndex:", objc_msgSend(v28, "length"));
                    v45 = objc_claimAutoreleasedReturnValue();
                    v46 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
                    v47 = *(void **)(v46 + 40);
                    *(_QWORD *)(v46 + 40) = v45;

                    v9 = v63;
                    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "isEqualToString:", CFSTR("StagedVolume")))
                    {
                      v48 = (void *)MEMORY[0x1E0CB3940];
                      v78[0] = v28;
                      v78[1] = CFSTR("System/Library/CoreServices/SystemVersion.plist");
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v78, 2);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "pathWithComponents:", v49);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v50, "length")
                        && (v51 = (const char *)objc_msgSend(objc_retainAutorelease(v50), "fileSystemRepresentation")) != 0)
                      {
                        memset(&buf, 0, sizeof(buf));
                        v52 = stat(v51, &buf);
                        v53 = CFSTR("MountedVolume");
                        if (!v52)
                          v53 = CFSTR("SystemVolume");
                        v67 = v53;
                        v35 = v53;
                        v34 = v28;
                        objc_msgSend((id)OSASanitizePath_domainInfos, "objectForKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v68 + 8) + 40));
                        v54 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("KPX"));
                        v55 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v55, "removeObject:", v34);
                        objc_msgSend((id)OSASanitizePath_domainInfos, "objectForKeyedSubscript:", v35);
                        v56 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("KPX"));
                        v57 = (void *)objc_claimAutoreleasedReturnValue();

                        objc_msgSend(v57, "addObject:", v34);
                        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v68 + 8) + 40), v67);

                      }
                      else
                      {
                        v34 = 0;
                        v35 = 0;
                      }
                      v58 = v64;

                    }
                    else
                    {
                      v34 = 0;
                      v35 = 0;
                      v58 = v64;
                    }

                    v37 = v65;
                    goto LABEL_50;
                  }
                }
                ++v27;
              }
              while (v25 != v27);
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
              if (v25)
                continue;
              break;
            }
          }

          v12 = v62;
          v9 = v63;
          v11 = a1 + 48;
          v19 = v65;
          v14 = OSADiagnosticsReporterSupport;
        }

        ++v15;
      }
      while (v15 != v66);
      v33 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
      v66 = v33;
    }
    while (v33);
  }
  v34 = 0;
  v35 = 0;
  v36 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v37 = *(__CFString **)(v36 + 40);
  *(_QWORD *)(v36 + 40) = 0;
LABEL_50:

  v59 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v59)
  {
    if (v35)
      objc_msgSend(v59, "isEqualToString:", v35);
  }
  else
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "hasPrefix:", CFSTR("/")))
      v60 = CFSTR("SystemVolume");
    else
      v60 = CFSTR("UnknownType");
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v60);
  }

}

void __OSASanitizePath_block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a1, "componentsJoinedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1A4D21000, MEMORY[0x1E0C81028], v1, "%@:\n%@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_2();
}

void __OSASanitizePath_block_invoke_33_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "found prefix in domain %@", a5, a6, a7, a8, 2u);
}

void __OSASanitizePath_block_invoke_33_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_1A4D21000, MEMORY[0x1E0C81028], a3, "search for matches in '%@'", a5, a6, a7, a8, 2u);
}

@end
