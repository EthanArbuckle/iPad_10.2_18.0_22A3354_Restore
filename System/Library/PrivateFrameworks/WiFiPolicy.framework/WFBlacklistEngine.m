@implementation WFBlacklistEngine

- (unint64_t)getBlacklistedNetworkCount
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v2 = self->_blacklist;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        v9 = v5;
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v2);
        v5 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * i);

        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(v5, "blacklistedStatesCurrent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v20;
LABEL_8:
          v14 = 0;
          while (1)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "blacklistedState"))
              break;
            if (v12 == ++v14)
            {
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
              if (v12)
                goto LABEL_8;
              break;
            }
          }
        }

      }
      v6 += v4;
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v4);

  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s count:%lu"), "-[WFBlacklistEngine getBlacklistedNetworkCount]", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v28 = v17;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
  return v6;
}

- (void)removeBlacklistedStateWithUnblacklistType:(unint64_t)a3
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  int v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  _BOOL4 v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  _BOOL4 v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  void *v73;
  char v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  NSMutableArray *obj;
  int v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  void *v85;
  WFBlacklistEngine *v86;
  void *v87;
  _QWORD v88[4];
  id v89;
  unint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _QWORD v99[4];
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t buf[4];
  uint64_t v106;
  __int16 v107;
  uint64_t v108;
  __int16 v109;
  uint64_t v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  void *v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;
  v87 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s discardedNodes is null"), "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_76;
    goto LABEL_77;
  }
  v8 = 0x1E0CB3000uLL;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s discardedBlacklistNodes is null"), "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_76:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v76), "UTF8String"));
      v77 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v106 = objc_msgSend(v77, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
LABEL_77:

    goto LABEL_72;
  }
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = self->_blacklist;
  v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
  v9 = 0;
  if (!v82)
    goto LABEL_64;
  v10 = 0;
  v81 = *(_QWORD *)v102;
  v11 = MEMORY[0x1E0C81028];
  v78 = v7;
  v86 = self;
  do
  {
    v12 = 0;
    v13 = v10;
    do
    {
      if (*(_QWORD *)v102 != v81)
        objc_enumerationMutation(obj);
      v84 = v12;
      v10 = *(id *)(*((_QWORD *)&v101 + 1) + 8 * v12);

      if (a3 == 1)
      {
        objc_msgSend(v10, "blacklistTriggers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removeAllObjects");

        objc_msgSend(v10, "blacklistedStatesCurrent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v99[0] = MEMORY[0x1E0C809B0];
        v99[1] = 3221225472;
        v99[2] = __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke;
        v99[3] = &unk_1E881E818;
        v16 = v10;
        v100 = v16;
        objc_msgSend(v15, "enumerateObjectsUsingBlock:", v99);

        objc_msgSend(v16, "blacklistedStatesCurrent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeAllObjects");

        objc_msgSend(v7, "addObject:", v16);
        v9 = 1;
        v18 = v100;
        goto LABEL_61;
      }
      v80 = v9;
      objc_msgSend(v10, "networkDelegate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ssid");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "networkDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bssid");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "networkDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = -[WFBlacklistEngine isNetworkInBlacklistedState:state:](self, "isNetworkInBlacklistedState:state:", v21, 1);

      v23 = 0.0;
      v83 = v10;
      if (v22)
      {
        objc_msgSend(v10, "blacklistTriggers");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "removeAllObjects");

        v97 = 0u;
        v98 = 0u;
        v95 = 0u;
        v96 = 0u;
        objc_msgSend(v10, "blacklistedStatesCurrent");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
        if (!v26)
          goto LABEL_38;
        v27 = v26;
        v28 = *(_QWORD *)v96;
        while (1)
        {
          v29 = 0;
          do
          {
            if (*(_QWORD *)v96 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v29);
            if (objc_msgSend(v30, "blacklistedState") != 1)
              goto LABEL_28;
            if (objc_msgSend(v30, "blacklistedReason") == 6)
              goto LABEL_32;
            if (a3 != 3)
              goto LABEL_25;
            objc_msgSend(v30, "blacklistedStateTimestamp");
            if (v31 > v23)
            {
              objc_msgSend(v30, "blacklistedStateTimestamp");
              v23 = v32;
            }
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "timeIntervalSince1970");
            v35 = v34;

            -[WFBlacklistEngine autojoinBlacklistExpiry](v86, "autojoinBlacklistExpiry");
            v36 = *(void **)(v8 + 2368);
            if (v35 - v23 > v37)
            {
              objc_msgSend(v36, "stringWithFormat:", CFSTR("Network '%@' is due for unblacklisting"), v18);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v38), "UTF8String"));
                v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v40 = objc_msgSend(v39, "UTF8String");
                *(_DWORD *)buf = 136446210;
                v106 = v40;
                _os_log_impl(&dword_1CC44E000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                v8 = 0x1E0CB3000uLL;
              }

LABEL_25:
              objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", CFSTR("%s Unblacklisting network '%@' for autojoin "), "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]", v18);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v41), "UTF8String"));
                v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v43 = objc_msgSend(v42, "UTF8String");
                *(_DWORD *)buf = 136446210;
                v106 = v43;
                _os_log_impl(&dword_1CC44E000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                v8 = 0x1E0CB3000uLL;
              }

              objc_msgSend(v87, "addObject:", v30);
LABEL_28:
              if (objc_msgSend(v30, "blacklistedState") == 3)
              {
                objc_msgSend(*(id *)(v8 + 2368), "stringWithFormat:", CFSTR("%s Unblacklisting network '%@' for WoW "), "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]", v18);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v44), "UTF8String"));
                  v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v46 = objc_msgSend(v45, "UTF8String");
                  *(_DWORD *)buf = 136446210;
                  v106 = v46;
                  _os_log_impl(&dword_1CC44E000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                  v8 = 0x1E0CB3000;
                }

                objc_msgSend(v87, "addObject:", v30);
              }
              goto LABEL_32;
            }
            objc_msgSend(v36, "stringWithFormat:", CFSTR("Skip unblacklisting network '%@' - not due."), v18);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v47), "UTF8String"));
              v48 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v49 = objc_msgSend(v48, "UTF8String");
              *(_DWORD *)buf = 136446210;
              v106 = v49;
              _os_log_impl(&dword_1CC44E000, v11, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

              v8 = 0x1E0CB3000;
            }

LABEL_32:
            ++v29;
          }
          while (v27 != v29);
          v50 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v95, v116, 16);
          v27 = v50;
          if (!v50)
          {
LABEL_38:

            v7 = v78;
            self = v86;
            v10 = v83;
            break;
          }
        }
      }
      objc_msgSend(v10, "networkDelegate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = -[WFBlacklistEngine isNetworkInBlacklistedState:state:](self, "isNetworkInBlacklistedState:state:", v51, 2);

      if (!v52)
        goto LABEL_60;
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      objc_msgSend(v10, "blacklistedStatesCurrent");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v115, 16);
      if (!v54)
        goto LABEL_59;
      v55 = v54;
      v56 = *(_QWORD *)v92;
      do
      {
        for (i = 0; i != v55; ++i)
        {
          if (*(_QWORD *)v92 != v56)
            objc_enumerationMutation(v53);
          v58 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
          if (objc_msgSend(v58, "blacklistedState") == 2)
          {
            if (a3 != 3)
              goto LABEL_52;
            objc_msgSend(v58, "blacklistedStateTimestamp");
            if (v59 > v23)
            {
              objc_msgSend(v58, "blacklistedStateTimestamp");
              v23 = v60;
            }
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "timeIntervalSince1970");
            v63 = v62;

            v64 = v63 - v23;
            -[WFBlacklistEngine bssBlacklistExpiry](v86, "bssBlacklistExpiry");
            v66 = v65;
            v67 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
            if (v64 > v66)
            {
              if (v67)
              {
                *(_DWORD *)buf = 141558786;
                v106 = 1752392040;
                v107 = 2112;
                v108 = (uint64_t)v18;
                v109 = 2160;
                v110 = 1752392040;
                v111 = 2112;
                v112 = (uint64_t)v85;
                _os_log_error_impl(&dword_1CC44E000, v11, OS_LOG_TYPE_ERROR, "BSS '%{mask.hash}@[%{mask.hash}@]' is due for unblacklisting", buf, 0x2Au);
              }
LABEL_52:
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v106 = (uint64_t)"-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]";
                v107 = 2160;
                v108 = 1752392040;
                v109 = 2112;
                v110 = (uint64_t)v18;
                v111 = 2160;
                v112 = 1752392040;
                v113 = 2112;
                v114 = v85;
                _os_log_error_impl(&dword_1CC44E000, v11, OS_LOG_TYPE_ERROR, "%s Unblacklisting BSS '%{mask.hash}@[%{mask.hash}@]' for autojoin ", buf, 0x34u);
              }
              objc_msgSend(v87, "addObject:", v58);
              continue;
            }
            if (v67)
            {
              *(_DWORD *)buf = 141558786;
              v106 = 1752392040;
              v107 = 2112;
              v108 = (uint64_t)v18;
              v109 = 2160;
              v110 = 1752392040;
              v111 = 2112;
              v112 = (uint64_t)v85;
              _os_log_error_impl(&dword_1CC44E000, v11, OS_LOG_TYPE_ERROR, "Skip unblacklisting BSS '%{mask.hash}@[%{mask.hash}@]' - not due.", buf, 0x2Au);
            }
          }
        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v91, v115, 16);
      }
      while (v55);
LABEL_59:

      v7 = v78;
      self = v86;
      v10 = v83;
LABEL_60:
      v88[0] = MEMORY[0x1E0C809B0];
      v88[1] = 3221225472;
      v88[2] = __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke_77;
      v88[3] = &unk_1E881E840;
      v90 = a3;
      v68 = v10;
      v89 = v68;
      objc_msgSend(v87, "enumerateObjectsUsingBlock:", v88);
      objc_msgSend(v68, "blacklistedStatesCurrent");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "removeObjectsInArray:", v87);

      v9 = (objc_msgSend(v87, "count") != 0) | v80;
      v10 = v83;
      objc_msgSend(v87, "removeAllObjects");

      v8 = 0x1E0CB3000uLL;
LABEL_61:

      v12 = v84 + 1;
      v13 = v10;
    }
    while (v84 + 1 != v82);
    v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v101, v117, 16);
  }
  while (v82);

LABEL_64:
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Unblacklisting all networks"), "-[WFBlacklistEngine removeBlacklistedStateWithUnblacklistType:]");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v70), "UTF8String"));
      v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v72 = objc_msgSend(v71, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v106 = v72;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
    -[NSMutableArray removeObjectsInArray:](self->_blacklist, "removeObjectsInArray:", v7);
  }
  if ((v9 & 1) != 0)
  {
    -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_opt_respondsToSelector();

    if ((v74 & 1) != 0)
    {
      -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "blacklistDidUpdate");

    }
  }
  -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
LABEL_72:

}

- (void)_printBlacklist
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t k;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  NSMutableArray *obj;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _BYTE v91[128];
  _BYTE v92[128];
  uint8_t v93[128];
  uint8_t buf[4];
  uint64_t v95;
  __int16 v96;
  uint64_t v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  uint64_t v101;
  __int16 v102;
  const char *v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_blacklist, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Current blacklist:"), "-[WFBlacklistEngine _printBlacklist]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v95 = objc_msgSend(v4, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

    }
    v74 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v74, "setDateFormat:", CFSTR("MM/dd/yy HH:mm:ss.SSS"));
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    obj = self->_blacklist;
    v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
    if (v66)
    {
      v5 = MEMORY[0x1E0C81028];
      v65 = *(_QWORD *)v88;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v88 != v65)
            objc_enumerationMutation(obj);
          v69 = v6;
          v7 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * v6);
          objc_msgSend(v7, "networkDelegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "ssid");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "copy");

          objc_msgSend(v7, "networkDelegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "bssid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "copy");

          v70 = v7;
          objc_msgSend(v7, "blacklistedStatesCurrent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "count");

          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 141559042;
            v16 = "YES";
            if (!v15)
              v16 = "NO";
            v95 = 1752392040;
            v96 = 2112;
            v97 = v10;
            v98 = 2160;
            v99 = 1752392040;
            v100 = 2112;
            v101 = v13;
            v102 = 2080;
            v103 = v16;
            _os_log_impl(&dword_1CC44E000, v5, OS_LOG_TYPE_DEFAULT, "Network '%{mask.hash}@' BSSID \"%{mask.hash}@\" isBlacklisted:%s ", buf, 0x34u);
          }
          v67 = (void *)v13;
          v68 = (void *)v10;
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR(" BlacklistHistory: "));
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          objc_msgSend(v7, "blacklistedStatesHistory");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
          if (v18)
          {
            v19 = v18;
            v20 = 0;
            v21 = *(_QWORD *)v84;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v84 != v21)
                  objc_enumerationMutation(v17);
                v23 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
                objc_msgSend(v23, "blacklistedStateString");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "blacklistedStateTimestamp");
                v25 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "stringFromDate:", v26);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "stringWithFormat:", CFSTR("[%d] %@ @ %@, "), v20 + i, v24, v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v73, "appendString:", v28);
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
              v20 = (v20 + i);
            }
            while (v19);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v73);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v29), "UTF8String"));
            v31 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v32 = objc_msgSend(v31, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v95 = v32;
            _os_log_impl(&dword_1CC44E000, v30, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR(" States: "));
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = 0u;
          v80 = 0u;
          v81 = 0u;
          v82 = 0u;
          objc_msgSend(v70, "blacklistedStatesCurrent");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
          if (v34)
          {
            v35 = v34;
            v36 = 0;
            v37 = *(_QWORD *)v80;
            do
            {
              for (j = 0; j != v35; ++j)
              {
                if (*(_QWORD *)v80 != v37)
                  objc_enumerationMutation(v33);
                v39 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * j);
                objc_msgSend(v39, "blacklistedStateString");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "blacklistedStateTimestamp");
                v41 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "stringFromDate:", v42);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "stringWithFormat:", CFSTR("[%d] %@ @ %@, "), v36 + j, v40, v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v72, "appendString:", v44);
              }
              v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
              v36 = (v36 + j);
            }
            while (v35);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v72);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v45), "UTF8String"));
            v47 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v48 = objc_msgSend(v47, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v95 = v48;
            _os_log_impl(&dword_1CC44E000, v46, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR(" Triggers: "));
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = 0u;
          v76 = 0u;
          v77 = 0u;
          v78 = 0u;
          objc_msgSend(v70, "blacklistTriggers");
          v71 = (id)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
          if (v50)
          {
            v51 = v50;
            v52 = 0;
            v53 = *(_QWORD *)v76;
            do
            {
              for (k = 0; k != v51; ++k)
              {
                if (*(_QWORD *)v76 != v53)
                  objc_enumerationMutation(v71);
                v55 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * k);
                objc_msgSend(v55, "triggerReasonString");
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "triggerReasonTimestamp");
                v57 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "stringFromDate:", v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v57, "stringWithFormat:", CFSTR("[%d] %@ @ %@, "), v52 + k, v56, v59);
                v60 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v49, "appendString:", v60);
              }
              v51 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v75, v91, 16);
              v52 = (v52 + k);
            }
            while (v51);
          }

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v49);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v61), "UTF8String"));
            v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v63 = objc_msgSend(v62, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v95 = v63;
            _os_log_impl(&dword_1CC44E000, v5, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

          }
          v6 = v69 + 1;
        }
        while (v69 + 1 != v66);
        v66 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v87, v104, 16);
      }
      while (v66);
    }

  }
}

- (WFBlacklistEngine)initWithBlacklistDelegate:(id)a3 profile:(unint64_t)a4
{
  id v6;
  WFBlacklistEngine *v7;
  WFBlacklistEngine *v8;
  NSMutableArray *v9;
  NSMutableArray *blacklist;
  uint64_t v11;
  NSMutableArray *ssidThresholds;
  uint64_t v13;
  NSMutableArray *bssidThresholds;
  WFBlacklistEngine *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  objc_super v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)WFBlacklistEngine;
  v7 = -[WFBlacklistEngine init](&v21, sel_init);
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s self alloc failed"), "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_10;
  }
  -[WFBlacklistEngine setEnabled:](v7, "setEnabled:", 0);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Invalid blacklistDelegate"), "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      -[NSMutableArray removeAllObjects](v8->_blacklist, "removeAllObjects");
      v15 = 0;
      goto LABEL_12;
    }
LABEL_10:
    v17 = (void *)MEMORY[0x1E0CB3940];
    v16 = objc_retainAutorelease(v16);
    objc_msgSend(v17, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v16, "UTF8String"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v23 = v19;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    goto LABEL_11;
  }
  -[WFBlacklistEngine setBlacklistDelegate:](v8, "setBlacklistDelegate:", v6);
  -[WFBlacklistEngine setWowBlacklistExpiry:](v8, "setWowBlacklistExpiry:", 600.0);
  -[WFBlacklistEngine setAutojoinBlacklistExpiry:](v8, "setAutojoinBlacklistExpiry:", 300.0);
  -[WFBlacklistEngine setBssBlacklistExpiry:](v8, "setBssBlacklistExpiry:", 300.0);
  v8->_profile = a4;
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  blacklist = v8->_blacklist;
  v8->_blacklist = v9;

  if (!v8->_blacklist)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s _blacklist alloc failed"), "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_10;
  }
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 13);
  ssidThresholds = v8->_ssidThresholds;
  v8->_ssidThresholds = (NSMutableArray *)v11;

  if (!v8->_ssidThresholds)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  ssidThresholds alloc failed"), "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_10;
  }
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 13);
  bssidThresholds = v8->_bssidThresholds;
  v8->_bssidThresholds = (NSMutableArray *)v13;

  if (!v8->_bssidThresholds)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  bssidThresholds alloc failed"), "-[WFBlacklistEngine initWithBlacklistDelegate:profile:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    goto LABEL_10;
  }
  -[WFBlacklistEngine setDefaultBlacklistThresholds](v8, "setDefaultBlacklistThresholds");
  v15 = v8;
LABEL_12:

  return v15;
}

- (void)setDefaultBlacklistThresholds
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
  id v34;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:atIndexedSubscript:", v3, 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v7, 2);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, 3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:atIndexedSubscript:", v11, 4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:atIndexedSubscript:", v13, 5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:atIndexedSubscript:", v15, 6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:atIndexedSubscript:", v17, 7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:atIndexedSubscript:", v19, 0);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setObject:atIndexedSubscript:", v21, 1);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:atIndexedSubscript:", v23, 2);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:atIndexedSubscript:", v25, 3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:atIndexedSubscript:", v27, 4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setObject:atIndexedSubscript:", v29, 5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:atIndexedSubscript:", v31, 6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 3);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setObject:atIndexedSubscript:", v34, 7);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  -[NSMutableArray removeAllObjects](self->_blacklist, "removeAllObjects");
  v5.receiver = self;
  v5.super_class = (Class)WFBlacklistEngine;
  -[WFBlacklistEngine dealloc](&v5, sel_dealloc);
}

- (void)configureBlacklistedStateExpiryIntervalInSec:(double)a3 state:(unint64_t)a4
{
  void *v4;
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  switch(a4)
  {
    case 3uLL:
      if (a3 != 0.0 && a3 <= 3600.0)
      {
        -[WFBlacklistEngine setWowBlacklistExpiry:](self, "setWowBlacklistExpiry:");
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Out of range WoWBlacklisting timeout value:%f"), "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      break;
    case 2uLL:
      if (a3 != 0.0 && a3 <= 300.0)
      {
        -[WFBlacklistEngine setBssBlacklistExpiry:](self, "setBssBlacklistExpiry:");
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Out of range BssBlacklisting timeout value:%f"), "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        break;
      goto LABEL_20;
    case 1uLL:
      if (a3 != 0.0 && a3 <= 86400.0)
      {
        -[WFBlacklistEngine setAutojoinBlacklistExpiry:](self, "setAutojoinBlacklistExpiry:");
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Out of range AutojoinBlacklisting timeout value:%f"), "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]", *(_QWORD *)&a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        break;
      goto LABEL_20;
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Invalid state"), a3, "-[WFBlacklistEngine configureBlacklistedStateExpiryIntervalInSec:state:]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
LABEL_20:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
        v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136446210;
        v7 = objc_msgSend(v5, "UTF8String");
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

      }
      break;
  }

}

- (BOOL)changeBlacklistingThresholds:(unint64_t)a3 value:(unsigned int)a4 perSsid:(BOOL)a5
{
  _BOOL4 v5;
  BOOL v7;
  BOOL v8;
  void *v10;
  void *v11;
  const char *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v5 = a5;
  v18 = *MEMORY[0x1E0C80C00];
  v7 = a3 >= 7 || a4 >= 0xFF;
  v8 = !v7;
  if (v7)
  {
    v13 = "perBSSID";
    if (a5)
      v13 = "perSSID";
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: Invalid Config Params. type:%s triggerReason:%lu threshCount:%u"), "-[WFBlacklistEngine changeBlacklistingThresholds:value:perSsid:]", v13, a3, *(_QWORD *)&a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v17 = objc_msgSend(v15, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
    else
      -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:atIndexedSubscript:", v10, a3);

  }
  return v8;
}

- (id)denyListThreshold:(unint64_t)a3 perSSID:(BOOL)a4
{
  void *v5;
  void *v6;

  if (a4)
    -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
  else
    -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_setBlacklistedState:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5 reasonData:(int64_t)a6
{
  objc_msgSend(a3, "addBlacklistedState:reason:reasonData:", a4, a5, a6);
}

- (void)setTriggerForNetworkWithReasonAndState:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 state:(unint64_t)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  WFBlackListNode *v16;
  void *v17;
  WFBlackListNode *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  char v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  unint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a6;
  if (-[WFBlacklistEngine enabled](self, "enabled"))
  {
    -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (id)v14;
      v16 = 0;
    }
    else
    {
      v18 = -[WFBlackListNode initWithBlacklistNetwork:]([WFBlackListNode alloc], "initWithBlacklistNetwork:", v12);
      if (!v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s BlacklistElement alloc failed"), "-[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:]");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v26 = (void *)MEMORY[0x1E0CB3940];
          v24 = objc_retainAutorelease(v24);
          objc_msgSend(v26, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v24, "UTF8String"));
          v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136446210;
          v29 = (const char *)objc_msgSend(v27, "UTF8String");
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

        }
        v19 = 0;
        v16 = 0;
        v15 = 0;
        goto LABEL_17;
      }
      v16 = v18;
      v15 = v16;
    }
    if (-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:](self, "_ignoreTriggersForDeviceProfile:node:", a4, v15))
    {
      v19 = 0;
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v15, "networkDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ssid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136317186;
      v29 = "-[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:]";
      v30 = 2112;
      v31 = v25;
      v32 = 2160;
      v33 = 1752392040;
      v34 = 2112;
      v35 = v19;
      v36 = 2160;
      v37 = 1752392040;
      v38 = 2112;
      v39 = v13;
      v40 = 2048;
      v41 = a4;
      v42 = 2048;
      v43 = a5;
      v44 = 2048;
      v45 = a7;
      _os_log_error_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Trigger '%@' for '%{mask.hash}@ [%{mask.hash}@]' (reason=%lu reasonData=%ld state=%lu)", buf, 0x5Cu);

    }
    objc_msgSend(v15, "addBlacklistTrigger:reasonData:bssid:", a4, a5, v13);
    v21 = -[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:](self, "_evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:", v15, a4, a5, v13, v19, a7);
    if ((-[NSMutableArray containsObject:](self->_blacklist, "containsObject:", v15) & 1) == 0)
      -[NSMutableArray addObject:](self->_blacklist, "addObject:", v15);
    -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
    if (!v21)
      goto LABEL_18;
    -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_opt_respondsToSelector();

    if ((v23 & 1) == 0)
      goto LABEL_18;
    -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "blacklistDidUpdate");
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s No Blacklisting"), "-[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:]");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v15 = objc_retainAutorelease(v15);
    objc_msgSend(v17, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v15, "UTF8String"));
    v16 = (WFBlackListNode *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v29 = (const char *)-[WFBlackListNode UTF8String](v16, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);
LABEL_19:

  }
}

- (void)setTriggerForNetworkWithReason:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6
{
  -[WFBlacklistEngine setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:](self, "setTriggerForNetworkWithReasonAndState:reason:reasonData:bssid:state:", a3, a4, a5, a6, 5);
}

- (BOOL)_evaluateTriggersForBlacklisting:(id)a3 reason:(unint64_t)a4 reasonData:(int64_t)a5 bssid:(id)a6 ssid:(id)a7 state:(unint64_t)a8
{
  id v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  _BOOL4 v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  _BOOL4 v62;
  unsigned int v63;
  _BOOL4 v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  WFBlacklistEngine *v72;
  id v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  unsigned int v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  char v93;
  void *v95;
  id v96;
  uint64_t v97;
  id v98;
  char v99;
  unint64_t v101;
  char v102;
  uint64_t v103;
  unint64_t v104;
  id v105;
  id obj;
  unint64_t v107;
  uint64_t v109;
  uint64_t v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint8_t buf[4];
  const char *v116;
  __int16 v117;
  void *v118;
  __int16 v119;
  uint64_t v120;
  __int16 v121;
  void *v122;
  __int16 v123;
  double v124;
  _BYTE v125[128];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v105 = a6;
  v98 = a7;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s node is null"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v95), "UTF8String"));
      v96 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v116 = (const char *)objc_msgSend(v96, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
    v93 = 0;
    goto LABEL_95;
  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  objc_msgSend(v12, "blacklistTriggers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
  if (!v110)
  {

    v93 = 0;
    goto LABEL_94;
  }
  v97 = 0;
  v14 = 0;
  v15 = 0;
  v103 = 0;
  v104 = 0;
  v99 = 0;
  v109 = *(_QWORD *)v112;
  v101 = a8 & 0xFFFFFFFFFFFFFFFELL;
  v102 = 0;
  v16 = MEMORY[0x1E0C81028];
  obj = v13;
  v107 = a8;
  do
  {
    v17 = 0;
    do
    {
      if (*(_QWORD *)v112 != v109)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v17);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "timeIntervalSince1970");
      v21 = v20;

      v22 = objc_msgSend(v18, "triggerReason");
      objc_msgSend(v18, "triggerReasonTimestamp");
      v24 = v23;
      if (objc_msgSend(v12, "enterprisePolicy"))
      {
        if (a4 <= 7)
        {
          v25 = v21 - v24;
          if (v21 - v24 <= 300.0)
          {
            objc_msgSend(v18, "bssid", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "compare:options:", v105, 1);

            v28 = v27 == 0;
            v29 = HIDWORD(v103);
            if (!v27)
              v29 = HIDWORD(v103) + 1;
            if (v22 != a4)
              v28 = 0;
            v30 = (v104 + v28);
            if (v22 == a4)
              v31 = (HIDWORD(v104) + 1);
            else
              v31 = HIDWORD(v104);
            v32 = v103 + 1;
            HIDWORD(v103) = v29;
            v104 = __PAIR64__(v31, v30);
            LODWORD(v103) = v103 + 1;
            if (v29 > 0x12
              || -[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:](self, "_meetsThresholds:count:perSsid:bssid:ssid:", a4, v30, 0, v105, v98)|| v32 > 0x12|| -[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:](self, "_meetsThresholds:count:perSsid:bssid:ssid:", a4, v31, 1, v105, v98))
            {
              a8 = v107;
              if (v107 != 5 && v107 != 3)
              {
                v36 = (void *)MEMORY[0x1E0CB3940];
                +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", a4);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "stringWithFormat:", CFSTR("%s WFNetworkBlacklistStateNoWoW ignored for %@ @ %@"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v37, v38);
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v39), "UTF8String"));
                  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v41 = objc_msgSend(v40, "UTF8String");
                  *(_DWORD *)buf = 136446210;
                  v116 = (const char *)v41;
                  _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

                }
                goto LABEL_31;
              }
              -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 3, a4, a5);
              v99 = 1;
            }
            else
            {
LABEL_31:
              a8 = v107;
            }
            v16 = MEMORY[0x1E0C81028];
            goto LABEL_33;
          }
        }
      }
      if (objc_msgSend(v12, "enterprisePolicy", v25) && os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", v22);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bssid");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v116 = "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]";
        v117 = 2112;
        v118 = v34;
        v119 = 2160;
        v120 = 1752392040;
        v121 = 2112;
        v122 = v35;
        v123 = 2048;
        v124 = v21 - v24;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s Trigger %@ for [%{mask.hash}@] was %f seconds ago and outside window. Will not consider for WoW blacklist", buf, 0x34u);

        v16 = MEMORY[0x1E0C81028];
      }
LABEL_33:
      if (v22 != a4)
      {
        v54 = (void *)MEMORY[0x1E0CB3940];
        +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", v22);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = MEMORY[0x1E0C81028];
        +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", a4);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithFormat:", CFSTR("%s Reasons differ. TriggerNodeReason: %@ CurrentReason: %@"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v55, v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();

        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          goto LABEL_47;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v57), "UTF8String"));
        v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v59 = objc_msgSend(v58, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v116 = (const char *)v59;
        v60 = v16;
        v61 = OS_LOG_TYPE_DEBUG;
        goto LABEL_46;
      }
      if (a4 > 3)
      {
        if (a4 == 4)
        {
          v33 = v21 - v24;
          if (v21 - v24 > 300.0)
            goto LABEL_48;
          LODWORD(v97) = v97 + 1;
          if (v97 >= 3)
          {
            if ((a8 | 4) != 5)
            {
              v89 = (void *)MEMORY[0x1E0CB3940];
              +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", 4, v33);
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "stringWithFormat:", CFSTR("%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v90, v91);
              v51 = (void *)objc_claimAutoreleasedReturnValue();

              v16 = MEMORY[0x1E0C81028];
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                goto LABEL_42;
              goto LABEL_43;
            }
            -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 1, 4, objc_msgSend(v18, "triggerReasonData", v33));
            v102 = 1;
          }
        }
      }
      else
      {
        if (a8 != 1 && a8 != 5)
        {
          if (a8 == 3)
          {
            -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 3, a4, a5);
            v42 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "stringWithFormat:", CFSTR("%s Power Alert Event Generated, Blacklist for WoW, TimeStamp: %@"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            v45 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v44), "UTF8String"));
              v46 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v47 = objc_msgSend(v46, "UTF8String");
              *(_DWORD *)buf = 136446210;
              v116 = (const char *)v47;
              _os_log_impl(&dword_1CC44E000, v45, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

            }
            v99 = 1;
          }
          v48 = (void *)MEMORY[0x1E0CB3940];
          +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", a4);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", CFSTR("%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v49, v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_42:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v51), "UTF8String"));
            v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v53 = objc_msgSend(v52, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v116 = (const char *)v53;
            _os_log_impl(&dword_1CC44E000, v16, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

          }
LABEL_43:

          a8 = v107;
          goto LABEL_56;
        }
        v102 = 1;
        -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 1, a4, objc_msgSend(v18, "triggerReasonData"));
      }
LABEL_56:
      v62 = a4 == 5;
      v63 = v15 + 1;
      if (a4 == 5)
        ++v15;
      if (v63 <= 9)
        v62 = 0;
      v64 = (v14 + 1) > 2;
      if (a4 == 7)
      {
        ++v14;
        v62 = v64;
      }
      if (v62)
      {
        if ((a8 | 4) == 5)
        {
          -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 1, a4, objc_msgSend(v18, "triggerReasonData"));
          v102 = 1;
        }
        else
        {
          v65 = (void *)MEMORY[0x1E0CB3940];
          +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", a4);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "stringWithFormat:", CFSTR("%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v66, v67);
          v68 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v68), "UTF8String"));
            v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v70 = objc_msgSend(v69, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v116 = (const char *)v70;
            _os_log_impl(&dword_1CC44E000, v16, OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

          }
          a8 = v107;
        }
      }
      if (a4 - 11 <= 1)
      {
        if (v101 != 4)
        {
          v76 = (void *)MEMORY[0x1E0CB3940];
          +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", a4);
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "stringWithFormat:", CFSTR("%s WFNetworkBlacklistStateTemporarilyUnavailable ignored for %@ @ %@"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v77, v78);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            goto LABEL_47;
LABEL_87:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v57), "UTF8String"));
          v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v88 = objc_msgSend(v58, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v116 = (const char *)v88;
          v60 = v16;
          v61 = OS_LOG_TYPE_INFO;
LABEL_46:
          _os_log_impl(&dword_1CC44E000, v60, v61, "%{public}s", buf, 0xCu);

          goto LABEL_47;
        }
        v71 = objc_msgSend(v18, "triggerReasonData");
        v72 = self;
        v73 = v12;
        v74 = 4;
        v75 = a4;
        goto LABEL_71;
      }
      if (a4 == 8)
      {
        objc_msgSend(v18, "bssid");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend(v79, "compare:options:", v105, 1);

        if (v80)
          v81 = HIDWORD(v97);
        else
          v81 = HIDWORD(v97) + 1;
        HIDWORD(v97) = v81;
        if (v81 >= 3)
        {
          if (a8 != 2)
          {
            v85 = (void *)MEMORY[0x1E0CB3940];
            +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", 8);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "stringWithFormat:", CFSTR("%s WFNetworkBlacklistReasonBssBlacklist ignored for %@ @ %@"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v86, v87);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              goto LABEL_87;
LABEL_47:

            goto LABEL_48;
          }
          v71 = objc_msgSend(v18, "triggerReasonData");
          v72 = self;
          v73 = v12;
          v74 = 2;
          v75 = 8;
LABEL_71:
          -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](v72, "_setBlacklistedState:state:reason:reasonData:", v73, v74, v75, v71);
          v102 = 1;
        }
      }
      else if (a4 == 6)
      {
        if ((a8 | 4) != 5)
        {
          v82 = (void *)MEMORY[0x1E0CB3940];
          +[WFBlacklistEngine stringRepresentationWithReason:](WFBlacklistEngine, "stringRepresentationWithReason:", 6);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v21);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v82, "stringWithFormat:", CFSTR("%s WFNetworkBlacklistStateNoAutoJoin ignored for %@ @ %@"), "-[WFBlacklistEngine _evaluateTriggersForBlacklisting:reason:reasonData:bssid:ssid:state:]", v83, v84);
          v57 = (void *)objc_claimAutoreleasedReturnValue();

          if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            goto LABEL_47;
          goto LABEL_87;
        }
        -[WFBlacklistEngine _setBlacklistedState:state:reason:reasonData:](self, "_setBlacklistedState:state:reason:reasonData:", v12, 1, 6, objc_msgSend(v18, "triggerReasonData"));
        v102 = 1;
      }
LABEL_48:
      ++v17;
    }
    while (v110 != v17);
    v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v111, v125, 16, v33);
    v110 = v92;
  }
  while (v92);

  v93 = v102;
  if ((v99 & 1) != 0)
  {
    objc_msgSend(v12, "addBlacklistedStateHistory:state:reason:reasonData:", 0, a8, a4, a5);
    v93 = 1;
  }
LABEL_94:
  -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
LABEL_95:

  return v93 & 1;
}

- (BOOL)_ignoreTriggersForDeviceProfile:(unint64_t)a3 node:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  BOOL v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v22;
  uint64_t v23;
  unsigned int v24;
  char v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (self->_profile != 2)
  {
    if ((objc_msgSend(v6, "enterprisePolicy") & 1) != 0
      || (objc_msgSend(v7, "networkDelegate"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "isProfileBased"),
          v13,
          v14))
    {
      -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_opt_respondsToSelector();

      if ((v16 & 1) != 0)
      {
        v25 = 0;
        v24 = 0;
        -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "retrieveBatteryInfo:batteryLevel:", &v25, &v24);

        if (v18)
        {
          if (v25)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s BlacklistTrigger %lu ignored as device connected to external power supply"), "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]", a3);
            v8 = (id)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_5;
            goto LABEL_21;
          }
          if (a3 == 2 && v24 >= 0x51)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s BlacklistTrigger %lu ignored as battery level is %d"), "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]", 2, v24);
            v8 = (id)objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_5;
LABEL_21:
            v22 = (void *)MEMORY[0x1E0CB3940];
            v8 = objc_retainAutorelease(v8);
            objc_msgSend(v22, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v8, "UTF8String"));
            v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v23 = objc_msgSend(v9, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v27 = v23;
            v10 = MEMORY[0x1E0C81028];
            v11 = OS_LOG_TYPE_ERROR;
            goto LABEL_4;
          }
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Delegate does not respond to blacklistProfileBatteryInfo"), "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
          v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 136446210;
          v27 = objc_msgSend(v20, "UTF8String");
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

        }
      }
    }
    v12 = 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s BlacklistTrigger %lu ignored for %lu"), "-[WFBlacklistEngine _ignoreTriggersForDeviceProfile:node:]", a3, 2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v27 = objc_msgSend(v9, "UTF8String");
    v10 = MEMORY[0x1E0C81028];
    v11 = OS_LOG_TYPE_INFO;
LABEL_4:
    _os_log_impl(&dword_1CC44E000, v10, v11, "%{public}s", buf, 0xCu);

  }
LABEL_5:

  v12 = 1;
LABEL_17:

  return v12;
}

- (BOOL)removeBlacklistedStateForNetworkWithReason:(id)a3 state:(unint64_t)a4 reason:(unint64_t)a5
{
  void *v8;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;
  if (!v8)
  {
LABEL_17:
    -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
    goto LABEL_18;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v10)
  {
    v11 = v10;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v8, "blacklistedStatesCurrent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v17, "blacklistedState") == a4 && objc_msgSend(v17, "blacklistedReason") == a5)
            objc_msgSend(v11, "addObject:", v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __77__WFBlacklistEngine_removeBlacklistedStateForNetworkWithReason_state_reason___block_invoke;
    v26[3] = &unk_1E881E818;
    v18 = v8;
    v27 = v18;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v26);
    objc_msgSend(v18, "blacklistedStatesCurrent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObjectsInArray:", v11);

    if (objc_msgSend(v11, "count"))
    {
      -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "blacklistDidUpdate");

      }
    }
    objc_msgSend(v11, "removeAllObjects");

    v9 = v8 != 0;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s discardedNodes is null"), "-[WFBlacklistEngine removeBlacklistedStateForNetworkWithReason:state:reason:]");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v24), "UTF8String"));
    v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v34 = objc_msgSend(v25, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
  v9 = 0;
LABEL_18:

  return v9;
}

uint64_t __77__WFBlacklistEngine_removeBlacklistedStateForNetworkWithReason_state_reason___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processBlacklistedStateMetric:unblacklisting:unblacklistingReason:", a2, 1, 1);
}

uint64_t __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processBlacklistedStateMetric:unblacklisting:unblacklistingReason:", a2, 1, 2);
}

uint64_t __63__WFBlacklistEngine_removeBlacklistedStateWithUnblacklistType___block_invoke_77(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + 32;
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(v4 + 8);
  if (v3 == 2)
    v5 = 3;
  else
    v5 = 4 * (v3 == 3);
  return objc_msgSend(v2, "processBlacklistedStateMetric:unblacklisting:unblacklistingReason:", a2, 1, v5);
}

- (void)removeExpiredBlacklistedState:(unint64_t)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  void *v51;
  id v52;
  uint64_t v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  char v72;
  void *v73;
  id v74;
  void *v75;
  id v76;
  uint64_t v77;
  void *v78;
  id v79;
  NSMutableArray *obj;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  WFBlacklistEngine *v87;
  _QWORD v88[4];
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t buf[4];
  uint64_t v101;
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    obj = self->_blacklist;
    v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
    v6 = 0;
    if (v82)
    {
      v81 = *(_QWORD *)v95;
      v85 = v5;
      v87 = self;
LABEL_4:
      v7 = 0;
      v8 = v6;
      while (1)
      {
        if (*(_QWORD *)v95 != v81)
          objc_enumerationMutation(obj);
        v6 = *(id *)(*((_QWORD *)&v94 + 1) + 8 * v7);

        objc_msgSend(v6, "blacklistedStatesCurrent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          break;
LABEL_64:
        ++v7;
        v8 = v6;
        if (v7 == v82)
        {
          v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
          if (!v82)
          {
            v74 = v6;
            v6 = 0;
            goto LABEL_67;
          }
          goto LABEL_4;
        }
      }
      objc_msgSend(v6, "networkDelegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ssid");
      v11 = objc_claimAutoreleasedReturnValue();

      v86 = (void *)v11;
      if (v11)
      {
        objc_msgSend(v6, "blacklistedStatesHistory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "count");

        v14 = 0.0;
        if (v13)
          v15 = (int)v13 < 1;
        else
          v15 = 1;
        v84 = v7;
        if (!v15)
        {
          v16 = v13 + 1;
          while (1)
          {
            objc_msgSend(v6, "blacklistedStatesHistory");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndex:", (v16 - 2));
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              if (objc_msgSend(v18, "blacklistedState") == a3 || objc_msgSend(v18, "blacklistedState") == 5)
                break;
            }

            if ((unint64_t)--v16 <= 1)
              goto LABEL_20;
          }
          objc_msgSend(v18, "blacklistedStateTimestamp");
          v14 = v19;

        }
LABEL_20:
        v20 = 0x1E0CB3000uLL;
        v92 = 0u;
        v93 = 0u;
        v90 = 0u;
        v91 = 0u;
        v83 = v6;
        objc_msgSend(v6, "blacklistedStatesCurrent");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
        if (!v22)
          goto LABEL_58;
        v23 = v22;
        v24 = *(_QWORD *)v91;
LABEL_22:
        v25 = 0;
        while (1)
        {
          if (*(_QWORD *)v91 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v25);
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "timeIntervalSince1970");
          v29 = v28;

          if (objc_msgSend(v26, "blacklistedState") != a3 || objc_msgSend(v26, "blacklistedState") != 3)
            goto LABEL_38;
          -[WFBlacklistEngine wowBlacklistExpiry](self, "wowBlacklistExpiry");
          if (v14 != 0.0)
            break;
          objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("%s No history for most recent blacklisting time!!"), "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
          v31 = (id)objc_claimAutoreleasedReturnValue();
          v32 = MEMORY[0x1E0C81028];
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            goto LABEL_29;
LABEL_52:

LABEL_53:
          if (v23 == ++v25)
          {
            v68 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
            v23 = v68;
            if (!v68)
            {
LABEL_58:

              v88[0] = MEMORY[0x1E0C809B0];
              v88[1] = 3221225472;
              v88[2] = __51__WFBlacklistEngine_removeExpiredBlacklistedState___block_invoke;
              v88[3] = &unk_1E881E818;
              v6 = v83;
              v69 = v83;
              v89 = v69;
              v5 = v85;
              objc_msgSend(v85, "enumerateObjectsUsingBlock:", v88);
              objc_msgSend(v69, "blacklistedStatesCurrent");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v70, "removeObjectsInArray:", v85);

              if (objc_msgSend(v85, "count"))
              {
                -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = objc_opt_respondsToSelector();

                v7 = v84;
                if ((v72 & 1) != 0)
                {
                  -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v73, "blacklistDidUpdate");

                }
                objc_msgSend(v85, "removeAllObjects");
                -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
              }
              else
              {
                objc_msgSend(v85, "removeAllObjects");
                v7 = v84;
              }

              goto LABEL_64;
            }
            goto LABEL_22;
          }
        }
        v36 = v30;
        if (objc_msgSend(v26, "blacklistedReason") == 2)
        {
          objc_msgSend(v26, "blacklistedStateTimestamp");
          if (v29 - v37 <= 3600.0)
          {
            objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("%s Skipping blacklist expiration: recent power alert"), "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
            v31 = (id)objc_claimAutoreleasedReturnValue();
            v32 = MEMORY[0x1E0C81028];
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_52;
LABEL_29:
            v33 = *(void **)(v20 + 2368);
            v31 = objc_retainAutorelease(v31);
            objc_msgSend(v33, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v31, "UTF8String"));
            v34 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v35 = objc_msgSend(v34, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v101 = v35;
            _os_log_impl(&dword_1CC44E000, v32, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

            goto LABEL_52;
          }
        }
        objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("%s timeDiff :%f expiry :%f "), "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v29 - v14, *(_QWORD *)&v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v38), "UTF8String"));
          v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v40 = objc_msgSend(v39, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v101 = v40;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

          self = v87;
        }

        if (v29 - v14 > v36)
        {
          objc_msgSend(v26, "blacklistedStateString");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "blacklistedStateTimestamp");
          v42 = *(void **)(v20 + 2368);
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", CFSTR("%s Unblacklisting '%@' expired blacklisted state %@ (%@) for:%@"), "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v86, v41, v43, v86);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v44), "UTF8String"));
            v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v46 = objc_msgSend(v45, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v101 = v46;
            _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

          }
          objc_msgSend(v85, "addObject:", v26);

          self = v87;
          v20 = 0x1E0CB3000uLL;
        }
LABEL_38:
        if (objc_msgSend(v26, "blacklistedState") == a3
          && objc_msgSend(v26, "blacklistedState") == 2
          && objc_msgSend(v26, "blacklistedReason") == 8)
        {
          -[WFBlacklistEngine bssBlacklistExpiry](self, "bssBlacklistExpiry");
          v48 = v47;
          v49 = *(void **)(v20 + 2368);
          objc_msgSend(v26, "blacklistedStateTimestamp");
          objc_msgSend(v49, "stringWithFormat:", CFSTR("%s timeDiff :%f expiry :%f "), "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v29 - v50, *(_QWORD *)&v48);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v51), "UTF8String"));
            v52 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v53 = objc_msgSend(v52, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v101 = v53;
            _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

          }
          objc_msgSend(v26, "blacklistedStateTimestamp");
          v20 = 0x1E0CB3000uLL;
          if (v29 - v54 > v48)
          {
            objc_msgSend(v26, "blacklistedStateString");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "blacklistedStateTimestamp");
            v56 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "stringWithFormat:", CFSTR("%s Unblacklisting '%@' expired blacklisted state %@ (%@) for:%@"), "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v86, v55, v57, v86);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            v59 = MEMORY[0x1E0C81028];
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v58), "UTF8String"));
              v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v61 = objc_msgSend(v60, "UTF8String");
              *(_DWORD *)buf = 136446210;
              v101 = v61;
              _os_log_impl(&dword_1CC44E000, v59, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

            }
            objc_msgSend(v85, "addObject:", v26);

            self = v87;
            v20 = 0x1E0CB3000uLL;
          }
        }
        if (objc_msgSend(v26, "blacklistedState") != a3 || objc_msgSend(v26, "blacklistedState") != 4)
          goto LABEL_53;
        objc_msgSend(v26, "blacklistedStateString");
        v31 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "blacklistedStateTimestamp");
        v62 = *(void **)(v20 + 2368);
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "stringWithFormat:", CFSTR("%s Unblacklisting '%@' expired blacklisted state %@ (%@) for:%@"), "-[WFBlacklistEngine removeExpiredBlacklistedState:]", v86, v31, v63, v86);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v64), "UTF8String"));
          v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v67 = objc_msgSend(v66, "UTF8String");
          *(_DWORD *)buf = 136446210;
          v101 = v67;
          _os_log_impl(&dword_1CC44E000, v65, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

        }
        objc_msgSend(v85, "addObject:", v26);
        self = v87;
        v20 = 0x1E0CB3000;
        goto LABEL_52;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s SSID is null"), "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
      v74 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v75 = (void *)MEMORY[0x1E0CB3940];
        v74 = objc_retainAutorelease(v74);
        objc_msgSend(v75, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v74, "UTF8String"));
        v76 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v77 = objc_msgSend(v76, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v101 = v77;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

      }
LABEL_67:

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s discardedNodes is null"), "-[WFBlacklistEngine removeExpiredBlacklistedState:]");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v78 = (void *)MEMORY[0x1E0CB3940];
      v6 = objc_retainAutorelease(v6);
      objc_msgSend(v78, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v6, "UTF8String"));
      v79 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v101 = objc_msgSend(v79, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }

}

uint64_t __51__WFBlacklistEngine_removeExpiredBlacklistedState___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processBlacklistedStateMetric:unblacklisting:unblacklistingReason:", a2, 1, 5);
}

- (void)removeBlacklistedStates
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  WFBlacklistEngine *v17;
  NSMutableArray *obj;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Clearing all blacklisted networks: "), "-[WFBlacklistEngine removeBlacklistedStates]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v27 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
  if (-[NSMutableArray count](self->_blacklist, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = self->_blacklist;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v6)
    {
      v7 = v6;
      v17 = self;
      v8 = 0;
      v9 = *(_QWORD *)v22;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(obj);
          v12 = *(id *)(*((_QWORD *)&v21 + 1) + 8 * i);

          objc_msgSend(v5, "addObject:", v12);
          objc_msgSend(v12, "blacklistedStatesCurrent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = v10;
          v19[1] = 3221225472;
          v19[2] = __44__WFBlacklistEngine_removeBlacklistedStates__block_invoke;
          v19[3] = &unk_1E881E818;
          v8 = v12;
          v20 = v8;
          objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v7);

      self = v17;
    }

    -[NSMutableArray removeObjectsInArray:](self->_blacklist, "removeObjectsInArray:", v5);
    -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "blacklistDidUpdate");

    }
  }
  else
  {
    v5 = 0;
  }
  -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");

}

uint64_t __44__WFBlacklistEngine_removeBlacklistedStates__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processBlacklistedStateMetric:unblacklisting:unblacklistingReason:", a2, 1, 6);
}

- (void)clearTriggerForNetworkWithUnblacklistReason:(id)a3 reason:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  NSObject *v34;
  const char *v35;
  uint32_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v61;
  id v62;
  uint64_t v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  void *v69;
  WFBlacklistEngine *v70;
  void *obj;
  void *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t v87[128];
  uint8_t buf[4];
  const char *v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  uint64_t v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  uint64_t v99;
  __int16 v100;
  void *v101;
  __int16 v102;
  unint64_t v103;
  _BYTE v104[128];
  _BYTE v105[128];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    -[WFBlacklistEngine _printBlacklist](self, "_printBlacklist");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Unblacklisting all networks"), "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v89 = (const char *)objc_msgSend(v7, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

    }
    -[WFBlacklistEngine removeBlacklistedStates](self, "removeBlacklistedStates");
  }
  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:].cold.1(v5);
    goto LABEL_85;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s discardedNodes is null"), "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v58), "UTF8String"));
      v59 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v60 = objc_msgSend(v59, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v89 = (const char *)v60;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
LABEL_85:
    v69 = 0;
    v73 = 0;
    v74 = 0;
    v10 = 0;
    goto LABEL_79;
  }
  v10 = v9;
  v74 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v74)
  {
    objc_msgSend(v8, "networkDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ssid");
    v12 = objc_claimAutoreleasedReturnValue();

    v73 = (void *)v12;
    if (v12)
    {
      v70 = self;
      objc_msgSend(v8, "networkDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bssid");
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      v85 = 0u;
      v86 = 0u;
      v83 = 0u;
      v84 = 0u;
      objc_msgSend(v8, "blacklistedStatesCurrent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v84;
        v18 = MEMORY[0x1E0C81028];
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v84 != v17)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
            if (objc_msgSend(v20, "blacklistedState") == 1)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                v90 = 2160;
                v91 = 1752392040;
                v92 = 2112;
                v93 = v73;
                v94 = 2160;
                v95 = 1752392040;
                v96 = 2112;
                v97 = v69;
                _os_log_error_impl(&dword_1CC44E000, v18, OS_LOG_TYPE_ERROR, "%s Unblacklisting and removing '%{mask.hash}@[%{mask.hash}@]' from Autojoin blacklist", buf, 0x34u);
              }
              objc_msgSend(v10, "addObject:", v20);
            }
            if (objc_msgSend(v20, "blacklistedState") == 3
              && -[WFBlacklistEngine _evaluateTriggersForUnblacklisting:unblacklistReason:ssid:](v70, "_evaluateTriggersForUnblacklisting:unblacklistReason:ssid:", v8, a4, v73))
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                v90 = 2160;
                v91 = 1752392040;
                v92 = 2112;
                v93 = v73;
                v94 = 2160;
                v95 = 1752392040;
                v96 = 2112;
                v97 = v69;
                _os_log_error_impl(&dword_1CC44E000, v18, OS_LOG_TYPE_ERROR, "%s Unblacklisting and removing '%{mask.hash}@[%{mask.hash}@]' from WoW blacklist", buf, 0x34u);
              }
              objc_msgSend(v10, "addObject:", v20);
            }
            if (objc_msgSend(v20, "blacklistedState") == 2)
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136316162;
                v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                v90 = 2160;
                v91 = 1752392040;
                v92 = 2112;
                v93 = v73;
                v94 = 2160;
                v95 = 1752392040;
                v96 = 2112;
                v97 = v69;
                _os_log_error_impl(&dword_1CC44E000, v18, OS_LOG_TYPE_ERROR, "%s Unblacklisting and removing '%{mask.hash}@[%{mask.hash}@]' from BSS blacklist", buf, 0x34u);
              }
              objc_msgSend(v10, "addObject:", v20);
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
        }
        while (v16);
      }

      v81 = 0u;
      v82 = 0u;
      v79 = 0u;
      v80 = 0u;
      objc_msgSend(v8, "blacklistTriggers");
      obj = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
      if (v21)
      {
        v22 = v21;
        v23 = MEMORY[0x1E0C81028];
        v24 = *(_QWORD *)v80;
        do
        {
          v25 = 0;
          do
          {
            if (*(_QWORD *)v80 != v24)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v25);
            objc_msgSend(v26, "triggerReasonString");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "triggerReasonTimestamp");
            v29 = v28;
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "timeIntervalSince1970");
            v32 = v31;

            if (!objc_msgSend(v26, "triggerReason")
              || objc_msgSend(v26, "triggerReason") == 1
              || objc_msgSend(v26, "triggerReason") == 5
              || objc_msgSend(v26, "triggerReason") == 7
              || objc_msgSend(v26, "triggerReason") == 2
              || objc_msgSend(v26, "triggerReason") == 3
              || objc_msgSend(v26, "triggerReason") == 11
              || objc_msgSend(v26, "triggerReason") == 12)
            {
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v29);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136316674;
                v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                v90 = 2112;
                v91 = (uint64_t)v27;
                v92 = 2112;
                v93 = v33;
                v94 = 2160;
                v95 = 1752392040;
                v96 = 2112;
                v97 = v73;
                v98 = 2160;
                v99 = 1752392040;
                v100 = 2112;
                v101 = v69;
                v34 = v23;
                v35 = "%s Clearing trigger %@ (%@) for '%{mask.hash}@[%{mask.hash}@]'";
                goto LABEL_47;
              }
              goto LABEL_43;
            }
            if (a4 == 1)
            {
              v37 = v32 - v29;
              if (objc_msgSend(v26, "triggerReason") == 4 && v29 != 0.0 && v37 > 300.0)
              {
                if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v29);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 136316674;
                  v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                  v90 = 2112;
                  v91 = (uint64_t)v27;
                  v92 = 2112;
                  v93 = v33;
                  v94 = 2160;
                  v95 = 1752392040;
                  v96 = 2112;
                  v97 = v73;
                  v98 = 2160;
                  v99 = 1752392040;
                  v100 = 2112;
                  v101 = v69;
                  v34 = v23;
                  v35 = "%s Clearing(for interval exceeded) trigger %@ (%@) for '%{mask.hash}@[%{mask.hash}@]'";
LABEL_47:
                  v36 = 72;
LABEL_48:
                  _os_log_error_impl(&dword_1CC44E000, v34, OS_LOG_TYPE_ERROR, v35, buf, v36);

                }
                goto LABEL_43;
              }
              if (objc_msgSend(v26, "triggerReason") == 8 && v29 != 0.0)
              {
                -[WFBlacklistEngine bssBlacklistExpiry](v70, "bssBlacklistExpiry");
                if (v37 > v38)
                {
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v29);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "triggerReasonTimestamp");
                    *(_DWORD *)buf = 136316930;
                    v89 = "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]";
                    v90 = 2112;
                    v91 = (uint64_t)v27;
                    v92 = 2112;
                    v93 = v33;
                    v94 = 2160;
                    v95 = 1752392040;
                    v96 = 2112;
                    v97 = v73;
                    v98 = 2160;
                    v99 = 1752392040;
                    v100 = 2112;
                    v101 = v69;
                    v102 = 2048;
                    v103 = (unint64_t)(v32 - v39);
                    v34 = v23;
                    v35 = "%s Clearing(for interval exceeded) trigger %@ (%@) for '%{mask.hash}@[%{mask.hash}@] (diff:%lu)'";
                    v36 = 82;
                    goto LABEL_48;
                  }
LABEL_43:
                  objc_msgSend(v74, "addObject:", v26);
                  goto LABEL_44;
                }
              }
            }
            v40 = dbl_1CC50EDC0[objc_msgSend(v26, "triggerReason") == 2];
            objc_msgSend(v26, "triggerReasonTimestamp");
            if (v32 - v41 > v40)
            {
              v67 = (id)MEMORY[0x1E0CB3940];
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v32);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "stringWithFormat:", CFSTR("%s Clearing(expired) trigger %@ (%@) for '%@'"), "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]", v27, v42, v73);
              v68 = (id)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v68), "UTF8String"));
                v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v44 = objc_msgSend(v43, "UTF8String");
                *(_DWORD *)buf = 136446210;
                v89 = (const char *)v44;
                _os_log_impl(&dword_1CC44E000, v23, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

              }
              goto LABEL_43;
            }
LABEL_44:

            ++v25;
          }
          while (v22 != v25);
          v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v104, 16);
          v22 = v45;
        }
        while (v45);
      }

      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v10 = v10;
      v46 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
      if (v46)
      {
        v47 = v46;
        v48 = *(_QWORD *)v76;
        do
        {
          for (j = 0; j != v47; ++j)
          {
            if (*(_QWORD *)v76 != v48)
              objc_enumerationMutation(v10);
            objc_msgSend(v8, "processBlacklistedStateMetric:unblacklisting:unblacklistingReason:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * j), 1, 7);
          }
          v47 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v75, v87, 16);
        }
        while (v47);
      }

      objc_msgSend(v8, "blacklistedStatesCurrent");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "removeObjectsInArray:", v10);

      objc_msgSend(v8, "blacklistTriggers");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "removeObjectsInArray:", v74);

      if (objc_msgSend(v10, "count"))
      {
        -[WFBlacklistEngine blacklistDelegate](v70, "blacklistDelegate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_opt_respondsToSelector();

        if ((v53 & 1) != 0)
        {
          -[WFBlacklistEngine blacklistDelegate](v70, "blacklistDelegate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "blacklistDidUpdate");

        }
      }
      objc_msgSend(v8, "blacklistedStatesCurrent");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v55, "count"))
      {

      }
      else
      {
        objc_msgSend(v8, "blacklistTriggers");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "count");

        if (!v57)
          -[NSMutableArray removeObject:](v70->_blacklist, "removeObject:", v8);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s SSID is null"), "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v64), "UTF8String"));
        v65 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v66 = objc_msgSend(v65, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v89 = (const char *)v66;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

      }
      v69 = 0;
      v73 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s discardedNodes is null"), "-[WFBlacklistEngine clearTriggerForNetworkWithUnblacklistReason:reason:]");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v61), "UTF8String"));
      v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v63 = objc_msgSend(v62, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v89 = (const char *)v63;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
    v69 = 0;
    v73 = 0;
    v74 = 0;
  }
LABEL_79:
  objc_msgSend(v10, "removeAllObjects");
  objc_msgSend(v74, "removeAllObjects");

}

- (BOOL)_evaluateTriggersForUnblacklisting:(id)a3 unblacklistReason:(unint64_t)a4 ssid:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  const char *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  id v34;
  unint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "blacklistedStatesHistory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Delegate does not respond to isUserModeInteractive"), "-[WFBlacklistEngine _evaluateTriggersForUnblacklisting:unblacklistReason:ssid:]");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v31), "UTF8String"));
      v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v42 = objc_msgSend(v32, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
    goto LABEL_24;
  }
  -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isUserModeInteractive");

  v14 = "non-interactive";
  if (v13)
    v14 = "interactive";
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s User mode %s "), "-[WFBlacklistEngine _evaluateTriggersForUnblacklisting:unblacklistReason:ssid:]", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v42 = objc_msgSend(v16, "UTF8String");
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
  if ((v13 & 1) != 0)
  {
LABEL_24:
    LOBYTE(v17) = 1;
    goto LABEL_25;
  }
  v34 = v7;
  v35 = a4;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v7, "blacklistedStatesHistory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = 0;
    v22 = *(_QWORD *)v37;
    v23 = v9 - 1;
    v24 = 13;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v17);
        v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend(v26, "blacklistedState") != 1)
        {
          if (objc_msgSend(v26, "blacklistedReason") == 2)
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "timeIntervalSince1970");
            v29 = v28;

            objc_msgSend(v26, "blacklistedStateTimestamp");
            v21 |= v29 - v30 < 21600.0;
          }
          if (v20 == v23)
            v24 = objc_msgSend(v26, "blacklistedReason");
          ++v20;
        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v19);
  }
  else
  {
    v21 = 0;
    v24 = 13;
  }

  LOBYTE(v17) = 0;
  if (v35 != 1 || (v21 & 1) != 0)
  {
    v7 = v34;
  }
  else
  {
    v7 = v34;
    if (v24 <= 7)
      LODWORD(v17) = (0xB0u >> v24) & 1;
  }
LABEL_25:

  return (char)v17;
}

- (void)networkPruned:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  WFBlacklistEngine *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = self->_blacklist;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    if (v6)
    {
      v7 = v6;
      v24 = self;
      v25 = v4;
      v8 = 0;
      v9 = *(_QWORD *)v27;
      v10 = MEMORY[0x1E0C81028];
      do
      {
        v11 = 0;
        v12 = v8;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v5);
          v8 = *(id *)(*((_QWORD *)&v26 + 1) + 8 * v11);

          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v8, "networkDelegate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "ssid");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "networkDelegate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "bssid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316162;
            v31 = "-[WFBlacklistEngine networkPruned:]";
            v32 = 2160;
            v33 = 1752392040;
            v34 = 2112;
            v35 = v14;
            v36 = 2160;
            v37 = 1752392040;
            v38 = 2112;
            v39 = v16;
            _os_log_error_impl(&dword_1CC44E000, v10, OS_LOG_TYPE_ERROR, "%s blacklistedNode %{mask.hash}@[%{mask.hash}@]", buf, 0x34u);

          }
          ++v11;
          v12 = v8;
        }
        while (v7 != v11);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      }
      while (v7);

      self = v24;
      v4 = v25;
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[WFBlacklistEngine networkPruned:].cold.1(v4);
    -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = v17;
      objc_msgSend(v17, "networkPruned");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Node not found for network"), "-[WFBlacklistEngine networkPruned:]");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v21 = (void *)MEMORY[0x1E0CB3940];
        v18 = objc_retainAutorelease(v18);
        objc_msgSend(v21, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v18, "UTF8String"));
        v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v23 = objc_msgSend(v22, "UTF8String");
        *(_DWORD *)buf = 136446210;
        v31 = (const char *)v23;
        _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s network nil"), "-[WFBlacklistEngine networkPruned:]");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v18 = objc_retainAutorelease(v18);
      objc_msgSend(v19, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v18, "UTF8String"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v31 = (const char *)objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }

}

- (void)networkRemovedForSsid:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  WFBlacklistEngine *v32;
  void *v33;
  NSMutableArray *obj;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = self->_blacklist;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v33 = v5;
    v32 = self;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v38;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(obj);
        v9 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * v11);

        objc_msgSend(v9, "networkDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "ssid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v4, "isEqualToString:", v14);

        if (v15)
        {
          v16 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v9, "networkDelegate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "ssid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "networkDelegate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "ssid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringWithFormat:", CFSTR("%s Removing blacklist node for network %@[%@]"), "-[WFBlacklistEngine networkRemovedForSsid:]", v18, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
            v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v23 = objc_msgSend(v22, "UTF8String");
            *(_DWORD *)buf = 136446210;
            v42 = v23;
            _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

          }
          objc_msgSend(v9, "blacklistTriggers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "removeAllObjects");

          objc_msgSend(v9, "blacklistedStatesCurrent");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v35[0] = MEMORY[0x1E0C809B0];
          v35[1] = 3221225472;
          v35[2] = __43__WFBlacklistEngine_networkRemovedForSsid___block_invoke;
          v35[3] = &unk_1E881E818;
          v26 = v9;
          v36 = v26;
          objc_msgSend(v25, "enumerateObjectsUsingBlock:", v35);

          objc_msgSend(v26, "blacklistedStatesCurrent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "removeAllObjects");

          objc_msgSend(v26, "blacklistedStatesHistory");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "removeAllObjects");

          objc_msgSend(v33, "addObject:", v26);
          v8 = 1;
        }
        ++v11;
        v12 = v9;
      }
      while (v7 != v11);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v7);

    self = v32;
    v5 = v33;
  }
  else
  {
    v8 = 0;
  }

  if (objc_msgSend(v5, "count"))
    -[NSMutableArray removeObjectsInArray:](self->_blacklist, "removeObjectsInArray:", v5);
  if ((v8 & 1) != 0)
  {
    -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_opt_respondsToSelector();

    if ((v30 & 1) != 0)
    {
      -[WFBlacklistEngine blacklistDelegate](self, "blacklistDelegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "blacklistDidUpdate");

    }
  }

}

uint64_t __43__WFBlacklistEngine_networkRemovedForSsid___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processBlacklistedStateMetric:unblacklisting:unblacklistingReason:", a2, 1, 0);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  if (a3)
  {
    self->_enabled = 1;
  }
  else
  {
    self->_enabled = 0;
    -[WFBlacklistEngine removeBlacklistedStates](self, "removeBlacklistedStates");
  }
}

- (BOOL)_meetsThresholds:(unint64_t)a3 count:(unsigned int)a4 perSsid:(BOOL)a5 bssid:(id)a6 ssid:(id)a7
{
  _BOOL4 v8;
  uint64_t v9;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  const char *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v8 = a5;
  v9 = *(_QWORD *)&a4;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  if (v8)
  {
    -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntValue");

    LOBYTE(v16) = v15 <= v9;
    v17 = (void *)MEMORY[0x1E0CB3940];
    if (v15 > v9)
      v18 = "not met";
    else
      v18 = "met";
    -[WFBlacklistEngine ssidThresholds](self, "ssidThresholds");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%s ssid '%@' %s thresholds. CurrentCount:%d ThresholdCount:%d"), "-[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:]", v13, v18, v9, objc_msgSend(v20, "unsignedIntValue"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v21), "UTF8String"));
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v31 = (const char *)objc_msgSend(v22, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}s", buf, 0xCu);

    }
  }
  else
  {
    -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectAtIndexedSubscript:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "unsignedIntValue");
    LODWORD(v16) = v25 <= v9;

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      if (v25 > v9)
        v26 = "not met";
      else
        v26 = "met";
      -[WFBlacklistEngine bssidThresholds](self, "bssidThresholds");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", a3);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      v31 = "-[WFBlacklistEngine _meetsThresholds:count:perSsid:bssid:ssid:]";
      v32 = 2160;
      v33 = 1752392040;
      v34 = 2112;
      v35 = v12;
      v36 = 2080;
      v37 = v26;
      v38 = 1024;
      v39 = v9;
      v40 = 1024;
      v41 = objc_msgSend(v28, "unsignedIntValue");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s bssid '%{mask.hash}@' %s thresholds. CurrentCount:%d ThresholdCount:%d", buf, 0x36u);

    }
  }

  return (char)v16;
}

- (id)_findBlacklistNode:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_blacklist;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    v11 = v8;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v5);
      v8 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * v10);

      if ((objc_msgSend(v8, "containsNetwork:", v4, (_QWORD)v13) & 1) != 0)
        break;
      ++v10;
      v11 = v8;
      if (v7 == v10)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;

        goto LABEL_10;
      }
    }
  }
  else
  {
LABEL_10:
    v8 = 0;
  }

  return v8;
}

- (id)retrieveNetworksInBlacklistedState:(unint64_t)a3
{
  id v5;
  NSMutableArray *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id v20;
  NSMutableArray *obj;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v5)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = self->_blacklist;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v23)
    {
      v7 = 0;
      obj = v6;
      v22 = *(_QWORD *)v29;
      do
      {
        v8 = 0;
        v9 = v7;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(obj);
          v7 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * v8);

          v26 = 0u;
          v27 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v7, "blacklistedStatesCurrent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v25 != v13)
                  objc_enumerationMutation(v10);
                if (objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "blacklistedState") == a3)
                {
                  objc_msgSend(v7, "networkDelegate");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v15)
                  {
                    objc_msgSend(v7, "networkDelegate");
                    v16 = (void *)objc_claimAutoreleasedReturnValue();
                    v17 = (void *)objc_msgSend(v16, "copyWithZone:", 0);

                    if (v17)
                      objc_msgSend(v5, "addObject:", v17);

                  }
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v12);
          }

          ++v8;
          v9 = v7;
        }
        while (v8 != v23);
        v6 = obj;
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v23);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  results alloc failed"), "-[WFBlacklistEngine retrieveNetworksInBlacklistedState:]");
    v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      v6 = objc_retainAutorelease(v6);
      objc_msgSend(v19, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), -[NSMutableArray UTF8String](v6, "UTF8String"));
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v35 = objc_msgSend(v20, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }

  return v5;
}

- (id)retrieveNetworksInBlacklistedStateHistory:(unint64_t)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  id v23;
  id v24;
  NSMutableArray *obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v24)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v5 = self->_blacklist;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v31;
      obj = v5;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          v11 = v8;
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          v8 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);

          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v8, "blacklistedStatesHistory");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v27;
            while (2)
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v27 != v15)
                  objc_enumerationMutation(v12);
                v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
                if (objc_msgSend(v17, "blacklistedState") == a3 || objc_msgSend(v17, "blacklistedState") == 5)
                {
                  objc_msgSend(v8, "networkDelegate");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v18)
                  {
                    objc_msgSend(v8, "networkDelegate");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = (void *)objc_msgSend(v19, "copyWithZone:", 0);

                    if (v20)
                      objc_msgSend(v24, "addObject:", v20);

                    goto LABEL_21;
                  }
                }
              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
              if (v14)
                continue;
              break;
            }
          }
LABEL_21:

        }
        v5 = obj;
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  results alloc failed"), "-[WFBlacklistEngine retrieveNetworksInBlacklistedStateHistory:]");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      v5 = objc_retainAutorelease(v5);
      objc_msgSend(v22, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), -[NSMutableArray UTF8String](v5, "UTF8String"));
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136446210;
      v37 = objc_msgSend(v23, "UTF8String");
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

    }
  }

  return v24;
}

- (id)retrieveBlacklistedStateHistoryForNetwork:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (!-[WFBlacklistEngine isNetworkInBlacklistedState:state:](self, "isNetworkInBlacklistedState:state:", v10, a4))
  {
    v15 = 0;
    goto LABEL_30;
  }
  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v14)
    {
      v15 = v14;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      objc_msgSend(v13, "blacklistedStatesHistory");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      if (!v17)
        goto LABEL_28;
      v18 = v17;
      v42 = v13;
      v43 = v10;
      v19 = *(_QWORD *)v46;
      obj = v16;
      while (1)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v46 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v20);
          v22 = objc_msgSend(v21, "blacklistedReason");
          objc_msgSend(v21, "blacklistedStateTimestamp");
          v24 = v23;
          v25 = objc_msgSend(v21, "blacklistedReasonData");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v26)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s reasonNum failed"), "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
LABEL_21:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v31), "UTF8String"));
              v32 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v33 = objc_msgSend(v32, "UTF8String");
              *(_DWORD *)buf = 136446210;
              v51 = v33;
              _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

            }
LABEL_22:

            v30 = 0;
            v28 = 0;
            goto LABEL_16;
          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
          v27 = objc_claimAutoreleasedReturnValue();
          if (!v27)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s timeNum failed"), "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_21;
            goto LABEL_22;
          }
          v28 = (void *)v27;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)v29;
            objc_msgSend(v15, "addObject:", v26);
            if (v11)
              objc_msgSend(v11, "addObject:", v28);
            if (v12)
              objc_msgSend(v12, "addObject:", v30);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s reasonDataNum failed"), "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v34), "UTF8String"));
              v41 = v34;
              v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v36 = objc_msgSend(v35, "UTF8String");
              *(_DWORD *)buf = 136446210;
              v51 = v36;
              _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

              v34 = v41;
            }

            v30 = 0;
          }
LABEL_16:

          ++v20;
        }
        while (v18 != v20);
        v16 = obj;
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
        v18 = v37;
        if (!v37)
        {
          v13 = v42;
          v10 = v43;
          goto LABEL_28;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  results alloc failed"), "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_35;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  Not in blacklisted state"), "-[WFBlacklistEngine retrieveBlacklistedStateHistoryForNetwork:state:timestamps:reasonData:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_35;
  }
  v39 = (void *)MEMORY[0x1E0CB3940];
  v16 = objc_retainAutorelease(v16);
  objc_msgSend(v39, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v16, "UTF8String"));
  v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_DWORD *)buf = 136446210;
  v51 = objc_msgSend(v40, "UTF8String");
  _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

LABEL_35:
  v15 = 0;
LABEL_28:

LABEL_30:
  return v15;
}

- (id)retrieveReasonsForNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4 timestamps:(id)a5 reasonData:(id)a6
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t v48[128];
  uint8_t buf[4];
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v43 = a5;
  v42 = a6;
  if (!-[WFBlacklistEngine isNetworkInBlacklistedState:state:](self, "isNetworkInBlacklistedState:state:", v10, a4))
  {
    v13 = 0;
    goto LABEL_27;
  }
  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v12)
    {
      v13 = v12;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend(v11, "blacklistTriggers");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (!v15)
        goto LABEL_25;
      v16 = v15;
      v40 = v11;
      v41 = v10;
      v17 = *(_QWORD *)v45;
      v18 = 0x1E0CB3000uLL;
      while (1)
      {
        v19 = 0;
        do
        {
          v20 = v18;
          if (*(_QWORD *)v45 != v17)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v19);
          v22 = objc_msgSend(v21, "triggerReason");
          objc_msgSend(v21, "triggerReasonTimestamp");
          v24 = v23;
          v25 = objc_msgSend(v21, "triggerReasonData");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = (id)v27;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v25);
              v29 = objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                v30 = (id)v29;
                objc_msgSend(v13, "addObject:", v26);
                objc_msgSend(v43, "addObject:", v28);
                objc_msgSend(v42, "addObject:", v30);
LABEL_13:

                v18 = v20;
                goto LABEL_14;
              }
              v18 = v20;
              objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("%s reasonDataNum failed"), "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
              v39 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(objc_retainAutorelease(v39), "UTF8String"));
                v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v34 = objc_msgSend(v33, "UTF8String");
                *(_DWORD *)buf = 136446210;
                v50 = v34;
                _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

                v18 = v20;
              }

            }
            else
            {
              v18 = v20;
              objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("%s timeNum failed"), "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
              v28 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
LABEL_19:
                v31 = *(void **)(v20 + 2368);
                v28 = objc_retainAutorelease(v28);
                objc_msgSend(v31, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v28, "UTF8String"));
                v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                v32 = objc_msgSend(v30, "UTF8String");
                *(_DWORD *)buf = 136446210;
                v50 = v32;
                _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);
                goto LABEL_13;
              }
            }
          }
          else
          {
            v18 = v20;
            objc_msgSend(*(id *)(v20 + 2368), "stringWithFormat:", CFSTR("%s reasonNum failed"), "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
            v28 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              goto LABEL_19;
          }
LABEL_14:

          ++v19;
        }
        while (v16 != v19);
        v35 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        v16 = v35;
        if (!v35)
        {
          v11 = v40;
          v10 = v41;
          goto LABEL_25;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  results alloc failed"), "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_32;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s  Not in blacklisted state"), "-[WFBlacklistEngine retrieveReasonsForNetworkInBlacklistedState:state:timestamps:reasonData:]");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_32;
  }
  v37 = (void *)MEMORY[0x1E0CB3940];
  v14 = objc_retainAutorelease(v14);
  objc_msgSend(v37, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v14, "UTF8String"));
  v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  *(_DWORD *)buf = 136446210;
  v50 = objc_msgSend(v38, "UTF8String");
  _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

LABEL_32:
  v13 = 0;
LABEL_25:

LABEL_27:
  return v13;
}

- (BOOL)isNetworkInBlacklistedState:(id)a3 state:(unint64_t)a4
{
  void *v5;
  void *v6;
  char v7;

  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = objc_msgSend(v5, "hasBlacklistedState:", a4);
  else
    v7 = 0;

  return v7;
}

- (int64_t)getRssiWhenNetworkWasBlacklisted:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[WFBlacklistEngine _findBlacklistNode:](self, "_findBlacklistNode:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "networkDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "rssi");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isNetworkBlacklistedForAutoJoinDueToTrigDisc:(id)a3 rssi:(int64_t *)a4 timestamp:(double *)a5
{
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  BOOL v25;
  uint64_t v26;
  int64_t *v28;
  double *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = self->_blacklist;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v28 = a4;
    v29 = a5;
    v11 = 0;
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        v14 = v11;
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v8);
        v11 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);

        if (objc_msgSend(v11, "hasBlacklistedState:", 1))
        {
          objc_msgSend(v11, "networkDelegate");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "ssid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "ssid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v16, "isEqual:", v17);

          if (v18)
          {
            v33 = 0u;
            v34 = 0u;
            v31 = 0u;
            v32 = 0u;
            objc_msgSend(v11, "blacklistedStatesCurrent");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v32;
              while (2)
              {
                for (j = 0; j != v21; ++j)
                {
                  if (*(_QWORD *)v32 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
                  if (objc_msgSend(v24, "blacklistedReason") == 6)
                  {
                    if (v28)
                      *v28 = (int)objc_msgSend(v24, "blacklistedReasonData");
                    if (v29)
                    {
                      objc_msgSend(v24, "blacklistedStateTimestamp");
                      *(_QWORD *)v29 = v26;
                    }
                    v25 = 1;
                    goto LABEL_25;
                  }
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
                if (v21)
                  continue;
                break;
              }
            }

          }
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v10);
    v25 = 0;
    v19 = v11;
    v11 = 0;
LABEL_25:

  }
  else
  {
    v11 = 0;
    v25 = 0;
  }

  return v25;
}

- (id)retrieveBlacklistedNetworkSsids:(unint64_t)a3
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v22;
  NSMutableArray *obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s list not created"), "-[WFBlacklistEngine retrieveBlacklistedNetworkSsids:]");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_22;
    v22 = (void *)MEMORY[0x1E0CB3940];
    v16 = objc_retainAutorelease(v16);
    objc_msgSend(v22, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v16, "UTF8String"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136446210;
    v38 = objc_msgSend(v18, "UTF8String");
    v20 = MEMORY[0x1E0C81028];
    goto LABEL_21;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_blacklist;
  v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v25)
  {
    v6 = 0;
    v24 = *(_QWORD *)v32;
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(obj);
        v26 = v7;
        v6 = *(id *)(*((_QWORD *)&v31 + 1) + 8 * v7);

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        objc_msgSend(v6, "blacklistedStatesCurrent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v28 != v12)
                objc_enumerationMutation(v9);
              if (objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "blacklistedState") == a3)
              {
                objc_msgSend(v6, "networkDelegate");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "ssid");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v5, "appendFormat:", CFSTR("%@ "), v15);
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          }
          while (v11);
        }

        v7 = v26 + 1;
        v8 = v6;
      }
      while (v26 + 1 != v25);
      v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v25);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s : %@"), "-[WFBlacklistEngine retrieveBlacklistedNetworkSsids:]", v5);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    v16 = objc_retainAutorelease(v16);
    objc_msgSend(v17, "stringWithFormat:", CFSTR("[WiFiPolicy] %s"), objc_msgSend(v16, "UTF8String"));
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "UTF8String");
    *(_DWORD *)buf = 136446210;
    v38 = v19;
    v20 = MEMORY[0x1E0C81028];
LABEL_21:
    _os_log_impl(&dword_1CC44E000, v20, OS_LOG_TYPE_ERROR, "%{public}s", buf, 0xCu);

  }
LABEL_22:

  return v5;
}

+ (id)stringRepresentationWithReason:(unint64_t)a3
{
  if (a3 > 0xA)
    return CFSTR("Unknown");
  else
    return off_1E881E860[a3];
}

+ (id)stringRepresentationWithState:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E881E8B8[a3 - 1];
}

- (id)getBlacklist
{
  return self->_blacklist;
}

- (WFBlacklistDelegate)blacklistDelegate
{
  return self->_blacklistDelegate;
}

- (void)setBlacklistDelegate:(id)a3
{
  self->_blacklistDelegate = (WFBlacklistDelegate *)a3;
}

- (NSMutableArray)ssidThresholds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSsidThresholds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)bssidThresholds
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBssidThresholds:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (double)wowBlacklistExpiry
{
  return self->_wowBlacklistExpiry;
}

- (void)setWowBlacklistExpiry:(double)a3
{
  self->_wowBlacklistExpiry = a3;
}

- (double)autojoinBlacklistExpiry
{
  return self->_autojoinBlacklistExpiry;
}

- (void)setAutojoinBlacklistExpiry:(double)a3
{
  self->_autojoinBlacklistExpiry = a3;
}

- (double)bssBlacklistExpiry
{
  return self->_bssBlacklistExpiry;
}

- (void)setBssBlacklistExpiry:(double)a3
{
  self->_bssBlacklistExpiry = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bssidThresholds, 0);
  objc_storeStrong((id *)&self->_ssidThresholds, 0);
  objc_storeStrong((id *)&self->_blacklist, 0);
}

- (void)clearTriggerForNetworkWithUnblacklistReason:(void *)a1 reason:.cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "ssid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1CC44E000, MEMORY[0x1E0C81028], v4, "%s node not found with ssid:%{mask.hash}@ bssid:%{mask.hash}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_1();
}

- (void)networkPruned:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "ssid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1CC44E000, MEMORY[0x1E0C81028], v4, "%s network %{mask.hash}@[%{mask.hash}@]", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2_1();
}

@end
