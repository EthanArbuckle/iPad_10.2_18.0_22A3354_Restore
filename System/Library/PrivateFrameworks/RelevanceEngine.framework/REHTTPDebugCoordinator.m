@implementation REHTTPDebugCoordinator

- (REHTTPDebugCoordinator)initWithSimulator:(id)a3
{
  id v5;
  REHTTPDebugCoordinator *v6;
  REHTTPDebugCoordinator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REHTTPDebugCoordinator;
  v6 = -[REHTTPDebugCoordinator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_simulator, a3);

  return v7;
}

- (id)_urlFromPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[RETrainingSimulator relevanceEngineName](self->_simulator, "relevanceEngineName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/"), "stringByAppendingString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      v12 = v6;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v12, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v11;
        v12 = v6;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)_linkElementForTableItem:(id)a3 paths:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[REHTTPDebugCoordinator _stringElementForObject:](self, "_stringElementForObject:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTTPDebugCoordinator _urlFromPaths:](self, "_urlFromPaths:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[REHTMLElement link:title:](REHTMLElement, "link:title:", v8, &stru_24CF92178);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addChild:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_linkToPaths:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  REDisplayStringForPropertyName(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[REHTTPDebugCoordinator _urlFromPaths:](self, "_urlFromPaths:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[REHTMLElement link:title:](REHTMLElement, "link:title:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_stringForObject:(id)a3
{
  id v3;
  __CFString *v4;
  CFTypeID TypeID;
  int v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (__CFString *)v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(v3)))
    {
      v6 = objc_msgSend(v3, "BOOLValue");
      v7 = CFSTR("NO");
      if (v6)
        v7 = CFSTR("YES");
      v4 = v7;
    }
    else
    {
      objc_msgSend(v3, "description");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = v4;
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
    0,
    0,
    objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
    0,
    0,
    objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
    0,
    0,
    objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("<br>"), 0, 0, objc_msgSend(v9, "length"));
  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\t"), CFSTR("&#9;"),
    0,
    0,
    objc_msgSend(v9, "length"));
  v10 = (void *)objc_msgSend(v9, "copy");

  return v10;
}

- (id)_stringElementForObject:(id)a3
{
  void *v3;
  void *v4;

  -[REHTTPDebugCoordinator _stringForObject:](self, "_stringForObject:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[REHTMLElement elementWithHTMLString:](REHTMLElement, "elementWithHTMLString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)generateDiagnosticsForPaths:(id)a3 completion:(id)a4
{
  void (**v5)(id, id, __CFString *);
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  __CFString *v24;
  void *v25;
  char isKindOfClass;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t n;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t ii;
  void *v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t jj;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t j;
  void *v77;
  uint64_t k;
  uint64_t v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t m;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  uint64_t v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  const __CFString *v105;
  id v106;
  int v107;
  void *v108;
  void (**v109)(id, id, __CFString *);
  void *v110;
  void *v111;
  __CFString *v112;
  id obj;
  id v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  uint64_t v122;
  id v123;
  id v124;
  uint64_t v125;
  void *v126;
  _QWORD v128[5];
  _QWORD v129[6];
  _QWORD v130[5];
  id v131;
  uint64_t v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  _QWORD v137[5];
  id v138;
  __int128 *p_buf;
  _QWORD v140[4];
  id v141;
  REHTTPDebugCoordinator *v142;
  _QWORD v143[5];
  id v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  void *v153;
  _BYTE v154[128];
  uint8_t v155[128];
  __int128 buf;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;

  v159 = *MEMORY[0x24BDAC8D0];
  v120 = a3;
  v5 = (void (**)(id, id, __CFString *))a4;
  if (v5)
  {
    v109 = v5;
    RELogForDomain(21);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v120, "componentsJoinedByString:", CFSTR("->"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_2132F7000, v6, OS_LOG_TYPE_INFO, "Loading diagnostics for object path %@", (uint8_t *)&buf, 0xCu);

    }
    -[RETrainingSimulator encodedObjectAtPath:](self->_simulator, "encodedObjectAtPath:", v120);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "dataUsingEncoding:", 4);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    RELogForDomain(21);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[REHTTPDebugCoordinator generateDiagnosticsForPaths:completion:].cold.1((uint64_t)v110, v8);

    objc_msgSend(v120, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    REDisplayStringForPropertyName(v9);
    v112 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[__CFString integerValue](v112, "integerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v11, "isEqualToString:", v112);

    if (v111
      && (objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v111, 4, 0),
          (v12 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v121 = v12;
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v151 = 0u;
        v152 = 0u;
        v149 = 0u;
        v150 = 0u;
        objc_msgSend(v121, "keyEnumerator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
        if (v16)
        {
          v17 = *(_QWORD *)v150;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v150 != v17)
                objc_enumerationMutation(v14);
              v19 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
              if (REPropertyIsInternalAttribute(v19, v15))
              {
                objc_msgSend(v121, "objectForKeyedSubscript:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                REPropertyNameFromInternalAttribute(v19);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v21);

              }
            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
          }
          while (v16);
        }

        v108 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(v108, "objectForKeyedSubscript:", CFSTR("type"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("table"));

        if (v23)
        {
          -[REHTTPDebugCoordinator _createHTMLTableFromDictionary:](self, "_createHTMLTableFromDictionary:", v121);
          v123 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v147 = 0u;
          v148 = 0u;
          v145 = 0u;
          v146 = 0u;
          v117 = v121;
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v117, "count"));
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v151 = 0u;
          v152 = 0u;
          v149 = 0u;
          v150 = 0u;
          objc_msgSend(v117, "keyEnumerator");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
          if (v74)
          {
            v75 = *(_QWORD *)v150;
            do
            {
              for (j = 0; j != v74; ++j)
              {
                if (*(_QWORD *)v150 != v75)
                  objc_enumerationMutation(v72);
                v77 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * j);
                if ((REPropertyIsInternalAttribute(v77, v73) & 1) == 0)
                  objc_msgSend(v71, "addObject:", v77);
              }
              v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
            }
            while (v74);
          }

          objc_msgSend(v71, "sortUsingSelector:");
          v114 = (id)objc_msgSend(v71, "copy");

          v119 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v145, v155, 16);
          if (v119)
          {
            v123 = 0;
            v115 = *(_QWORD *)v146;
            do
            {
              for (k = 0; k != v119; ++k)
              {
                if (*(_QWORD *)v146 != v115)
                  objc_enumerationMutation(v114);
                v79 = *(_QWORD *)(*((_QWORD *)&v145 + 1) + 8 * k);
                objc_msgSend(v120, "arrayByAddingObject:", v79);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                -[REHTTPDebugCoordinator _linkToPaths:](self, "_linkToPaths:", v80);
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v117, "objectForKeyedSubscript:", v79);
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v82 = v81;
                  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v82, "count"));
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v151 = 0u;
                  v152 = 0u;
                  v149 = 0u;
                  v150 = 0u;
                  objc_msgSend(v82, "keyEnumerator");
                  v84 = (void *)objc_claimAutoreleasedReturnValue();
                  v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
                  if (v86)
                  {
                    v87 = *(_QWORD *)v150;
                    do
                    {
                      for (m = 0; m != v86; ++m)
                      {
                        if (*(_QWORD *)v150 != v87)
                          objc_enumerationMutation(v84);
                        v89 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * m);
                        if ((REPropertyIsInternalAttribute(v89, v85) & 1) == 0)
                          objc_msgSend(v83, "addObject:", v89);
                      }
                      v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
                    }
                    while (v86);
                  }

                  objc_msgSend(v83, "sortUsingSelector:", sel_compare_);
                  v90 = (void *)objc_msgSend(v83, "copy");

                  v91 = MEMORY[0x24BDAC760];
                  v143[0] = MEMORY[0x24BDAC760];
                  v143[1] = 3221225472;
                  v143[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke;
                  v143[3] = &unk_24CF8D320;
                  v143[4] = self;
                  v144 = v80;
                  v140[0] = v91;
                  v140[1] = 3221225472;
                  v140[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_2;
                  v140[3] = &unk_24CF8D320;
                  v141 = v82;
                  v142 = self;
                  -[REHTTPDebugCoordinator _createTableWithItems:itemFormatBlock:valueBlock:](self, "_createTableWithItems:itemFormatBlock:valueBlock:", v90, v143, v140);
                  v92 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    *(_QWORD *)&buf = 0;
                    *((_QWORD *)&buf + 1) = &buf;
                    v157 = 0x2020000000;
                    v158 = 0;
                    v137[0] = MEMORY[0x24BDAC760];
                    v137[1] = 3221225472;
                    v137[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_3;
                    v137[3] = &unk_24CF8D348;
                    p_buf = &buf;
                    v137[4] = self;
                    v138 = v80;
                    -[REHTTPDebugCoordinator _createTableWithItems:itemFormatBlock:valueBlock:](self, "_createTableWithItems:itemFormatBlock:valueBlock:", v81, v137, 0);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();

                    _Block_object_dispose(&buf, 8);
                  }
                  else
                  {
                    +[REHTMLElement div](REHTMLElement, "div");
                    v93 = (void *)objc_claimAutoreleasedReturnValue();
                    -[REHTTPDebugCoordinator _stringElementForObject:](self, "_stringElementForObject:", v81);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v93, "addChild:", v94);
                    v92 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                }
                -[REHTTPDebugCoordinator _createContentItemWithTitle:content:](self, "_createContentItemWithTitle:content:", v126, v92);
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                if (v123)
                {
                  objc_msgSend(v123, "append:", v95);
                  v96 = objc_claimAutoreleasedReturnValue();

                  v123 = (id)v96;
                }
                else
                {
                  v123 = v95;
                }

              }
              v119 = objc_msgSend(v114, "countByEnumeratingWithState:objects:count:", &v145, v155, 16);
            }
            while (v119);
          }
          else
          {
            v123 = 0;
          }

        }
        if (v107)
        {
          v97 = v121;
          v149 = 0u;
          v150 = 0u;
          v151 = 0u;
          v152 = 0u;
          REEncodeIdentificationProperites();
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
          if (v99)
          {
            v100 = *(_QWORD *)v150;
LABEL_110:
            v101 = 0;
            while (1)
            {
              if (*(_QWORD *)v150 != v100)
                objc_enumerationMutation(v98);
              objc_msgSend(v97, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * v101));
              v102 = (void *)objc_claimAutoreleasedReturnValue();
              if (v102)
                break;
              if (v99 == ++v101)
              {
                v99 = objc_msgSend(v98, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
                if (v99)
                  goto LABEL_110;
                goto LABEL_116;
              }
            }

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_120;
            objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v102);
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "replaceOccurrencesOfString:withString:options:range:", CFSTR("&"), CFSTR("&amp;"),
              0,
              0,
              objc_msgSend(v103, "length"));
            objc_msgSend(v103, "replaceOccurrencesOfString:withString:options:range:", CFSTR("<"), CFSTR("&lt;"),
              0,
              0,
              objc_msgSend(v103, "length"));
            objc_msgSend(v103, "replaceOccurrencesOfString:withString:options:range:", CFSTR(">"), CFSTR("&gt;"),
              0,
              0,
              objc_msgSend(v103, "length"));
            objc_msgSend(v103, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), CFSTR("<br>"), 0, 0, objc_msgSend(v103, "length"));
            objc_msgSend(v103, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\t"), CFSTR("&#9;"),
              0,
              0,
              objc_msgSend(v103, "length"));
            v24 = (__CFString *)objc_msgSend(v103, "copy");

          }
          else
          {
LABEL_116:

            v102 = 0;
LABEL_120:
            v24 = &stru_24CF92178;
          }

        }
        else
        {
          v24 = v112;
        }
        v109[2](v109, v123, v24);

        goto LABEL_22;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v106 = v12;
        if (objc_msgSend(v106, "count"))
        {
          objc_msgSend(v106, "firstObject");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            v135 = 0u;
            v136 = 0u;
            v133 = 0u;
            v134 = 0u;
            obj = v106;
            v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v154, 16);
            if (v118)
            {
              v124 = 0;
              v125 = 0;
              v116 = *(_QWORD *)v134;
              do
              {
                v27 = 0;
                do
                {
                  if (*(_QWORD *)v134 != v116)
                  {
                    v28 = v27;
                    objc_enumerationMutation(obj);
                    v27 = v28;
                  }
                  v122 = v27;
                  v29 = *(id *)(*((_QWORD *)&v133 + 1) + 8 * v27);
                  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v151 = 0u;
                  v152 = 0u;
                  v149 = 0u;
                  v150 = 0u;
                  objc_msgSend(v29, "keyEnumerator");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
                  if (v33)
                  {
                    v34 = *(_QWORD *)v150;
                    do
                    {
                      for (n = 0; n != v33; ++n)
                      {
                        if (*(_QWORD *)v150 != v34)
                          objc_enumerationMutation(v31);
                        v36 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * n);
                        if (REPropertyIsInternalAttribute(v36, v32))
                        {
                          objc_msgSend(v29, "objectForKeyedSubscript:", v36);
                          v37 = (void *)objc_claimAutoreleasedReturnValue();
                          REPropertyNameFromInternalAttribute(v36);
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v30, "setObject:forKeyedSubscript:", v37, v38);

                        }
                      }
                      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
                    }
                    while (v33);
                  }

                  v39 = (void *)objc_msgSend(v30, "copy");
                  objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("type"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("table"));

                  if (v41)
                  {
                    -[REHTTPDebugCoordinator _createHTMLTableFromDictionary:](self, "_createHTMLTableFromDictionary:", v29);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    v43 = v29;
                    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v43, "count"));
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    v151 = 0u;
                    v152 = 0u;
                    v149 = 0u;
                    v150 = 0u;
                    objc_msgSend(v43, "keyEnumerator");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
                    if (v47)
                    {
                      v48 = *(_QWORD *)v150;
                      do
                      {
                        for (ii = 0; ii != v47; ++ii)
                        {
                          if (*(_QWORD *)v150 != v48)
                            objc_enumerationMutation(v45);
                          v50 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * ii);
                          if ((REPropertyIsInternalAttribute(v50, v46) & 1) == 0)
                            objc_msgSend(v44, "addObject:", v50);
                        }
                        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
                      }
                      while (v47);
                    }

                    objc_msgSend(v44, "sortUsingSelector:", sel_compare_);
                    v51 = (void *)objc_msgSend(v44, "copy");

                    v52 = MEMORY[0x24BDAC760];
                    v130[0] = MEMORY[0x24BDAC760];
                    v130[1] = 3221225472;
                    v130[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_4;
                    v130[3] = &unk_24CF8D370;
                    v130[4] = self;
                    v131 = v120;
                    v132 = v125;
                    v129[0] = v52;
                    v129[1] = 3221225472;
                    v129[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_5;
                    v129[3] = &unk_24CF8D320;
                    v129[4] = self;
                    v129[5] = v43;
                    -[REHTTPDebugCoordinator _createTableWithItems:itemFormatBlock:valueBlock:](self, "_createTableWithItems:itemFormatBlock:valueBlock:", v51, v130, v129);
                    v42 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  v53 = v29;
                  v149 = 0u;
                  v150 = 0u;
                  v151 = 0u;
                  v152 = 0u;
                  REEncodeIdentificationProperites();
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
                  if (v55)
                  {
                    v56 = *(_QWORD *)v150;
                    while (2)
                    {
                      for (jj = 0; jj != v55; ++jj)
                      {
                        if (*(_QWORD *)v150 != v56)
                          objc_enumerationMutation(v54);
                        objc_msgSend(v53, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v149 + 1) + 8 * jj));
                        v58 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v58)
                        {

                          -[REHTTPDebugCoordinator _stringForObject:](self, "_stringForObject:", v58);
                          v60 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v125);
                          v61 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v61, "stringValue");
                          v62 = (void *)objc_claimAutoreleasedReturnValue();
                          v153 = v62;
                          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v153, 1);
                          v63 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v120, "arrayByAddingObjectsFromArray:", v63);
                          v64 = (void *)objc_claimAutoreleasedReturnValue();
                          -[REHTTPDebugCoordinator _linkElementForTableItem:paths:](self, "_linkElementForTableItem:paths:", v60, v64);
                          v59 = (void *)objc_claimAutoreleasedReturnValue();

                          goto LABEL_63;
                        }
                      }
                      v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v149, &buf, 16);
                      if (v55)
                        continue;
                      break;
                    }
                  }

                  v59 = 0;
LABEL_63:
                  -[REHTTPDebugCoordinator _createContentItemWithTitle:content:](self, "_createContentItemWithTitle:content:", v59, v42);
                  v65 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v124)
                  {
                    objc_msgSend(v124, "append:", v65);
                    v66 = objc_claimAutoreleasedReturnValue();

                    v124 = (id)v66;
                  }
                  else
                  {
                    v124 = v65;
                  }

                  ++v125;
                  v27 = v122 + 1;
                }
                while (v122 + 1 != v118);
                v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v133, v154, 16);
              }
              while (v118);
            }
            else
            {
              v124 = 0;
            }

          }
          else
          {
            v128[0] = MEMORY[0x24BDAC760];
            v128[1] = 3221225472;
            v128[2] = __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_6;
            v128[3] = &unk_24CF8D398;
            v128[4] = self;
            -[REHTTPDebugCoordinator _createTableWithItems:itemFormatBlock:valueBlock:](self, "_createTableWithItems:itemFormatBlock:valueBlock:", v106, v128, 0);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            -[REHTTPDebugCoordinator _createContentItemWithTitle:content:](self, "_createContentItemWithTitle:content:", 0, v104);
            v124 = (id)objc_claimAutoreleasedReturnValue();

          }
          v105 = v112;
          if (v107)
          {

            v105 = &stru_24CF92178;
          }
          v112 = (__CFString *)v105;
          ((void (*)(void (**)(id, id, __CFString *), id))v109[2])(v109, v124);
        }
        else
        {
          +[REHTMLElement div](REHTMLElement, "div");
          v124 = (id)objc_claimAutoreleasedReturnValue();
          v109[2](v109, v124, v112);
        }

      }
      else
      {
        +[REHTMLElement div](REHTMLElement, "div");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[REHTTPDebugCoordinator _stringElementForObject:](self, "_stringElementForObject:", v12);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "addChild:", v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        -[REHTTPDebugCoordinator _createContentItemWithTitle:content:](self, "_createContentItemWithTitle:content:", 0, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v109[2](v109, v70, v112);
      }
    }
    else
    {
      v109[2](v109, 0, v112);
    }
    v24 = v112;
LABEL_22:

    v5 = v109;
  }

}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "arrayByAddingObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_linkElementForTableItem:paths:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_stringElementForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    REEncodeIdentificationProperites();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      while (2)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9), (_QWORD)v19);
          v10 = objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v12 = (void *)v10;

            v13 = *(void **)(a1 + 32);
            v14 = *(void **)(a1 + 40);
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) - 1);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "stringValue");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "arrayByAddingObject:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "_linkElementForTableItem:paths:", v4, v17);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_stringElementForObject:", v3, (_QWORD)v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v11;
}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = (void *)a1[5];
  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a1[6];
  v6 = a2;
  objc_msgSend(v4, "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_linkElementForTableItem:paths:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_stringElementForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __65__REHTTPDebugCoordinator_generateDiagnosticsForPaths_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stringElementForObject:", a2);
}

- (id)_createContentItemWithTitle:(id)a3 content:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    +[REHTMLElement div](REHTMLElement, "div");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "elementByAddingClass:", CFSTR("section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addChild:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  +[REHTMLElement div](REHTMLElement, "div");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "elementByAddingClass:", CFSTR("content-item"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v11, "addChild:", v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  if (v6)
  {
    objc_msgSend(v11, "addChild:", v6);
    v13 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v13;
  }

  return v11;
}

- (id)_createHTMLTableRowFromArray:(id)a3 itemElementTag:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("tr"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (_createHTMLTableRowFromArray_itemElementTag__onceToken != -1)
    dispatch_once(&_createHTMLTableRowFromArray_itemElementTag__onceToken, &__block_literal_global_27);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v12);
        if ((objc_msgSend(v14, "hasPrefix:", CFSTR("0x"), (_QWORD)v21) & 1) != 0)
        {
          v15 = 1;
        }
        else
        {
          objc_msgSend(v14, "stringByTrimmingCharactersInSet:", _createHTMLTableRowFromArray_itemElementTag__NumericCharacterSet);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v16, "length") == 0;

        }
        +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", v6, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v15)
        {
          objc_msgSend(v17, "elementByAddingClass:", CFSTR("monospaced"));
          v19 = objc_claimAutoreleasedReturnValue();

          v18 = (void *)v19;
        }
        objc_msgSend(v13, "addChild:", v18);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v7;
}

void __70__REHTTPDebugCoordinator__createHTMLTableRowFromArray_itemElementTag___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD14A8], "characterSetWithCharactersInString:", CFSTR("1234567890.-+"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_createHTMLTableRowFromArray_itemElementTag__NumericCharacterSet;
  _createHTMLTableRowFromArray_itemElementTag__NumericCharacterSet = v0;

}

- (id)_createHTMLTableFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v4, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (REPropertyIsInternalAttribute(v12, v8))
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          REPropertyNameFromInternalAttribute(v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v14);

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  v35 = v15;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("sortable"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "BOOLValue");

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("table"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17)
  {
    objc_msgSend(v18, "elementByAddingClasses:", &unk_24CFC1CB8);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("thead"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("header"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTTPDebugCoordinator _createHTMLTableRowFromArray:itemElementTag:](self, "_createHTMLTableRowFromArray:itemElementTag:", v22, CFSTR("th"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addChild:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "addChild:", v24);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  +[REHTMLElement htmlElementWithTag:content:](REHTMLElement, "htmlElementWithTag:content:", CFSTR("tbody"), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = 1;
    do
    {
      -[REHTTPDebugCoordinator _createHTMLTableRowFromArray:itemElementTag:](self, "_createHTMLTableRowFromArray:itemElementTag:", v27, CFSTR("td"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addChild:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v31);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      ++v28;
      v25 = v30;
    }
    while (v27);
  }
  else
  {
    v30 = v25;
  }
  objc_msgSend(v34, "addChild:", v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)_createTableWithItems:(id)a3 itemFormatBlock:(id)a4 valueBlock:(id)a5
{
  id v7;
  void (**v8)(id, _QWORD);
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  v9 = (void (**)(id, _QWORD))a5;
  +[REHTMLElement div](REHTMLElement, "div");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "elementByAddingClass:", CFSTR("content-table"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v7, "count");
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v35;
    do
    {
      v12 = 0;
      do
      {
        v13 = v11;
        if (*(_QWORD *)v35 != v32)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v12);
        +[REHTMLElement div](REHTMLElement, "div", v30);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "elementByAddingClass:", CFSTR("table-item"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v8[2](v8, v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[REHTMLElement div](REHTMLElement, "div");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "elementByAddingClass:", CFSTR("item-key"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addChild:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "addChild:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v9[2](v9, v14);
          v22 = objc_claimAutoreleasedReturnValue();
          if (v22)
          {
            v23 = (void *)v22;
            +[REHTMLElement div](REHTMLElement, "div");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "elementByAddingClass:", CFSTR("item-value"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addChild:", v23);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "addChild:", v26);
            v27 = objc_claimAutoreleasedReturnValue();

            v21 = (void *)v27;
          }
        }
        objc_msgSend(v13, "addChild:", v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        ++v12;
      }
      while (v33 != v12);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v33);
  }

  if (v30 <= 2)
  {
    objc_msgSend(v11, "elementByAddingClass:", CFSTR("two-column"));
    v28 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v28;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulator, 0);
}

- (void)generateDiagnosticsForPaths:(uint64_t)a1 completion:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_2132F7000, a2, OS_LOG_TYPE_DEBUG, "Received json %@", (uint8_t *)&v2, 0xCu);
}

@end
