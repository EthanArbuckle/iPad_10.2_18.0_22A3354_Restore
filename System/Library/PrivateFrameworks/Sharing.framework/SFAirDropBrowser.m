@implementation SFAirDropBrowser

- (SFAirDropBrowser)init
{
  SFAirDropBrowser *v2;
  SFAirDropBrowser *v3;
  uint64_t v4;
  NSMutableDictionary *nodes;
  uint64_t v6;
  NSMutableDictionary *nodeIDToNode;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFAirDropBrowser;
  v2 = -[SFAirDropBrowser init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_browser = 0;
    v4 = objc_opt_new();
    nodes = v3->_nodes;
    v3->_nodes = (NSMutableDictionary *)v4;

    v6 = objc_opt_new();
    nodeIDToNode = v3->_nodeIDToNode;
    v3->_nodeIDToNode = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[SFAirDropBrowser stop](self, "stop");
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropBrowser;
  -[SFAirDropBrowser dealloc](&v3, sel_dealloc);
}

- (void)start
{
  __SFBrowser *v3;
  const __CFString *sendingAppBundleID;
  NSArray *urlsBeingShared;
  NSArray *photosAssetIDs;
  NSArray *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  if (!self->_browser)
  {
    *(_QWORD *)&v9 = 0;
    v10 = 0u;
    v11 = 0;
    *((_QWORD *)&v9 + 1) = self;
    v3 = (__SFBrowser *)SFBrowserCreate(0, CFSTR("AirDrop"));
    self->_browser = v3;
    SFBrowserSetClient((uint64_t)v3, (uint64_t)browserCallBack, &v9);
    SFBrowserSetDispatchQueue((uint64_t)self->_browser, MEMORY[0x1E0C80D38]);
    sendingAppBundleID = &stru_1E483B8E8;
    urlsBeingShared = self->_urlsBeingShared;
    if (self->_sendingAppBundleID)
      sendingAppBundleID = (const __CFString *)self->_sendingAppBundleID;
    v12[0] = CFSTR("BundleID");
    v12[1] = CFSTR("URLsBeingShared");
    photosAssetIDs = (NSArray *)MEMORY[0x1E0C9AA60];
    if (urlsBeingShared)
      v7 = urlsBeingShared;
    else
      v7 = (NSArray *)MEMORY[0x1E0C9AA60];
    v13[0] = sendingAppBundleID;
    v13[1] = v7;
    if (self->_photosAssetIDs)
      photosAssetIDs = self->_photosAssetIDs;
    v12[2] = CFSTR("PhotosAssetIDs");
    v12[3] = CFSTR("ShouldCollectDiscoveryMetrics");
    v13[2] = photosAssetIDs;
    v13[3] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4, v9, v10, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SFBrowserSetOptions((uint64_t)self->_browser, (uint64_t)v8);
    SFBrowserOpenNode((uint64_t)self->_browser, 0, self->_sessionID, 0);

  }
}

- (void)pause
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_batchDelegate);

  if (WeakRetained)
  {
    self->_shouldDeliverEmptyUpdates = 1;
    -[SFAirDropBrowser stop](self, "stop");
  }
}

- (void)resume
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_batchDelegate);

  if (WeakRetained)
    -[SFAirDropBrowser start](self, "start");
}

- (void)stop
{
  __SFBrowser *browser;

  browser = self->_browser;
  if (browser)
  {
    SFBrowserInvalidate((uint64_t)browser);
    CFRelease(self->_browser);
    self->_browser = 0;
  }
}

- (void)updateDiscoveredPeople
{
  void *v3;
  __SFBrowser *browser;
  void *v5;
  NSArray *people;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *nodeIDToNode;
  void *v17;
  NSMutableDictionary *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t n;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t ii;
  void *v63;
  char v64;
  void *v65;
  char v66;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t jj;
  unint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t kk;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  char v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t mm;
  uint64_t v94;
  void *v95;
  NSArray *v96;
  NSArray *v97;
  SFAirDropBrowserDelegate **p_delegate;
  id WeakRetained;
  NSArray *v100;
  unint64_t v101;
  void *v102;
  SFAirDropBrowserDelegate **v103;
  id v104;
  unint64_t v105;
  unint64_t v106;
  id v107;
  id v108;
  id v109;
  id v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  NSArray *v119;
  void *v120;
  void *v121;
  id v122;
  NSArray *v123;
  id v124;
  id obj;
  void *v126;
  _QWORD v127[5];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  uint8_t v171[128];
  uint8_t buf[4];
  void *v173;
  _BYTE v174[128];
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  browser = self->_browser;
  if (browser)
    v5 = (void *)SFBrowserCopyChildren((uint64_t)browser, 0);
  else
    v5 = 0;
  people = self->_people;
  if (people)
    v7 = people;
  else
    v7 = (NSArray *)objc_opt_new();
  v123 = v7;
  v162 = 0u;
  v163 = 0u;
  v160 = 0u;
  v161 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v174, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v161;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v161 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](self->_nodes, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = v14;
          objc_msgSend(v14, "updateWithSFNode:", v12);
          nodeIDToNode = self->_nodeIDToNode;
          objc_msgSend(v15, "nodeIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = nodeIDToNode;
        }
        else
        {
          +[SFAirDropNode nodeWithSFNode:](SFAirDropNode, "nodeWithSFNode:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_nodes, "setObject:forKeyedSubscript:", v15, v13);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setNodeIdentifier:", v17);
          v18 = self->_nodeIDToNode;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v15, v17);

        objc_msgSend(v3, "addObject:", v15);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v174, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "differenceFromArray:", v123);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v115 = v20;
  if (objc_msgSend(v20, "hasChanges"))
  {
    airdrop_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v173 = v20;
      _os_log_impl(&dword_1A2830000, v21, OS_LOG_TYPE_DEFAULT, "Updated people: %@", buf, 0xCu);
    }

    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    objc_msgSend(v20, "insertions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v156, v171, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v157;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v157 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * j);
          airdrop_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v27, "object");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v173 = v29;
            _os_log_impl(&dword_1A2830000, v28, OS_LOG_TYPE_DEFAULT, "Updated people: Adding person %@", buf, 0xCu);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v156, v171, 16);
      }
      while (v24);
    }

    v154 = 0u;
    v155 = 0u;
    v152 = 0u;
    v153 = 0u;
    objc_msgSend(v115, "removals");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v152, v170, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v153;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v153 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * k);
          airdrop_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v35, "object");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v173 = v37;
            _os_log_impl(&dword_1A2830000, v36, OS_LOG_TYPE_DEFAULT, "Updated people: Removing person %@", buf, 0xCu);

          }
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v152, v170, 16);
      }
      while (v32);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = objc_claimAutoreleasedReturnValue();
  v148 = 0u;
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v41 = v123;
  v42 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v148, v169, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v149;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v149 != v44)
          objc_enumerationMutation(v41);
        v46 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * m);
        if (objc_msgSend(v3, "containsObject:", v46))
          v47 = v38;
        else
          v47 = (void *)v40;
        objc_msgSend(v47, "addObject:", v46);
      }
      v43 = -[NSArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v148, v169, 16);
    }
    while (v43);
  }

  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  v48 = v3;
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v144, v168, 16);
  if (v49)
  {
    v50 = v49;
    v51 = *(_QWORD *)v145;
    do
    {
      for (n = 0; n != v50; ++n)
      {
        if (*(_QWORD *)v145 != v51)
          objc_enumerationMutation(v48);
        v53 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * n);
        if (!-[NSArray containsObject:](v41, "containsObject:", v53))
          objc_msgSend(v39, "addObject:", v53);
      }
      v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v144, v168, 16);
    }
    while (v50);
  }
  v118 = (void *)v40;
  v119 = v41;
  v113 = v48;

  objc_msgSend(v39, "sortUsingComparator:", &__block_literal_global_3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v54 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v38;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v124 = v39;
  v59 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v140, v167, 16);
  if (v59)
  {
    v60 = v59;
    v61 = *(_QWORD *)v141;
    do
    {
      for (ii = 0; ii != v60; ++ii)
      {
        if (*(_QWORD *)v141 != v61)
          objc_enumerationMutation(v124);
        v63 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * ii);
        v64 = objc_msgSend(v63, "isSuggestion");
        v65 = v56;
        if ((v64 & 1) == 0)
        {
          v66 = objc_msgSend(v63, "isMe");
          v65 = v55;
          if ((v66 & 1) == 0)
          {
            if (objc_msgSend(v63, "isUnknown"))
              v65 = (void *)v54;
            else
              v65 = v120;
          }
        }
        objc_msgSend(v65, "addObject:", v63);
      }
      v60 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v140, v167, 16);
    }
    while (v60);
  }

  if (objc_msgSend(v57, "count"))
  {
    v67 = 0;
    v68 = 0;
    do
    {
      objc_msgSend(v57, "objectAtIndexedSubscript:", v67);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v69, "isSuggestion") & 1) != 0 || objc_msgSend(v69, "isMe"))
        ++v68;

      ++v67;
    }
    while (objc_msgSend(v57, "count") > v67);
  }
  else
  {
    v68 = 0;
  }
  v117 = (void *)v54;
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v70 = v56;
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v136, v166, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v137;
    do
    {
      for (jj = 0; jj != v72; ++jj)
      {
        if (*(_QWORD *)v137 != v73)
          objc_enumerationMutation(v70);
        objc_msgSend(v57, "insertObject:atIndex:", *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * jj), v68 + jj);
        objc_msgSend(v58, "addIndex:", v68 + jj);
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v136, v166, 16);
      v68 += jj;
    }
    while (v72);
  }

  if (objc_msgSend(v57, "count"))
  {
    v75 = 0;
    v76 = 0;
    v77 = v116;
    do
    {
      objc_msgSend(v57, "objectAtIndexedSubscript:", v75);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v78, "isMe"))
      {
        objc_msgSend(v116, "addObject:", v78);
        ++v76;
      }

      ++v75;
    }
    while (objc_msgSend(v57, "count") > v75);
  }
  else
  {
    v76 = 0;
    v77 = v116;
  }
  v111 = v70;
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v122 = v55;
  v79 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v132, v165, 16);
  if (v79)
  {
    v80 = v79;
    v81 = *(_QWORD *)v133;
    do
    {
      for (kk = 0; kk != v80; ++kk)
      {
        if (*(_QWORD *)v133 != v81)
          objc_enumerationMutation(v122);
        v83 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * kk);
        objc_msgSend(v57, "insertObject:atIndex:", v83, v76 + kk);
        objc_msgSend(v58, "addIndex:", v76 + kk);
        objc_msgSend(v77, "addObject:", v83);
      }
      v80 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v132, v165, 16);
      v76 += kk;
    }
    while (v80);
  }

  if (objc_msgSend(v57, "count"))
  {
    v84 = 0;
    v85 = 0;
    while (1)
    {
      objc_msgSend(v57, "objectAtIndexedSubscript:", v84);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v86, "isUnknown") & 1) != 0)
        break;
      ++v85;
      v88 = objc_msgSend(v86, "isMe");
      v87 = v126;
      if ((v88 & 1) == 0)
        goto LABEL_104;
LABEL_105:

      if (objc_msgSend(v57, "count") <= (unint64_t)++v84)
        goto LABEL_108;
    }
    v87 = v114;
LABEL_104:
    objc_msgSend(v87, "addObject:", v86);
    goto LABEL_105;
  }
  v85 = 0;
LABEL_108:
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v89 = v120;
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v128, v164, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v129;
    do
    {
      for (mm = 0; mm != v91; ++mm)
      {
        if (*(_QWORD *)v129 != v92)
          objc_enumerationMutation(v89);
        v94 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * mm);
        objc_msgSend(v57, "insertObject:atIndex:", v94, v85 + mm);
        objc_msgSend(v58, "addIndex:", v85 + mm);
        objc_msgSend(v126, "addObject:", v94);
      }
      v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v128, v164, 16);
      v85 += mm;
    }
    while (v91);
  }

  objc_msgSend(v114, "arrayByAddingObjectsFromArray:", v117);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = (void *)objc_msgSend(v95, "copy");

  objc_msgSend(v57, "arrayByAddingObjectsFromArray:", v117);
  v96 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v97 = self->_people;
  self->_people = v96;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "browserWillChangePeople:", self);

  v100 = v119;
  if (-[NSArray count](v119, "count"))
  {
    v101 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](v100, "objectAtIndexedSubscript:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v118, "containsObject:", v102))
      {
        v103 = p_delegate;
        v104 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v104, "browser:didDeletePersonAtIndex:", self, v101);

        p_delegate = v103;
        objc_msgSend(v112, "addIndex:", v101);
      }

      ++v101;
      v100 = v119;
    }
    while (-[NSArray count](v119, "count") > v101);
  }
  v127[0] = MEMORY[0x1E0C809B0];
  v127[1] = 3221225472;
  v127[2] = __42__SFAirDropBrowser_updateDiscoveredPeople__block_invoke_2;
  v127[3] = &unk_1E482DE58;
  v127[4] = self;
  objc_msgSend(v58, "enumerateIndexesUsingBlock:", v127);
  v105 = objc_msgSend(v57, "count");
  if (v105 < objc_msgSend(v117, "count") + v105)
  {
    v106 = v105;
    do
    {
      v107 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v107, "browser:didInsertPersonAtIndex:", self, v105);

      objc_msgSend(v58, "addIndex:", v105++);
    }
    while (v105 < objc_msgSend(v117, "count") + v106);
  }
  v108 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v108, "browserDidChangePeople:", self);

  v109 = objc_loadWeakRetained((id *)&self->_diffableDelegate);
  objc_msgSend(v109, "browserDidUpdateMePeople:knownPeople:unknownPeople:", v116, v126, v121);

  if (!self->_shouldDeliverEmptyUpdates || -[NSArray count](self->_people, "count"))
  {
    self->_shouldDeliverEmptyUpdates = 0;
    v110 = objc_loadWeakRetained((id *)&self->_batchDelegate);
    objc_msgSend(v110, "browserDidUpdatePeople:", self);

  }
}

uint64_t __42__SFAirDropBrowser_updateDiscoveredPeople__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6)
    v9 = -1;
  else
    v9 = v7 != 0;
  if (v6 && v7)
  {
    if (!objc_msgSend(v6, "isClassroom") || objc_msgSend(v8, "isClassroom"))
    {
      if ((objc_msgSend(v6, "isClassroom") & 1) == 0 && (objc_msgSend(v8, "isClassroom") & 1) != 0)
      {
LABEL_14:
        v9 = 1;
        goto LABEL_17;
      }
      if (!objc_msgSend(v6, "isClassroomCourse") || objc_msgSend(v8, "isClassroomCourse"))
      {
        if ((objc_msgSend(v6, "isClassroomCourse") & 1) != 0 || (objc_msgSend(v8, "isClassroomCourse") & 1) == 0)
        {
          objc_msgSend(v6, "displayName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "displayName");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v10, "localizedCaseInsensitiveCompare:", v11);

          goto LABEL_17;
        }
        goto LABEL_14;
      }
    }
    v9 = -1;
  }
LABEL_17:

  return v9;
}

void __42__SFAirDropBrowser_updateDiscoveredPeople__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  objc_msgSend(WeakRetained, "browser:didInsertPersonAtIndex:", *(_QWORD *)(a1 + 32), a2);

}

- (void)getChangedIndexesForClientPeopleList:(id)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    v8 = a4;
  }
  else
  {
    v9 = a4;
    v7 = (void *)objc_opt_new();
  }
  -[NSArray sortedArrayUsingComparator:](self->_people, "sortedArrayUsingComparator:", &__block_literal_global_94);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = 0;
  objc_msgSend(v7, "sf_differencesFromArray:removedIndexes:insertedIndexes:", v10, &v14, &v13);
  v11 = v14;
  v12 = v13;
  (*((void (**)(id, void *, id, id))a4 + 2))(a4, v10, v11, v12);

}

uint64_t __72__SFAirDropBrowser_getChangedIndexesForClientPeopleList_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v13;

  v4 = a2;
  v5 = a3;
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v6)
    v9 = -1;
  else
    v9 = v7 != 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v6, "isClassroom") && !objc_msgSend(v8, "isClassroom"))
      goto LABEL_30;
    if ((objc_msgSend(v6, "isClassroom") & 1) != 0 || (objc_msgSend(v8, "isClassroom") & 1) == 0)
    {
      if (objc_msgSend(v6, "isClassroomCourse") && !objc_msgSend(v8, "isClassroomCourse"))
        goto LABEL_30;
      if ((objc_msgSend(v6, "isClassroomCourse") & 1) != 0 || (objc_msgSend(v8, "isClassroomCourse") & 1) == 0)
      {
        if (objc_msgSend(v6, "isSuggestion") && objc_msgSend(v8, "isSuggestion"))
        {
          objc_msgSend(v6, "model");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "model");
          v11 = objc_claimAutoreleasedReturnValue();
LABEL_33:
          v13 = (void *)v11;
          v9 = objc_msgSend(v10, "compare:", v11);

          goto LABEL_31;
        }
        if (objc_msgSend(v6, "isSuggestion") && !objc_msgSend(v8, "isSuggestion"))
          goto LABEL_30;
        if ((objc_msgSend(v6, "isSuggestion") & 1) != 0 || (objc_msgSend(v8, "isSuggestion") & 1) == 0)
        {
          if (objc_msgSend(v6, "isMe") && !objc_msgSend(v8, "isMe"))
            goto LABEL_30;
          if ((objc_msgSend(v6, "isMe") & 1) != 0 || (objc_msgSend(v8, "isMe") & 1) == 0)
          {
            if (!objc_msgSend(v6, "isKnown") || objc_msgSend(v8, "isKnown"))
            {
              if ((objc_msgSend(v6, "isKnown") & 1) != 0 || (objc_msgSend(v8, "isKnown") & 1) == 0)
              {
                objc_msgSend(v6, "discoveryDate");
                v10 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "discoveryDate");
                v11 = objc_claimAutoreleasedReturnValue();
                goto LABEL_33;
              }
              goto LABEL_29;
            }
LABEL_30:
            v9 = -1;
            goto LABEL_31;
          }
        }
      }
    }
LABEL_29:
    v9 = 1;
  }
LABEL_31:

  return v9;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)people
{
  return self->_people;
}

- (SFAirDropBrowserDelegate)delegate
{
  return (SFAirDropBrowserDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFAirDropBrowserBatchDelegate)batchDelegate
{
  return (SFAirDropBrowserBatchDelegate *)objc_loadWeakRetained((id *)&self->_batchDelegate);
}

- (void)setBatchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_batchDelegate, a3);
}

- (NSString)sendingAppBundleID
{
  return self->_sendingAppBundleID;
}

- (void)setSendingAppBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)urlsBeingShared
{
  return self->_urlsBeingShared;
}

- (void)setUrlsBeingShared:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)photosAssetIDs
{
  return self->_photosAssetIDs;
}

- (void)setPhotosAssetIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (SFAirDropBrowserDiffableDelegate)diffableDelegate
{
  return (SFAirDropBrowserDiffableDelegate *)objc_loadWeakRetained((id *)&self->_diffableDelegate);
}

- (void)setDiffableDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_diffableDelegate, a3);
}

- (NSMutableDictionary)nodeIDToNode
{
  return self->_nodeIDToNode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeIDToNode, 0);
  objc_destroyWeak((id *)&self->_diffableDelegate);
  objc_storeStrong((id *)&self->_photosAssetIDs, 0);
  objc_storeStrong((id *)&self->_urlsBeingShared, 0);
  objc_storeStrong((id *)&self->_sendingAppBundleID, 0);
  objc_destroyWeak((id *)&self->_batchDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_people, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
