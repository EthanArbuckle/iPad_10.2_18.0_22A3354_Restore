@implementation PXGTextureManager

uint64_t __36__PXGTextureManager__pruneTextures___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hash");
}

- (void)_addTextureToTexturesInUse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *deallocationsQueue;
  _QWORD block[4];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");

  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "hasPendingTextureRequestID:deliveryOrder:", v6, v8) & 1) == 0)
    goto LABEL_12;
  -[NSMapTable objectForKey:](self->_pendingSpriteTextureByRequestID, "objectForKey:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10 && v10 != v9)
  {
    if (!objc_msgSend(v10, "removePendingSpriteWithTextureRequestID:ifDeliveredBefore:", v6, v8))
    {
      objc_msgSend(v9, "removePendingSpriteWithTextureRequestID:ifDeliveredBefore:", v6, 0xFFFFFFFFLL);
      goto LABEL_9;
    }
    if ((objc_msgSend(v11, "hasSprites") & 1) == 0)
    {
      -[NSHashTable removeObject:](self->_spriteTexturesInUse, "removeObject:", v11);
      deallocationsQueue = self->_deallocationsQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __48__PXGTextureManager__addTextureToTexturesInUse___block_invoke;
      block[3] = &unk_1E5149198;
      v14 = v11;
      dispatch_async(deallocationsQueue, block);

    }
  }
  -[NSMapTable setObject:forKey:](self->_pendingSpriteTextureByRequestID, "setObject:forKey:", v9, v5);
LABEL_9:
  if (objc_msgSend(v9, "hasSprites"))
    -[NSHashTable addObject:](self->_spriteTexturesInUse, "addObject:", v9);

LABEL_12:
}

- (BOOL)streamUpdatedTexturesForDisplayLinkIfNeeded:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXGTextureManager layoutQueue](self, "layoutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  kdebug_trace();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_textureProviderByMediaKind, "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_textureProvidersDisplayLinkRegistrationState, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "BOOLValue"))
        {
          objc_msgSend(v11, "requestUpdatedTexturesForDisplayLink:", v4);
          v7 = 1;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  kdebug_trace();
  return v7 & 1;
}

- (void)_streamTexturesForSpritesInDataStore:(id)a3 presentationDataStore:(id)a4 changeDetails:(id)a5 layout:(id)a6 interactionState:(id *)a7 loadingStatus:(id)a8
{
  id v14;
  id v15;
  uint64_t v16;
  unsigned __int8 *p_isPerformingUpdateFromRequestQueue;
  int v18;
  uint64_t v19;
  NSObject *requestQueue;
  void *v21;
  __int128 v22;
  CGSize size;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSIndexSet **p_loadedSpriteIndexes;
  NSIndexSet *loadedSpriteIndexes;
  void *v34;
  uint64_t v35;
  $3AF47EF1DC6FA7925F89D368FE250233 *v36;
  unint64_t streamInfoBySpriteIndexCount;
  NSIndexSet *v38;
  NSIndexSet *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  unsigned int *j;
  _BOOL4 v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  __int128 v53;
  CGSize v54;
  uint64_t v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  id v66;
  id v67;
  NSIndexSet *v68;
  NSIndexSet *v69;
  BOOL var5;
  os_unfair_lock_s *p_lookupLock;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t m;
  void *v77;
  NSObject *v78;
  __int128 v79;
  CGSize v80;
  void *v81;
  id v82;
  id v83;
  os_unfair_lock_s *v84;
  void *v85;
  _BOOL4 v86;
  NSObject *v87;
  void *v88;
  uint64_t v89;
  uint64_t n;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t ii;
  void *v96;
  void *v97;
  PXGMutableSpriteTexture *v98;
  PXGMutableSpriteTexture *v99;
  id obj;
  void *v101;
  id v102;
  void *v103;
  uint64_t v104;
  id v105;
  NSMutableDictionary *v106;
  NSMutableDictionary *v107;
  id v108;
  id v109;
  void *v110;
  id v111;
  NSMutableDictionary *v112;
  void *v113;
  id v114;
  void *v115;
  NSIndexSet *v116;
  void *v117;
  id v118;
  void *v119;
  void *v121;
  os_unfair_lock_t lock;
  void *v123;
  void *v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  int64_t v129;
  uint64_t v130;
  $3AF47EF1DC6FA7925F89D368FE250233 *streamInfoBySpriteIndex;
  id v132;
  void *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[5];
  os_unfair_lock_s *v143;
  _QWORD v144[4];
  PXGMutableSpriteTexture *v145;
  id v146;
  PXGTextureManager *v147;
  os_unfair_lock_s *v148;
  id v149;
  _QWORD v150[4];
  id v151;
  __int128 *p_buf;
  _OWORD v153[4];
  _QWORD v154[6];
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  _QWORD v159[4];
  id v160;
  $3AF47EF1DC6FA7925F89D368FE250233 *v161;
  _QWORD v162[5];
  NSMutableDictionary *v163;
  id v164;
  id v165;
  id v166;
  $3AF47EF1DC6FA7925F89D368FE250233 *v167;
  uint64_t v168;
  unordered_map<int, unsigned int, std::hash<int>, std::equal_to<int>, std::allocator<std::pair<const int, unsigned int>>> *v169;
  SEL v170;
  __int128 v171;
  __int128 v172;
  uint64_t v173;
  BOOL v174;
  _QWORD v175[4];
  id v176;
  $3AF47EF1DC6FA7925F89D368FE250233 *v177;
  _QWORD v178[4];
  id v179;
  PXGTextureManager *v180;
  id v181;
  uint64_t v182;
  __int128 v183;
  __int128 v184;
  uint64_t v185;
  $3AF47EF1DC6FA7925F89D368FE250233 *v186;
  _QWORD v187[6];
  __int128 v188;
  __int128 v189;
  uint64_t v190;
  _OWORD v191[4];
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  _QWORD v200[4];
  id v201;
  _QWORD v202[8];
  _QWORD v203[5];
  NSMutableDictionary *v204;
  id v205;
  $3AF47EF1DC6FA7925F89D368FE250233 *v206;
  unordered_map<int, unsigned int, std::hash<int>, std::equal_to<int>, std::allocator<std::pair<const int, unsigned int>>> *p_spriteIndexByRequestID;
  uint64_t v208;
  _QWORD aBlock[7];
  _OWORD v210[4];
  _QWORD block[5];
  _BYTE v212[5];
  uint8_t v213[128];
  __int128 buf;
  uint64_t v215;
  uint64_t v216;
  _BYTE v217[128];
  _BYTE v218[128];
  _BYTE v219[128];
  uint64_t v220;

  v220 = *MEMORY[0x1E0C80C00];
  v128 = a3;
  v118 = a4;
  v126 = a5;
  v14 = a6;
  v15 = a8;
  v129 = self->_streamCount + 1;
  self->_streamCount = v129;
  v110 = v14;
  v111 = objc_retainAutorelease(v15);
  v16 = objc_msgSend(v111, "mutableStates");
  p_isPerformingUpdateFromRequestQueue = &self->_isPerformingUpdateFromRequestQueue;
  do
    v18 = __ldaxr(p_isPerformingUpdateFromRequestQueue);
  while (__stlxr(0, p_isPerformingUpdateFromRequestQueue));
  v19 = MEMORY[0x1E0C809B0];
  if (v18)
  {
    requestQueue = self->_requestQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(requestQueue, block);
  }
  objc_msgSend(v14, "fences");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeAllFences");
  -[PXGTextureManager preheatingStrategy](self, "preheatingStrategy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *(_OWORD *)&a7->var4;
  v210[0] = *(_OWORD *)&a7->var0;
  v210[1] = v22;
  size = a7->var8.size;
  v210[2] = a7->var8.origin;
  v210[3] = size;
  objc_msgSend(v21, "preheatingRectForLayout:interactionState:", v14, v210);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  kdebug_trace();
  -[PXGTextureManager _resizeStorageIfNeededForSpriteCount:](self, "_resizeStorageIfNeededForSpriteCount:", objc_msgSend(v128, "count"));
  self->_streamInfoBySpriteIndexCount = objc_msgSend(v128, "count");
  streamInfoBySpriteIndex = self->_streamInfoBySpriteIndex;
  v112 = self->_textureProviderByMediaKind;
  aBlock[0] = v19;
  aBlock[1] = 3221225472;
  aBlock[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2;
  aBlock[3] = &unk_1E513A120;
  aBlock[4] = self;
  aBlock[5] = a2;
  aBlock[6] = &self->_lookupLock_requestDetailsByRequestID;
  v113 = _Block_copy(aBlock);
  p_loadedSpriteIndexes = &self->_loadedSpriteIndexes;
  loadedSpriteIndexes = self->_loadedSpriteIndexes;
  objc_msgSend(v126, "removedSpriteIndexes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSIndexSet px_intersectionWithIndexSet:](loadedSpriteIndexes, "px_intersectionWithIndexSet:", v34);
  v117 = (void *)objc_claimAutoreleasedReturnValue();

  v203[0] = v19;
  v203[1] = 3221225472;
  v203[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3;
  v203[3] = &unk_1E513A148;
  v203[4] = self;
  v206 = streamInfoBySpriteIndex;
  v108 = v113;
  v205 = v108;
  p_spriteIndexByRequestID = &self->_spriteIndexByRequestID;
  v106 = v112;
  v204 = v106;
  v208 = v16;
  v123 = _Block_copy(v203);
  os_unfair_lock_lock(&self->_lookupLock);
  objc_msgSend(v117, "enumerateRangesUsingBlock:", v123);
  os_unfair_lock_unlock(&self->_lookupLock);
  if (objc_msgSend(v126, "hasAnyInsertionsRemovalsOrMoves"))
  {
    v35 = objc_msgSend(objc_retainAutorelease(v128), "entities");
    v36 = self->_streamInfoBySpriteIndex;
    streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
    v202[0] = v19;
    v202[1] = 3221225472;
    v202[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4;
    v202[3] = &unk_1E513A170;
    v202[5] = v35;
    v202[4] = self;
    v202[6] = a2;
    v202[7] = streamInfoBySpriteIndex;
    objc_msgSend(v126, "applyToArray:elementSize:countAfterChanges:insertionHandler:modifiedHandler:", v36, 66, streamInfoBySpriteIndexCount, v202, 0);
    objc_msgSend(v126, "indexSetAfterApplyingChangeDetails:", *p_loadedSpriteIndexes);
    v38 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    v39 = self->_loadedSpriteIndexes;
    self->_loadedSpriteIndexes = v38;

    v200[0] = v19;
    v200[1] = 3221225472;
    v200[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5;
    v200[3] = &unk_1E513A198;
    v40 = v126;
    v201 = v40;
    -[PXGTextureManager _enumerateSpriteTextures:](self, "_enumerateSpriteTextures:", v200);
    v199 = 0u;
    v198 = 0u;
    v197 = 0u;
    v196 = 0u;
    -[PXGTextureManager textureAtlasManagers](self, "textureAtlasManagers");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v196, v219, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v197;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v197 != v43)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v196 + 1) + 8 * i), "applyChangeDetails:", v40);
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v196, v219, 16);
      }
      while (v42);
    }

    v45 = objc_msgSend(objc_retainAutorelease(v40), "spriteIndexAfterChangeBySpriteIndexBeforeChange");
    for (j = (unsigned int *)self->_spriteIndexByRequestID.__table_.__p1_.__value_.__next_; j; j = *(unsigned int **)j)
      j[5] = *(_DWORD *)(v45 + 4 * j[5]);

  }
  v47 = -[PXGTextureManager isInactive](self, "isInactive");
  -[PXGTextureManager viewEnvironment](self, "viewEnvironment");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  v195 = 0u;
  v194 = 0u;
  v193 = 0u;
  v192 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_textureProviderByMediaKind, "objectEnumerator");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v192, v218, 16);
  if (v49)
  {
    v50 = *(_QWORD *)v193;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(_QWORD *)v193 != v50)
          objc_enumerationMutation(v48);
        v52 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * k);
        objc_msgSend(v52, "setViewEnvironment:", v133);
        v53 = *(_OWORD *)&a7->var4;
        v191[0] = *(_OWORD *)&a7->var0;
        v191[1] = v53;
        v54 = a7->var8.size;
        v191[2] = a7->var8.origin;
        v191[3] = v54;
        objc_msgSend(v52, "setInteractionState:", v191);
      }
      v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v192, v218, 16);
    }
    while (v49);
  }

  -[PXGTextureManager _processTextureProviderResults](self, "_processTextureProviderResults");
  v116 = *p_loadedSpriteIndexes;
  v190 = 0;
  v189 = 0u;
  v188 = 0u;
  if (v128)
  {
    objc_msgSend(v128, "sprites");
    v104 = v189;
    v55 = v190;
  }
  else
  {
    v55 = 0;
    v104 = 0;
  }
  if (v47)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v56 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    PXGTungstenGetLog();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1A6789000, v57, OS_LOG_TYPE_DEFAULT, "%@ purging resources", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v57 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    objc_msgSend(v128, "spriteIndexesInRect:", v25, v27, v29, v31);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    if (CGRectIsNull(a7->var8))
    {
      v119 = 0;
    }
    else
    {
      objc_msgSend(v128, "spriteIndexesInRect:", a7->var8.origin.x, a7->var8.origin.y, a7->var8.size.width, a7->var8.size.height);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v128, "spriteIndexesWithSpriteInfoFlags:", 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addIndexes:](v57, "addIndexes:", v58);
    -[NSObject addIndexes:](v57, "addIndexes:", v59);
    v56 = -[NSObject copy](v57, "copy");

  }
  v124 = (void *)objc_msgSend(v56, "mutableCopy");
  objc_msgSend(v124, "removeIndexes:", v116);
  v127 = (void *)-[NSIndexSet mutableCopy](v116, "mutableCopy");
  objc_msgSend(v127, "removeIndexes:", v56);
  if (self->_didSwitchTextureConverter)
  {
    v125 = (void *)objc_msgSend(v56, "mutableCopy");
  }
  else
  {
    objc_msgSend(v126, "modifiedSpriteIndexes");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v125 = (void *)objc_msgSend(v60, "mutableCopy");

  }
  objc_msgSend(v125, "removeIndexes:", v127);
  objc_msgSend(v125, "removeIndexes:", v124);
  if (v118 && (!objc_msgSend(v127, "count") ? (v61 = 1) : (v61 = v47), (v61 & 1) == 0))
  {
    objc_msgSend(v118, "spriteAtIndexes:inRect:", v127, v25, v27, v29, v31);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v63, "count"))
    {
      objc_msgSend(v127, "removeIndexes:", v63);
      v64 = (void *)objc_msgSend(v56, "mutableCopy");
      objc_msgSend(v64, "addIndexes:", v63);

    }
    else
    {
      v64 = v56;
    }

    v62 = v64;
  }
  else
  {
    v62 = v56;
  }
  v103 = v62;
  objc_storeStrong((id *)&self->_loadedSpriteIndexes, v62);
  v65 = self->_requestQueue;
  v187[0] = v19;
  v187[1] = 3221225472;
  v187[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_36;
  v187[3] = &unk_1E5144EB8;
  v187[4] = self;
  v187[5] = v129;
  dispatch_async(v65, v187);
  os_unfair_lock_lock(&self->_lookupLock);
  v178[0] = v19;
  v178[1] = 3221225472;
  v178[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2_37;
  v178[3] = &unk_1E513A1E8;
  v66 = v110;
  v182 = v55;
  v179 = v66;
  v180 = self;
  v183 = v188;
  v184 = v189;
  v185 = v190;
  v186 = streamInfoBySpriteIndex;
  v67 = v111;
  v181 = v67;
  objc_msgSend(v124, "enumerateRangesUsingBlock:", v178);
  objc_msgSend(v127, "enumerateRangesUsingBlock:", v123);
  if (-[PXGTextureManager deferModifiedTextureRequestsDuringViewResizing](self, "deferModifiedTextureRequestsDuringViewResizing")&& !a7->var5&& self->_hasDeferredRequests)
  {
    v68 = *p_loadedSpriteIndexes;
    v175[0] = v19;
    v175[1] = 3221225472;
    v175[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4_40;
    v175[3] = &unk_1E513A210;
    v177 = streamInfoBySpriteIndex;
    v176 = v125;
    v69 = v68;
    -[NSIndexSet enumerateRangesUsingBlock:](v69, "enumerateRangesUsingBlock:", v175);
    self->_hasDeferredRequests = 0;

  }
  if (-[PXGTextureManager deferModifiedTextureRequestsDuringViewResizing](self, "deferModifiedTextureRequestsDuringViewResizing"))
  {
    var5 = a7->var5;
  }
  else
  {
    var5 = 0;
  }
  v162[0] = v19;
  v162[1] = 3221225472;
  v162[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5_41;
  v162[3] = &unk_1E513A260;
  v168 = v55;
  v174 = var5;
  v167 = streamInfoBySpriteIndex;
  v162[4] = self;
  v109 = v108;
  v166 = v109;
  v169 = &self->_spriteIndexByRequestID;
  v107 = v106;
  v163 = v107;
  v114 = v66;
  v164 = v114;
  v170 = a2;
  v171 = v188;
  v172 = v189;
  v173 = v190;
  v102 = v67;
  v165 = v102;
  objc_msgSend(v125, "enumerateRangesUsingBlock:", v162);
  p_lookupLock = &self->_lookupLock;
  if (v119)
  {
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v159[0] = v19;
    v159[1] = 3221225472;
    v159[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_52;
    v159[3] = &unk_1E513A210;
    v161 = streamInfoBySpriteIndex;
    v72 = (id)objc_claimAutoreleasedReturnValue();
    v160 = v72;
    objc_msgSend(v119, "enumerateRangesUsingBlock:", v159);

    p_lookupLock = &self->_lookupLock;
  }
  else
  {
    v72 = 0;
  }
  os_unfair_lock_unlock(p_lookupLock);
  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_textureProviderByMediaKind, "objectEnumerator");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v155, v217, 16);
  if (v74)
  {
    v75 = *(_QWORD *)v156;
    do
    {
      for (m = 0; m != v74; ++m)
      {
        if (*(_QWORD *)v156 != v75)
          objc_enumerationMutation(v73);
        v77 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * m);
        objc_msgSend(v77, "setRequestIDsInTargetRect:", v72);
        objc_msgSend(v77, "performDeferredCancellations");
        objc_msgSend(v77, "didFinishRequestingTextures");
        if (v47)
          objc_msgSend(v77, "releaseCachedResources");
      }
      v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v155, v217, 16);
    }
    while (v74);
  }
  v101 = v72;

  v78 = self->_requestQueue;
  v154[0] = v19;
  v154[1] = 3221225472;
  v154[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2_53;
  v154[3] = &unk_1E5144EB8;
  v154[4] = self;
  v154[5] = v129;
  dispatch_async(v78, v154);
  objc_msgSend(v114, "visibleRect");
  v79 = *(_OWORD *)&a7->var4;
  v153[0] = *(_OWORD *)&a7->var0;
  v153[1] = v79;
  v80 = a7->var8.size;
  v153[2] = a7->var8.origin;
  v153[3] = v80;
  -[PXGTextureManager _blockOnThumbnailsIfNeededWithGeometries:visibleRect:interactionState:fences:](self, "_blockOnThumbnailsIfNeededWithGeometries:visibleRect:interactionState:fences:", v104, v153, v115);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v215 = 0x2020000000;
  v216 = 0;
  v150[0] = v19;
  v150[1] = 3221225472;
  v150[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3_54;
  v150[3] = &unk_1E513A288;
  obj = v81;
  v105 = v81;
  v151 = v105;
  p_buf = &buf;
  v121 = _Block_copy(v150);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = self->_emptyTexture;
  v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v144[0] = v19;
  v144[1] = 3221225472;
  v144[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4_57;
  v144[3] = &unk_1E513A2B0;
  v99 = v98;
  v145 = v99;
  v83 = v121;
  v149 = v83;
  v132 = v97;
  v146 = v132;
  v147 = self;
  v84 = (os_unfair_lock_s *)v82;
  v148 = v84;
  lock = v84;
  -[PXGTextureManager _enumerateSpriteTextures:](self, "_enumerateSpriteTextures:", v144);
  if (-[os_unfair_lock_s count](v84, "count"))
  {
    -[PXGTextureManager layoutQueue](self, "layoutQueue");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v85 == (void *)MEMORY[0x1E0C80D38];

    if (v86)
    {
      -[PXGTextureManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__pruneTextures_, lock, 0);
    }
    else
    {
      -[PXGTextureManager layoutQueue](self, "layoutQueue");
      v87 = objc_claimAutoreleasedReturnValue();
      v142[0] = v19;
      v142[1] = 3221225472;
      v142[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5_60;
      v142[3] = &unk_1E5148D08;
      v142[4] = self;
      v143 = lock;
      dispatch_async(v87, v142);

    }
  }
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  -[PXGTextureManager textureAtlasManagers](self, "textureAtlasManagers");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v138, v213, 16);
  if (v89)
  {
    v130 = *(_QWORD *)v139;
    do
    {
      for (n = 0; n != v89; ++n)
      {
        if (*(_QWORD *)v139 != v130)
          objc_enumerationMutation(v88);
        v91 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * n);
        objc_msgSend(v91, "setSkipRenderSpriteIndexes:", v132);
        objc_msgSend(v91, "pruneUnusedTextures");
        v136 = 0u;
        v137 = 0u;
        v134 = 0u;
        v135 = 0u;
        objc_msgSend(v91, "textures");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v134, v212, 16);
        if (v93)
        {
          v94 = *(_QWORD *)v135;
          do
          {
            for (ii = 0; ii != v93; ++ii)
            {
              if (*(_QWORD *)v135 != v94)
                objc_enumerationMutation(v92);
              v96 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * ii);
              if (objc_msgSend(v96, "spriteCount"))
                (*((void (**)(id, void *, _QWORD))v83 + 2))(v83, v96, self->_atlasPresentationType);
            }
            v93 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v134, v212, 16);
          }
          while (v93);
        }

      }
      v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v138, v213, 16);
    }
    while (v89);
  }

  objc_storeStrong((id *)&self->_texturesByPresentationType, obj);
  self->_didSwitchTextureConverter = 0;
  objc_msgSend(v124, "count");
  objc_msgSend(v127, "count");
  kdebug_trace();

  _Block_object_dispose(&buf, 8);
}

void __51__PXGTextureManager__processTextureProviderResults__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;
  __int128 v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PXGTextureManager__processTextureProviderResults__block_invoke_3;
  v5[3] = &unk_1E513A388;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = *(_OWORD *)(a1 + 40);
  v4 = v3;
  objc_msgSend(v4, "processPendingTextureRequestIDsWithHandler:", v5);

}

- (NSArray)textureAtlasManagers
{
  return (NSArray *)objc_getProperty(self, a2, 352, 1);
}

- (void)_enumerateSpriteTextures:(id)a3
{
  os_unfair_lock_s *p_lookupLock;
  id v5;

  p_lookupLock = &self->_lookupLock;
  v5 = a3;
  os_unfair_lock_assert_not_owner(p_lookupLock);
  os_unfair_lock_lock(p_lookupLock);
  -[PXGSpriteTextureStore enumerateTexturesWithHandler:](self->_lookupLock_textureCache, "enumerateTexturesWithHandler:", v5);

  os_unfair_lock_unlock(p_lookupLock);
}

- (unint64_t)deferModifiedTextureRequestsDuringViewResizing
{
  return self->_deferModifiedTextureRequestsDuringViewResizing;
}

- (BOOL)isInactive
{
  return self->_isInactive;
}

- (PXGViewEnvironment)viewEnvironment
{
  return self->_viewEnvironment;
}

- (PXGTextureManagerPreheatingStrategy)preheatingStrategy
{
  return self->_preheatingStrategy;
}

- (void)_resizeStorageIfNeededForSpriteCount:(int64_t)a3
{
  unint64_t streamInfoBySpriteIndexCapacity;

  streamInfoBySpriteIndexCapacity = self->_streamInfoBySpriteIndexCapacity;
  if (streamInfoBySpriteIndexCapacity < a3)
  {
    if (!streamInfoBySpriteIndexCapacity)
    {
      streamInfoBySpriteIndexCapacity = 10;
      self->_streamInfoBySpriteIndexCapacity = 10;
    }
    if (streamInfoBySpriteIndexCapacity < a3)
    {
      do
        streamInfoBySpriteIndexCapacity *= 2;
      while (streamInfoBySpriteIndexCapacity < a3);
      self->_streamInfoBySpriteIndexCapacity = streamInfoBySpriteIndexCapacity;
    }
    _PXGArrayResize();
  }
}

- (void)_blockOnThumbnailsIfNeededWithGeometries:(id *)a3 visibleRect:(CGRect)a4 interactionState:(id *)a5 fences:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v13;
  int64_t var0;
  _BOOL4 v15;
  _BOOL4 var1;
  _BOOL4 var5;
  _BOOL4 var6;
  id v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t i;
  void *v28;
  double v29;
  int v30;
  char v31;
  double v32;
  double v33;
  char v34;
  _BOOL4 v35;
  NSIndexSet *v36;
  $3AF47EF1DC6FA7925F89D368FE250233 *streamInfoBySpriteIndex;
  uint64_t v38;
  NSIndexSet *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *requestQueue;
  double v45;
  double v46;
  double v47;
  int v48;
  double v49;
  double v50;
  int v51;
  NSObject *v52;
  void (**v53)(_QWORD);
  _BOOL4 v54;
  _BOOL4 v55;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 *v56;
  _BOOL4 v57;
  _BOOL4 v58;
  int v59;
  void *v60;
  id v61;
  _QWORD v62[5];
  char v63;
  _QWORD block[5];
  _QWORD aBlock[4];
  NSIndexSet *v66;
  $3AF47EF1DC6FA7925F89D368FE250233 *v67;
  $16EC8B44B1C22DB88FC318D5A7EDDAB2 *v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  uint64_t v78;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v78 = *MEMORY[0x1E0C80C00];
  v61 = a6;
  if (-[PXGTextureManager isInactive](self, "isInactive"))
    goto LABEL_74;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v13;
  v15 = objc_msgSend(v13, "allowBlockingDuringScrolling")
     && ((var0 = a5->var0, var0 >= objc_msgSend(v13, "blockOnMissingThumbnailsAtSpeedRegime"))
      || a5->var0 < 1
      || a5->var2)
     && !a5->var3
     && a5->var4 - 4 < 0xFFFFFFFFFFFFFFFDLL;
  var1 = a5->var1;
  var5 = a5->var5;
  var6 = a5->var6;
  if (objc_msgSend(v13, "allowBlockingDueToFences"))
  {
    v57 = var5;
    v58 = var1;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v19 = v61;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
    v54 = v15;
    v55 = var6;
    v56 = a3;
    v21 = 0;
    v22 = 0;
    v23 = 0;
    if (v20)
    {
      v24 = *(_QWORD *)v74;
      v25 = 0.0;
      v26 = 0.0;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v74 != v24)
            objc_enumerationMutation(v19);
          v28 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          objc_msgSend(v28, "timeout");
          if (v29 >= v25)
            v25 = v29;
          switch(objc_msgSend(v28, "type"))
          {
            case 0:
              v21 = 1;
              break;
            case 1:
              v21 = 1;
              v26 = 0.0333333333;
              break;
            case 2:
              v22 = 1;
              break;
            case 3:
              v22 = 1;
              v23 = 1;
              break;
            default:
              continue;
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v77, 16);
      }
      while (v20);
    }
    else
    {
      v25 = 0.0;
      v26 = 0.0;
    }

    v31 = v21 & 1;
    v30 = v22 & 1;
    v59 = v23 & 1;
    v13 = v60;
    a3 = v56;
    v15 = v54;
    var6 = v55;
    var5 = v57;
    var1 = v58;
    if (v25 != 0.0)
      goto LABEL_37;
  }
  else
  {
    v59 = 0;
    v30 = 0;
    v31 = 0;
    v26 = 0.0;
  }
  if (a5->var6)
  {
    objc_msgSend(v13, "blockingWhileInitialLoadTimeout");
    goto LABEL_29;
  }
  if (v15)
  {
    if (a5->var2)
      objc_msgSend(v13, "blockingWhileScrubbingTimeout");
    else
      objc_msgSend(v13, "blockingWhileScrollingTimeout");
LABEL_29:
    if (v26 >= v32)
      v33 = v32;
    else
      v33 = v26;
    if (v26 == 0.0)
      v33 = v32;
    if (v32 > 0.0)
      v25 = v33;
    else
      v25 = v26;
    goto LABEL_37;
  }
  v25 = v26;
LABEL_37:
  v34 = var5 || var1 || v15;
  if (var6 || (v34 & 1) != 0 || (v31 & 1) != 0 || (v30 & 1) != 0 || self->_didSwitchTextureConverter)
  {
    v35 = var6;
    v36 = self->_loadedSpriteIndexes;
    streamInfoBySpriteIndex = self->_streamInfoBySpriteIndex;
    v38 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke;
    aBlock[3] = &unk_1E513A300;
    v39 = v36;
    v66 = v39;
    v67 = streamInfoBySpriteIndex;
    v68 = a3;
    v69 = x;
    v70 = y;
    v71 = width;
    v72 = height;
    v40 = _Block_copy(aBlock);
    v41 = v40;
    if (((v35 | v30) & 1) != 0 || (*((unsigned int (**)(void *))v40 + 2))(v40))
    {
      -[PXGTextureManager delegate](self, "delegate");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "textureManagerCanBlockMainThreadIfNeeded:", self);

      if (v43)
      {
        -[NSIndexSet count](v39, "count");
        kdebug_trace();
        requestQueue = self->_requestQueue;
        if (v25 <= 0.0)
        {
          block[0] = v38;
          block[1] = 3221225472;
          block[2] = __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_3;
          block[3] = &unk_1E5149198;
          block[4] = self;
          dispatch_sync(requestQueue, block);
          if (v59)
            dispatch_sync((dispatch_queue_t)self->_adjustQueue, &__block_literal_global_63_230682);
          v52 = self->_requestQueue;
          v62[0] = v38;
          v62[1] = 3221225472;
          v62[2] = __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_6;
          v62[3] = &unk_1E5144398;
          v63 = v30;
          v62[4] = self;
          dispatch_sync(v52, v62);
        }
        else
        {
          px_dispatch_queue_wait();
          v46 = v25 - v45;
          if (v25 - v45 > 0.0)
          {
            px_dispatch_queue_wait();
            v46 = v46 - v47;
          }
          v48 = v59;
          if (v46 <= 0.0)
            v48 = 0;
          if (v48 == 1)
          {
            px_dispatch_queue_wait();
            v46 = v46 - v49;
          }
          if (v46 > 0.0)
          {
            px_dispatch_queue_wait();
            v46 = v46 - v50;
          }
          if (v46 > 0.0)
            v51 = v30;
          else
            v51 = 0;
          if (v51 == 1)
            px_dispatch_queue_wait();
        }
        -[PXGTextureManager _processTextureProviderResults](self, "_processTextureProviderResults");
        v53 = v41;
        if (kdebug_is_enabled())
        {
          v53[2](v53);
          kdebug_trace();
        }

      }
    }

    v13 = v60;
  }

LABEL_74:
}

uint64_t __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  _QWORD v5[5];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v1 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_2;
  v5[3] = &unk_1E513A2D8;
  v2 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v2;
  v8 = *(_OWORD *)(a1 + 72);
  v5[4] = &v9;
  objc_msgSend(v1, "enumerateRangesUsingBlock:", v5);
  v3 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v3;
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyChangeDetails:", *(_QWORD *)(a1 + 32));
}

- (void)_lookupLock_requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 textureProvider:(id)a4 mediaKind:(unsigned __int8)a5 presentationType:(unsigned __int8)a6 isAppearing:(BOOL)a7 layout:(id)a8 leafSpriteIndexRange:(_PXGSpriteIndexRange)a9 sprites:(id *)a10 textureStreamInfos:(id *)a11 loadingStatus:(id)a12
{
  _BOOL4 v13;
  uint64_t v14;
  int v15;
  id v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var3;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var4;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  void *v29;
  NSObject *processQueue;
  id *v31;
  NSObject *v32;
  int v33;
  unint64_t v34;
  int v35;
  char *v36;
  unsigned int *v37;
  char v38;
  _QWORD *v39;
  char *v40;
  uint64_t v41;
  char *v42;
  char *v43;
  id *v44;
  uint64_t v45;
  id v46;
  id v47;
  char *v48;
  double v49;
  double v50;
  id v51;
  float64x2_t v52;
  char *v53;
  char v54;
  id v55;
  id v56;
  float64_t v57;
  float64_t v58;
  uint64_t location;
  id v60;
  uint64_t v61;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v62;
  float *p_lookupLock_requestDetailsByRequestID;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v64;
  float *p_spriteIndexByRequestID;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var2;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  _QWORD v71[5];
  id v72;
  id v73;
  uint64_t v74;
  _QWORD block[5];
  id v76;

  v13 = a7;
  v14 = a6;
  v15 = a5;
  v18 = a4;
  v60 = a8;
  v56 = objc_retainAutorelease(a12);
  v69 = objc_msgSend(v56, "mutableStates");
  var3 = a10->var3;
  var2 = a10->var2;
  var4 = a10->var4;
  -[PXGTextureManager entityManager](self, "entityManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "effectComponent");
  v62 = var3;
  v64 = var4;
  v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v68 = objc_msgSend(v22, "effectIds");

  os_unfair_lock_assert_owner(&self->_lookupLock);
  v23 = 0;
  if (v15 == 2 && v13)
  {
    -[PXGTextureManager _textureConverterForPresentationType:contentType:](self, "_textureConverterForPresentationType:contentType:", v14, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v60, "contentSource");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "desiredPlaceholderStyleInLayout:", v60);
      if (v26 == 1)
      {
        v27 = objc_msgSend(v18, "placeholderImage");
        -[PXGSpriteTextureStore textureForKey:presentationType:](self->_lookupLock_textureCache, "textureForKey:presentationType:", v27, v14);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        if (!v23 && v27)
        {
          if ((_DWORD)v14 == 1)
          {
            LODWORD(v28) = 1.0;
            objc_msgSend(v24, "createTextureFromCGImage:transform:alpha:options:error:", v27, 0, 0, *(double *)off_1E50B83E0, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[PXGSpriteTextureStore storeTexture:forKey:presentationType:](self->_lookupLock_textureCache, "storeTexture:forKey:presentationType:", v29, v27, 1);
            processQueue = self->_processQueue;
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __190__PXGTextureManager__lookupLock_requestTexturesForSpritesInRange_textureProvider_mediaKind_presentationType_isAppearing_layout_leafSpriteIndexRange_sprites_textureStreamInfos_loadingStatus___block_invoke;
            block[3] = &unk_1E5148D08;
            block[4] = self;
            v31 = &v76;
            v23 = v29;
            v76 = v23;
            dispatch_async(processQueue, block);
          }
          else
          {
            v32 = self->_processQueue;
            v71[0] = MEMORY[0x1E0C809B0];
            v71[1] = 3221225472;
            v71[2] = __190__PXGTextureManager__lookupLock_requestTexturesForSpritesInRange_textureProvider_mediaKind_presentationType_isAppearing_layout_leafSpriteIndexRange_sprites_textureStreamInfos_loadingStatus___block_invoke_2;
            v71[3] = &unk_1E5146098;
            v71[4] = self;
            v74 = v27;
            v31 = &v72;
            v72 = v18;
            v73 = v24;
            dispatch_async(v32, v71);

            v23 = 0;
          }

        }
      }
      else if (v26 == 2)
      {
        objc_msgSend(v24, "transparentTexture");
        v23 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }

  }
  v33 = objc_msgSend(v18, "requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:", a9, (char *)var2 + 32 * (a3.location - a9.location), (char *)v62 + 160 * (a3.location - a9.location), (char *)v64 + 40 * (a3.location - a9.location), v60);
  v34 = HIDWORD(*(unint64_t *)&a9);
  if (HIDWORD(*(unint64_t *)&a9))
  {
    v35 = v33;
    v55 = v18;
    v61 = 0;
    p_lookupLock_requestDetailsByRequestID = (float *)&self->_lookupLock_requestDetailsByRequestID;
    p_spriteIndexByRequestID = (float *)&self->_spriteIndexByRequestID;
    location = 0x7FFFFFFFFFFFFFFFLL;
    v67 = v23;
    while (1)
    {
      v70 = v35;
      v36 = (char *)a10->var4 + 40 * a3.location;
      v37 = (unsigned int *)((char *)&a11->var0.var0 + 66 * a3.location);
      *(_BYTE *)(v69 + *v37) = v36[1] != 0;
      *((_DWORD *)std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_spriteIndexByRequestID, v35, &v70)+ 5) = a3.location;
      v38 = *v36;
      LODWORD(v37) = *(_DWORD *)(v68 + 4 * *v37);
      v39 = std::__hash_table<std::__hash_value_type<int,PXGRequestDetails>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PXGRequestDetails>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PXGRequestDetails>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PXGRequestDetails>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_lookupLock_requestDetailsByRequestID, v35, &v70);
      *((_BYTE *)v39 + 20) = v38;
      *(_DWORD *)((char *)v39 + 21) = (_DWORD)v37;
      v40 = (char *)a11 + 66 * a3.location;
      *((_DWORD *)v40 + 1) = v35;
      v40[8] = *v36;
      v40[9] = v36[1];
      v41 = *((_QWORD *)v36 + 1);
      *((_WORD *)v40 + 32) = 0;
      v42 = v40 + 64;
      *(_QWORD *)(v42 - 52) = v41;
      *((_WORD *)v42 - 27) = *((_WORD *)v36 + 16);
      v23 = v67;
      if (!v67)
        goto LABEL_33;
      v43 = (char *)a11 + 66 * a3.location;
      v45 = *(_QWORD *)(v43 + 36);
      v44 = (id *)(v43 + 36);
      if (v45 || *(_QWORD *)(&a11->var10 + 66 * a3.location))
        goto LABEL_33;
      v46 = v67;
      if (*v44)
      {
        v47 = *v44;
        objc_msgSend(v47, "removeSpriteIndex:", a3);

        *v42 = 0;
        v48 = (char *)a11 + 66 * a3.location;
        *(_QWORD *)(v48 + 36) = 0;
        *(_QWORD *)(v48 + 28) = 0;

      }
      objc_msgSend(v46, "pixelSize", v55);
      v57 = v50;
      v58 = v49;
      v51 = v46;
      *v44 = v51;
      v52.f64[0] = v58;
      v52.f64[1] = v57;
      v53 = (char *)a11 + 66 * a3.location;
      *(float32x2_t *)(v53 + 28) = vcvt_f32_f64(v52);
      *((_DWORD *)v53 + 11) = 0;
      if (objc_msgSend(v51, "isDegraded"))
        v54 = 1;
      else
        v54 = 2;
      *v42 = v54;

      if (!v61 || location == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_32;
      if (v61 + location != a3.location)
        break;
      ++v61;
LABEL_33:
      ++v35;
      a3 = (_PXGSpriteIndexRange)(a3.location + 1);
      if (!--v34)
      {
        v18 = v55;
        if (v61)
          objc_msgSend(v67, "addSpriteIndexRange:", location);
        goto LABEL_36;
      }
    }
    objc_msgSend(v51, "addSpriteIndexRange:");
LABEL_32:
    location = a3.location;
    v61 = 1;
    goto LABEL_33;
  }
LABEL_36:

}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (void)textureProvider:(id)a3 didProvideNothingForRequestID:(int)a4
{
  uint64_t v4;
  PXGMutableSpriteTexture *emptyTexture;
  unsigned int v7;
  id v8;

  v4 = *(_QWORD *)&a4;
  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  emptyTexture = self->_emptyTexture;
  do
    v7 = __ldaxr((unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID);
  while (__stlxr(v7 + 1, (unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID));
  -[PXGTextureManager _handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:](self, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", emptyTexture, v8, v4);

}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int8x8_t v11;
  uint8x8_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t **v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  int8x8_t v27;
  uint8x8_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t **v31;
  uint64_t *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  id v42;

  v7 = a4;
  v8 = *(int *)(a2 + 4);
  if ((_DWORD)v8)
  {
    v42 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(a2 + 9));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)(a2 + 4) = 0;
    *(_BYTE *)(a2 + 9) = 0;
    *(_BYTE *)(a2 + 64) = 0;
    v11 = (int8x8_t)a3[1];
    if (v11)
    {
      v12 = (uint8x8_t)vcnt_s8(v11);
      v12.i16[0] = vaddlv_u8(v12);
      if (v12.u32[0] > 1uLL)
      {
        v13 = v8;
        if (*(_QWORD *)&v11 <= v8)
          v13 = v8 % *(_QWORD *)&v11;
      }
      else
      {
        v13 = (*(_QWORD *)&v11 - 1) & v8;
      }
      v14 = *a3;
      v15 = *(uint64_t ***)(*a3 + 8 * v13);
      if (v15)
      {
        v16 = *v15;
        if (*v15)
        {
          v17 = *(_QWORD *)&v11 - 1;
          do
          {
            v18 = v16[1];
            if (v18 == v8)
            {
              if (*((_DWORD *)v16 + 4) == (_DWORD)v8)
              {
                if (v12.u32[0] > 1uLL)
                {
                  v19 = v8;
                  if (*(_QWORD *)&v11 <= v8)
                    v19 = v8 % *(_QWORD *)&v11;
                }
                else
                {
                  v19 = v17 & v8;
                }
                v20 = *(uint64_t **)(v14 + 8 * v19);
                do
                {
                  v21 = v20;
                  v20 = (uint64_t *)*v20;
                }
                while (v20 != v16);
                if (v21 == a3 + 2)
                  goto LABEL_37;
                v22 = v21[1];
                if (v12.u32[0] > 1uLL)
                {
                  if (v22 >= *(_QWORD *)&v11)
                    v22 %= *(_QWORD *)&v11;
                }
                else
                {
                  v22 &= v17;
                }
                if (v22 != v19)
                {
LABEL_37:
                  if (!*v16)
                    goto LABEL_38;
                  v23 = *(_QWORD *)(*v16 + 8);
                  if (v12.u32[0] > 1uLL)
                  {
                    if (v23 >= *(_QWORD *)&v11)
                      v23 %= *(_QWORD *)&v11;
                  }
                  else
                  {
                    v23 &= v17;
                  }
                  if (v23 != v19)
LABEL_38:
                    *(_QWORD *)(v14 + 8 * v19) = 0;
                }
                v24 = *v16;
                if (*v16)
                {
                  v25 = *(_QWORD *)(v24 + 8);
                  if (v12.u32[0] > 1uLL)
                  {
                    if (v25 >= *(_QWORD *)&v11)
                      v25 %= *(_QWORD *)&v11;
                  }
                  else
                  {
                    v25 &= v17;
                  }
                  if (v25 != v19)
                  {
                    *(_QWORD *)(*a3 + 8 * v25) = v21;
                    v24 = *v16;
                  }
                }
                *v21 = v24;
                *v16 = 0;
                --a3[3];
                operator delete(v16);
                break;
              }
            }
            else
            {
              if (v12.u32[0] > 1uLL)
              {
                if (v18 >= *(_QWORD *)&v11)
                  v18 %= *(_QWORD *)&v11;
              }
              else
              {
                v18 &= v17;
              }
              if (v18 != v13)
                break;
            }
            v16 = (uint64_t *)*v16;
          }
          while (v16);
        }
      }
    }
    v26 = *(uint64_t **)(a1 + 48);
    v27 = (int8x8_t)v26[1];
    if (v27)
    {
      v28 = (uint8x8_t)vcnt_s8(v27);
      v28.i16[0] = vaddlv_u8(v28);
      if (v28.u32[0] > 1uLL)
      {
        v29 = v8;
        if (*(_QWORD *)&v27 <= v8)
          v29 = v8 % *(_QWORD *)&v27;
      }
      else
      {
        v29 = (*(_QWORD *)&v27 - 1) & v8;
      }
      v30 = *v26;
      v31 = *(uint64_t ***)(*v26 + 8 * v29);
      if (v31)
      {
        v32 = *v31;
        if (*v31)
        {
          v33 = *(_QWORD *)&v27 - 1;
          do
          {
            v34 = v32[1];
            if (v34 == v8)
            {
              if (*((_DWORD *)v32 + 4) == (_DWORD)v8)
              {
                if (v28.u32[0] > 1uLL)
                {
                  v35 = v8;
                  if (*(_QWORD *)&v27 <= v8)
                    v35 = v8 % *(_QWORD *)&v27;
                }
                else
                {
                  v35 = v33 & v8;
                }
                v36 = *(uint64_t **)(v30 + 8 * v35);
                do
                {
                  v37 = v36;
                  v36 = (uint64_t *)*v36;
                }
                while (v36 != v32);
                if (v37 == v26 + 2)
                  goto LABEL_82;
                v38 = v37[1];
                if (v28.u32[0] > 1uLL)
                {
                  if (v38 >= *(_QWORD *)&v27)
                    v38 %= *(_QWORD *)&v27;
                }
                else
                {
                  v38 &= v33;
                }
                if (v38 != v35)
                {
LABEL_82:
                  if (!*v32)
                    goto LABEL_83;
                  v39 = *(_QWORD *)(*v32 + 8);
                  if (v28.u32[0] > 1uLL)
                  {
                    if (v39 >= *(_QWORD *)&v27)
                      v39 %= *(_QWORD *)&v27;
                  }
                  else
                  {
                    v39 &= v33;
                  }
                  if (v39 != v35)
LABEL_83:
                    *(_QWORD *)(v30 + 8 * v35) = 0;
                }
                v40 = *v32;
                if (*v32)
                {
                  v41 = *(_QWORD *)(v40 + 8);
                  if (v28.u32[0] > 1uLL)
                  {
                    if (v41 >= *(_QWORD *)&v27)
                      v41 %= *(_QWORD *)&v27;
                  }
                  else
                  {
                    v41 &= v33;
                  }
                  if (v41 != v35)
                  {
                    *(_QWORD *)(*v26 + 8 * v41) = v37;
                    v40 = *v32;
                  }
                }
                *v37 = v40;
                *v32 = 0;
                --v26[3];
                operator delete(v32);
                break;
              }
            }
            else
            {
              if (v28.u32[0] > 1uLL)
              {
                if (v34 >= *(_QWORD *)&v27)
                  v34 %= *(_QWORD *)&v27;
              }
              else
              {
                v34 &= v33;
              }
              if (v34 != v29)
                break;
            }
            v32 = (uint64_t *)*v32;
          }
          while (v32);
        }
      }
    }
    objc_msgSend(v10, "cancelTextureRequestDeferred:", v8);

    v7 = v42;
  }

}

uint64_t __51__PXGTextureManager__processTextureProviderResults__block_invoke_3(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  unsigned int *v12;
  id v13;
  void *v14;
  id *v15;
  id v16;
  uint64_t v17;
  double v18;
  double v19;
  id v20;
  float64x2_t v21;
  char v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  _QWORD *v28;
  float32x2_t v29;
  float32x2_t v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  uint64_t v39;
  float64_t v40;
  float64_t v41;
  uint64_t v42;
  int v43;

  v43 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if (std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::find<int>((_QWORD *)(v6 + 160), a2))
  {
    v7 = *((unsigned int *)std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((float *)(v6 + 160), a2, &v43)+ 5);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(v6 + 208);
    v9 = v8 + 66 * v7;
    v11 = *(_DWORD *)(v9 + 44);
    v10 = (unsigned int *)(v9 + 44);
    if (v11 < a3)
    {
      v12 = (unsigned int *)(v8 + 66 * v7);
      v13 = *(id *)(a1 + 40);
      v15 = (id *)(v12 + 9);
      v14 = *(void **)(v12 + 9);
      if (v14)
      {
        v16 = v14;
        objc_msgSend(v16, "removeSpriteIndex:", v7);

        v17 = v8 + 66 * v7;
        *(_BYTE *)(v17 + 64) = 0;
        *(_QWORD *)(v17 + 36) = 0;
        *(_QWORD *)(v17 + 28) = 0;

      }
      objc_msgSend(v13, "pixelSize");
      v40 = v19;
      v41 = v18;
      v20 = v13;
      v21.f64[0] = v41;
      v21.f64[1] = v40;
      *v15 = v20;
      *(float32x2_t *)(v8 + 66 * v7 + 28) = vcvt_f32_f64(v21);
      *v10 = a3;
      if (objc_msgSend(v20, "isDegraded"))
        v22 = 1;
      else
        v22 = 2;
      v23 = v8 + 66 * v7;
      *(_BYTE *)(v23 + 64) = v22;
      v24 = (_BYTE *)(v23 + 64);

      v25 = *(_QWORD *)(a1 + 56);
      if (*v24 == 3)
      {
        LOBYTE(v26) = 4;
LABEL_33:
        *(_BYTE *)(v25 + *v12) = v26;
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v6 = *(_QWORD *)(a1 + 32);
        goto LABEL_34;
      }
      v27 = v8 + 66 * v7;
      v29 = *(float32x2_t *)(v27 + 20);
      v28 = (_QWORD *)(v27 + 20);
      v30 = v29;
      v31 = *((unsigned __int8 *)v28 - 11);
      if (v31 > 0xD)
      {
LABEL_32:
        LOBYTE(v26) = 3;
        goto LABEL_33;
      }
      v32 = 1 << v31;
      v42 = *(_QWORD *)(a1 + 56);
      if ((v32 & 0x35D8) != 0)
      {
        v39 = *(v28 - 1);
        if (!PXFloatApproximatelyEqualToFloat() || (PXFloatApproximatelyEqualToFloat() & 1) == 0)
          goto LABEL_22;
      }
      else if ((v32 & 0x807) != 0)
      {
        v30 = (float32x2_t)vcge_f32(v30, (float32x2_t)*(v28 - 1));
        if ((v30.i32[0] & v30.i32[1] & 1) == 0)
          goto LABEL_22;
      }
      else if (v30.f32[0] <= 0.0 || (v30.i32[0] = v30.i32[1], v30.f32[1] <= 0.0))
      {
LABEL_22:
        if (*v10 && *v15)
        {
          v33 = *v24;
          v25 = v42;
          if (v33 >= 2)
          {
            if (v33 != 2)
            {
              if (v33 == 3)
              {
                objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(double *)&v30);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PXGUpdateLoadingStatusForStreamInfo(PXGSpriteIndex, const PXGStreamInfo *, PXGLoadingState *)");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "handleFailureInFunction:file:lineNumber:description:", v38, CFSTR("PXGTextureManager.mm"), 201, CFSTR("Should be handled earlier"));

                abort();
              }
              LOBYTE(v26) = 0;
              goto LABEL_33;
            }
            goto LABEL_32;
          }
        }
        else
        {
          v25 = v42;
          if (COERCE_FLOAT(*v28) <= 0.0)
          {
            v26 = *(_DWORD *)(v8 + 66 * v7 + 4);
            if (v26)
              LOBYTE(v26) = *((_BYTE *)v28 - 11) != 0;
            goto LABEL_33;
          }
        }
        LOBYTE(v26) = 2;
        goto LABEL_33;
      }
      LOBYTE(v26) = 3;
      v25 = v42;
      goto LABEL_33;
    }
  }
  v7 = 0xFFFFFFFFLL;
LABEL_34:
  v34 = *(void **)(v6 + 112);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2, v39);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "removeObjectForKey:", v35);

  return v7;
}

- (void)_handleProvidedSpriteTexture:(id)a3 fromTextureProvider:(id)a4 requestID:(int)a5 deliveryOrder:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  PXGTextureManager *v21;
  id v22;
  _QWORD v23[4];

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v23[3] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if ((objc_msgSend(v11, "isRequestActive:", v7) & 1) != 0)
  {
    objc_msgSend(v10, "addSpriteWithTextureRequestID:deliveryOrder:", v7, v6);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    v23[2] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXGTextureManager layoutQueue](self, "layoutQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = v15 == (void *)MEMORY[0x1E0C80D38];

    if ((_DWORD)v12)
    {
      -[PXGTextureManager performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__addTextureToTexturesInUse_, v14, 0);
    }
    else
    {
      -[PXGTextureManager layoutQueue](self, "layoutQueue");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C809B0];
      v18 = 3221225472;
      v19 = __94__PXGTextureManager__handleProvidedSpriteTexture_fromTextureProvider_requestID_deliveryOrder___block_invoke;
      v20 = &unk_1E5148D08;
      v21 = self;
      v22 = v14;
      dispatch_async(v16, &v17);

    }
    -[PXGTextureManager _requestQueue_setNeedsUpdate](self, "_requestQueue_setNeedsUpdate", v17, v18, v19, v20, v21);

  }
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)_requestQueue_scheduleUpdateIfAllowed
{
  unsigned __int8 *p_isPerformingUpdateFromRequestQueue;
  int v4;
  NSObject *v5;
  _QWORD block[5];

  p_isPerformingUpdateFromRequestQueue = &self->_isPerformingUpdateFromRequestQueue;
  do
    v4 = __ldaxr(p_isPerformingUpdateFromRequestQueue);
  while (__stlxr(v4 | 1, p_isPerformingUpdateFromRequestQueue));
  if (!v4)
  {
    self->_requestQueue_pendingSetNeedsUpdate = 0;
    -[PXGTextureManager layoutQueue](self, "layoutQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__PXGTextureManager__requestQueue_scheduleUpdateIfAllowed__block_invoke;
    block[3] = &unk_1E5149198;
    block[4] = self;
    dispatch_async(v5, block);

  }
}

- (void)_requestQueue_setNeedsUpdate
{
  ++self->_requestQueue_pendingSetNeedsUpdate;
  -[PXGTextureManager _requestQueue_scheduleUpdateIfAllowed](self, "_requestQueue_scheduleUpdateIfAllowed");
}

- (void)_setNeedsUpdate
{
  NSObject *v3;
  id v4;

  -[PXGTextureManager layoutQueue](self, "layoutQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PXGTextureManager delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textureManagerNeedsUpdate:", self);

}

- (PXGTextureManagerDelegate)delegate
{
  return (PXGTextureManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

uint64_t __58__PXGTextureManager__requestQueue_scheduleUpdateIfAllowed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdate");
}

- (NSDictionary)texturesByPresentationType
{
  return self->_texturesByPresentationType;
}

- (void)streamTexturesForSpritesInDataStore:(id)a3 presentationDataStore:(id)a4 changeDetails:(id)a5 layout:(id)a6 interactionState:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  __int128 v21;
  CGSize size;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  CGPoint origin;
  CGSize v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  -[PXGTextureManager entityManager](self, "entityManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "loadingStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __117__PXGTextureManager_streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState___block_invoke;
  v24[3] = &unk_1E513A0F8;
  v24[4] = self;
  v23 = v12;
  v25 = v23;
  v18 = v13;
  v26 = v18;
  v19 = v14;
  v27 = v19;
  v20 = v15;
  v28 = v20;
  v21 = *(_OWORD *)&a7->var4;
  v29 = *(_OWORD *)&a7->var0;
  v30 = v21;
  size = a7->var8.size;
  origin = a7->var8.origin;
  v32 = size;
  objc_msgSend(v17, "performChanges:", v24);

}

- (int64_t)_processTextureProviderResults
{
  NSObject *v3;
  void *v4;
  void *v5;
  int64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  -[PXGTextureManager layoutQueue](self, "layoutQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[PXGTextureManager entityManager](self, "entityManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loadingStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__PXGTextureManager__processTextureProviderResults__block_invoke;
  v8[3] = &unk_1E513A400;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v5, "performChanges:", v8);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __51__PXGTextureManager__processTextureProviderResults__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[8];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _QWORD v17[4];
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_retainAutorelease(a2);
  v4 = objc_msgSend(v3, "mutableStates");
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __51__PXGTextureManager__processTextureProviderResults__block_invoke_2;
  v17[3] = &unk_1E513A3B0;
  v19 = v4;
  v18 = *(_OWORD *)(a1 + 32);
  objc_msgSend((id)v18, "_enumerateSpriteTextures:", v17);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "textureAtlasManagers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v12[0] = v5;
        v12[1] = 3221225472;
        v12[2] = __51__PXGTextureManager__processTextureProviderResults__block_invoke_4;
        v12[3] = &unk_1E513A3D8;
        v11 = *(_QWORD *)(a1 + 40);
        v12[4] = *(_QWORD *)(a1 + 32);
        v12[5] = v10;
        v12[6] = v11;
        v12[7] = v4;
        objc_msgSend(v10, "processPendingThumbnailRequestIDsWithHandler:", v12);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    }
    while (v7);
  }

}

uint64_t __117__PXGTextureManager_streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[4];

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_OWORD *)(a1 + 88);
  v10[0] = *(_OWORD *)(a1 + 72);
  v10[1] = v7;
  v8 = *(_OWORD *)(a1 + 120);
  v10[2] = *(_OWORD *)(a1 + 104);
  v10[3] = v8;
  return objc_msgSend(v3, "_streamTexturesForSpritesInDataStore:presentationDataStore:changeDetails:layout:interactionState:loadingStatus:", v2, v4, v5, v6, v10, a2);
}

_QWORD *__132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[30])
    return (_QWORD *)objc_msgSend(result, "_requestQueue_scheduleUpdateIfAllowed");
  return result;
}

void __147__PXGTextureManager__processCGImage_options_adjustment_isDegraded_fromTextureProvider_withTextureConverter_requestID_requestDetails_deliveryOrder___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));

}

void __190__PXGTextureManager__lookupLock_requestTexturesForSpritesInRange_textureProvider_mediaKind_presentationType_isAppearing_layout_leafSpriteIndexRange_sprites_textureStreamInfos_loadingStatus___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  void *v3;
  _OWORD v4[2];

  v2 = *((_OWORD *)off_1E50B83F8 + 1);
  v4[0] = *(_OWORD *)off_1E50B83F8;
  v4[1] = v2;
  objc_msgSend(*(id *)(a1 + 32), "_createTextureForCGImage:requestID:requestDetails:processingOptions:fromTextureProvider:withTextureConverter:", *(_QWORD *)(a1 + 56), 0, 0, v4, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "addObject:", v3);

}

void __98__PXGTextureManager_textureProvider_didProvideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_OWORD *)(a1 + 48);
  v7[0] = *(_OWORD *)(a1 + 32);
  v7[1] = v4;
  LODWORD(v6) = *(_DWORD *)(a1 + 108);
  LODWORD(v5) = *(_DWORD *)(a1 + 104);
  objc_msgSend(WeakRetained, "_processCGImage:options:adjustment:isDegraded:fromTextureProvider:withTextureConverter:requestID:requestDetails:deliveryOrder:", v3, v7, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 112), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v5, *(unsigned int *)(a1 + 113) | ((unint64_t)*(unsigned __int8 *)(a1 + 117) << 32), v6);

  CGImageRelease(*(CGImageRef *)(a1 + 96));
}

- (void)_processCGImage:(CGImage *)a3 options:(id)a4 adjustment:(id)a5 isDegraded:(BOOL)a6 fromTextureProvider:(id)a7 withTextureConverter:(id)a8 requestID:(int)a9 requestDetails:(id)a10 deliveryOrder:(unsigned int)a11
{
  _BOOL8 v12;
  _OWORD *v14;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  void *v21;
  NSObject *adjustQueue;
  id *v23;
  __int128 v24;
  void *v25;
  NSObject *requestQueue;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  int v31;
  int v32;
  _QWORD block[4];
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  int v41;
  int v42;
  int v43;
  char v44;
  id location;
  _OWORD v46[3];
  char v47;

  v12 = a6;
  v14 = *(_OWORD **)&a4.var0;
  v17 = *(id *)&a4.var2;
  v18 = (id)v12;
  v19 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  if ((objc_msgSend(v18, "isRequestActive:", a8) & 1) != 0)
  {
    v20 = v14[1];
    v46[0] = *v14;
    v46[1] = v20;
    -[PXGTextureManager _createTextureForCGImage:requestID:requestDetails:processingOptions:fromTextureProvider:withTextureConverter:](self, "_createTextureForCGImage:requestID:requestDetails:processingOptions:fromTextureProvider:withTextureConverter:", a3, a8, *(_QWORD *)&a9 & 0xFFFFFFFFFFLL, v46, v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIsDegraded:", a5);
    if (v21)
    {
      if (v17 || *((_BYTE *)v14 + 16))
      {
        objc_initWeak(&location, self);
        adjustQueue = self->_adjustQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __147__PXGTextureManager__processCGImage_options_adjustment_isDegraded_fromTextureProvider_withTextureConverter_requestID_requestDetails_deliveryOrder___block_invoke;
        block[3] = &unk_1E513A4F0;
        v23 = &v40;
        objc_copyWeak(&v40, &location);
        v36 = v17;
        v24 = v14[1];
        v34 = *v14;
        v35 = v24;
        v37 = v21;
        v38 = v18;
        v39 = v19;
        v41 = (int)a8;
        v42 = *(_DWORD *)&a10.var0;
        v44 = v47;
        v43 = a9;
        dispatch_async(adjustQueue, block);

        v25 = v36;
      }
      else
      {
        objc_initWeak(&location, self);
        requestQueue = self->_requestQueue;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __147__PXGTextureManager__processCGImage_options_adjustment_isDegraded_fromTextureProvider_withTextureConverter_requestID_requestDetails_deliveryOrder___block_invoke_2;
        v27[3] = &unk_1E513A518;
        v23 = &v30;
        objc_copyWeak(&v30, &location);
        v28 = v21;
        v29 = v18;
        v31 = (int)a8;
        v32 = *(_DWORD *)&a10.var0;
        dispatch_async(requestQueue, v27);

        v25 = v28;
      }

      objc_destroyWeak(v23);
      objc_destroyWeak(&location);
    }

  }
}

- (void)textureProvider:(id)a3 didProvidePayload:(id)a4 forRequestID:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _BYTE v16[5];

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "requestThumbnailsOnly");

  if ((v11 & 1) == 0
    && objc_msgSend(v8, "isRequestActive:", v5)
    && -[PXGTextureManager _getRequestDetails:forRequestID:](self, "_getRequestDetails:forRequestID:", v16, v5))
  {
    do
      v12 = __ldaxr((unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID);
    while (__stlxr(v12 + 1, (unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID));
    -[PXGTextureManager _existingTextureForPayload:presentationType:](self, "_existingTextureForPayload:presentationType:", v9, v16[0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[PXGTextureManager _handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:](self, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", v13, v8, v5, v12);
    }
    else
    {
      -[PXGTextureManager _textureConverterForPresentationType:contentType:](self, "_textureConverterForPresentationType:contentType:", v16[0], 4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createPayloadTextureFromPayload:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[PXGTextureManager _storeTexture:forPayload:](self, "_storeTexture:forPayload:", v15, v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGTextureManager _handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:](self, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", v13, v8, v5, v12);
      }
      else
      {
        v13 = 0;
      }

    }
  }

}

- (void)textureProvider:(id)a3 didProvideCGImage:(CGImage *)a4 options:(id)a5 adjustment:(id)a6 isDegraded:(BOOL)a7 forRequestID:(int)a8
{
  _BOOL8 v8;
  char v9;
  void *v10;
  _OWORD *v11;
  id v14;
  id v15;
  void *v16;
  char v17;
  uint64_t v18;
  __int128 v19;
  void *v20;
  int v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *processQueue;
  __int128 v26;
  id v27;
  void *v28;
  NSObject *adjustQueue;
  __int128 v30;
  id v31;
  void *v32;
  _QWORD block[4];
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  id v38;
  id v39[2];
  _BOOL4 v40;
  int v41;
  char v42;
  int v43;
  char v44;
  _QWORD v45[4];
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  _BOOL4 v53;
  int v54;
  int v55;
  char v56;
  _OWORD v57[2];
  int v58;
  char v59;
  uint8_t buf[4];
  id v61;
  __int16 v62;
  _BOOL4 v63;
  __int16 v64;
  uint64_t v65;
  uint64_t v66;

  v8 = a7;
  v9 = (char)a6;
  v10 = *(void **)&a5.var2;
  v11 = *(_OWORD **)&a5.var0;
  v66 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = v10;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "requestThumbnailsOnly");

  if ((v17 & 1) == 0
    && objc_msgSend(v14, "isRequestActive:", v8)
    && -[PXGTextureManager _getRequestDetails:forRequestID:](self, "_getRequestDetails:forRequestID:", &v58, v8))
  {
    do
      v18 = __ldaxr((unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID);
    while (__stlxr(v18 + 1, (unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID));
    if (a4)
    {
      v19 = v11[1];
      v57[0] = *v11;
      v57[1] = v19;
      -[PXGTextureManager _existingTextureForCGImage:processingOptions:presentationType:](self, "_existingTextureForCGImage:processingOptions:presentationType:", a4, v57, v58);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v20;
      if (v20)
      {
        v21 = *((unsigned __int8 *)v11 + 16);
        if (!v15)
        {
          if (!*((_BYTE *)v11 + 16))
          {
            -[PXGTextureManager _handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:](self, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", v20, v14, v8, v18);
            goto LABEL_19;
          }
          v21 = 1;
        }
        -[PXGTextureManager _existingAdjustedTextureForSourceTexture:adjustment:wantsMipmaps:presentationType:](self, "_existingAdjustedTextureForSourceTexture:adjustment:wantsMipmaps:presentationType:", v20, v15, v21 != 0, v58);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          -[PXGTextureManager _handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:](self, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", v22, v14, v8, v18);
        }
        else
        {
          -[PXGTextureManager _textureConverterForPresentationType:contentType:](self, "_textureConverterForPresentationType:contentType:", v58, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak((id *)buf, self);
          adjustQueue = self->_adjustQueue;
          v45[0] = MEMORY[0x1E0C809B0];
          v45[1] = 3221225472;
          v45[2] = __98__PXGTextureManager_textureProvider_didProvideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke;
          v45[3] = &unk_1E513A4F0;
          objc_copyWeak(&v52, (id *)buf);
          v48 = v15;
          v30 = v11[1];
          v46 = *v11;
          v47 = v30;
          v49 = v20;
          v50 = v14;
          v51 = v28;
          v53 = v8;
          v54 = v18;
          v55 = v58;
          v56 = v59;
          v31 = v28;
          dispatch_async(adjustQueue, v45);

          objc_destroyWeak(&v52);
          objc_destroyWeak((id *)buf);
        }

      }
      else
      {
        -[PXGTextureManager _textureConverterForPresentationType:contentType:](self, "_textureConverterForPresentationType:contentType:", v58, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        CGImageRetain(a4);
        objc_initWeak((id *)buf, self);
        processQueue = self->_processQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __98__PXGTextureManager_textureProvider_didProvideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke_2;
        block[3] = &unk_1E513A568;
        objc_copyWeak(v39, (id *)buf);
        v39[1] = a4;
        v26 = v11[1];
        v34 = *v11;
        v35 = v26;
        v36 = v15;
        v42 = v9;
        v37 = v14;
        v38 = v24;
        v43 = v58;
        v44 = v59;
        v40 = v8;
        v41 = v18;
        v27 = v24;
        dispatch_async(processQueue, block);

        objc_destroyWeak(v39);
        objc_destroyWeak((id *)buf);
      }
      v20 = v32;
LABEL_19:

      goto LABEL_20;
    }
    PXGTungstenGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v61 = v14;
      v62 = 1024;
      v63 = v8;
      v64 = 2112;
      v65 = 0;
      _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_ERROR, "Error textureProvider:%@ requestID:%d provided invalid cgImage:%@", buf, 0x1Cu);
    }

    -[PXGTextureManager _handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:](self, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", self->_emptyTexture, v14, v8, v18);
  }
LABEL_20:

}

- (id)_textureConverterForPresentationType:(unsigned __int8)a3 contentType:(unint64_t)a4
{
  int v5;
  NSDictionary *textureConverterByPresentationType;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  unint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  textureConverterByPresentationType = self->_textureConverterByPresentationType;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](textureConverterByPresentationType, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PXGTextureManager textureConverters](self, "textureConverters", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v18;
LABEL_4:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if ((a4 & ~objc_msgSend(v14, "supportedContentTypes")) == 0)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      v9 = v14;

      if (v9)
        return v9;
    }
    else
    {
LABEL_10:

    }
    PXGTungstenGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v22 = v5;
      v23 = 2048;
      v24 = a4;
      _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Missing textureConverter for presentationType:%d contentType:%lu", buf, 0x12u);
    }

    v9 = 0;
  }
  return v9;
}

- (BOOL)_getRequestDetails:(id *)a3 forRequestID:(int)a4
{
  os_unfair_lock_s *p_lookupLock;
  unint64_t value;
  float *p_lookupLock_requestDetailsByRequestID;
  uint8x8_t v10;
  unint64_t v11;
  uint64_t **v12;
  uint64_t *v13;
  unint64_t v14;
  _QWORD *v16;
  char v17;
  BOOL v18;
  int v19;

  v19 = a4;
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_assert_not_owner(&self->_lookupLock);
  os_unfair_lock_lock(p_lookupLock);
  value = self->_lookupLock_requestDetailsByRequestID.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (!value)
    goto LABEL_17;
  p_lookupLock_requestDetailsByRequestID = (float *)&self->_lookupLock_requestDetailsByRequestID;
  v10 = (uint8x8_t)vcnt_s8((int8x8_t)value);
  v10.i16[0] = vaddlv_u8(v10);
  if (v10.u32[0] > 1uLL)
  {
    v11 = a4;
    if (value <= a4)
      v11 = a4 % value;
  }
  else
  {
    v11 = (value - 1) & a4;
  }
  v12 = *(uint64_t ***)(*(_QWORD *)p_lookupLock_requestDetailsByRequestID + 8 * v11);
  if (!v12 || (v13 = *v12) == 0)
  {
LABEL_17:
    v18 = 0;
    goto LABEL_18;
  }
  while (1)
  {
    v14 = v13[1];
    if (v14 == a4)
      break;
    if (v10.u32[0] > 1uLL)
    {
      if (v14 >= value)
        v14 %= value;
    }
    else
    {
      v14 &= value - 1;
    }
    if (v14 != v11)
      goto LABEL_17;
LABEL_16:
    v13 = (uint64_t *)*v13;
    if (!v13)
      goto LABEL_17;
  }
  if (*((_DWORD *)v13 + 4) != a4)
    goto LABEL_16;
  v16 = std::__hash_table<std::__hash_value_type<int,PXGRequestDetails>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PXGRequestDetails>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PXGRequestDetails>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PXGRequestDetails>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(p_lookupLock_requestDetailsByRequestID, a4, &v19);
  v17 = *((_BYTE *)v16 + 24);
  *(_DWORD *)&a3->var0 = *((_DWORD *)v16 + 5);
  LOBYTE(a3->var1) = v17;
  v18 = 1;
LABEL_18:
  os_unfair_lock_unlock(p_lookupLock);
  return v18;
}

- (id)_createTextureForCGImage:(CGImage *)a3 requestID:(int)a4 requestDetails:(id)a5 processingOptions:(id)a6 fromTextureProvider:(id)a7 withTextureConverter:(id)a8
{
  __int128 *v9;
  id v14;
  id v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  double v19;
  void *v20;
  id v21;
  NSObject *requestQueue;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  int v28;
  id location;
  id v30;
  _OWORD v31[2];

  v9 = *(__int128 **)&a6.var0;
  v14 = *(id *)&a6.var2;
  v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  v16 = v9[1];
  v31[0] = *v9;
  v31[1] = v16;
  -[PXGTextureManager _existingTextureForCGImage:processingOptions:presentationType:](self, "_existingTextureForCGImage:processingOptions:presentationType:", a3, v31, objc_msgSend(v15, "presentationType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    CGImageGetWidth(a3);
    CGImageGetHeight(a3);
    kdebug_trace();
    v18 = *v9;
    LODWORD(v19) = *((_DWORD *)v9 + 5);
    v30 = 0;
    objc_msgSend(v15, "createTextureFromCGImage:transform:alpha:options:error:", a3, (*(unint64_t *)&a5 >> 8), &v30, *(double *)&v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v30;
    objc_msgSend(v20, "pixelSize");
    kdebug_trace();
    if (v20)
    {
      objc_msgSend(v20, "setSourceCGImage:", a3);
      -[PXGTextureManager _storeTexture:forKey:replaceExisting:](self, "_storeTexture:forKey:replaceExisting:", v20, a3, *((unsigned __int8 *)v9 + 24));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_initWeak(&location, self);
      requestQueue = self->_requestQueue;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __130__PXGTextureManager__createTextureForCGImage_requestID_requestDetails_processingOptions_fromTextureProvider_withTextureConverter___block_invoke;
      v24[3] = &unk_1E513A540;
      objc_copyWeak(&v27, &location);
      v25 = v14;
      v26 = v21;
      v28 = a4;
      dispatch_async(requestQueue, v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
      v17 = 0;
    }

  }
  return v17;
}

- (id)_existingTextureForCGImage:(CGImage *)a3 processingOptions:(id)a4 presentationType:(unsigned __int8)a5
{
  float32x4_t *v5;
  void *v8;
  uint16x4_t v9;
  float v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  void *v14;
  uint64_t v15;

  v5 = *(float32x4_t **)&a4.var0;
  -[PXGTextureManager _existingTextureForKey:presentationType:](self, "_existingTextureForKey:presentationType:", a3, *(_QWORD *)&a4.var2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alpha");
  v9.i32[0] = v5[1].i32[1];
  if (v10 != *(float *)v9.i32)
  {
    v11 = *v5;
LABEL_5:
    v14 = (void *)objc_msgSend(v8, "copyWithOrientationTransform:alpha:", *(double *)v11.i64, *(double *)&v9);
    -[PXGTextureManager _storeTexture:forKey:replaceExisting:](self, "_storeTexture:forKey:replaceExisting:", v14, a3, v5[1].u8[8]);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v15;
    return v8;
  }
  objc_msgSend(v8, "orientationTransform");
  v13 = v12;
  v11 = *v5;
  v9 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(v13, *v5)), 0xFuLL));
  if ((vminv_u16(v9) & 1) == 0)
  {
    v9.i32[0] = v5[1].i32[1];
    goto LABEL_5;
  }
  return v8;
}

- (id)_storeTexture:(id)a3 forKey:(id)a4 replaceExisting:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  os_unfair_lock_assert_not_owner(&self->_lookupLock);
  os_unfair_lock_lock(&self->_lookupLock);
  -[PXGSpriteTextureStore storedTextureForTexture:key:presentationType:policy:](self->_lookupLock_textureCache, "storedTextureForTexture:key:presentationType:policy:", v8, v9, objc_msgSend(v8, "presentationType"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lookupLock);

  return v10;
}

- (id)_existingTextureForKey:(id)a3 presentationType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  os_unfair_lock_assert_not_owner(&self->_lookupLock);
  os_unfair_lock_lock(&self->_lookupLock);
  -[PXGSpriteTextureStore textureForKey:presentationType:](self->_lookupLock_textureCache, "textureForKey:presentationType:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lookupLock);

  return v7;
}

- (id)_storeTexture:(id)a3 forPayload:(id)a4
{
  -[PXGTextureManager _storeTexture:forKey:](self, "_storeTexture:forKey:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_storeTexture:(id)a3 forKey:(id)a4
{
  -[PXGTextureManager _storeTexture:forKey:replaceExisting:](self, "_storeTexture:forKey:replaceExisting:", a3, a4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_existingTextureForPayload:(id)a3 presentationType:(unsigned __int8)a4
{
  -[PXGTextureManager _existingTextureForKey:presentationType:](self, "_existingTextureForKey:presentationType:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_pruneTextures:(id)a3
{
  id v4;
  NSObject *deallocationsQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  deallocationsQueue = self->_deallocationsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__PXGTextureManager__pruneTextures___block_invoke;
  block[3] = &unk_1E5149198;
  v8 = v4;
  v6 = v4;
  dispatch_async(deallocationsQueue, block);

}

- (void)textureProvider:(id)a3 didProvideImageData:(id)a4 withSpecAtIndex:(int64_t)a5 size:(CGSize)a6 bytesPerRow:(unint64_t)a7 contentsRect:(CGRect)a8 forRequestID:(int)a9
{
  uint64_t v9;
  double height;
  double width;
  double y;
  double x;
  double v15;
  double v16;
  id v20;
  id v21;
  void *v22;
  __int128 v23;
  int v24;
  __int128 v25;
  int v26;

  v9 = *(_QWORD *)&a9;
  height = a8.size.height;
  width = a8.size.width;
  y = a8.origin.y;
  x = a8.origin.x;
  v15 = a6.height;
  v16 = a6.width;
  v20 = a3;
  v21 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if ((objc_msgSend(v20, "isRequestActive:", v9) & 1) != 0)
  {
    objc_msgSend(v20, "textureAtlasManagerAtSpecIndex:", a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v25 = 0uLL;
      v26 = 0;
      if (v20)
        objc_msgSend(v20, "imageDataSpecAtIndex:", a5);
      v23 = v25;
      v24 = v26;
      -[PXGTextureManager _textureAtlasManagerForImageDataSpec:](self, "_textureAtlasManagerForImageDataSpec:", &v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setTextureAtlasManager:atSpecIndex:", v22, a5);
    }
    objc_msgSend(v22, "addSpriteWithTextureRequestID:thumbnailData:size:bytesPerRow:contentsRect:", v9, v21, a7, v16, v15, x, y, width, height);
    -[PXGTextureManager _requestQueue_setNeedsUpdate](self, "_requestQueue_setNeedsUpdate");

  }
}

- (id)_textureAtlasManagerForImageDataSpec:(id *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  double v11;
  unint64_t v12;
  double v13;
  id atlasTextureConverter;
  void *v15;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  -[PXGTextureManager textureAtlasManagers](self, "textureAtlasManagers");
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
      objc_msgSend(v9, "thumbnailSize");
      LOWORD(v10) = a3->var2;
      if (v11 == (double)v10)
      {
        objc_msgSend(v9, "thumbnailSize");
        LOWORD(v12) = a3->var3;
        if (v13 == (double)v12 && objc_msgSend(v9, "pixelFormat") == a3->var0)
          break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    atlasTextureConverter = v9;

    if (atlasTextureConverter)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
  atlasTextureConverter = self->_atlasTextureConverter;
  if (atlasTextureConverter)
  {
    v17 = *(_OWORD *)&a3->var0;
    LODWORD(v18) = *(_DWORD *)&a3->var2;
    objc_msgSend(atlasTextureConverter, "createTextureAtlasManagerForImageDataSpec:mipmapped:", &v17, -[PXGTextureManager preferMipmaps](self, "preferMipmaps", v17, v18));
    atlasTextureConverter = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(atlasTextureConverter, "setDelegate:", self);
    objc_msgSend(v5, "arrayByAddingObject:", atlasTextureConverter);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGTextureManager setTextureAtlasManagers:](self, "setTextureAtlasManagers:", v15);

  }
LABEL_15:

  return atlasTextureConverter;
}

- (void)setTextureAtlasManagers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

uint64_t __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_2(uint64_t result, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  double v8;
  float32x2_t v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  if (a2 < a2 + a3)
  {
    v4 = 32 * a2;
    for (i = *(_QWORD *)(result + 40) + 66 * a2 + 44; ; i += 66)
    {
      if (!*(_QWORD *)(i + 4) && !*(_DWORD *)i)
      {
        v6 = *(_QWORD *)(i - 32);
        if (*(float *)&v6 > 0.0 && *((float *)&v6 + 1) > 0.0)
        {
          v7 = *(_QWORD *)(result + 48) + v4;
          v8 = *(double *)(result + 56);
          v9 = vmul_f32(*(float32x2_t *)(v7 + 24), (float32x2_t)0x3F0000003F000000);
          if (*(double *)v7 - v9.f32[0] <= v8 + *(double *)(result + 72) && *(double *)v7 + v9.f32[0] >= v8)
          {
            v11 = *(double *)(result + 64);
            v12 = *(double *)(v7 + 8);
            v13 = v9.f32[1];
            v14 = v12 - v13;
            v15 = v12 + v13;
            if (v14 <= *(double *)(result + 80) + v11 && v15 >= v11)
              break;
          }
        }
      }
      v4 += 32;
      if (!--a3)
        return result;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __48__PXGTextureManager__addTextureToTexturesInUse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hash");
}

uint64_t __51__PXGTextureManager__processTextureProviderResults__block_invoke_4(uint64_t a1, int a2, __int32 a3, unsigned int a4, double a5)
{
  float *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  unsigned int v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  float32x2_t *v24;
  uint64_t v25;
  void *v26;
  id *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 *v33;
  int v34;
  int v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unsigned int v39;
  float32x2_t v40;
  int v41;
  int32x2_t v42;
  unsigned int v43;
  void *v45;
  void *v46;
  int v47;

  v47 = a2;
  v10 = (float *)(*(_QWORD *)(a1 + 32) + 160);
  if (std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::find<int>(v10, a2))
  {
    v11 = *((unsigned int *)std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v10, a2, &v47)+ 5);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
    v13 = v12 + 66 * v11;
    v15 = *(_DWORD *)(v13 + 60);
    v14 = (unsigned int *)(v13 + 60);
    if (v15 < a4)
    {
      v16 = *(id *)(a1 + 40);
      v17 = v12 + 66 * v11;
      v19 = *(void **)(v17 + 48);
      v18 = (_QWORD *)(v17 + 48);
      v20 = v19;
      v21 = v20;
      if (v20)
      {
        objc_msgSend(v20, "removeSpriteIndex:atThumbnailIndex:", v11, *(unsigned int *)(v12 + 66 * v11 + 56));
        *v18 = 0;
        v22 = v12 + 66 * v11;
        *(_DWORD *)(v22 + 20) = 0;
        *(_DWORD *)(v22 + 24) = 0;
      }

      v23 = v12 + 66 * v11;
      *(double *)(v23 + 20) = a5;
      v24 = (float32x2_t *)(v23 + 20);
      v24[4].i32[1] = a3;
      *v14 = a4;
      *v18 = v16;

      if (!v24[3].i32[0])
      {
        v25 = v12 + 66 * v11;
        v28 = *(void **)(v25 + 36);
        v27 = (id *)(v25 + 36);
        v26 = v28;
        if (v28)
        {
          v29 = v26;
          objc_msgSend(v29, "removeSpriteIndex:", v11);

          v30 = v12 + 66 * v11;
          *(_BYTE *)(v30 + 64) = 0;
          *(_QWORD *)(v30 + 36) = 0;
          *(_QWORD *)(v30 + 28) = 0;

        }
      }
      v31 = *(_QWORD *)(a1 + 56);
      v32 = v12 + 66 * v11;
      v34 = *(unsigned __int8 *)(v32 + 64);
      v33 = (unsigned __int8 *)(v32 + 64);
      if (v34 == 3)
      {
        LOBYTE(v35) = 4;
LABEL_32:
        *(_BYTE *)(v31 + *(unsigned int *)(v12 + 66 * v11)) = v35;
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        return v11;
      }
      v36 = v12 + 66 * v11;
      v39 = *(unsigned __int8 *)(v36 + 9);
      v38 = v36 + 9;
      v37 = v39;
      if (v39 <= 0xD)
      {
        v40 = *v24;
        v41 = 1 << v37;
        if ((v41 & 0x35D8) != 0)
        {
          if (!PXFloatApproximatelyEqualToFloat() || (PXFloatApproximatelyEqualToFloat() & 1) == 0)
            goto LABEL_21;
        }
        else if ((v41 & 0x807) != 0)
        {
          v42 = vcge_f32(v40, *(float32x2_t *)(v38 + 3));
          if ((v42.i32[0] & v42.i32[1] & 1) == 0)
            goto LABEL_21;
        }
        else if (v40.f32[0] <= 0.0 || v40.f32[1] <= 0.0)
        {
LABEL_21:
          if (v24[3].i32[0] && *(_QWORD *)(v12 + 66 * v11 + 36))
          {
            v43 = *v33;
            if (v43 >= 2)
            {
              if (v43 != 2)
              {
                if (v43 == 3)
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PXGUpdateLoadingStatusForStreamInfo(PXGSpriteIndex, const PXGStreamInfo *, PXGLoadingState *)");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("PXGTextureManager.mm"), 201, CFSTR("Should be handled earlier"));

                  abort();
                }
                LOBYTE(v35) = 0;
                goto LABEL_32;
              }
              goto LABEL_27;
            }
          }
          else if (COERCE_FLOAT(*v24) <= 0.0)
          {
            v35 = *(_DWORD *)(v12 + 66 * v11 + 4);
            if (v35)
              LOBYTE(v35) = *(_BYTE *)v38 != 0;
            goto LABEL_32;
          }
          LOBYTE(v35) = 2;
          goto LABEL_32;
        }
      }
LABEL_27:
      LOBYTE(v35) = 3;
      goto LABEL_32;
    }
  }
  return 0xFFFFFFFFLL;
}

- (void)setTextureConverters:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *v6;
  NSArray *v7;
  char v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  NSArray *v19;
  NSArray *textureConverters;
  NSArray *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[5];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_textureConverters;
  v6 = (NSArray *)v4;
  v7 = v6;
  if (v5 == v6)
  {

  }
  else
  {
    v8 = -[NSArray isEqual:](v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      v21 = v7;
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v9 = self->_textureConverters;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v28;
        v12 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v28 != v11)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            v26[0] = v12;
            v26[1] = 3221225472;
            v26[2] = __42__PXGTextureManager_setTextureConverters___block_invoke;
            v26[3] = &unk_1E513A0D0;
            v26[4] = v14;
            if (-[NSArray indexOfObjectPassingTest:](v21, "indexOfObjectPassingTest:", v26) == 0x7FFFFFFFFFFFFFFFLL)
              -[PXGTextureManager _registerTextureConverter:forPresentationType:](self, "_registerTextureConverter:forPresentationType:", 0, objc_msgSend(v14, "presentationType"));
          }
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v10);
      }

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v15 = v21;
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v23;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v15);
            -[PXGTextureManager _registerTextureConverter:forPresentationType:](self, "_registerTextureConverter:forPresentationType:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "presentationType"));
          }
          v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
        }
        while (v16);
      }

      v19 = (NSArray *)-[NSArray copy](v15, "copy");
      textureConverters = self->_textureConverters;
      self->_textureConverters = v19;

      v7 = v21;
    }
  }

}

- (void)_registerTextureConverter:(id)a3 forPresentationType:(unsigned __int8)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t streamInfoBySpriteIndexCount;
  uint64_t v12;
  $3AF47EF1DC6FA7925F89D368FE250233 *streamInfoBySpriteIndex;
  unsigned int v14;
  char *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  char *v20;
  char *v21;
  void *v22;
  id *v23;
  void *v24;
  id v25;
  char *v26;
  NSArray *v28;
  NSArray *textureAtlasManagers;
  void *v30;
  NSObject *requestQueue;
  uint64_t v32;
  id v33;
  NSArray *v34;
  NSObject *processQueue;
  id v36;
  void *v37;
  NSDictionary *v38;
  NSDictionary *textureConverterByPresentationType;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  _QWORD v46[5];
  _QWORD block[4];
  id v48;
  PXGTextureManager *v49;
  NSArray *v50;

  v4 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_textureConverterByPresentationType, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if ((id)v9 != v7)
  {
    if (v9)
    {
      v42 = a3;
      v43 = (void *)v9;
      v44 = v8;
      v45 = v7;
      streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
      if (streamInfoBySpriteIndexCount)
      {
        v12 = 0;
        streamInfoBySpriteIndex = self->_streamInfoBySpriteIndex;
        v14 = 1;
        do
        {
          if (*(&streamInfoBySpriteIndex->var2 + 66 * v12) == (_DWORD)v4)
          {
            v15 = (char *)streamInfoBySpriteIndex + 66 * v12;
            v17 = (void *)*((_QWORD *)v15 + 6);
            v16 = v15 + 48;
            v18 = v17;
            v19 = v18;
            if (v18)
            {
              objc_msgSend(v18, "removeSpriteIndex:atThumbnailIndex:", v14 - 1, *(unsigned int *)((char *)&streamInfoBySpriteIndex[1].var0.var0 + 66 * v12));
              *v16 = 0;
              v20 = (char *)streamInfoBySpriteIndex + 66 * v12;
              *((_DWORD *)v20 + 5) = 0;
              *((_DWORD *)v20 + 6) = 0;
            }

            v21 = (char *)streamInfoBySpriteIndex + 66 * v12;
            v24 = *(void **)(v21 + 36);
            v23 = (id *)(v21 + 36);
            v22 = v24;
            if (v24)
            {
              v25 = v22;
              objc_msgSend(v25, "removeSpriteIndex:", v14 - 1);

              v26 = (char *)streamInfoBySpriteIndex + 66 * v12;
              v26[64] = 0;
              *(_QWORD *)(v26 + 36) = 0;
              *(_QWORD *)(v26 + 28) = 0;

            }
            *(&streamInfoBySpriteIndex->var4 + 33 * v12) = -1;
            streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
          }
          v12 = v14;
        }
        while (streamInfoBySpriteIndexCount > v14++);
      }
      self->_didSwitchTextureConverter = 1;
      v28 = self->_textureAtlasManagers;
      textureAtlasManagers = self->_textureAtlasManagers;
      self->_textureAtlasManagers = (NSArray *)MEMORY[0x1E0C9AA60];

      -[NSMutableDictionary allValues](self->_textureProviderByMediaKind, "allValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      requestQueue = self->_requestQueue;
      v32 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke;
      block[3] = &unk_1E51457C8;
      v33 = v30;
      v48 = v33;
      v49 = self;
      v34 = v28;
      v50 = v34;
      dispatch_async(requestQueue, block);
      processQueue = self->_processQueue;
      v46[0] = v32;
      v46[1] = 3221225472;
      v46[2] = __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke_3;
      v46[3] = &unk_1E5149198;
      v46[4] = self;
      dispatch_async(processQueue, v46);
      -[PXGTextureManager _removeAllTexturesForPresentationType:](self, "_removeAllTexturesForPresentationType:", v4);
      v36 = -[PXGTextureManager _storeTexture:forKey:](self, "_storeTexture:forKey:", self->_emptyTexture, self->_emptyTexture);
      -[PXGTextureManager _setNeedsUpdate](self, "_setNeedsUpdate");

      v8 = v44;
      v7 = v45;
      v10 = v43;
    }
    v37 = (void *)-[NSDictionary mutableCopy](self->_textureConverterByPresentationType, "mutableCopy", v42, v43, v44, v45);
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v7, v8);
    v38 = (NSDictionary *)objc_msgSend(v37, "copy");
    textureConverterByPresentationType = self->_textureConverterByPresentationType;
    self->_textureConverterByPresentationType = v38;

    if (v7)
    {
      if ((objc_msgSend(v7, "supportedContentTypes") & 8) != 0)
      {
        objc_storeStrong((id *)&self->_atlasTextureConverter, a3);
        self->_atlasPresentationType = v4;
      }
      objc_msgSend(v7, "setRequestQueue:", self->_requestQueue);
      objc_msgSend(v7, "setProcessingQueue:", self->_processQueue);
      -[PXGTextureManager _configureTextureConverter:](self, "_configureTextureConverter:", v7);
      objc_msgSend(v7, "transparentTexture");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
        v41 = -[PXGTextureManager _storeTexture:forKey:](self, "_storeTexture:forKey:", v40, v40);

    }
  }

}

- (void)_configureTextureConverter:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setLowMemoryMode:", -[PXGTextureManager lowMemoryMode](self, "lowMemoryMode"));

}

- (void)registerTextureProvider:(id)a3 forMediaKind:(unsigned __int8)a4
{
  uint64_t v4;
  NSMutableDictionary *textureProviderByMediaKind;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  textureProviderByMediaKind = self->_textureProviderByMediaKind;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](textureProviderByMediaKind, "setObject:forKeyedSubscript:", v9, v7);

  -[NSMapTable setObject:forKey:](self->_textureProvidersDisplayLinkRegistrationState, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v9);
  objc_msgSend(v9, "setLayoutQueue:", self->_layoutQueue);
  objc_msgSend(v9, "setRequestQueue:", self->_requestQueue);
  objc_msgSend(v9, "setWorkQueue:", self->_workQueue);
  objc_msgSend(v9, "setProcessingQueue:", self->_processQueue);
  -[PXGTextureManager viewEnvironment](self, "viewEnvironment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setViewEnvironment:", v8);

  objc_msgSend(v9, "setDelegate:", self);
  -[PXGTextureManager _configureTextureProvider:](self, "_configureTextureProvider:", v9);
  objc_msgSend(v9, "prepareImageDataSpecs");

}

- (void)_configureTextureProvider:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setLowMemoryMode:", -[PXGTextureManager lowMemoryMode](self, "lowMemoryMode"));
  objc_msgSend(v4, "setAllowLargerImagesDuringScrollingInLowMemoryMode:", -[PXGTextureManager allowLargerImagesDuringScrollingInLowMemoryMode](self, "allowLargerImagesDuringScrollingInLowMemoryMode"));
  objc_msgSend(v4, "setCanDeliverThumbnailData:", self->_atlasTextureConverter != 0);
  objc_msgSend(v4, "setPreferBGRA:", -[PXGTextureManager preferBGRA](self, "preferBGRA"));
  objc_msgSend(v4, "setPreferMipmaps:", -[PXGTextureManager preferMipmaps](self, "preferMipmaps"));
  objc_msgSend(v4, "setPreferredColorSpaceName:", -[PXGTextureManager preferredColorSpaceName](self, "preferredColorSpaceName"));

}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (BOOL)preferMipmaps
{
  return self->_preferMipmaps;
}

- (unint64_t)preferredColorSpaceName
{
  return self->_preferredColorSpaceName;
}

- (BOOL)preferBGRA
{
  return self->_preferBGRA;
}

- (BOOL)allowLargerImagesDuringScrollingInLowMemoryMode
{
  return self->_allowLargerImagesDuringScrollingInLowMemoryMode;
}

- (void)setPreferredColorSpaceName:(unint64_t)a3
{
  if (self->_preferredColorSpaceName != a3)
  {
    self->_preferredColorSpaceName = a3;
    -[PXGTextureManager _configureAllTextureProviders](self, "_configureAllTextureProviders");
  }
}

- (void)setPreferMipmaps:(BOOL)a3
{
  if (self->_preferMipmaps != a3)
  {
    self->_preferMipmaps = a3;
    -[PXGTextureManager _configureAllTextureProviders](self, "_configureAllTextureProviders");
  }
}

- (void)setPreferBGRA:(BOOL)a3
{
  if (self->_preferBGRA != a3)
  {
    self->_preferBGRA = a3;
    -[PXGTextureManager _configureAllTextureProviders](self, "_configureAllTextureProviders");
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PXGTextureManager)initWithEntityManager:(id)a3 layoutQueue:(id)a4
{
  id v7;
  id v8;
  PXGTextureManager *v9;
  PXGTextureManager *v10;
  void *v11;
  uint64_t v12;
  NSArray *trackedComponents;
  NSDictionary *textureConverterByPresentationType;
  NSMutableDictionary *v15;
  NSMutableDictionary *textureProviderByMediaKind;
  uint64_t v17;
  NSMapTable *textureProvidersDisplayLinkRegistrationState;
  PXGSpriteTextureStore *v19;
  PXGSpriteTextureStore *lookupLock_textureCache;
  NSHashTable *v21;
  NSHashTable *spriteTexturesInUse;
  uint64_t v23;
  NSMapTable *pendingSpriteTextureByRequestID;
  NSArray *textureAtlasManagers;
  uint64_t v26;
  NSIndexSet *loadedSpriteIndexes;
  NSObject *v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *requestQueue;
  NSObject *v32;
  NSObject *v33;
  dispatch_queue_t v34;
  OS_dispatch_queue *workQueue;
  NSObject *v36;
  NSObject *v37;
  dispatch_queue_t v38;
  OS_dispatch_queue *processQueue;
  NSObject *v40;
  NSObject *v41;
  dispatch_queue_t v42;
  OS_dispatch_queue *adjustQueue;
  NSObject *v44;
  NSObject *v45;
  dispatch_queue_t v46;
  OS_dispatch_queue *deallocationsQueue;
  PXGMutableSpriteTexture *v48;
  PXGMutableSpriteTexture *emptyTexture;
  id v50;
  NSMutableSet *v51;
  NSMutableSet *placeholderTextures;
  PXGTextureProvider *v53;
  objc_super v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v55.receiver = self;
  v55.super_class = (Class)PXGTextureManager;
  v9 = -[PXGTextureManager init](&v55, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entityManager, a3);
    objc_msgSend(v7, "loadingStatus");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    trackedComponents = v10->_trackedComponents;
    v10->_trackedComponents = (NSArray *)v12;

    objc_storeStrong((id *)&v10->_layoutQueue, a4);
    textureConverterByPresentationType = v10->_textureConverterByPresentationType;
    v10->_textureConverterByPresentationType = (NSDictionary *)MEMORY[0x1E0C9AA70];

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    textureProviderByMediaKind = v10->_textureProviderByMediaKind;
    v10->_textureProviderByMediaKind = v15;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v17 = objc_claimAutoreleasedReturnValue();
    textureProvidersDisplayLinkRegistrationState = v10->_textureProvidersDisplayLinkRegistrationState;
    v10->_textureProvidersDisplayLinkRegistrationState = (NSMapTable *)v17;

    v19 = (PXGSpriteTextureStore *)objc_alloc_init((Class)off_1E50B2D38);
    lookupLock_textureCache = v10->_lookupLock_textureCache;
    v10->_lookupLock_textureCache = v19;

    v21 = (NSHashTable *)objc_alloc_init(MEMORY[0x1E0CB3690]);
    spriteTexturesInUse = v10->_spriteTexturesInUse;
    v10->_spriteTexturesInUse = v21;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    pendingSpriteTextureByRequestID = v10->_pendingSpriteTextureByRequestID;
    v10->_pendingSpriteTextureByRequestID = (NSMapTable *)v23;

    textureAtlasManagers = v10->_textureAtlasManagers;
    v10->_textureAtlasManagers = (NSArray *)MEMORY[0x1E0C9AA60];

    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v26 = objc_claimAutoreleasedReturnValue();
    loadedSpriteIndexes = v10->_loadedSpriteIndexes;
    v10->_loadedSpriteIndexes = (NSIndexSet *)v26;

    -[PXGTextureManager _updatePreheatingStrategy](v10, "_updatePreheatingStrategy");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v28, QOS_CLASS_USER_INTERACTIVE, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = dispatch_queue_create("com.apple.photos.texture-manager-request", v29);
    requestQueue = v10->_requestQueue;
    v10->_requestQueue = (OS_dispatch_queue *)v30;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v32 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v32, QOS_CLASS_USER_INTERACTIVE, 0);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = dispatch_queue_create("com.apple.photos.texture-manager-work", v33);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v34;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v36 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v36, QOS_CLASS_USER_INITIATED, 0);
    v37 = objc_claimAutoreleasedReturnValue();
    v38 = dispatch_queue_create("com.apple.photos.texture-manager-process", v37);
    processQueue = v10->_processQueue;
    v10->_processQueue = (OS_dispatch_queue *)v38;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v40 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v40, QOS_CLASS_USER_INITIATED, 0);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = dispatch_queue_create("com.apple.photos.texture-manager-adjust", v41);
    adjustQueue = v10->_adjustQueue;
    v10->_adjustQueue = (OS_dispatch_queue *)v42;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v44 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v44, QOS_CLASS_USER_INITIATED, 0);
    v45 = objc_claimAutoreleasedReturnValue();
    v46 = dispatch_queue_create("com.apple.photos.texture-manager-deallocations", v45);
    deallocationsQueue = v10->_deallocationsQueue;
    v10->_deallocationsQueue = (OS_dispatch_queue *)v46;

    v10->_lookupLock._os_unfair_lock_opaque = 0;
    v48 = (PXGMutableSpriteTexture *)objc_alloc_init((Class)off_1E50B2970);
    emptyTexture = v10->_emptyTexture;
    v10->_emptyTexture = v48;

    v50 = -[PXGTextureManager _storeTexture:forKey:](v10, "_storeTexture:forKey:", v10->_emptyTexture, v10->_emptyTexture);
    v51 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    placeholderTextures = v10->_placeholderTextures;
    v10->_placeholderTextures = v51;

    v53 = objc_alloc_init(PXGTextureProvider);
    -[PXGTextureManager registerTextureProvider:forMediaKind:](v10, "registerTextureProvider:forMediaKind:", v53, 0);

  }
  return v10;
}

- (void)_updatePreheatingStrategy
{
  PXGTextureManagerPreheatingStrategy *v3;
  PXGTextureManagerPreheatingStrategy *preheatingStrategy;

  if (-[PXGTextureManager lowMemoryMode](self, "lowMemoryMode"))
    +[PXGTextureManagerPreheatingStrategy lowMemoryPreheatingStrategy](PXGTextureManagerPreheatingStrategy, "lowMemoryPreheatingStrategy");
  else
    +[PXGTextureManagerPreheatingStrategy defaultPreheatingStrategy](PXGTextureManagerPreheatingStrategy, "defaultPreheatingStrategy");
  v3 = (PXGTextureManagerPreheatingStrategy *)objc_claimAutoreleasedReturnValue();
  preheatingStrategy = self->_preheatingStrategy;
  self->_preheatingStrategy = v3;

}

- (void)_configureAllTextureProviders
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__PXGTextureManager__configureAllTextureProviders__block_invoke;
  v2[3] = &unk_1E513A478;
  v2[4] = self;
  -[PXGTextureManager _enumerateTextureProviders:](self, "_enumerateTextureProviders:", v2);
}

- (void)_enumerateTextureProviders:(id)a3
{
  id v4;
  NSMutableDictionary *textureProviderByMediaKind;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  textureProviderByMediaKind = self->_textureProviderByMediaKind;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__PXGTextureManager__enumerateTextureProviders___block_invoke;
  v7[3] = &unk_1E513A4A0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](textureProviderByMediaKind, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)setViewEnvironment:(id)a3
{
  id v5;
  PXGViewEnvironment *v6;
  PXGViewEnvironment *v7;
  BOOL v8;
  PXGViewEnvironment *v9;

  v5 = a3;
  v6 = self->_viewEnvironment;
  v7 = (PXGViewEnvironment *)v5;
  v9 = v7;
  if (v6 == v7)
  {

  }
  else
  {
    v8 = -[PXGViewEnvironment isEqual:](v6, "isEqual:", v7);

    if (!v8)
    {
      objc_storeStrong((id *)&self->_viewEnvironment, a3);
      -[PXGTextureManager _setNeedsUpdate](self, "_setNeedsUpdate");
    }
  }

}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_DWORD *)self + 24) = 1065353216;
  *((_OWORD *)self + 10) = 0u;
  *((_OWORD *)self + 11) = 0u;
  *((_DWORD *)self + 48) = 1065353216;
  return self;
}

void __48__PXGTextureManager__enumerateTextureProviders___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "integerValue"), v5);

}

uint64_t __50__PXGTextureManager__configureAllTextureProviders__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureTextureProvider:");
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = (HIDWORD(a2) + a2);
  if (v2 > a2)
  {
    v3 = a2;
    v4 = 66 * a2;
    do
    {
      v5 = *(_QWORD *)(result + 56) + v4;
      *(_DWORD *)v5 = *(_DWORD *)(*(_QWORD *)(result + 40) + 4 * v3++);
      *(_OWORD *)(v5 + 4) = 0uLL;
      *(_OWORD *)(v5 + 20) = 0uLL;
      *(_OWORD *)(v5 + 36) = 0uLL;
      *(_OWORD *)(v5 + 50) = 0uLL;
      v4 += 66;
    }
    while (v2 != v3);
  }
  return result;
}

- (void)dealloc
{
  unint64_t streamInfoBySpriteIndexCount;
  $3AF47EF1DC6FA7925F89D368FE250233 *streamInfoBySpriteIndex;
  uint64_t v5;
  unsigned int v6;
  char *v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  char *v12;
  objc_super v14;

  streamInfoBySpriteIndex = self->_streamInfoBySpriteIndex;
  streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
  if (streamInfoBySpriteIndexCount)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      v7 = (char *)streamInfoBySpriteIndex + 66 * v5;
      v10 = *(void **)(v7 + 36);
      v9 = (id *)(v7 + 36);
      v8 = v10;
      if (v10)
      {
        v11 = v8;
        objc_msgSend(v11, "removeSpriteIndex:", v6 - 1);

        v12 = (char *)streamInfoBySpriteIndex + 66 * v5;
        v12[64] = 0;
        *(_QWORD *)(v12 + 36) = 0;
        *(_QWORD *)(v12 + 28) = 0;

        streamInfoBySpriteIndexCount = self->_streamInfoBySpriteIndexCount;
      }
      v5 = v6;
    }
    while (streamInfoBySpriteIndexCount > v6++);
    streamInfoBySpriteIndex = self->_streamInfoBySpriteIndex;
  }
  free(streamInfoBySpriteIndex);
  v14.receiver = self;
  v14.super_class = (Class)PXGTextureManager;
  -[PXGTextureManager dealloc](&v14, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __32__PXGTextureManager_description__block_invoke;
  v32[3] = &unk_1E513A0A8;
  v32[4] = &v37;
  v32[5] = &v33;
  -[PXGTextureManager _enumerateSpriteTextures:](self, "_enumerateSpriteTextures:", v32);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PXGTextureManager textureAtlasManagers](self, "textureAtlasManagers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v27 = 0u;
        objc_msgSend(v7, "textures");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v41, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v25;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v25 != v10)
                objc_enumerationMutation(v8);
              v12 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v11), "estimatedByteSize");
              v38[3] += v12;
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v41, 16);
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v42, 16);
    }
    while (v4);
  }

  v13 = (void *)MEMORY[0x1E0CB3940];
  v23.receiver = self;
  v23.super_class = (Class)PXGTextureManager;
  -[PXGTextureManager description](&v23, sel_description);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v38[3];
  v16 = v34[3];
  -[PXGTextureManager textureAtlasManagers](self, "textureAtlasManagers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@ totalMemory:%.2fMB imageTextures:%lu atlasManagers:%@>"), v14, (double)v15 * 0.0009765625 * 0.0009765625, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  do
  {
    v19 = objc_msgSend(v18, "length");
    objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\n"), CFSTR("\n"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\\\"), CFSTR("\"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v21;
  }
  while (objc_msgSend(v21, "length") != v19);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  return (NSString *)v21;
}

- (CGImage)textureSnapshotForSpriteIndex:(unsigned int)a3
{
  CGImage *v3;
  _QWORD v5[5];
  unsigned int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__PXGTextureManager_textureSnapshotForSpriteIndex___block_invoke;
  v5[3] = &unk_1E513A428;
  v6 = a3;
  v5[4] = &v7;
  -[PXGTextureManager _enumerateSpriteTextures:](self, "_enumerateSpriteTextures:", v5);
  v3 = (CGImage *)v8[3];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)releaseCachedResources
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[PXGTextureManager layoutQueue](self, "layoutQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_textureProviderByMediaKind, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "releaseCachedResources");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)setAllowLargerImagesDuringScrollingInLowMemoryMode:(BOOL)a3
{
  if (self->_allowLargerImagesDuringScrollingInLowMemoryMode != a3)
  {
    self->_allowLargerImagesDuringScrollingInLowMemoryMode = a3;
    -[PXGTextureManager _configureAllTextureProviders](self, "_configureAllTextureProviders");
  }
}

- (void)setLowMemoryMode:(BOOL)a3
{
  if (self->_lowMemoryMode != a3)
  {
    self->_lowMemoryMode = a3;
    -[PXGTextureManager _updatePreheatingStrategy](self, "_updatePreheatingStrategy");
    -[PXGTextureManager _configureAllTextureProviders](self, "_configureAllTextureProviders");
    -[PXGTextureManager _configureAllTextureConverters](self, "_configureAllTextureConverters");
  }
}

- (void)_configureAllTextureConverters
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__PXGTextureManager__configureAllTextureConverters__block_invoke;
  v2[3] = &unk_1E513A450;
  v2[4] = self;
  -[PXGTextureManager _enumerateTextureConverters:](self, "_enumerateTextureConverters:", v2);
}

- (void)_enumerateTextureConverters:(id)a3
{
  id v4;
  NSDictionary *textureConverterByPresentationType;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  textureConverterByPresentationType = self->_textureConverterByPresentationType;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PXGTextureManager__enumerateTextureConverters___block_invoke;
  v7[3] = &unk_1E513A4C8;
  v8 = v4;
  v6 = v4;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](textureConverterByPresentationType, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)_removeAllTexturesForPresentationType:(unsigned __int8)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lookupLock;

  v3 = a3;
  p_lookupLock = &self->_lookupLock;
  os_unfair_lock_assert_not_owner(&self->_lookupLock);
  os_unfair_lock_lock(p_lookupLock);
  -[PXGSpriteTextureStore removeAllTexturesForPresentationType:](self->_lookupLock_textureCache, "removeAllTexturesForPresentationType:", v3);
  os_unfair_lock_unlock(p_lookupLock);
}

- (id)_existingTextureForPixelBuffer:(__CVBuffer *)a3 processingOptions:(id)a4 presentationType:(unsigned __int8)a5
{
  float32x4_t *v5;
  void *v8;
  uint16x4_t v9;
  float v10;
  float32x4_t v11;
  float32x4_t v12;
  float32x4_t v13;
  uint64_t v14;
  id v15;

  v5 = *(float32x4_t **)&a4.var0;
  -[PXGTextureManager _existingTextureForKey:presentationType:](self, "_existingTextureForKey:presentationType:", a3, *(_QWORD *)&a4.var2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alpha");
  v9.i32[0] = v5[1].i32[1];
  if (v10 != *(float *)v9.i32)
  {
    v11 = *v5;
LABEL_5:
    v14 = objc_msgSend(v8, "copyWithOrientationTransform:alpha:", *(double *)v11.i64, *(double *)&v9);

    v8 = (void *)v14;
    v15 = -[PXGTextureManager _storeTexture:forKey:replaceExisting:](self, "_storeTexture:forKey:replaceExisting:", v14, a3, v5[1].u8[8]);
    return v8;
  }
  objc_msgSend(v8, "orientationTransform");
  v13 = v12;
  v11 = *v5;
  v9 = (uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vceqq_f32(v13, *v5)), 0xFuLL));
  if ((vminv_u16(v9) & 1) == 0)
  {
    v9.i32[0] = v5[1].i32[1];
    goto LABEL_5;
  }
  return v8;
}

- (id)_existingAdjustedTextureForSourceTexture:(id)a3 adjustment:(id)a4 wantsMipmaps:(BOOL)a5 presentationType:(unsigned __int8)a6
{
  uint64_t v6;
  _BOOL8 v7;
  id v10;
  id v11;
  PXGAdjustedTexturePayload *v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = -[PXGAdjustedTexturePayload initWithTexture:adjustment:mipmaps:]([PXGAdjustedTexturePayload alloc], "initWithTexture:adjustment:mipmaps:", v10, v11, v7);
  -[PXGTextureManager _existingTextureForKey:presentationType:](self, "_existingTextureForKey:presentationType:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_storeAdjustedTexture:(id)a3 forSourceTexture:(id)a4 adjustment:(id)a5 mipmaps:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  PXGAdjustedTexturePayload *v13;
  void *v14;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[PXGAdjustedTexturePayload initWithTexture:adjustment:mipmaps:]([PXGAdjustedTexturePayload alloc], "initWithTexture:adjustment:mipmaps:", v11, v12, v6);
  objc_msgSend(v10, "setCacheKey:", v13);
  -[PXGTextureManager _storeTexture:forKey:](self, "_storeTexture:forKey:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)_processPixelBuffer:(__CVBuffer *)a3 options:(id)a4 adjustment:(id)a5 fromTextureProvider:(id)a6 withTextureConverter:(id)a7 forRequestID:(int)a8 requestDetails:(id)a9 deliveryOrder:(unsigned int)a10
{
  _OWORD *v13;
  id v16;
  id v17;
  id v18;
  __int128 v19;
  void *v20;
  NSObject *adjustQueue;
  id *v22;
  __int128 v23;
  void *v24;
  NSObject *requestQueue;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  int v30;
  int v31;
  _QWORD block[4];
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  int v40;
  int v41;
  int v42;
  char v43;
  id location;
  _OWORD v45[3];
  char v46;

  v13 = *(_OWORD **)&a4.var0;
  v16 = *(id *)&a4.var2;
  v17 = a5;
  v18 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  if ((objc_msgSend(v17, "isRequestActive:", a7) & 1) != 0)
  {
    v19 = v13[1];
    v45[0] = *v13;
    v45[1] = v19;
    -[PXGTextureManager _createTextureForCVPixelBuffer:requestID:requestDetails:processingOptions:fromTextureProvider:withTextureConverter:](self, "_createTextureForCVPixelBuffer:requestID:requestDetails:processingOptions:fromTextureProvider:withTextureConverter:", a3, a7, *(_QWORD *)&a8 & 0xFFFFFFFFFFLL, v45, v17, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (v16 || *((_BYTE *)v13 + 16))
      {
        objc_initWeak(&location, self);
        adjustQueue = self->_adjustQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __143__PXGTextureManager__processPixelBuffer_options_adjustment_fromTextureProvider_withTextureConverter_forRequestID_requestDetails_deliveryOrder___block_invoke;
        block[3] = &unk_1E513A4F0;
        v22 = &v39;
        objc_copyWeak(&v39, &location);
        v35 = v16;
        v23 = v13[1];
        v33 = *v13;
        v34 = v23;
        v36 = v20;
        v37 = v17;
        v38 = v18;
        v40 = (int)a7;
        v41 = *(_DWORD *)&a9.var0;
        v43 = v46;
        v42 = a8;
        dispatch_async(adjustQueue, block);

        v24 = v35;
      }
      else
      {
        objc_initWeak(&location, self);
        requestQueue = self->_requestQueue;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __143__PXGTextureManager__processPixelBuffer_options_adjustment_fromTextureProvider_withTextureConverter_forRequestID_requestDetails_deliveryOrder___block_invoke_2;
        v26[3] = &unk_1E513A518;
        v22 = &v29;
        objc_copyWeak(&v29, &location);
        v27 = v20;
        v28 = v17;
        v30 = (int)a7;
        v31 = *(_DWORD *)&a9.var0;
        dispatch_async(requestQueue, v26);

        v24 = v27;
      }

      objc_destroyWeak(v22);
      objc_destroyWeak(&location);
    }

  }
}

- (id)_createTextureForCVPixelBuffer:(__CVBuffer *)a3 requestID:(int)a4 requestDetails:(id)a5 processingOptions:(id)a6 fromTextureProvider:(id)a7 withTextureConverter:(id)a8
{
  __int128 *v9;
  id v14;
  id v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  double v19;
  void *v20;
  id v21;
  NSObject *requestQueue;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  int v28;
  id location;
  id v30;
  _OWORD v31[2];

  v9 = *(__int128 **)&a6.var0;
  v14 = *(id *)&a6.var2;
  v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processQueue);
  v16 = v9[1];
  v31[0] = *v9;
  v31[1] = v16;
  -[PXGTextureManager _existingTextureForPixelBuffer:processingOptions:presentationType:](self, "_existingTextureForPixelBuffer:processingOptions:presentationType:", a3, v31, objc_msgSend(v15, "presentationType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    CVPixelBufferGetWidth(a3);
    CVPixelBufferGetHeight(a3);
    kdebug_trace();
    v18 = *v9;
    LODWORD(v19) = *((_DWORD *)v9 + 5);
    v30 = 0;
    objc_msgSend(v15, "createTextureFromCVPixelBuffer:transform:alpha:options:error:", a3, (*(unint64_t *)&a5 >> 8), &v30, *(double *)&v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v30;
    objc_msgSend(v20, "pixelSize");
    kdebug_trace();
    if (v20)
    {
      -[PXGTextureManager _storeTexture:forKey:replaceExisting:](self, "_storeTexture:forKey:replaceExisting:", v20, a3, *((unsigned __int8 *)v9 + 24));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_initWeak(&location, self);
      requestQueue = self->_requestQueue;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __136__PXGTextureManager__createTextureForCVPixelBuffer_requestID_requestDetails_processingOptions_fromTextureProvider_withTextureConverter___block_invoke;
      v24[3] = &unk_1E513A540;
      objc_copyWeak(&v27, &location);
      v25 = v14;
      v26 = v21;
      v28 = a4;
      dispatch_async(requestQueue, v24);

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
      v17 = 0;
    }

  }
  return v17;
}

- (void)_applyAdjustment:(id)a3 withMipmaps:(BOOL)a4 toTexture:(id)a5 fromTextureProvider:(id)a6 withTextureConverter:(id)a7 forRequestID:(int)a8 deliveryOrder:(unsigned int)a9 requestDetails:(id)a10
{
  uint64_t v10;
  _BOOL8 v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  NSObject *requestQueue;
  id v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  int v30;
  unsigned int v31;
  id location;

  v10 = *(_QWORD *)&a8;
  v14 = a4;
  v16 = a3;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_adjustQueue);
  if ((objc_msgSend(v18, "isRequestActive:", v10) & 1) != 0)
  {
    -[PXGTextureManager _existingAdjustedTextureForSourceTexture:adjustment:wantsMipmaps:presentationType:](self, "_existingAdjustedTextureForSourceTexture:adjustment:wantsMipmaps:presentationType:", v17, v16, v14, objc_msgSend(v19, "presentationType"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      if (v14)
        v21 = 0x100000000;
      else
        v21 = 0;
      objc_msgSend(v19, "applyAdjustment:toTexture:options:", v16, v17, v21 & 0xFFFFFFFF00000000 | (*(unint64_t *)&a10 >> 8));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      if (!v20)
      {
        v23 = v17;
LABEL_11:
        objc_initWeak(&location, self);
        requestQueue = self->_requestQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __143__PXGTextureManager__applyAdjustment_withMipmaps_toTexture_fromTextureProvider_withTextureConverter_forRequestID_deliveryOrder_requestDetails___block_invoke;
        block[3] = &unk_1E513A518;
        objc_copyWeak(&v29, &location);
        v27 = v23;
        v28 = v18;
        v30 = v10;
        v31 = a9;
        v25 = v23;
        dispatch_async(requestQueue, block);

        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
        goto LABEL_12;
      }
      v22 = -[PXGTextureManager _storeAdjustedTexture:forSourceTexture:adjustment:mipmaps:](self, "_storeAdjustedTexture:forSourceTexture:adjustment:mipmaps:", v20, v17, v16, v14);
    }
    v23 = v17;
    if (v20 != v17)
    {
      objc_msgSend(v20, "setSourceCGImage:", objc_msgSend(v17, "sourceCGImage"));
      objc_msgSend(v20, "setSourceCVPixelBuffer:", objc_msgSend(v17, "sourceCVPixelBuffer"));
      v23 = v20;
    }
    goto LABEL_11;
  }
LABEL_12:

}

- (void)textureProvider:(id)a3 didProvidePixelBuffer:(__CVBuffer *)a4 options:(id)a5 adjustment:(id)a6 forRequestID:(int)a7
{
  void *v8;
  _OWORD *v9;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *processQueue;
  __int128 v21;
  id v22;
  void *v23;
  NSObject *adjustQueue;
  __int128 v25;
  id v26;
  _QWORD v27[4];
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  id v32;
  id v33[2];
  int v34;
  int v35;
  int v36;
  char v37;
  _QWORD block[4];
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  int v46;
  int v47;
  int v48;
  char v49;
  id location;
  _OWORD v51[2];
  int v52;
  char v53;

  v8 = *(void **)&a5.var2;
  v9 = *(_OWORD **)&a5.var0;
  v12 = a3;
  v13 = v8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  if ((objc_msgSend(v12, "isRequestActive:", a6) & 1) != 0
    && -[PXGTextureManager _getRequestDetails:forRequestID:](self, "_getRequestDetails:forRequestID:", &v52, a6))
  {
    do
      v14 = __ldaxr((unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID);
    while (__stlxr(v14 + 1, (unsigned int *)&PXGMakeNextTextureDeliveryOrderID::lastRequestID));
    v15 = v9[1];
    v51[0] = *v9;
    v51[1] = v15;
    -[PXGTextureManager _existingTextureForPixelBuffer:processingOptions:presentationType:](self, "_existingTextureForPixelBuffer:processingOptions:presentationType:", a4, v51, v52);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = *((unsigned __int8 *)v9 + 16);
      if (v13)
      {
LABEL_8:
        -[PXGTextureManager _existingAdjustedTextureForSourceTexture:adjustment:wantsMipmaps:presentationType:](self, "_existingAdjustedTextureForSourceTexture:adjustment:wantsMipmaps:presentationType:", v16, v13, v17 != 0, v52);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          -[PXGTextureManager _handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:](self, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", v18, v12, a6, v14);
        }
        else
        {
          -[PXGTextureManager _textureConverterForPresentationType:contentType:](self, "_textureConverterForPresentationType:contentType:", v52, 1);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_initWeak(&location, self);
          adjustQueue = self->_adjustQueue;
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __91__PXGTextureManager_textureProvider_didProvidePixelBuffer_options_adjustment_forRequestID___block_invoke;
          block[3] = &unk_1E513A4F0;
          objc_copyWeak(&v45, &location);
          v41 = v13;
          v25 = v9[1];
          v39 = *v9;
          v40 = v25;
          v42 = v16;
          v43 = v12;
          v44 = v23;
          v46 = (int)a6;
          v47 = v14;
          v48 = v52;
          v49 = v53;
          v26 = v23;
          dispatch_async(adjustQueue, block);

          objc_destroyWeak(&v45);
          objc_destroyWeak(&location);
        }

        goto LABEL_13;
      }
      if (*((_BYTE *)v9 + 16))
      {
        v17 = 1;
        goto LABEL_8;
      }
      -[PXGTextureManager _handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:](self, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", v16, v12, a6, v14);
    }
    else
    {
      -[PXGTextureManager _textureConverterForPresentationType:contentType:](self, "_textureConverterForPresentationType:contentType:", v52, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      CVPixelBufferRetain(a4);
      objc_initWeak(&location, self);
      processQueue = self->_processQueue;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __91__PXGTextureManager_textureProvider_didProvidePixelBuffer_options_adjustment_forRequestID___block_invoke_2;
      v27[3] = &unk_1E513A590;
      objc_copyWeak(v33, &location);
      v33[1] = a4;
      v21 = v9[1];
      v28 = *v9;
      v29 = v21;
      v30 = v13;
      v31 = v12;
      v32 = v19;
      v35 = v14;
      v36 = v52;
      v37 = v53;
      v34 = (int)a6;
      v22 = v19;
      dispatch_async(processQueue, v27);

      objc_destroyWeak(v33);
      objc_destroyWeak(&location);
    }
LABEL_13:

  }
}

- (void)textureProvider:(id)a3 didProvideFailureWithError:(id)a4 forRequestID:(int)a5
{
  id v7;
  NSObject *layoutQueue;
  id v9;
  _QWORD block[5];
  id v11;
  int v12;

  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  layoutQueue = self->_layoutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PXGTextureManager_textureProvider_didProvideFailureWithError_forRequestID___block_invoke;
  block[3] = &unk_1E513A5E0;
  v12 = a5;
  block[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(layoutQueue, block);

}

- (void)textureProviderNeedsToRegisterToDisplayLinkUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXGTextureManager layoutQueue](self, "layoutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PXGTextureManager_textureProviderNeedsToRegisterToDisplayLinkUpdates___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)textureProviderNeedsToUnregisterFromDisplayLinkUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXGTextureManager layoutQueue](self, "layoutQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PXGTextureManager_textureProviderNeedsToUnregisterFromDisplayLinkUpdates___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)textureProvider:(id)a3 requestRenderSnapshot:(id *)a4
{
  void *v6;
  __int128 v7;
  void *v8;
  _OWORD v10[2];
  CGFloat height;

  -[PXGTextureManager delegate](self, "delegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_OWORD *)&a4->var1.origin.y;
  v10[0] = *(_OWORD *)&a4->var0;
  v10[1] = v7;
  height = a4->var1.size.height;
  objc_msgSend(v6, "textureManager:requestRenderSnapshot:", self, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)textureConverters
{
  return self->_textureConverters;
}

- (void)setPreheatingStrategy:(id)a3
{
  objc_storeStrong((id *)&self->_preheatingStrategy, a3);
}

- (void)setDeferModifiedTextureRequestsDuringViewResizing:(unint64_t)a3
{
  self->_deferModifiedTextureRequestsDuringViewResizing = a3;
}

- (void)setIsInactive:(BOOL)a3
{
  self->_isInactive = a3;
}

- (int64_t)streamCount
{
  return self->_streamCount;
}

- (void).cxx_destruct
{
  _QWORD *next;
  _QWORD *v4;
  void **value;
  _QWORD *v6;
  _QWORD *v7;
  void **v8;

  objc_storeStrong((id *)&self->_textureAtlasManagers, 0);
  objc_storeStrong((id *)&self->_texturesByPresentationType, 0);
  objc_storeStrong((id *)&self->_viewEnvironment, 0);
  objc_storeStrong((id *)&self->_preheatingStrategy, 0);
  objc_storeStrong((id *)&self->_textureConverters, 0);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_trackedComponents, 0);
  objc_storeStrong((id *)&self->_placeholderTextures, 0);
  objc_storeStrong((id *)&self->_emptyTexture, 0);
  objc_storeStrong((id *)&self->_loadedSpriteIndexes, 0);
  next = self->_spriteIndexByRequestID.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v4 = (_QWORD *)*next;
      operator delete(next);
      next = v4;
    }
    while (v4);
  }
  value = self->_spriteIndexByRequestID.__table_.__bucket_list_.__ptr_.__value_;
  self->_spriteIndexByRequestID.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value)
    operator delete(value);
  objc_storeStrong((id *)&self->_textureProvidersDisplayLinkRegistrationState, 0);
  objc_storeStrong((id *)&self->_textureProviderByMediaKind, 0);
  objc_storeStrong((id *)&self->_atlasTextureConverter, 0);
  objc_storeStrong((id *)&self->_textureConverterByPresentationType, 0);
  objc_storeStrong((id *)&self->_pendingSpriteTextureByRequestID, 0);
  objc_storeStrong((id *)&self->_spriteTexturesInUse, 0);
  v6 = self->_lookupLock_requestDetailsByRequestID.__table_.__p1_.__value_.__next_;
  if (v6)
  {
    do
    {
      v7 = (_QWORD *)*v6;
      operator delete(v6);
      v6 = v7;
    }
    while (v7);
  }
  v8 = self->_lookupLock_requestDetailsByRequestID.__table_.__bucket_list_.__ptr_.__value_;
  self->_lookupLock_requestDetailsByRequestID.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v8)
    operator delete(v8);
  objc_storeStrong((id *)&self->_lookupLock_textureCache, 0);
  objc_storeStrong((id *)&self->_deallocationsQueue, 0);
  objc_storeStrong((id *)&self->_adjustQueue, 0);
  objc_storeStrong((id *)&self->_processQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
}

uint64_t __76__PXGTextureManager_textureProviderNeedsToUnregisterFromDisplayLinkUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setObject:forKey:", MEMORY[0x1E0C9AAA0], *(_QWORD *)(a1 + 40));
}

uint64_t __72__PXGTextureManager_textureProviderNeedsToRegisterToDisplayLinkUpdates___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setObject:forKey:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdate");
}

void __77__PXGTextureManager_textureProvider_didProvideFailureWithError_forRequestID___block_invoke(uint64_t a1)
{
  _DWORD *v2;
  int v3;
  float *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  int v11;

  v2 = (_DWORD *)(a1 + 48);
  v3 = *(_DWORD *)(a1 + 48);
  v4 = (float *)(*(_QWORD *)(a1 + 32) + 160);
  if (std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::find<int>(v4, v3))
  {
    v5 = *((_DWORD *)std::__hash_table<std::__hash_value_type<int,unsigned int>,std::__unordered_map_hasher<int,std::__hash_value_type<int,unsigned int>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,unsigned int>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,unsigned int>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(v4, v3, v2)+ 5);
    objc_msgSend(*(id *)(a1 + 32), "entityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadingStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__PXGTextureManager_textureProvider_didProvideFailureWithError_forRequestID___block_invoke_2;
    v9[3] = &unk_1E513A5B8;
    v8 = *(void **)(a1 + 40);
    v9[4] = *(_QWORD *)(a1 + 32);
    v11 = v5;
    v10 = v8;
    objc_msgSend(v7, "performChanges:", v9);

  }
}

void __77__PXGTextureManager_textureProvider_didProvideFailureWithError_forRequestID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  float32x2_t v12;
  float32x2_t v13;
  unsigned int v14;
  int v15;
  int v16;
  unsigned int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  float32x2_t v21;
  id v22;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208);
  v5 = *(_DWORD *)(a1 + 48);
  v6 = v4 + 66 * v5;
  *(_BYTE *)(v6 + 64) = 3;
  v7 = (_BYTE *)(v6 + 64);
  v22 = objc_retainAutorelease(v3);
  v8 = objc_msgSend(v22, "mutableStates");
  if (*v7 == 3)
  {
    LOBYTE(v9) = 4;
    goto LABEL_24;
  }
  v10 = v4 + 66 * v5;
  v12 = *(float32x2_t *)(v10 + 20);
  v11 = (_QWORD *)(v10 + 20);
  v13 = v12;
  v14 = *((unsigned __int8 *)v11 - 11);
  if (v14 > 0xD)
    goto LABEL_19;
  v15 = 1 << v14;
  if ((v15 & 0x35D8) != 0)
  {
    v20 = *(v11 - 1);
    v21 = v13;
    v16 = PXFloatApproximatelyEqualToFloat();
    v13 = v21;
    if (v16 && (PXFloatApproximatelyEqualToFloat() & 1) != 0)
      goto LABEL_19;
  }
  else if ((v15 & 0x807) != 0)
  {
    v13 = (float32x2_t)vcge_f32(v13, (float32x2_t)*(v11 - 1));
    if ((v13.i32[0] & v13.i32[1] & 1) != 0)
      goto LABEL_19;
  }
  else if (v13.f32[0] > 0.0)
  {
    v13.i32[0] = v13.i32[1];
    if (v13.f32[1] > 0.0)
      goto LABEL_19;
  }
  if (*(_DWORD *)(v4 + 66 * v5 + 44) && *(_QWORD *)(v4 + 66 * v5 + 36))
  {
    v17 = *v7;
    if (v17 >= 2)
    {
      if (v17 != 2)
      {
        if (v17 == 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", *(double *)&v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void PXGUpdateLoadingStatusForStreamInfo(PXGSpriteIndex, const PXGStreamInfo *, PXGLoadingState *)");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXGTextureManager.mm"), 201, CFSTR("Should be handled earlier"));

          abort();
        }
        LOBYTE(v9) = 0;
        goto LABEL_24;
      }
LABEL_19:
      LOBYTE(v9) = 3;
      goto LABEL_24;
    }
LABEL_21:
    LOBYTE(v9) = 2;
    goto LABEL_24;
  }
  if (COERCE_FLOAT(*v11) > 0.0)
    goto LABEL_21;
  v9 = *(_DWORD *)(v4 + 66 * v5 + 4);
  if (v9)
    LOBYTE(v9) = *((_BYTE *)v11 - 11) != 0;
LABEL_24:
  *(_BYTE *)(v8 + *(unsigned int *)(v4 + 66 * v5)) = v9;
  objc_msgSend(v22, "setError:forEntity:", *(_QWORD *)(a1 + 40), v20);

}

void __91__PXGTextureManager_textureProvider_didProvidePixelBuffer_options_adjustment_forRequestID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  LODWORD(v3) = *(_DWORD *)(a1 + 108);
  v4 = WeakRetained;
  objc_msgSend(WeakRetained, "_applyAdjustment:withMipmaps:toTexture:fromTextureProvider:withTextureConverter:forRequestID:deliveryOrder:requestDetails:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(unsigned int *)(a1 + 104), v3, *(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32));

}

void __91__PXGTextureManager_textureProvider_didProvidePixelBuffer_options_adjustment_forRequestID___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  _OWORD v6[2];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  v3 = *(_QWORD *)(a1 + 96);
  v4 = *(_OWORD *)(a1 + 48);
  v6[0] = *(_OWORD *)(a1 + 32);
  v6[1] = v4;
  LODWORD(v5) = *(_DWORD *)(a1 + 108);
  objc_msgSend(WeakRetained, "_processPixelBuffer:options:adjustment:fromTextureProvider:withTextureConverter:forRequestID:requestDetails:deliveryOrder:", v3, v6, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(unsigned int *)(a1 + 104), *(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32), v5);

  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 96));
}

void __98__PXGTextureManager_textureProvider_didProvideCGImage_options_adjustment_isDegraded_forRequestID___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  LODWORD(v3) = *(_DWORD *)(a1 + 108);
  v4 = WeakRetained;
  objc_msgSend(WeakRetained, "_applyAdjustment:withMipmaps:toTexture:fromTextureProvider:withTextureConverter:forRequestID:deliveryOrder:requestDetails:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(unsigned int *)(a1 + 104), v3, *(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32));

}

void __143__PXGTextureManager__applyAdjustment_withMipmaps_toTexture_fromTextureProvider_withTextureConverter_forRequestID_deliveryOrder_requestDetails___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));

}

void __136__PXGTextureManager__createTextureForCVPixelBuffer_requestID_requestDetails_processingOptions_fromTextureProvider_withTextureConverter___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "textureProvider:didProvideFailureWithError:forRequestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));

}

void __143__PXGTextureManager__processPixelBuffer_options_adjustment_fromTextureProvider_withTextureConverter_forRequestID_requestDetails_deliveryOrder___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  LODWORD(v3) = *(_DWORD *)(a1 + 108);
  v4 = WeakRetained;
  objc_msgSend(WeakRetained, "_applyAdjustment:withMipmaps:toTexture:fromTextureProvider:withTextureConverter:forRequestID:deliveryOrder:requestDetails:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(unsigned int *)(a1 + 104), v3, *(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32));

}

void __143__PXGTextureManager__processPixelBuffer_options_adjustment_fromTextureProvider_withTextureConverter_forRequestID_requestDetails_deliveryOrder___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleProvidedSpriteTexture:fromTextureProvider:requestID:deliveryOrder:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(unsigned int *)(a1 + 60));

}

void __130__PXGTextureManager__createTextureForCGImage_requestID_requestDetails_processingOptions_fromTextureProvider_withTextureConverter___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "textureProvider:didProvideFailureWithError:forRequestID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56));

}

void __147__PXGTextureManager__processCGImage_options_adjustment_isDegraded_fromTextureProvider_withTextureConverter_requestID_requestDetails_deliveryOrder___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  LODWORD(v3) = *(_DWORD *)(a1 + 108);
  v4 = WeakRetained;
  objc_msgSend(WeakRetained, "_applyAdjustment:withMipmaps:toTexture:fromTextureProvider:withTextureConverter:forRequestID:deliveryOrder:requestDetails:", *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(unsigned int *)(a1 + 104), v3, *(unsigned int *)(a1 + 112) | ((unint64_t)*(unsigned __int8 *)(a1 + 116) << 32));

}

uint64_t __94__PXGTextureManager__handleProvidedSpriteTexture_fromTextureProvider_requestID_deliveryOrder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addTextureToTexturesInUse:", *(_QWORD *)(a1 + 40));
}

void __49__PXGTextureManager__enumerateTextureConverters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "integerValue"), v5);

}

uint64_t __51__PXGTextureManager__configureAllTextureConverters__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureTextureConverter:");
}

void __51__PXGTextureManager_textureSnapshotForSpriteIndex___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "containsSpriteIndex:", *(unsigned int *)(a1 + 40)))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "imageRepresentation");
    *a3 = 1;
  }

}

uint64_t __190__PXGTextureManager__lookupLock_requestTexturesForSpritesInRange_textureProvider_mediaKind_presentationType_isAppearing_layout_leafSpriteIndexRange_sprites_textureStreamInfos_loadingStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "addObject:", *(_QWORD *)(a1 + 40));
}

void __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_3(uint64_t a1)
{
  dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16), &__block_literal_global_230684);
}

void __98__PXGTextureManager__blockOnThumbnailsIfNeededWithGeometries_visibleRect_interactionState_fences___block_invoke_6(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40))
    dispatch_sync(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24), &__block_literal_global_64_230683);
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;

  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1[4] + 48));
  v6 = a2 + a3;
  if (a2 + a3 > (unint64_t)a2)
  {
    v7 = a2;
    do
    {
      v8 = a1[7];
      v9 = (unsigned int *)(v8 + 66 * v7);
      (*(void (**)(void))(a1[6] + 16))();
      v10 = *(void **)(v9 + 9);
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v11, "removeSpriteIndex:", a2);

        v12 = v8 + 66 * v7;
        *(_BYTE *)(v12 + 64) = 0;
        *(_QWORD *)(v12 + 36) = 0;
        *(_QWORD *)(v12 + 28) = 0;

      }
      v13 = v8 + 66 * v7;
      v15 = *(void **)(v13 + 48);
      v14 = (_QWORD *)(v13 + 48);
      v16 = v15;
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "removeSpriteIndex:atThumbnailIndex:", a2, *(unsigned int *)(v8 + 66 * v7 + 56));
        *v14 = 0;
        v18 = v8 + 66 * v7;
        *(_DWORD *)(v18 + 20) = 0;
        *(_DWORD *)(v18 + 24) = 0;
      }

      *(_BYTE *)(a1[9] + *v9) = 0;
      v7 = (a2 + 1);
      a2 = v7;
    }
    while (v6 > v7);
  }
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_36()
{
  return kdebug_trace();
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2_37(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __int128 v7;
  uint64_t v8;
  _QWORD v9[5];
  id v10;
  _QWORD *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];
  unsigned int v18;

  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = a2;
  v3 = a2 | ((unint64_t)a3 << 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3_38;
  v9[3] = &unk_1E513A1C0;
  v5 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v11 = v17;
  v12 = v4;
  v6 = *(void **)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v7 = *(_OWORD *)(a1 + 80);
  v13 = *(_OWORD *)(a1 + 64);
  v14 = v7;
  v8 = *(_QWORD *)(a1 + 104);
  v15 = *(_QWORD *)(a1 + 96);
  v16 = v8;
  v10 = v5;
  objc_msgSend(v6, "enumerateLayoutsForSpritesInRange:options:usingBlock:", v3, 1, v9);

  _Block_object_dispose(v17, 8);
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4_40(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a2 < a2 + a3)
  {
    v3 = a3;
    v4 = a2;
    v5 = result;
    v6 = 66 * a2 + 65;
    do
    {
      if (*(_BYTE *)(*(_QWORD *)(v5 + 40) + v6))
        result = objc_msgSend(*(id *)(v5 + 32), "addIndex:", v4);
      ++v4;
      v6 += 66;
      --v3;
    }
    while (v3);
  }
  return result;
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5_41(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  int v10;
  _BOOL4 v11;
  uint64_t v12;
  float32x2_t *v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  uint64_t SupportedResize;
  float32x2_t v19;
  int32x2_t v20;
  int32x2_t v21;
  __int32 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  id *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  void *v38;
  id *v39;
  void *v40;
  float32x2_t v41;
  int32x2_t v42;
  id v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  unsigned __int8 *v47;
  unint64_t v48;
  float32x2_t v49;
  _OWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, unint64_t, void *);
  void *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  uint64_t (*v62)();
  void *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint8_t buf[4];
  int v71;
  __int16 v72;
  uint64_t v73;
  uint64_t v74;

  v3 = a2;
  v74 = *MEMORY[0x1E0C80C00];
  v48 = a2 + a3;
  if (a2 + a3 > (unint64_t)a2)
  {
    v5 = a2;
    v46 = a1 + 104;
    while (1)
    {
      v6 = *(_QWORD *)(a1 + 72);
      if (*(_DWORD *)(v6 + 66 * v5 + 4))
        break;
LABEL_39:
      v5 = (v3 + 1);
      v3 = v5;
      if (v48 <= v5)
        return;
    }
    v7 = *(_QWORD *)(a1 + 80);
    v8 = v7 + 40 * v5;
    v10 = *(unsigned __int8 *)(v8 + 1);
    v9 = (unsigned __int8 *)(v8 + 1);
    v47 = (unsigned __int8 *)(v7 + 40 * v5);
    v11 = v10 != *(unsigned __int8 *)(v6 + 66 * v5 + 9)
       || *(unsigned __int16 *)(v7 + 40 * v5 + 32) != *(unsigned __int16 *)(v6 + 66 * v5 + 10)
       || *(_BYTE *)(v6 + 66 * v5 + 65) != 0;
    v49 = *(float32x2_t *)(v7 + 40 * v5 + 8);
    v12 = v6 + 66 * v5;
    v14 = *(float32x2_t *)(v12 + 28);
    v13 = (float32x2_t *)(v12 + 28);
    v15 = v14;
    v16 = v13[-2];
    v17 = v13[-1];
    SupportedResize = PXGMediaKindGetSupportedResize();
    if (SupportedResize == 1)
    {
      v19 = v49;
      v21 = vcgt_f32(v49, v16);
      if (((v21.i32[0] | v21.i32[1]) & 1) == 0)
      {
        v22 = 0;
        goto LABEL_17;
      }
      v20 = vcgt_f32(v49, vmaxnm_f32(v15, v17));
    }
    else
    {
      if (SupportedResize)
      {
        v22 = 0;
        v19 = v49;
        goto LABEL_17;
      }
      v19 = v49;
      v20 = (int32x2_t)vmvn_s8((int8x8_t)vceq_f32(v49, v16));
    }
    if ((v20.i8[0] & 1) != 0)
      goto LABEL_18;
    v22 = v20.i32[1];
LABEL_17:
    if (((v11 | v22) & 1) == 0)
    {
LABEL_33:
      v37 = v6 + 66 * v5;
      v40 = *(void **)(v37 + 36);
      v39 = (id *)(v37 + 36);
      v38 = v40;
      if (v40)
      {
        if ((vcgt_f32(v17, v19).u32[0] & 1) != 0)
        {
          v41 = vmul_f32(*v13, (float32x2_t)0x3F0000003F000000);
          v42 = vcgt_f32((float32x2_t)vzip2_s32((int32x2_t)v41, (int32x2_t)v17), (float32x2_t)vdup_lane_s32((int32x2_t)v19, 1));
          if ((v42.i8[4] & 1) != 0 && (vcgt_f32(v41, v19).u8[0] & 1) != 0 && (v42.i8[0] & 1) != 0)
          {
            v43 = v38;
            objc_msgSend(v43, "removeSpriteIndex:", v3);

            *(_BYTE *)(v6 + 66 * v5 + 64) = 0;
            *v13 = 0;
            v13[1] = 0;

            v13[-2] = v17;
          }
        }
      }
      goto LABEL_39;
    }
LABEL_18:
    if (*(_BYTE *)(a1 + 144))
    {
      *(_BYTE *)(v6 + 66 * v5 + 65) = 1;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 272) = 1;
    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
      v23 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *v9);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v64 = 0;
        v65 = &v64;
        v66 = 0x3032000000;
        v67 = __Block_byref_object_copy__230694;
        v68 = __Block_byref_object_dispose__230695;
        v69 = 0;
        v58 = 0;
        v59 = &v58;
        v60 = 0x3812000000;
        v61 = __Block_byref_object_copy__42;
        v62 = __Block_byref_object_dispose__43;
        v63 = &unk_1A7E74EE7;
        v26 = *(void **)(a1 + 48);
        v52 = MEMORY[0x1E0C809B0];
        v53 = 3221225472;
        v54 = __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_44;
        v55 = &unk_1E513A238;
        v56 = &v64;
        v57 = &v58;
        objc_msgSend(v26, "enumerateLayoutsForSpritesInRange:options:usingBlock:");
        if (!v65[5] && !*(_BYTE *)(*(_QWORD *)(a1 + 32) + 137))
        {
          PXAssertGetLog();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            v44 = *(_QWORD *)(a1 + 48);
            *(_DWORD *)buf = 67109378;
            v71 = v3;
            v72 = 2112;
            v73 = v44;
            _os_log_error_impl(&dword_1A6789000, v27, OS_LOG_TYPE_ERROR, "missing leaf layout for spriteIndex %i in layout %@", buf, 0x12u);
          }

        }
        if (!*v9)
        {
          v28 = v6 + 66 * v5;
          v31 = *(void **)(v28 + 36);
          v30 = (id *)(v28 + 36);
          v29 = v31;
          if (v31)
          {
            v45 = v29;
            objc_msgSend(v45, "removeSpriteIndex:", v3);

            *(_BYTE *)(v6 + 66 * v5 + 64) = 0;
            *v13 = 0;
            v13[1] = 0;

          }
        }
        if (v65[5])
        {
          v32 = *(void **)(a1 + 32);
          v33 = *v9;
          v34 = *v47;
          v35 = v59[6];
          v36 = *(_OWORD *)(v46 + 16);
          v50[0] = *(_OWORD *)v46;
          v50[1] = v36;
          v51 = *(_QWORD *)(v46 + 32);
          objc_msgSend(v32, "_lookupLock_requestTexturesForSpritesInRange:textureProvider:mediaKind:presentationType:isAppearing:layout:leafSpriteIndexRange:sprites:textureStreamInfos:loadingStatus:", v5 | 0x100000000, v25, v33, v34, 0, v35, v50, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
        }
        _Block_object_dispose(&v58, 8);
        _Block_object_dispose(&v64, 8);

      }
      v19 = v49;
    }
    goto LABEL_33;
  }
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_52(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a2 < a2 + a3)
  {
    v3 = a3;
    v4 = result;
    v5 = 0;
    v6 = 66 * a2 + 4;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    while (1)
    {
      v8 = *(int *)(*(_QWORD *)(v4 + 40) + v6);
      if ((_DWORD)v8)
      {
        if (!v5 || v7 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_9;
        if (v5 + v7 != v8)
        {
          result = objc_msgSend(*(id *)(v4 + 32), "addIndexesInRange:");
LABEL_9:
          v7 = v8;
          v5 = 1;
          goto LABEL_10;
        }
        ++v5;
      }
LABEL_10:
      v6 += 66;
      if (!--v3)
      {
        if (v5)
          return objc_msgSend(*(id *)(v4 + 32), "addIndexesInRange:", v7);
        return result;
      }
    }
  }
  return result;
}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_2_53()
{
  return kdebug_trace();
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3_54(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    v7 = (void *)v8;
  }
  objc_msgSend(v7, "addObject:", v11);
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_4_57(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "spriteCount"))
  {
    v3 = v7;
    if ((id)a1[4] != v7)
    {
      (*(void (**)(_QWORD, id, uint64_t))(a1[8] + 16))(a1[8], v7, objc_msgSend(v7, "presentationType"));
      v3 = v7;
    }
    v4 = (void *)a1[5];
    objc_msgSend(v3, "spriteIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addIndexes:", v5);

    v6 = (id *)(a1[6] + 104);
  }
  else
  {
    objc_msgSend(*(id *)(a1[6] + 104), "removeObject:", v7);
    v6 = (id *)(a1 + 7);
  }
  objc_msgSend(*v6, "addObject:", v7);

}

uint64_t __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_5_60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pruneTextures:", *(_QWORD *)(a1 + 40));
}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_44(uint64_t a1, unint64_t a2, void *a3)
{
  int v4;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a2;
  v6 = HIDWORD(a2);
  v11 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v7 = v11;
  if ((_DWORD)v6 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGTextureManager _streamTexturesForSpritesInDataStore:presentationDataStore:changeDetails:layout:interactionState:loadingStatus:]_block_invoke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGTextureManager.mm"), 817, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subrange.length == 1"));

    v7 = v11;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_DWORD *)(v8 + 48) = v4;
  *(_DWORD *)(v8 + 52) = v6;

}

void __132__PXGTextureManager__streamTexturesForSpritesInDataStore_presentationDataStore_changeDetails_layout_interactionState_loadingStatus___block_invoke_3_38(uint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  _OWORD *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  __int128 v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  id v23;
  _OWORD v24[2];
  uint64_t v25;
  _OWORD v26[2];
  uint64_t v27;

  v23 = a3;
  v5 = HIDWORD(a2);
  if (HIDWORD(a2) + (int)a2 <= a2)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = (_OWORD *)(a1 + 64);
    v13 = -1;
    do
    {
      v14 = *(_QWORD *)(a1 + 56);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v16 = *(_DWORD *)(v15 + 24);
      v17 = *(unsigned __int8 *)(v14 + 40 * v16 + 1);
      if (__PAIR64__(v17, *(unsigned __int8 *)(v14 + 40 * v16)) != __PAIR64__(v13, v6))
      {
        if ((_DWORD)v9 && v7)
        {
          v18 = *(_OWORD *)(a1 + 80);
          v26[0] = *v12;
          v26[1] = v18;
          v27 = *(_QWORD *)(a1 + 96);
          objc_msgSend(*(id *)(a1 + 32), "_lookupLock_requestTexturesForSpritesInRange:textureProvider:mediaKind:presentationType:isAppearing:layout:leafSpriteIndexRange:sprites:textureStreamInfos:loadingStatus:", v10 | (unint64_t)(v11 << 32), v7, v13, v6, 1, v23, v8 | (unint64_t)(v9 << 32), v26, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 40));
          v14 = *(_QWORD *)(a1 + 56);
          v16 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          v17 = *(unsigned __int8 *)(v14 + 40 * v16 + 1);
        }
        v6 = *(_BYTE *)(v14 + 40 * v16);
        v19 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v20);
        v21 = objc_claimAutoreleasedReturnValue();

        LODWORD(v11) = 0;
        LODWORD(v9) = 0;
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v16 = *(_DWORD *)(v15 + 24);
        v10 = v16;
        v8 = a2;
        v7 = (void *)v21;
        v13 = v17;
      }
      v9 = (v9 + 1);
      v11 = (v11 + 1);
      *(_DWORD *)(v15 + 24) = v16 + 1;
      LODWORD(a2) = a2 + 1;
      LODWORD(v5) = v5 - 1;
    }
    while ((_DWORD)v5);
    if ((_DWORD)v9 && v7)
    {
      v22 = *(_OWORD *)(a1 + 80);
      v24[0] = *v12;
      v24[1] = v22;
      v25 = *(_QWORD *)(a1 + 96);
      objc_msgSend(*(id *)(a1 + 32), "_lookupLock_requestTexturesForSpritesInRange:textureProvider:mediaKind:presentationType:isAppearing:layout:leafSpriteIndexRange:sprites:textureStreamInfos:loadingStatus:", v10 | (unint64_t)(v11 << 32), v7, v13, v6, 1, v23, v8 | (unint64_t)(v9 << 32), v24, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 40));
    }
  }

}

void __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = a1[4];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v5++), "clearTextureAtlasManagerCache");
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  objc_msgSend(a1[5], "layoutQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke_2;
  block[3] = &unk_1E5149198;
  v8 = a1[6];
  dispatch_async(v6, block);

}

uint64_t __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 256), "removeAllObjects");
}

uint64_t __67__PXGTextureManager__registerTextureConverter_forPresentationType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hash");
}

BOOL __42__PXGTextureManager_setTextureConverters___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  LODWORD(a1) = objc_msgSend(*(id *)(a1 + 32), "presentationType");
  v4 = (_DWORD)a1 == objc_msgSend(v3, "presentationType");

  return v4;
}

void __32__PXGTextureManager_description__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += objc_msgSend(v3, "estimatedByteSize");
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

@end
