@implementation CSSearchAgent

- (void)startQuery:(id)a3
{
  id v3;
  void *v4;
  xpc_object_t reply;
  void *v6;
  uint64_t uint64;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t spanid;
  NSObject *v15;
  NSObject *v16;
  const char *string;
  const char *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id *v23;
  __int128 v24;
  int v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t pid;
  __CFString *v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  int v34;
  MDIndexer *indexer;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  int v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  uint64_t v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  MDIndexer *v51;
  id v52;
  MDIndexer *v53;
  void *v54;
  NSObject *v55;
  uint64_t v56;
  id *v57;
  id *v58;
  id *v59;
  id v60;
  id v61;
  int v62;
  char v63;
  id v64;
  void *v65;
  __CFString *v66;
  id v67;
  void *v68;
  _BOOL4 v69;
  id v70;
  id *v71;
  unsigned int v72;
  MDIndexer *v73;
  __CFString *v74;
  void *v75;
  int v76;
  id v77;
  id val;
  _QWORD v80[5];
  __CFString *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _QWORD *v86;
  _QWORD *v87;
  id v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  BOOL v93;
  char v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  id v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  id from;
  _QWORD v106[4];
  NSObject *v107;
  id *v108;
  id v109;
  CSSearchAgent *v110;
  _QWORD *v111;
  _QWORD *v112;
  _QWORD *v113;
  _QWORD *v114;
  _QWORD *v115;
  _QWORD *v116;
  _QWORD *v117;
  id v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  char v124;
  BOOL v125;
  char v126;
  char v127;
  id location;
  _QWORD v129[3];
  char v130;
  _QWORD v131[3];
  char v132;
  _QWORD v133[3];
  char v134;
  _QWORD v135[3];
  char v136;
  _QWORD v137[3];
  char v138;
  _QWORD v139[3];
  char v140;
  _QWORD v141[3];
  char v142;
  id v143;
  id v144;
  __int128 v145;
  __int128 v146;
  uint64_t v147;
  char v148[32];
  _BYTE buf[32];
  _QWORD v150[6];

  v150[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  xpc_dictionary_get_remote_connection(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v3);
  v6 = reply;
  if (v4 && reply)
  {
    -[CSSearchAgent searchConnection:](self, "searchConnection:", v4);
    val = (id)objc_claimAutoreleasedReturnValue();
    if (val)
      uint64 = xpc_dictionary_get_uint64(v3, "qid");
    else
      uint64 = 0;
    logForCSLogCategoryQuery();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = uint64;
      _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_INFO, "os_signpost_interval_begin qid=%ld", buf, 0xCu);
    }

    v11 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v12 = *(_OWORD *)(v11 + 16);
    v145 = *(_OWORD *)v11;
    v146 = v12;
    v147 = *(_QWORD *)(v11 + 32);
    v13 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v11 = v13;
    *(_QWORD *)(v11 + 8) = spanid;
    *(_QWORD *)(v11 + 16) = 0;
    *(_DWORD *)(v11 + 24) = uint64;
    *(_BYTE *)(v11 + 28) = 102;
    *(_QWORD *)(v11 + 32) = "csquery_command_start_query";
    si_tracing_log_span_begin();
    logForCSLogCategoryQuery();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (uint64 - 1 > 0xFFFFFFFFFFFFFFFDLL)
    {

      if (!uint64)
      {
        v9 = 0;
        goto LABEL_30;
      }
    }
    else
    {
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_213CF1000, v16, OS_SIGNPOST_INTERVAL_BEGIN, uint64, "CSSearchLatency", (const char *)&unk_213D89001, buf, 2u);
      }

    }
    string = xpc_dictionary_get_string(v3, "query");
    v18 = string;
    if (!string || !strcmp(string, "false"))
    {
      v9 = 0;
    }
    else
    {
      xpc_dictionary_get_value(v3, "context");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDC2468]), "initWithXPCDictionary:", v19);

      if (v9)
      {
        objc_msgSend(val, "bundleID");
        v71 = (id *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend(val, "searchInternal");
        v20 = -[NSObject playback](v9, "playback");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v20 & 1) != 0)
        {
          if (!v72)
          {
            v72 = 0;
            goto LABEL_54;
          }
          -[NSObject clientBundleID](v9, "clientBundleID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          if (v21)
          {
            v23 = v21;

            v71 = v23;
          }
          v72 = -[NSObject internal](v9, "internal");
LABEL_53:

LABEL_54:
          -[NSObject setClientBundleID:](v9, "setClientBundleID:", v71);
          -[NSObject setInternal:](v9, "setInternal:", v72);
          v30 = v75;
          v31 = -[__CFString length](v30, "length");
          v32 = v30;
          if (!v31)
          {

            v32 = CFSTR("(true)");
          }
          v66 = (__CFString *)v32;

          -[CSSearchAgent _prepareQueryContext:searchConnection:](self, "_prepareQueryContext:searchConnection:", v9, val);
          -[NSObject clientBundleID](v9, "clientBundleID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v33, "hasPrefix:", CFSTR("com.apple.omniSearch")))
          {

          }
          else
          {
            v34 = _os_feature_enabled_impl();

            if (!v34)
            {
              v64 = 0;
              v60 = 0;
              goto LABEL_62;
            }
          }
          indexer = self->_indexer;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = 0;
          v143 = 0;
          -[MDIndexer processSearchString:intoTrimmedString:andTokens:](indexer, "processSearchString:intoTrimmedString:andTokens:", v36, &v144, &v143);
          v60 = v144;
          v64 = v143;

          if ((objc_opt_respondsToSelector() & 1) != 0)
            -[MDIndexer rewriteFirstPassQueryWithQueryString:context:trimmedSearchStringTokens:populateDateSynonyms:](self->_indexer, "rewriteFirstPassQueryWithQueryString:context:trimmedSearchStringTokens:populateDateSynonyms:", v66, v9, v64, 1);
LABEL_62:
          v76 = -[NSObject live](v9, "live");
          v63 = -[NSObject lowPriority](v9, "lowPriority");
          v62 = -[NSObject qos](v9, "qos");
          v61 = -[NSObject copy](v9, "copy");
          v141[0] = 0;
          v141[1] = v141;
          v141[2] = 0x2020000000;
          v142 = 0;
          v139[0] = 0;
          v139[1] = v139;
          v139[2] = 0x2020000000;
          v140 = 0;
          if (-[NSObject pommes](v9, "pommes"))
          {
            -[NSObject bundleIDs](v9, "bundleIDs");
            v58 = (id *)objc_claimAutoreleasedReturnValue();
            -[NSObject userQuery](v9, "userQuery");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_opt_respondsToSelector();
            v39 = -[NSObject counting](v9, "counting");
            -[NSObject queryEmbedding](v9, "queryEmbedding");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = +[SDPommesFeature usingRewritesForContextBundleIDs:clientBundleID:userQuery:indexSupportsRewrites:isCounting:embeddingsEnabled:](SDPommesFeature, "usingRewritesForContextBundleIDs:clientBundleID:userQuery:indexSupportsRewrites:isCounting:embeddingsEnabled:", v58, v71, v37, v38 & 1, v39, v40 != 0);

            logForCSLogCategoryQuery();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              v42 = -[NSObject rankingType](v9, "rankingType");
              v43 = CFSTR("NO");
              if (v69)
                v44 = CFSTR("YES");
              else
                v44 = CFSTR("NO");
              *(_DWORD *)buf = 134218754;
              *(_QWORD *)&buf[4] = uint64;
              if (v42 == 1)
                v45 = CFSTR("YES");
              else
                v45 = CFSTR("NO");
              *(_QWORD *)&buf[14] = v44;
              *(_WORD *)&buf[12] = 2112;
              *(_WORD *)&buf[22] = 2112;
              if (v76)
                v43 = CFSTR("YES");
              *(_QWORD *)&buf[24] = v45;
              LOWORD(v150[0]) = 2112;
              *(_QWORD *)((char *)v150 + 2) = v43;
              _os_log_impl(&dword_213CF1000, v41, OS_LOG_TYPE_INFO, "[rewrite] qid=%ld rewriteAllowed:%@ topHit:%@ live:%@", buf, 0x2Au);
            }

          }
          else
          {
            LOBYTE(v69) = 0;
          }
          v137[0] = 0;
          v137[1] = v137;
          v137[2] = 0x2020000000;
          v138 = 0;
          v135[0] = 0;
          v135[1] = v135;
          v135[2] = 0x2020000000;
          v136 = 0;
          v133[0] = 0;
          v133[1] = v133;
          v133[2] = 0x2020000000;
          v134 = 0;
          v131[0] = 0;
          v131[1] = v131;
          v131[2] = 0x2020000000;
          v132 = 0;
          v129[0] = 0;
          v129[1] = v129;
          v129[2] = 0x2020000000;
          v130 = 0;
          location = 0;
          objc_initWeak(&location, val);
          *(_OWORD *)buf = *(_OWORD *)v11;
          *(_OWORD *)&buf[16] = *(_OWORD *)(v11 + 16);
          v150[0] = *(_QWORD *)(v11 + 32);
          v46 = MEMORY[0x24BDAC760];
          v106[0] = MEMORY[0x24BDAC760];
          v106[1] = 3221225472;
          v106[2] = __28__CSSearchAgent_startQuery___block_invoke;
          v106[3] = &unk_24D0EDC70;
          v119 = *(_OWORD *)buf;
          v120 = *(_OWORD *)&buf[16];
          v121 = v150[0];
          v124 = v72;
          v59 = &v118;
          objc_copyWeak(&v118, &location);
          v9 = v9;
          v125 = v69;
          v107 = v9;
          v111 = v141;
          v112 = v137;
          v113 = v133;
          v126 = v76;
          v114 = v135;
          v115 = v129;
          v122 = uint64;
          v116 = v131;
          v57 = v71;
          v108 = v57;
          v47 = v4;
          v109 = v47;
          v110 = self;
          v127 = v63;
          v123 = v62;
          v117 = v139;
          v48 = (void *)objc_msgSend(v106, "copy");
          from = 0;
          objc_initWeak(&from, val);
          v95[0] = v46;
          v95[1] = 3221225472;
          v95[2] = __28__CSSearchAgent_startQuery___block_invoke_143;
          v95[3] = &unk_24D0EDC98;
          v100 = *(_OWORD *)buf;
          v101 = *(_OWORD *)&buf[16];
          v102 = v150[0];
          v104 = v76;
          v49 = v48;
          v98 = v49;
          v96 = v6;
          v103 = uint64;
          v97 = v47;
          objc_copyWeak(&v99, &from);
          v50 = (void *)MEMORY[0x2199C2F34](v95);
          v51 = self->_indexer;
          v80[0] = v46;
          v80[1] = 3221225472;
          v80[2] = __28__CSSearchAgent_startQuery___block_invoke_2_146;
          v80[3] = &unk_24D0EDD38;
          v73 = v51;
          objc_copyWeak(&v88, &from);
          v89 = *(_OWORD *)buf;
          v90 = *(_OWORD *)&buf[16];
          v91 = v150[0];
          v92 = uint64;
          v86 = v137;
          v93 = v69;
          v70 = v50;
          v84 = v70;
          v87 = v141;
          v85 = v49;
          v80[4] = self;
          v81 = v66;
          v67 = v61;
          v82 = v67;
          v94 = v76;
          v52 = v3;
          v83 = v52;
          v53 = v73;
          v74 = v81;
          v77 = v85;
          -[MDIndexer taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:](v53, "taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v81, v9, 0, v85, v80);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (v54)
          {
            objc_msgSend(val, "setQueryTask:forQueryID:", v54, uint64, v57, &v118, v60);
            -[MDIndexer startQueryTask:](self->_indexer, "startQueryTask:", v54);
          }
          else
          {
            logForCSLogCategoryDefault();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              v56 = xpc_dictionary_get_uint64(v52, "qid");
              -[CSSearchAgent startQuery:].cold.1((uint64_t)v52, (uint64_t)v148, v56, v55);
            }

          }
          objc_destroyWeak(&v88);

          objc_destroyWeak(&v99);
          objc_destroyWeak(&from);

          objc_destroyWeak(v59);
          objc_destroyWeak(&location);
          _Block_object_dispose(v129, 8);
          _Block_object_dispose(v131, 8);
          _Block_object_dispose(v133, 8);
          _Block_object_dispose(v135, 8);
          _Block_object_dispose(v137, 8);
          _Block_object_dispose(v139, 8);
          _Block_object_dispose(v141, 8);

          if (v54)
            goto LABEL_31;
          goto LABEL_30;
        }
        objc_msgSend(val, "overrideMailHitCounts:", v9);
        if (!objc_msgSend(MEMORY[0x24BDC24C8], "journalEnabled"))
          goto LABEL_54;
        v22 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyPlistFromXPCObject:", v3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_53;
        if (v71)
          v25 = 1;
        else
          v25 = v72;
        if (v25 != 1)
        {
LABEL_52:
          v28 = (void *)MEMORY[0x24BDC24C8];
          pid = xpc_connection_get_pid((xpc_connection_t)v4);
          objc_msgSend(v28, "journalDictionary:toFolderPath:forPID:withLabel:andID:", v22, "/private/tmp", pid, "query", xpc_dictionary_get_uint64(v3, "qid"));
          goto LABEL_53;
        }
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("context"));
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_51;
        if (v71)
          objc_msgSend(v68, "setObject:forKeyedSubscript:", v71, CFSTR("cbi"));
        if (!v72)
        {
LABEL_51:

          goto LABEL_52;
        }
        objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("f"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v26 = objc_msgSend(v65, "unsignedIntValue");
          if ((v26 & 1) != 0)
            goto LABEL_50;
        }
        else
        {
          v26 = 0;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v26 | 1u);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:forKeyedSubscript:", v27, CFSTR("f"));

LABEL_50:
        goto LABEL_51;
      }
    }
LABEL_30:
    xpc_dictionary_set_uint64(v6, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message((xpc_connection_t)v4, v6);
LABEL_31:
    si_tracing_log_span_end();
    v24 = v146;
    *(_OWORD *)v11 = v145;
    *(_OWORD *)(v11 + 16) = v24;
    *(_QWORD *)(v11 + 32) = v147;

LABEL_32:
    goto LABEL_33;
  }
  if (!v4)
  {
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CSSearchAgent startQuery:].cold.3(v3, v8);

  }
  if (!v6)
  {
    logForCSLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CSSearchAgent startQuery:].cold.2(v3, v9);
    goto LABEL_32;
  }
LABEL_33:

}

- (id)searchConnection:(id)a3
{
  void *v4;
  void *v5;

  +[CSSearchClientConnectionKey keyWithConnection:](CSSearchClientConnectionKey, "keyWithConnection:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_searchConnections, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_prepareQueryContext:(id)a3 searchConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v36;
  _BOOL4 v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  CSSearchAgent *v81;
  char v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  void *v95;
  uint64_t v96;
  void *v97;
  void *v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "internal");
  objc_msgSend(v6, "bundleIDs");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x24BDBD1A8];
  if (v10)
    v13 = (void *)v10;
  else
    v13 = (void *)MEMORY[0x24BDBD1A8];
  v14 = v13;

  objc_msgSend(v6, "additionalBundleIDs");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (void *)v15;
  else
    v17 = v12;
  v18 = v17;

  objc_msgSend(v6, "instantAnswersBundleIDs");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (void *)v19;
  else
    v21 = v12;
  v22 = v21;

  v85 = v18;
  v86 = v7;
  v83 = v14;
  v84 = v22;
  if ((v9 & 1) != 0)
  {
    if ((objc_msgSend(v6, "includeUserActivities") & 1) == 0)
      objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.search"));
    goto LABEL_34;
  }
  if (!objc_msgSend(v14, "count"))
  {
    if ((objc_msgSend(v6, "sourceOptions") & 1) != 0
      && (objc_msgSend(v7, "configuration"),
          v31 = (void *)objc_claimAutoreleasedReturnValue(),
          v32 = objc_msgSend(v31, "allowMail"),
          v31,
          (v32 & 1) != 0))
    {
      v33 = &unk_24D0FD138;
    }
    else
    {
      v97 = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v97, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "setBundleIDs:", v33);

LABEL_34:
    v37 = 0;
    goto LABEL_49;
  }
  v81 = self;
  objc_msgSend(v7, "allowedBundleIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v24 = v14;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = *(_QWORD *)v92;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v92 != v28)
          objc_enumerationMutation(v24);
        v30 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isEqualToString:", v30) & 1) == 0)
        {
          if ((objc_msgSend(v23, "containsObject:", v30) & 1) == 0)
          {
            logForCSLogCategoryDefault();
            v34 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              -[CSSearchAgent _prepareQueryContext:searchConnection:].cold.2();

            if ((v27 & 1) != 0)
            {
              v38 = (void *)objc_opt_new();
              v87 = 0u;
              v88 = 0u;
              v89 = 0u;
              v90 = 0u;
              v39 = v24;
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
              if (v40)
              {
                v41 = v40;
                v42 = *(_QWORD *)v88;
                do
                {
                  for (j = 0; j != v41; ++j)
                  {
                    if (*(_QWORD *)v88 != v42)
                      objc_enumerationMutation(v39);
                    v44 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j);
                    if ((objc_msgSend(v23, "containsObject:", v44) & 1) != 0
                      || objc_msgSend(v8, "isEqualToString:", v44))
                    {
                      objc_msgSend(v38, "addObject:", v8);
                    }
                  }
                  v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v87, v99, 16);
                }
                while (v41);
              }

              objc_msgSend(v6, "setBundleIDs:", v38);
              v36 = 1;
            }
            else
            {
              v98 = v8;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v98, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "setBundleIDs:", v35);

              v36 = 0;
            }
            goto LABEL_48;
          }
          v27 = 1;
        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
      if (v26)
        continue;
      break;
    }
  }
  else
  {
    v27 = 0;
  }

  v36 = v27 & 1;
LABEL_48:
  v18 = v85;

  v37 = v36 != 0;
  v7 = v86;
  v22 = v84;
  self = v81;
LABEL_49:
  if (objc_msgSend(v6, "generateSuggestions"))
  {
    if (objc_msgSend(v18, "count"))
    {
      objc_msgSend(v6, "bundleIDs");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "count");

      if (v46)
      {
        objc_msgSend(v6, "bundleIDs");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "arrayByAddingObjectsFromArray:", v18);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setBundleIDs:", v48);

      }
    }
  }
  if (objc_msgSend(v6, "enableInstantAnswers"))
  {
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v6, "bundleIDs");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");

      if (v50)
      {
        objc_msgSend(v6, "bundleIDs");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "arrayByAddingObjectsFromArray:", v22);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setBundleIDs:", v52);

      }
    }
  }
  objc_msgSend(v7, "configuration");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntitledAttributes:", objc_msgSend(v53, "entitledAttributes"));

  objc_msgSend(v7, "configuration");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "allowNotifications");

  if ((v55 & 1) != 0)
  {
    logForCSLogCategoryQuery();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
      -[CSSearchAgent _prepareQueryContext:searchConnection:].cold.1(v6, v56);
  }
  else
  {
    objc_msgSend(v6, "disableBundles");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (v57)
    {
      objc_msgSend(v6, "disableBundles");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "arrayByAddingObject:", CFSTR("com.apple.usernotificationsd"));
      v56 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v56 = &unk_24D0FD150;
    }

    objc_msgSend(v6, "setDisableBundles:", v56);
  }

  objc_msgSend(v6, "bundleIDs");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v59, "count"))
  {
    objc_msgSend(v6, "bundleIDs");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "containsObject:", CFSTR("com.apple.mobileslideshow"));

    if ((v61 & 1) != 0)
      goto LABEL_83;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v62;
  if ((v9 & 1) == 0)
    objc_msgSend(v62, "addObject:", CFSTR("_kMDItemUserActivityType != \"*\"));
  if (v37)
    objc_msgSend(v22, "addObject:", CFSTR("kMDItemHashtags==*"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MDIndexer fileProviderDomainFilterQueries](self->_indexer, "fileProviderDomainFilterQueries");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (v63 && objc_msgSend(v63, "count"))
      objc_msgSend(v22, "addObjectsFromArray:", v64);

  }
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v6, "filterQueries");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (v65)
    {
      objc_msgSend(v6, "filterQueries");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "arrayByAddingObjectsFromArray:", v22);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFilterQueries:", v67);

    }
    else
    {
      objc_msgSend(v6, "setFilterQueries:", v22);
    }

  }
LABEL_83:
  objc_msgSend(v6, "protectionClasses");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIDs");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "containsObject:", CFSTR("com.apple.spotlight.events"));
  if ((v70 & 1) == 0)
  {
    objc_msgSend(v6, "bundleIDs");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v22, "containsObject:", CFSTR("com.apple.spotlight.contacts")))
      goto LABEL_91;
  }
  objc_msgSend(v6, "protectionClasses");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = *MEMORY[0x24BDD0CE0];
  if ((objc_msgSend(v71, "containsObject:", *MEMORY[0x24BDD0CE0]) & 1) != 0)
  {
LABEL_90:

    if ((v70 & 1) != 0)
    {
LABEL_92:
      v75 = v86;
      v76 = v84;
LABEL_93:

      goto LABEL_94;
    }
LABEL_91:

    goto LABEL_92;
  }
  objc_msgSend(v6, "clientBundleID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v73, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0)
  {
LABEL_89:

    goto LABEL_90;
  }
  objc_msgSend(v6, "clientBundleID");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v74, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0)
  {

    goto LABEL_89;
  }
  objc_msgSend(v6, "clientBundleID");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v80, "hasPrefix:", CFSTR("com.apple.SpotlightUITests"));

  if ((v70 & 1) == 0)
  v75 = v86;
  v76 = v84;
  if ((v82 & 1) == 0)
  {
    if (objc_msgSend(v68, "count"))
    {
      objc_msgSend(v68, "arrayByAddingObject:", v72);
    }
    else
    {
      v96 = v72;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v96, 1);
    }
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProtectionClasses:", v79);

    objc_msgSend(v6, "protectionClasses");
    v69 = v68;
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_93;
  }
LABEL_94:
  if (v68 && !objc_msgSend(v68, "count"))
  {
    objc_msgSend(v75, "protectionClass");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = v77;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v95, 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProtectionClasses:", v78);

  }
}

- (BOOL)addClientConnectionIfAllowedForConnection:(id)a3
{
  id v4;
  SDConnectionConfiguration *v5;
  SDConnectionConfiguration *v6;

  v4 = a3;
  v5 = [SDConnectionConfiguration alloc];
  v6 = -[SDConnectionConfiguration initWithConnection:isPrivate:](v5, "initWithConnection:isPrivate:", v4, sSearchAgentIsPrivate);

  LOBYTE(self) = -[CSSearchAgent addClientConnectionIfAllowedForConfiguration:](self, "addClientConnectionIfAllowedForConfiguration:", v6);
  return (char)self;
}

- (BOOL)addClientConnectionIfAllowedForConfiguration:(id)a3
{
  id v4;
  CSSearchClientConnection *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v12;

  v4 = a3;
  v5 = -[CSSearchClientConnection initWithConnectionConfiguration:]([CSSearchClientConnection alloc], "initWithConnectionConfiguration:", v4);
  -[CSSearchClientConnection bundleID](v5, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

LABEL_4:
    objc_msgSend(v4, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSSearchClientConnectionKey keyWithConnection:](CSSearchClientConnectionKey, "keyWithConnection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CSSearchAgent searchConnections](self, "searchConnections");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, v8);

    v10 = 1;
    goto LABEL_5;
  }
  if (-[CSSearchClientConnection searchInternal](v5, "searchInternal"))
    goto LABEL_4;
  logForCSLogCategoryQuery();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[CSSearchAgent addClientConnectionIfAllowedForConfiguration:].cold.1(v4);

  v10 = 0;
LABEL_5:

  return v10;
}

- (NSMutableDictionary)searchConnections
{
  return self->_searchConnections;
}

void __28__CSSearchAgent_startQuery___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "received XPC reply";
  si_tracing_log_span_begin();
  objc_msgSend(*(id *)(a1 + 32), "_didReceiveResultsBatchCompletion");
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

void __28__CSSearchAgent_startQuery___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t spanid;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  void *v22;
  uint64_t v23;
  BOOL v24;
  int v25;
  NSObject *v26;
  void *v27;
  BOOL v28;
  void *v29;
  xpc_object_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  NSObject *v39;
  unsigned int VectorCount;
  const void *Vector;
  NSObject *v42;
  xpc_object_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  dispatch_qos_class_t v49;
  void *v50;
  dispatch_block_t v51;
  NSObject *v52;
  NSObject *v53;
  os_signpost_id_t v54;
  __int128 v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  os_signpost_id_t *v68;
  void *v69;
  id v70;
  id WeakRetained;
  id v72;
  uint8_t buf[8];
  _QWORD v74[4];
  id v75;
  id v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  __int128 v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  _BYTE v90[48];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v72 = a6;
  v10 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v11 = *(_OWORD *)(v10 + 16);
  v87 = *(_OWORD *)v10;
  v88 = v11;
  v89 = *(_QWORD *)(v10 + 32);
  v12 = *(_QWORD *)(a1 + 160);
  v13 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v10 + 16) = v13;
  *(_QWORD *)(v10 + 32) = v12;
  v14 = *(_OWORD *)(a1 + 144);
  v84 = *(_OWORD *)(a1 + 128);
  v85 = v14;
  v86 = *(_QWORD *)(a1 + 160);
  v15 = *(_QWORD *)v10;
  spanid = si_tracing_calc_next_spanid();
  v17 = *(_QWORD *)(v10 + 8);
  *(_QWORD *)v10 = v15;
  *(_QWORD *)(v10 + 8) = spanid;
  *(_QWORD *)(v10 + 16) = v17;
  *(_BYTE *)(v10 + 28) = 102;
  *(_QWORD *)(v10 + 32) = "resultsHandler";
  si_tracing_log_span_begin();
  v18 = v72;
  if (!*(_BYTE *)(a1 + 180))
    v18 = 0;
  v70 = v18;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 120));
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  switch(a2)
  {
    case 0u:
    case 6u:
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (*(_BYTE *)(v23 + 24))
      {
        v24 = 1;
      }
      else
      {
        v24 = _MDStoreOIDArrayGetVectorCount() != 0;
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      }
      *(_BYTE *)(v23 + 24) = v24;
      v21 = *(_BYTE *)(a1 + 182) != 0;
      if (!*(_BYTE *)(a1 + 181))
        goto LABEL_31;
      v19 = 0;
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        goto LABEL_81;
      v20 = 1;
      goto LABEL_44;
    case 1u:
      if (!*(_BYTE *)(a1 + 181)
        || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
        || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
      {
        v25 = 1;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
        if (!*(_BYTE *)(a1 + 181))
        {
          v20 = 0;
          v21 = 0;
          v19 = 0;
          v22 = 0;
          goto LABEL_45;
        }
      }
      else
      {
        v25 = 0;
      }
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        goto LABEL_80;
      logForCSLogCategoryQuery();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        __28__CSSearchAgent_startQuery___block_invoke_cold_3();
      goto LABEL_42;
    case 2u:
      if (!v72)
      {
        if (!*(_BYTE *)(a1 + 181)
          || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
          || *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        {
          v25 = 1;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
        }
        else
        {
          objc_msgSend(WeakRetained, "queryTask:", *(_QWORD *)(a1 + 168));
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "cancel");

          v25 = 0;
        }
        if (*(_BYTE *)(a1 + 181) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
        {
          logForCSLogCategoryQuery();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            __28__CSSearchAgent_startQuery___block_invoke_cold_2();
LABEL_42:

          v19 = 0;
          if ((v25 & 1) != 0)
            goto LABEL_43;
        }
        else
        {
LABEL_80:
          v19 = 0;
          if (v25)
            goto LABEL_43;
        }
LABEL_81:
        v22 = 0;
        goto LABEL_82;
      }
      if (!objc_msgSend(*(id *)(a1 + 32), "priorityIndexQuery"))
      {
LABEL_25:
        v22 = 0;
        v19 = 0;
        goto LABEL_82;
      }
      v19 = 0;
      if ((objc_msgSend(v72, "isEqual:", CFSTR("Priority")) & 1) == 0)
        goto LABEL_81;
LABEL_43:
      v20 = 0;
      v21 = 0;
LABEL_44:
      v22 = 0;
LABEL_45:
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
        || (objc_msgSend(WeakRetained, "queryTask:", *(_QWORD *)(a1 + 168)),
            (v69 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = 1;
          goto LABEL_82;
        }
        v69 = 0;
      }
      v30 = xpc_dictionary_create(0, 0, 0);
      v67 = a1 + 168;
      xpc_dictionary_set_uint64(v30, "qid", *(_QWORD *)(a1 + 168));
      xpc_dictionary_set_uint64(v30, "t", a2);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      {
        logForCSLogCategoryQuery();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          __28__CSSearchAgent_startQuery___block_invoke_cold_1(v67, v31, v32, v33, v34, v35, v36, v37);
      }
      else
      {
        if (v22)
        {
          v38 = objc_retainAutorelease(v22);
          xpc_dictionary_set_data(v30, "rd", (const void *)objc_msgSend(v38, "bytes"), objc_msgSend(v38, "length"));
        }
        else if (v20)
        {
          objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setPlistBytes:forKey:sizeKey:", v30, a5, "rd", "rdl");
          logForCSLogCategoryQuery();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          {
            v64 = objc_msgSend(WeakRetained, "outBatchCount");
            v65 = *(_QWORD *)(a1 + 40);
            v66 = *(_QWORD *)(a1 + 168);
            *(_DWORD *)v90 = 67110146;
            *(_DWORD *)&v90[4] = a2;
            *(_WORD *)&v90[8] = 1024;
            *(_DWORD *)&v90[10] = v64;
            *(_WORD *)&v90[14] = 2112;
            *(_QWORD *)&v90[16] = v65;
            *(_WORD *)&v90[24] = 2112;
            *(_QWORD *)&v90[26] = v72;
            *(_WORD *)&v90[34] = 2048;
            *(_QWORD *)&v90[36] = v66;
            _os_log_debug_impl(&dword_213CF1000, v39, OS_LOG_TYPE_DEBUG, "Found query results, type:%d outBatchCount:%u, clientBundleID:%@, dataclass:%@ qid:%ld", v90, 0x2Cu);
          }

        }
        if (v21)
        {
          VectorCount = _MDStoreOIDArrayGetVectorCount();
          Vector = (const void *)_MDStoreOIDArrayGetVector();
          xpc_dictionary_set_data(v30, "od", Vector, 8 * VectorCount);
          logForCSLogCategoryQuery();
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          {
            v60 = objc_msgSend(WeakRetained, "outBatchCount");
            v61 = *(_QWORD *)(a1 + 40);
            v62 = *(_QWORD *)(a1 + 168);
            *(_DWORD *)v90 = 67110146;
            *(_DWORD *)&v90[4] = v60;
            *(_WORD *)&v90[8] = 2048;
            *(_QWORD *)&v90[10] = 8 * VectorCount;
            *(_WORD *)&v90[18] = 2112;
            *(_QWORD *)&v90[20] = v61;
            *(_WORD *)&v90[28] = 2112;
            *(_QWORD *)&v90[30] = v72;
            *(_WORD *)&v90[38] = 2048;
            *(_QWORD *)&v90[40] = v62;
            _os_log_debug_impl(&dword_213CF1000, v42, OS_LOG_TYPE_DEBUG, "Remove query results, outBatchCount:%u, size:%ld, clientBundleID:%@, dataclass:%@ qid: %ld", v90, 0x30u);
          }

        }
        if (v70)
        {
          v43 = xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v70), "UTF8String"));
          xpc_dictionary_set_value(v30, "pc", v43);

        }
        logForCSLogCategoryQuery();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v58 = *(_QWORD *)(a1 + 40);
          v59 = *(_QWORD *)(a1 + 168);
          *(_DWORD *)v90 = 138412802;
          *(_QWORD *)&v90[4] = v58;
          *(_WORD *)&v90[12] = 2112;
          *(_QWORD *)&v90[14] = v72;
          *(_WORD *)&v90[22] = 2048;
          *(_QWORD *)&v90[24] = v59;
          _os_log_debug_impl(&dword_213CF1000, v31, OS_LOG_TYPE_DEBUG, "Found query results clientBundleID:%@, dataclass:%@ qid:%ld", v90, 0x20u);
        }
      }

      *(_OWORD *)v90 = *(_OWORD *)v10;
      *(_OWORD *)&v90[16] = *(_OWORD *)(v10 + 16);
      *(_QWORD *)&v90[32] = *(_QWORD *)(v10 + 32);
      v74[0] = MEMORY[0x24BDAC760];
      v74[1] = 3221225472;
      v74[2] = __28__CSSearchAgent_startQuery___block_invoke_139;
      v74[3] = &unk_24D0EDC48;
      v75 = WeakRetained;
      v44 = v69;
      v45 = *(_QWORD *)(a1 + 168);
      v76 = v44;
      v80 = v45;
      v77 = *(id *)(a1 + 48);
      v46 = v30;
      v47 = *(_QWORD *)(a1 + 56);
      v78 = v46;
      v79 = v47;
      v81 = *(_OWORD *)v90;
      v82 = *(_OWORD *)&v90[16];
      v83 = *(_QWORD *)&v90[32];
      v48 = (void *)MEMORY[0x2199C2F34](v74);
      if (*(_BYTE *)(a1 + 182) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      {
        if (*(_BYTE *)(a1 + 183))
          v49 = QOS_CLASS_BACKGROUND;
        else
          v49 = *(_DWORD *)(a1 + 176);
        objc_msgSend(*(id *)(a1 + 56), "queue", v67);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v49, 0, v48);
        tracing_dispatch_async();
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "queue", v67);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, (dispatch_qos_class_t)*(_DWORD *)(a1 + 176), 0, v48);
        tracing_dispatch_async();
      }

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
      {
        logForCSLogCategoryQuery();
        v52 = objc_claimAutoreleasedReturnValue();
        v53 = v52;
        v54 = *v68;
        if (*v68 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_213CF1000, v53, OS_SIGNPOST_INTERVAL_END, v54, "CSSearchLatency", (const char *)&unk_213D89001, buf, 2u);
        }

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
      }

LABEL_82:
      si_tracing_log_span_end();
      v55 = v88;
      *(_OWORD *)v10 = v87;
      *(_OWORD *)(v10 + 16) = v55;
      *(_QWORD *)(v10 + 32) = v89;

      return;
    case 3u:
    case 4u:
      goto LABEL_82;
    case 5u:
      *(_QWORD *)v90 = a3;
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v90, 8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v21 = 0;
      v19 = 0;
      goto LABEL_45;
    case 7u:
      v20 = 0;
      v19 = 0;
      v22 = 0;
      v21 = 1;
      goto LABEL_45;
    case 8u:
      if (a5)
      {
        v27 = (void *)_MDPlistBytesCopyPlistAtIndex();
        v19 = v27;
        if (v27)
        {
          v28 = objc_msgSend(v27, "count") != 0;
          goto LABEL_85;
        }
      }
      else
      {
        v19 = 0;
      }
      v28 = 0;
LABEL_85:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v28;
      v56 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (*(_BYTE *)(v56 + 24))
        v57 = 1;
      else
        v57 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) != 0;
      *(_BYTE *)(v56 + 24) = v57;
      if (*(_BYTE *)(a1 + 181))
      {
        v22 = 0;
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
          goto LABEL_82;
        v21 = 0;
      }
      else
      {
        v21 = 0;
LABEL_32:
        v22 = 0;
      }
      v20 = 1;
      goto LABEL_45;
    case 9u:
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
      {
        objc_msgSend(WeakRetained, "queryTask:", *(_QWORD *)(a1 + 168));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "addMatchInfo:", a5);

      }
      goto LABEL_25;
    case 0xAu:
      goto LABEL_45;
    case 0xBu:
      v21 = 0;
LABEL_31:
      v19 = 0;
      goto LABEL_32;
    default:
      goto LABEL_81;
  }
}

- (BOOL)handleCommand:(const char *)a3 info:(id)a4 connection:(id)a5
{
  id v8;
  _xpc_connection_s *v9;
  NSObject *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t spanid;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v26[32];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (_xpc_connection_s *)a5;
  logForCSLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v26 = 136315394;
    *(_QWORD *)&v26[4] = a3;
    *(_WORD *)&v26[12] = 1024;
    *(_DWORD *)&v26[14] = xpc_connection_get_pid(v9);
    _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_INFO, "search %s pid: %d", v26, 0x12u);
  }

  if (!strcmp(a3, "startQuery"))
  {
    -[CSSearchAgent startQuery:](self, "startQuery:", v8);
LABEL_19:
    v11 = 1;
    goto LABEL_20;
  }
  if (!strcmp(a3, "cancelQuery"))
  {
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    *(_OWORD *)v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    v27 = *(_QWORD *)(v12 + 32);
    v13 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v13;
    *(_QWORD *)(v12 + 8) = spanid;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "csquery_command_cancel_query";
    si_tracing_log_span_begin();
    -[CSSearchAgent cancelQuery:](self, "cancelQuery:", v8);
    si_tracing_log_span_end();
LABEL_18:
    *(_OWORD *)v12 = *(_OWORD *)v26;
    *(_OWORD *)(v12 + 16) = *(_OWORD *)&v26[16];
    *(_QWORD *)(v12 + 32) = v27;
    goto LABEL_19;
  }
  if (!strcmp(a3, "pollResults"))
  {
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    *(_OWORD *)v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    v27 = *(_QWORD *)(v12 + 32);
    v15 = si_tracing_calc_traceid();
    v16 = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v15;
    *(_QWORD *)(v12 + 8) = v16;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "csquery_command_poll_results";
    si_tracing_log_span_begin();
    -[CSSearchAgent pollResults:](self, "pollResults:", v8);
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  if (!strcmp(a3, "simpleQuery"))
  {
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    *(_OWORD *)v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    v27 = *(_QWORD *)(v12 + 32);
    v17 = si_tracing_calc_traceid();
    v18 = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v17;
    *(_QWORD *)(v12 + 8) = v18;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "csquery_command_start_simple_query";
    si_tracing_log_span_begin();
    -[CSSearchAgent startSimpleQuery:](self, "startSimpleQuery:", v8);
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  if (!strcmp(a3, "simpleCancel"))
  {
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    *(_OWORD *)v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    v27 = *(_QWORD *)(v12 + 32);
    v19 = si_tracing_calc_traceid();
    v20 = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v19;
    *(_QWORD *)(v12 + 8) = v20;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "csquery_command_cancel_simple_query";
    si_tracing_log_span_begin();
    -[CSSearchAgent cancelSimpleQuery:](self, "cancelSimpleQuery:", v8);
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  if (!strcmp(a3, "userEngaged"))
  {
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    *(_OWORD *)v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    v27 = *(_QWORD *)(v12 + 32);
    v21 = si_tracing_calc_traceid();
    v22 = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v21;
    *(_QWORD *)(v12 + 8) = v22;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "csquery_command_user_engaged";
    si_tracing_log_span_begin();
    -[CSSearchAgent handleEngagement:forConnection:](self, "handleEngagement:forConnection:", v8, v9);
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  if (!strcmp(a3, "preheat"))
  {
    v12 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    *(_OWORD *)v26 = *(_OWORD *)v12;
    *(_OWORD *)&v26[16] = *(_OWORD *)(v12 + 16);
    v27 = *(_QWORD *)(v12 + 32);
    v23 = si_tracing_calc_traceid();
    v24 = si_tracing_calc_next_spanid();
    *(_QWORD *)v12 = v23;
    *(_QWORD *)(v12 + 8) = v24;
    *(_QWORD *)(v12 + 16) = 0;
    *(_DWORD *)(v12 + 24) = -1;
    *(_BYTE *)(v12 + 28) = 102;
    *(_QWORD *)(v12 + 32) = "csquery_command_preheat";
    si_tracing_log_span_begin();
    -[CSSearchAgent preheat:](self, "preheat:", v8);
    si_tracing_log_span_end();
    goto LABEL_18;
  }
  v11 = 0;
LABEL_20:

  return v11;
}

+ (id)searchAgent:(BOOL)a3 serviceName:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  BOOL v12;

  v5 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__CSSearchAgent_searchAgent_serviceName___block_invoke;
  v10[3] = &unk_24D0EAB10;
  v12 = a3;
  v11 = v5;
  v6 = searchAgent_serviceName__onceToken;
  v7 = v5;
  if (v6 != -1)
    dispatch_once(&searchAgent_serviceName__onceToken, v10);
  v8 = (id)sSearchAgent;

  return v8;
}

uint64_t __41__CSSearchAgent_searchAgent_serviceName___block_invoke(uint64_t a1)
{
  int v2;
  CSSearchAgent *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = [CSSearchAgent alloc];
  if (*(_QWORD *)(a1 + 32))
    v4 = *(_QWORD *)(a1 + 32);
  else
    v4 = *MEMORY[0x24BDC19B0];
  if (v2)
  {
    v5 = -[CSXPCConnection initWithServiceName:](v3, "initWithServiceName:", v4);
    v6 = (void *)sSearchAgent;
    sSearchAgent = v5;

    sSearchAgentIsPrivate = 1;
  }
  else
  {
    v7 = -[CSXPCConnection initMachServiceListenerWithName:](v3, "initMachServiceListenerWithName:", v4);
    v8 = (void *)sSearchAgent;
    sSearchAgent = v7;

  }
  v9 = (void *)objc_opt_new();
  objc_msgSend((id)sSearchAgent, "setSearchConnections:", v9);

  return SISetQueryCSFieldNameCallback();
}

+ (id)searchAgent
{
  return (id)sSearchAgent;
}

- (BOOL)lostClientConnection:(id)a3 error:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  +[CSSearchClientConnectionKey keyWithConnection:](CSSearchClientConnectionKey, "keyWithConnection:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_searchConnections, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchAgent searchConnections](self, "searchConnections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v5);

  objc_msgSend(v6, "cancelQueryTasks");
  return 0;
}

- (void)cancelQuery:(id)a3
{
  _xpc_connection_s *v4;
  xpc_object_t reply;
  void *v6;
  void *v7;
  uint64_t uint64;
  xpc_object_t original;

  original = a3;
  xpc_dictionary_get_remote_connection(original);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(original);
  v6 = reply;
  if (v4 && reply)
  {
    -[CSSearchAgent searchConnection:](self, "searchConnection:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      uint64 = xpc_dictionary_get_uint64(original, "qid");
      objc_msgSend(v7, "cancelQueryTask:", uint64);
    }
    else
    {
      uint64 = 0;
    }
    xpc_dictionary_set_uint64(v6, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message(v4, v6);

  }
}

- (void)pollResults:(id)a3
{
  _xpc_connection_s *v4;
  xpc_object_t reply;
  void *v6;
  void *v7;
  uint64_t uint64;
  xpc_object_t original;

  original = a3;
  xpc_dictionary_get_remote_connection(original);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(original);
  v6 = reply;
  if (v4 && reply)
  {
    -[CSSearchAgent searchConnection:](self, "searchConnection:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      uint64 = xpc_dictionary_get_uint64(original, "qid");
      objc_msgSend(v7, "pollResultsForQueryTask:", uint64);
    }
    else
    {
      uint64 = 0;
    }
    xpc_dictionary_set_uint64(v6, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message(v4, v6);

  }
}

- (void)preheat:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int64_t v14;
  _xpc_connection_s *v15;
  xpc_object_t reply;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x24BDC24C8];
  xpc_dictionary_get_value(v4, "pcs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copyNSStringArrayFromXPCArray:", v6);

  v8 = objc_msgSend(v7, "count");
  logForCSLogCategoryQuery();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (!v10)
      goto LABEL_7;
    v18 = 138412290;
    v19 = v7;
    v11 = "query preheat %@";
    v12 = v9;
    v13 = 12;
  }
  else
  {
    if (!v10)
      goto LABEL_7;
    LOWORD(v18) = 0;
    v11 = "query preheat";
    v12 = v9;
    v13 = 2;
  }
  _os_log_impl(&dword_213CF1000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v18, v13);
LABEL_7:

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MDIndexer queryPreheat:](self->_indexer, "queryPreheat:", v7);
    v14 = 0;
  }
  else
  {
    v14 = -1;
  }
  xpc_dictionary_get_remote_connection(v4);
  v15 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    reply = xpc_dictionary_create_reply(v4);
    v17 = reply;
    if (reply)
    {
      xpc_dictionary_set_int64(reply, "status", v14);
      xpc_connection_send_message(v15, v17);
    }

  }
}

void __28__CSSearchAgent_startQuery___block_invoke_139(uint64_t a1)
{
  _xpc_connection_s *v2;
  void *v3;
  NSObject *v4;
  __int128 v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  objc_msgSend(*(id *)(a1 + 32), "_willSendResultsBatch:qid:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72));
  v2 = *(_xpc_connection_s **)(a1 + 48);
  v3 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 64), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 96);
  v8 = *(_OWORD *)(a1 + 80);
  v6[0] = MEMORY[0x24BDAC760];
  v6[2] = __28__CSSearchAgent_startQuery___block_invoke_2;
  v6[3] = &unk_24D0EDC20;
  v9 = v5;
  v10 = *(_QWORD *)(a1 + 112);
  v7 = *(id *)(a1 + 32);
  xpc_connection_send_message_with_reply(v2, v3, v4, v6);

}

void __28__CSSearchAgent_startQuery___block_invoke_143(uint64_t a1, int a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t spanid;
  uint64_t v10;
  id WeakRetained;
  id v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v12 = a3;
  v5 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v13 = *(_OWORD *)v5;
  v14 = *(_OWORD *)(v5 + 16);
  v15 = *(_QWORD *)(v5 + 32);
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)v5 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v5 + 16) = v7;
  *(_QWORD *)(v5 + 32) = v6;
  v8 = *(_QWORD *)v5;
  spanid = si_tracing_calc_next_spanid();
  v10 = *(_QWORD *)(v5 + 8);
  *(_QWORD *)v5 = v8;
  *(_QWORD *)(v5 + 8) = spanid;
  *(_QWORD *)(v5 + 16) = v10;
  *(_BYTE *)(v5 + 28) = 102;
  *(_QWORD *)(v5 + 32) = "completionHandler";
  si_tracing_log_span_begin();
  if (a2)
  {
    if (*(_BYTE *)(a1 + 112))
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "qid", *(_QWORD *)(a1 + 104));
  csquery_xpc_dictionary_encode_status_with_error();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setQueryTask:forQueryID:", 0, *(_QWORD *)(a1 + 104));

  si_tracing_log_span_end();
  *(_OWORD *)v5 = v13;
  *(_OWORD *)(v5 + 16) = v14;
  *(_QWORD *)(v5 + 32) = v15;

}

void __28__CSSearchAgent_startQuery___block_invoke_2_146(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t spanid;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  id *from;
  uint64_t v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t, __int128 *);
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  uint8_t buf[16];
  __int128 v65;
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  v5 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v6 = *(_OWORD *)(v5 + 16);
  v61 = *(_OWORD *)v5;
  v62 = v6;
  v63 = *(_QWORD *)(v5 + 32);
  v7 = *(_QWORD *)(a1 + 136);
  v8 = *(_OWORD *)(a1 + 120);
  *(_OWORD *)v5 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)(v5 + 16) = v8;
  *(_QWORD *)(v5 + 32) = v7;
  v9 = *(_OWORD *)(a1 + 120);
  v58 = *(_OWORD *)(a1 + 104);
  v59 = v9;
  v60 = *(_QWORD *)(a1 + 136);
  v10 = *(_QWORD *)v5;
  spanid = si_tracing_calc_next_spanid();
  v12 = *(_QWORD *)(v5 + 8);
  *(_QWORD *)v5 = v10;
  *(_QWORD *)(v5 + 8) = spanid;
  *(_QWORD *)(v5 + 16) = v12;
  *(_BYTE *)(v5 + 28) = 102;
  *(_QWORD *)(v5 + 32) = "query task completion handler";
  si_tracing_log_span_begin();
  objc_msgSend(WeakRetained, "queryTask:", *(_QWORD *)(a1 + 144));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v33 = WeakRetained;
  if (v13)
  {
    v15 = objc_msgSend(v13, "wasCanceledByClient");
    if (v3)
      goto LABEL_18;
  }
  else
  {
    v15 = 1;
    if (v3)
    {
LABEL_18:
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      goto LABEL_19;
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) || (v15 & 1) != 0 || !*(_BYTE *)(a1 + 152))
    goto LABEL_18;
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  logForCSLogCategoryQuery();
  v16 = objc_claimAutoreleasedReturnValue();
  from = (id *)(a1 + 96);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = *(_QWORD *)(a1 + 144);
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v17;
    _os_log_impl(&dword_213CF1000, v16, OS_LOG_TYPE_INFO, "[rewrite] qid=%ld Requesting rewrite candidates", buf, 0xCu);
  }
  v32 = a1;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  objc_msgSend(v14, "matchInfo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  v21 = MEMORY[0x24BDAC760];
  if (v20)
  {
    v22 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v55 != v22)
          objc_enumerationMutation(v19);
        v24 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * i);
        _MDPlistGetRootPlistObjectFromPlist();
        v49 = v21;
        v50 = 3221225472;
        v51 = __28__CSSearchAgent_startQuery___block_invoke_148;
        v52 = &unk_24D0EDCC0;
        v53 = v18;
        _MDPlistDictionaryIterate();
        CFRelease(v24);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    }
    while (v20);
  }

  *(_OWORD *)buf = *(_OWORD *)v5;
  v65 = *(_OWORD *)(v5 + 16);
  v66 = *(_QWORD *)(v5 + 32);
  v25 = *(_QWORD *)(v32 + 40);
  v26 = *(void **)(*(_QWORD *)(v32 + 32) + 56);
  v27 = *(_QWORD *)(v32 + 48);
  v34[0] = v21;
  v34[1] = 3221225472;
  v34[2] = __28__CSSearchAgent_startQuery___block_invoke_2_150;
  v34[3] = &unk_24D0EDD10;
  v46 = v66;
  v45 = v65;
  v44 = *(_OWORD *)buf;
  v35 = v14;
  v41 = *(id *)(v32 + 64);
  v36 = 0;
  v48 = *(_BYTE *)(v32 + 153);
  v37 = *(id *)(v32 + 40);
  v28 = *(id *)(v32 + 48);
  v47 = *(_QWORD *)(v32 + 144);
  v29 = *(_QWORD *)(v32 + 32);
  v38 = v28;
  v39 = v29;
  v42 = *(id *)(v32 + 72);
  v40 = *(id *)(v32 + 56);
  objc_copyWeak(&v43, from);
  objc_msgSend(v26, "rewriteQueryWithQueryString:context:matchInfo:rewriteHandler:", v25, v27, v18, v34);
  objc_destroyWeak(&v43);

LABEL_19:
  si_tracing_log_span_end();
  v30 = v62;
  *(_OWORD *)v5 = v61;
  *(_OWORD *)(v5 + 16) = v30;
  *(_QWORD *)(v5 + 32) = v63;

}

void __28__CSSearchAgent_startQuery___block_invoke_148(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  uint64_t IntValue;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  uint64_t v15;

  v14 = *a4;
  v15 = *((_QWORD *)a4 + 2);
  IntValue = _MDPlistNumberGetIntValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2, v14, v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "longLongValue") + IntValue;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

}

void __28__CSSearchAgent_startQuery___block_invoke_2_150(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t spanid;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  double v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id WeakRetained;
  NSObject *v28;
  uint64_t uint64;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  _BYTE v46[32];
  _BYTE buf[32];
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v8 = *(_OWORD *)(v7 + 16);
  v43 = *(_OWORD *)v7;
  v44 = v8;
  v45 = *(_QWORD *)(v7 + 32);
  v9 = *(_QWORD *)(a1 + 136);
  v10 = *(_OWORD *)(a1 + 120);
  *(_OWORD *)v7 = *(_OWORD *)(a1 + 104);
  *(_OWORD *)(v7 + 16) = v10;
  *(_QWORD *)(v7 + 32) = v9;
  v11 = *(_OWORD *)(a1 + 120);
  v40 = *(_OWORD *)(a1 + 104);
  v41 = v11;
  v42 = *(_QWORD *)(a1 + 136);
  v12 = *(_QWORD *)v7;
  spanid = si_tracing_calc_next_spanid();
  v14 = *(_QWORD *)(v7 + 8);
  *(_QWORD *)v7 = v12;
  *(_QWORD *)(v7 + 8) = spanid;
  *(_QWORD *)(v7 + 16) = v14;
  *(_BYTE *)(v7 + 28) = 102;
  *(_QWORD *)(v7 + 32) = "rewriteHandler";
  si_tracing_log_span_begin();
  if (!objc_msgSend(*(id *)(a1 + 32), "wasCanceledByClient"))
  {
    objc_msgSend(v5, "firstObject");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v6 || !v15)
    {
      if (!*(_BYTE *)(a1 + 152))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_15:

        goto LABEL_16;
      }
      v17 = objc_alloc(MEMORY[0x24BE66710]);
      LODWORD(v18) = 0;
      v19 = objc_msgSend(v17, "initWithSearchQueryString:searchQueryContext:score:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v18);

      v16 = (void *)v19;
    }
    logForCSLogCategoryQuery();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = *(_QWORD *)(a1 + 144);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = objc_msgSend(v5, "count");
      _os_log_impl(&dword_213CF1000, v20, OS_LOG_TYPE_INFO, "[rewrite] qid=%ld Found %lu rewrite candidate", buf, 0x16u);
    }

    *(_OWORD *)buf = *(_OWORD *)v7;
    *(_OWORD *)&buf[16] = *(_OWORD *)(v7 + 16);
    v48 = *(_QWORD *)(v7 + 32);
    v22 = *(void **)(*(_QWORD *)(a1 + 64) + 56);
    objc_msgSend(v16, "queryString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "searchQueryContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 3221225472;
    v37 = *(_OWORD *)buf;
    v32 = MEMORY[0x24BDAC760];
    v34 = __28__CSSearchAgent_startQuery___block_invoke_153;
    v35 = &unk_24D0EDCE8;
    v38 = *(_OWORD *)&buf[16];
    v39 = v48;
    v25 = *(_QWORD *)(a1 + 88);
    v36 = *(id *)(a1 + 80);
    objc_msgSend(v22, "taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v23, v24, 0, v25, &v32);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
      objc_msgSend(WeakRetained, "setQueryTask:forQueryID:", v26, *(_QWORD *)(a1 + 144), v32, v33, v34, v35);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 64) + 56), "startQueryTask:", v26);
    }
    else
    {
      logForCSLogCategoryDefault();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 72), "qid");
        __28__CSSearchAgent_startQuery___block_invoke_2_150_cold_1((uint64_t *)(a1 + 72), (uint64_t)v46, uint64, v28);
      }

      (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), 1, 0, v30);
    }

    goto LABEL_15;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_16:
  si_tracing_log_span_end();
  v31 = v44;
  *(_OWORD *)v7 = v43;
  *(_OWORD *)(v7 + 16) = v31;
  *(_QWORD *)(v7 + 32) = v45;

}

void __28__CSSearchAgent_startQuery___block_invoke_153(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v9 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v10 = *(_OWORD *)v3;
  v11 = *(_OWORD *)(v3 + 16);
  v12 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "rewrite query completion handler";
  si_tracing_log_span_begin();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  si_tracing_log_span_end();
  *(_OWORD *)v3 = v10;
  *(_OWORD *)(v3 + 16) = v11;
  *(_QWORD *)(v3 + 32) = v12;

}

- (void)cancelSimpleQuery:(id)a3
{
  _xpc_connection_s *v4;
  xpc_object_t reply;
  void *v6;
  void *v7;
  uint64_t uint64;
  xpc_object_t original;

  original = a3;
  xpc_dictionary_get_remote_connection(original);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(original);
  v6 = reply;
  if (v4 && reply)
  {
    -[CSSearchAgent searchConnection:](self, "searchConnection:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      uint64 = xpc_dictionary_get_uint64(original, "qid");
      objc_msgSend(v7, "cancelQueryTask:", uint64);
    }
    else
    {
      uint64 = 0;
    }
    xpc_dictionary_set_uint64(v6, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message(v4, v6);

  }
}

- (void)startSimpleQuery:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t reply;
  void *v7;
  void *v8;
  uint64_t uint64;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t spanid;
  const char *string;
  const char *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  __int128 v20;
  uint64_t v21;
  MDIndexer *v22;
  void *v23;
  __int128 v24;
  MDIndexer *indexer;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  id from;
  _QWORD v38[5];
  id v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  id location;
  _QWORD v48[3];
  char v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;

  v4 = a3;
  xpc_dictionary_get_remote_connection(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  reply = xpc_dictionary_create_reply(v4);
  v7 = reply;
  if (v5 && reply)
  {
    -[CSSearchAgent searchConnection:](self, "searchConnection:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      uint64 = xpc_dictionary_get_uint64(v4, "qid");
    else
      uint64 = 0;
    v10 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
    v11 = *(_OWORD *)(v10 + 16);
    v50 = *(_OWORD *)v10;
    v51 = v11;
    v52 = *(_QWORD *)(v10 + 32);
    v12 = si_tracing_calc_traceid();
    spanid = si_tracing_calc_next_spanid();
    *(_QWORD *)v10 = v12;
    *(_QWORD *)(v10 + 8) = spanid;
    *(_QWORD *)(v10 + 16) = 0;
    *(_DWORD *)(v10 + 24) = uint64;
    *(_BYTE *)(v10 + 28) = 102;
    *(_QWORD *)(v10 + 32) = "CSSearchAgent::startSimpleQuery";
    si_tracing_log_span_begin();
    if (uint64)
    {
      string = xpc_dictionary_get_string(v4, "query");
      v15 = string;
      if (!string || !strcmp(string, "false"))
      {
        v17 = 0;
      }
      else
      {
        xpc_dictionary_get_value(v4, "context");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC2468]), "initWithXPCDictionary:", v16);

        if (v17)
        {
          objc_msgSend(v8, "bundleID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v8, "searchInternal");
          objc_msgSend(v17, "setMaxCount:", 1);
          objc_msgSend(v17, "setClientBundleID:", v27);
          objc_msgSend(v17, "setInternal:", v18);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
          v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!-[__CFString length](v19, "length"))
          {

            v19 = CFSTR("true");
          }
          -[CSSearchAgent _prepareQueryContext:searchConnection:](self, "_prepareQueryContext:searchConnection:", v17, v8);
          v48[0] = 0;
          v48[1] = v48;
          v48[2] = 0x2020000000;
          v49 = 0;
          location = 0;
          objc_initWeak(&location, v8);
          v20 = *(_OWORD *)(v10 + 16);
          v44 = *(_OWORD *)v10;
          v45 = v20;
          v46 = *(_QWORD *)(v10 + 32);
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __34__CSSearchAgent_startSimpleQuery___block_invoke;
          v38[3] = &unk_24D0EDD60;
          v40 = v44;
          v41 = v20;
          v42 = v46;
          v38[4] = v48;
          objc_copyWeak(&v39, &location);
          v43 = uint64;
          v21 = objc_msgSend(v38, "copy");
          from = 0;
          objc_initWeak(&from, v8);
          indexer = self->_indexer;
          v28[0] = MEMORY[0x24BDAC760];
          v28[1] = 3221225472;
          v28[2] = __34__CSSearchAgent_startSimpleQuery___block_invoke_2;
          v28[3] = &unk_24D0EDD88;
          v33 = v44;
          v34 = v45;
          v35 = v46;
          v36 = uint64;
          v29 = v7;
          v31 = v48;
          v30 = v5;
          objc_copyWeak(&v32, &from);
          v22 = indexer;
          v26 = (void *)v21;
          -[MDIndexer taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:](v22, "taskForQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:", v19, v17, 0, v21, v28);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
          {
            objc_msgSend(v8, "setQueryTask:forQueryID:", v23, uint64);
            -[MDIndexer startQueryTask:](self->_indexer, "startQueryTask:", v23);
          }

          objc_destroyWeak(&v32);
          objc_destroyWeak(&from);

          objc_destroyWeak(&v39);
          objc_destroyWeak(&location);
          _Block_object_dispose(v48, 8);

          if (v23)
            goto LABEL_17;
        }
      }
    }
    else
    {
      v17 = 0;
    }
    xpc_dictionary_set_uint64(v7, "qid", uint64);
    csquery_xpc_dictionary_encode_status();
    xpc_connection_send_message((xpc_connection_t)v5, v7);
LABEL_17:
    si_tracing_log_span_end();
    v24 = v51;
    *(_OWORD *)v10 = v50;
    *(_OWORD *)(v10 + 16) = v24;
    *(_QWORD *)(v10 + 32) = v52;

  }
}

void __34__CSSearchAgent_startSimpleQuery___block_invoke(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t spanid;
  uint64_t v13;
  id WeakRetained;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v16 = a6;
  v8 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v17 = *(_OWORD *)v8;
  v18 = *(_OWORD *)(v8 + 16);
  v19 = *(_QWORD *)(v8 + 32);
  v9 = *(_QWORD *)(a1 + 80);
  v10 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)v8 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = v9;
  v11 = *(_QWORD *)v8;
  spanid = si_tracing_calc_next_spanid();
  v13 = *(_QWORD *)(v8 + 8);
  *(_QWORD *)v8 = v11;
  *(_QWORD *)(v8 + 8) = spanid;
  *(_QWORD *)(v8 + 16) = v13;
  *(_BYTE *)(v8 + 28) = 102;
  *(_QWORD *)(v8 + 32) = "resultsHandler";
  si_tracing_log_span_begin();
  if ((!a2 || a2 == 6) && _MDStoreOIDArrayGetVectorCount() >= 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "queryTask:", *(_QWORD *)(a1 + 88));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "cancel");
  }
  si_tracing_log_span_end();
  *(_OWORD *)v8 = v17;
  *(_OWORD *)(v8 + 16) = v18;
  *(_QWORD *)(v8 + 32) = v19;

}

void __34__CSSearchAgent_startSimpleQuery___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t spanid;
  uint64_t v8;
  id WeakRetained;
  id v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v10 = a2;
  v3 = ((uint64_t (*)(void))*MEMORY[0x24BE66888])();
  v11 = *(_OWORD *)v3;
  v12 = *(_OWORD *)(v3 + 16);
  v13 = *(_QWORD *)(v3 + 32);
  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)v3 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v3 + 16) = v5;
  *(_QWORD *)(v3 + 32) = v4;
  v6 = *(_QWORD *)v3;
  spanid = si_tracing_calc_next_spanid();
  v8 = *(_QWORD *)(v3 + 8);
  *(_QWORD *)v3 = v6;
  *(_QWORD *)(v3 + 8) = spanid;
  *(_QWORD *)(v3 + 16) = v8;
  *(_BYTE *)(v3 + 28) = 102;
  *(_QWORD *)(v3 + 32) = "completionHandler";
  si_tracing_log_span_begin();
  csquery_xpc_dictionary_encode_status_with_error();
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "qid", *(_QWORD *)(a1 + 104));
  xpc_dictionary_set_uint64(*(xpc_object_t *)(a1 + 32), "t", 1uLL);
  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "exists", *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "setQueryTask:forQueryID:", 0, *(_QWORD *)(a1 + 104));

  si_tracing_log_span_end();
  *(_OWORD *)v3 = v11;
  *(_OWORD *)(v3 + 16) = v12;
  *(_QWORD *)(v3 + 32) = v13;

}

- (void)handleEngagement:(id)a3 forConnection:(id)a4
{
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  MDIndexer *indexer;
  void *v16;
  id v17;

  v17 = a3;
  -[CSSearchAgent searchConnection:](self, "searchConnection:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "searchInternal");
  objc_msgSend(v6, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "qenb", v17);
  v10 = (void *)v9;
  if ((v7 & 1) != 0)
    goto LABEL_5;
  if (!v9 || objc_msgSend(v8, "isEqual:", v9))
  {
    v11 = v8;

    v10 = v11;
LABEL_5:
    v12 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "pc", v17);
    v13 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "userquery", v17);
    v14 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSStringForKey:fromXPCDictionary:", "qenr", v17);
    indexer = self->_indexer;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDIndexer recordEngagementForBundleID:uniqueIdentifier:protectionClass:userQuery:date:](indexer, "recordEngagementForBundleID:uniqueIdentifier:protectionClass:userQuery:date:", v10, v14, v12, v13, v16);

  }
}

- (MDIndexer)indexer
{
  return self->_indexer;
}

- (void)setIndexer:(id)a3
{
  objc_storeStrong((id *)&self->_indexer, a3);
}

- (void)setSearchConnections:(id)a3
{
  objc_storeStrong((id *)&self->_searchConnections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchConnections, 0);
  objc_storeStrong((id *)&self->_indexer, 0);
}

- (void)addClientConnectionIfAllowedForConfiguration:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "connection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_2_0(&dword_213CF1000, v2, v3, "Could not resolve bundle id for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_11();
}

- (void)_prepareQueryContext:(void *)a1 searchConnection:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "clientBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1();
  _os_log_debug_impl(&dword_213CF1000, a2, OS_LOG_TYPE_DEBUG, "Notifications allowed for bid: %@", v4, 0xCu);

  OUTLINED_FUNCTION_11();
}

- (void)_prepareQueryContext:searchConnection:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  v4 = 2112;
  v5 = v0;
  v6 = 2112;
  v7 = v1;
  _os_log_error_impl(&dword_213CF1000, v2, OS_LOG_TYPE_ERROR, "Client %@ trying to search other bundles (%@) without having entitlement %@", v3, 0x20u);
}

- (void)startQuery:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = a1;
  OUTLINED_FUNCTION_17(&dword_213CF1000, a4, a3, "startQuery: Failed to create query task for query id %lld, xpc object %@", (uint8_t *)a2);
}

- (void)startQuery:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  xpc_dictionary_get_uint64(a1, "qid");
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_17(&dword_213CF1000, a2, v3, "startQuery: No reply for query id %lld, xpc object %@", v4);
  OUTLINED_FUNCTION_11();
}

- (void)startQuery:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  xpc_dictionary_get_uint64(a1, "qid");
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_17(&dword_213CF1000, a2, v3, "startQuery: No remote connection for query id %lld, xpc object %@", v4);
  OUTLINED_FUNCTION_11();
}

void __28__CSSearchAgent_startQuery___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_213CF1000, a2, a3, "Finished query qid: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __28__CSSearchAgent_startQuery___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_9_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, v1, "[rewrite] qid=%ld Rewrite gather ended hasResults:%@", v2);
  OUTLINED_FUNCTION_1();
}

void __28__CSSearchAgent_startQuery___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_9_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_3(&dword_213CF1000, v0, v1, "[rewrite] qid=%ld Rewrite finished hasResults:%@", v2);
  OUTLINED_FUNCTION_1();
}

void __28__CSSearchAgent_startQuery___block_invoke_2_150_cold_1(uint64_t *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *a1;
  *(_DWORD *)a2 = 134218242;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = v4;
  OUTLINED_FUNCTION_17(&dword_213CF1000, a4, a3, "[rewrite] qid=%lld startQuery: Failed to create rewrite query task, xpc object %@", (uint8_t *)a2);
}

@end
