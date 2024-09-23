@implementation PXGMetalRenderer

- (void)_populateEffectSprites:(id)a3 spriteRenderDataStore:(id)a4 presentationDataStore:(id)a5 metadataStore:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id obj;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  void *v38;
  id v39;
  id v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v34 = a4;
  v11 = a5;
  v26 = a6;
  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXGMetalRenderer entityManager](self, "entityManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "effectComponent");
  v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v32 = objc_msgSend(v33, "effectIds");
  v12 = objc_retainAutorelease(v11);
  v31 = objc_msgSend(v12, "entities");
  v13 = objc_retainAutorelease(v12);
  v30 = objc_msgSend(v13, "geometries");
  v14 = objc_retainAutorelease(v13);
  v29 = objc_msgSend(v14, "styles");
  v25 = objc_retainAutorelease(v14);
  v15 = objc_msgSend(v25, "infos");
  -[PXGMetalRenderer renderDestination](self, "renderDestination");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scale");
  v18 = v17;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v10;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v54;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v54 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v21);
        v51[0] = 0;
        v51[1] = v51;
        v51[2] = 0x3032000000;
        v51[3] = __Block_byref_object_copy__19448;
        v51[4] = __Block_byref_object_dispose__19449;
        v52 = 0;
        v49[0] = 0;
        v49[1] = v49;
        v49[2] = 0x3032000000;
        v49[3] = __Block_byref_object_copy__19448;
        v49[4] = __Block_byref_object_dispose__19449;
        v50 = 0;
        objc_msgSend(v22, "spriteIndexes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __101__PXGMetalRenderer__populateEffectSprites_spriteRenderDataStore_presentationDataStore_metadataStore___block_invoke;
        v36[3] = &unk_1E5119508;
        v43 = v31;
        v44 = v32;
        v24 = v33;
        v41 = v49;
        v42 = v51;
        v37 = v24;
        v38 = v22;
        v39 = v35;
        v40 = v34;
        v45 = v30;
        v46 = v29;
        v47 = v15;
        v48 = v18;
        objc_msgSend(v23, "enumerateRangesUsingBlock:", v36);

        _Block_object_dispose(v49, 8);
        _Block_object_dispose(v51, 8);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v19);
  }

  objc_msgSend(obj, "addObjectsFromArray:", v35);
}

- (PXGMetalRenderDestination)renderDestination
{
  return self->_renderDestination;
}

- (BOOL)isInvertColorsEnabled
{
  return self->_isInvertColorsEnabled;
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (void)_pipelinesLock_resizePipelinesStorageIfNeeded
{
  int64_t pipelinesCount;
  int64_t pipelinesCapacity;
  int64_t v5;
  BOOL v6;

  os_unfair_lock_assert_owner(&self->_pipelinesLock);
  pipelinesCount = self->_pipelinesCount;
  pipelinesCapacity = self->_pipelinesCapacity;
  if (pipelinesCount > pipelinesCapacity)
  {
    v5 = self->_pipelinesCapacity;
    if (!pipelinesCapacity)
    {
      v5 = 10;
      self->_pipelinesCapacity = 10;
    }
    if (pipelinesCount > v5)
    {
      do
      {
        v6 = pipelinesCount <= 2 * v5;
        v5 *= 2;
      }
      while (!v6);
      self->_pipelinesCapacity = v5;
    }
    _PXGArrayResize();
    _PXGArrayZeroRange();
  }
}

- (PXGTungstenRecordingSession)recordingSession
{
  return self->_recordingSession;
}

void __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "entityManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentsFrom:", v4);

}

- ($EDEBC7EA21717A15148E9A8A98906629)interactionState
{
  CGSize size;
  CGSize v4;

  size = self[5].var8.size;
  *(CGPoint *)&retstr->var0 = self[5].var8.origin;
  *(CGSize *)&retstr->var4 = size;
  v4 = *(CGSize *)&self[6].var4;
  retstr->var8.origin = *(CGPoint *)&self[6].var0;
  retstr->var8.size = v4;
  return self;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)visibleRectInRenderCoordinates
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXGMetalRenderer visibleRect](self, "visibleRect");
  -[PXGMetalRenderer converRectToRenderCoordinates:](self, "converRectToRenderCoordinates:");
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

+ (float)maxZPosition
{
  return 250.0;
}

- (double)offscreenEffectScale
{
  return self->_offscreenEffectScale;
}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
}

- (void)setNeedsRender
{
  id v2;

  -[PXGMetalRenderer renderDestination](self, "renderDestination");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsRender");

}

- (void)setInteractionState:(id *)a3
{
  __int128 v3;
  __int128 v4;
  CGSize size;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var4;
  size = a3->var8.size;
  self->_interactionState.targetRect.origin = a3->var8.origin;
  self->_interactionState.targetRect.size = size;
  *(_OWORD *)&self->_interactionState.scrollRegime = v3;
  *(_OWORD *)&self->_interactionState.contentChangeTrend = v4;
}

- (__n128)setCameraConfiguration:(uint64_t)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  *(_OWORD *)(a1 + 416) = *(_OWORD *)a3;
  v3 = *(_OWORD *)(a3 + 16);
  v4 = *(_OWORD *)(a3 + 32);
  v5 = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 464) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(a1 + 480) = v5;
  *(_OWORD *)(a1 + 432) = v3;
  *(_OWORD *)(a1 + 448) = v4;
  v6 = *(_OWORD *)(a3 + 80);
  v7 = *(_OWORD *)(a3 + 96);
  v8 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(a1 + 528) = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a1 + 544) = v8;
  *(_OWORD *)(a1 + 496) = v6;
  *(_OWORD *)(a1 + 512) = v7;
  result = *(__n128 *)(a3 + 144);
  v10 = *(_OWORD *)(a3 + 160);
  v11 = *(_OWORD *)(a3 + 192);
  *(_OWORD *)(a1 + 592) = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(a1 + 608) = v11;
  *(__n128 *)(a1 + 560) = result;
  *(_OWORD *)(a1 + 576) = v10;
  return result;
}

- (unsigned)presentationType
{
  return 0;
}

- (void)renderDestinationRequestRender:(id)a3
{
  id v4;

  -[PXGMetalRenderer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rendererPerformRender:", self);

}

- (PXGRendererDelegate)delegate
{
  return (PXGRendererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXGTextureConverter)textureConverter
{
  return (PXGTextureConverter *)self->_textureConverter;
}

- (void)renderDestination:(id)a3 renderSizeWillChange:(CGSize)a4
{
  double height;
  double width;
  id v7;

  height = a4.height;
  width = a4.width;
  -[PXGMetalRenderer delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renderer:viewportSizeWillChange:", self, width, height);

}

void __101__PXGMetalRenderer__populateEffectSprites_spriteRenderDataStore_presentationDataStore_metadataStore___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  _QWORD v25[4];
  _QWORD v26[4];
  _OWORD v27[2];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  if (a3)
  {
    v3 = a3;
    do
    {
      if (*(_DWORD *)(*(_QWORD *)(a1 + 88) + 4 * *(unsigned int *)(*(_QWORD *)(a1 + 80) + 4 * a2)))
      {
        objc_msgSend(*(id *)(a1 + 32), "effectForId:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "numberOfSiblingSprites");
        if ((_DWORD)v7)
        {
          if (*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) != v6)
          {
            objc_msgSend(v6, "createSiblingsTextureForMainSpriteTexture:", *(_QWORD *)(a1 + 40));
            v8 = objc_claimAutoreleasedReturnValue();
            v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v10 = *(void **)(v9 + 40);
            *(_QWORD *)(v9 + 40) = v8;

            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v6);
            if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
              objc_msgSend(*(id *)(a1 + 48), "addObject:");
          }
          if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
          {
            v11 = objc_msgSend(*(id *)(a1 + 56), "count") | (unint64_t)(v7 << 32);
            objc_msgSend(*(id *)(a1 + 56), "insertSpritesInRange:", v11);
            v12 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "entities");
            v13 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "geometries");
            v14 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "styles");
            v15 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 56)), "infos");
            v31 = 0;
            v29 = 0u;
            v30 = 0u;
            v16 = *(void **)(a1 + 56);
            if (v16)
              objc_msgSend(v16, "spritesInRange:", v11);
            v17 = *(_QWORD *)(a1 + 96);
            v18 = *(_QWORD *)(a1 + 104);
            v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v28 = v31;
            v20 = *(_QWORD *)(a1 + 112);
            v21 = *(_QWORD *)(v19 + 40);
            v22 = v17 + 32 * a2;
            v23 = *(_QWORD *)(a1 + 40);
            v24 = *(double *)(a1 + 120);
            v27[0] = v29;
            v27[1] = v30;
            v26[0] = v12 + 4 * a2;
            v26[1] = v13 + 32 * a2;
            v26[2] = v14 + 160 * a2;
            v26[3] = v15 + 40 * a2;
            v25[0] = v26[0];
            v25[1] = v22;
            v25[2] = v18 + 160 * a2;
            v25[3] = v20 + 40 * a2;
            objc_msgSend(v6, "configureSiblingSprites:siblingsSpriteIndexRange:siblingsTexture:forMainRenderSpriteRef:mainPresentationSpriteRef:mainSpriteIndex:mainSpriteTexture:screenScale:", v27, v11, v21, v26, v25, a2, v24, v23);
          }
        }

      }
      ++a2;
      --v3;
    }
    while (v3);
  }
}

- (void)renderSpritesWithTextures:(id)a3 dataStore:(id)a4 presentationDataStore:(id)a5 presentationMetadataStore:(id)a6 layout:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id WeakRetained;
  PXGMetalRenderer *v19;
  void *v20;
  int32x4_t v21;
  double v22;
  double v23;
  unint64_t v24;
  float32x4_t v25;
  int32x4_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  MTLDevice *v45;
  MTLDevice *device;
  id v47;
  uint64_t v48;
  PXGSpriteDataStore *v49;
  unsigned int v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  float64x2_t v64;
  uint64_t v65;
  float v66;
  unsigned int v67;
  const void *v68;
  id v69;
  void *v70;
  void *v71;
  PXGMetalRenderer *v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint32x4_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  float32x4_t v91;
  float32x4_t v92;
  float32x4_t v93;
  float32x4_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  uint64_t v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  int8x16_t v143;
  uint64_t v144;
  PXGSpriteDataStore *v145;
  id v146;
  id v147;
  id v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  void *v154;
  _QWORD v155[4];
  id v156;
  PXGMetalRenderer *v157;
  id v158;
  _QWORD v159[15];
  _QWORD v160[5];
  __int128 v161;
  __int128 v162;
  void *v163;
  _OWORD v164[2];
  uint64_t v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _OWORD v173[4];
  _BYTE v174[128];
  uint8_t buf[16];
  __int128 v176;
  __int128 v177;
  __int128 v178;
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[PXGMetalRenderStatePool checkoutRenderState](self->_renderStatePool, "checkoutRenderState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v146 = v16;
    WeakRetained = objc_loadWeakRetained((id *)&self->_testingDelegate);
    v152 = v17;
    objc_msgSend(WeakRetained, "metalRenderer:willCheckoutRenderState:", self, v17);

    -[PXGMetalRenderer renderDestination](self, "renderDestination");
    v19 = self;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGMetalRenderer visibleRect](self, "visibleRect");
    v21.i32[0] = 0;
    *(float *)&v22 = v22;
    *(float *)&v23 = v23;
    v24 = __PAIR64__(LODWORD(v23), LODWORD(v22));
    v25 = *(float32x4_t *)&self[1]._nextFrameId;
    v26 = vceqq_f32(v25, (float32x4_t)xmmword_1A7C0C280);
    v26.i32[3] = v26.i32[2];
    v26.i32[0] = vminvq_u32((uint32x4_t)v26);
    v143 = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_s32(v21, v26), 0), (int8x16_t)v24, (int8x16_t)v25);
    -[PXGMetalRenderer recordingSession](self, "recordingSession");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[PXGMetalRenderer recordingSession](self, "recordingSession");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGMetalRenderer visibleRect](self, "visibleRect");
      v30 = v29;
      v32 = v31;
      -[PXGMetalRenderer renderDestination](self, "renderDestination");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "scale");
      +[PXGMetalRecordingFrameStartEvent eventWithViewSize:renderOrigin:screenScale:](PXGMetalRecordingFrameStartEvent, "eventWithViewSize:renderOrigin:screenScale:", v30, v32, *(double *)v143.i64, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "recordEvent:", v35);

    }
    v149 = v15;
    v150 = v14;
    v147 = v13;
    if (objc_msgSend(v20, "canSetColorSpace"))
      objc_msgSend(v20, "setColorspace:", MEMORY[0x1A85CCEEC](objc_msgSend(v20, "destinationColorSpaceName")));
    v151 = v20;
    v154 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
    v153 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v148 = v12;
    v36 = v12;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v169, v174, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v170;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v170 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v169 + 1) + 8 * i);
          objc_msgSend(v41, "texture");
          v42 = objc_claimAutoreleasedReturnValue();
          if (!v42)
            goto LABEL_13;
          v43 = (void *)v42;
          objc_msgSend(v41, "texture");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "device");
          v45 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
          device = v19->_device;

          if (v45 == device)
          {
LABEL_13:
            v47 = v41;
            if (objc_msgSend(v47, "isCaptureTexture"))
            {
              v48 = objc_msgSend(v47, "copy");
              objc_msgSend(v153, "addObject:", v48);

              v47 = (id)v48;
            }
            objc_msgSend(v154, "addObject:", v47);

          }
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v169, v174, 16);
      }
      while (v38);
    }

    v49 = v19->_spriteRenderDataStore;
    v14 = v150;
    if (v150)
    {
      objc_msgSend(v150, "sprites");
    }
    else
    {
      v168 = 0;
      v166 = 0u;
      v167 = 0u;
    }
    v15 = v149;
    v164[0] = v166;
    v164[1] = v167;
    v165 = v168;
    -[PXGSpriteDataStore setSprites:](v49, "setSprites:", v164);
    -[PXGMetalRenderer _populateEffectSprites:spriteRenderDataStore:presentationDataStore:metadataStore:](v19, "_populateEffectSprites:spriteRenderDataStore:presentationDataStore:metadataStore:", v154, v49, v150, v149);
    objc_msgSend(v152, "setTextures:", v154);
    objc_msgSend(v152, "setCaptureSpriteTextures:", v153);
    v163 = 0;
    v161 = 0u;
    v162 = 0u;
    v145 = v49;
    if (v49)
    {
      -[PXGSpriteDataStore sprites](v49, "sprites");
      v50 = v161;
    }
    else
    {
      v50 = 0;
    }
    v51 = v50;
    v52 = objc_retainAutorelease(v152);
    v53 = objc_msgSend(v52, "spriteGeometriesBufferWithCount:", v51);
    v54 = objc_retainAutorelease(v52);
    v55 = (void *)objc_msgSend(v54, "spriteEntitiesBufferWithCount:", v51);
    v56 = objc_retainAutorelease(v54);
    v57 = (void *)objc_msgSend(v56, "spriteStylesBufferWithCount:", v51);
    v58 = objc_retainAutorelease(v56);
    v59 = (void *)objc_msgSend(v58, "spriteInfosBufferWithCount:", v51);
    v60 = objc_retainAutorelease(v58);
    v61 = objc_msgSend(v60, "spriteOriginalGeometriesBufferWithCount:", v51);
    if (v53 && v55 && v57 && v59 && (v62 = (void *)v61) != 0)
    {
      if ((_DWORD)v51)
      {
        v63 = v162;
        v64 = vcvtq_f64_f32(*(float32x2_t *)v143.i8);
        v65 = v51;
        do
        {
          *(float32x2_t *)v53 = vcvt_f32_f64(vsubq_f64(*(float64x2_t *)v63, v64));
          v66 = *(double *)(v63 + 16) - *(float *)&v143.i32[2];
          *(float *)(v53 + 8) = v66;
          *(_QWORD *)(v53 + 12) = *(_QWORD *)(v63 + 24);
          v63 += 32;
          v53 += 20;
          --v65;
        }
        while (v65);
      }
      memcpy(v55, *((const void **)&v161 + 1), 4 * v51);
      memcpy(v57, *((const void **)&v162 + 1), 160 * v51);
      memcpy(v59, v163, 40 * v51);
      memcpy(v62, (const void *)v162, 32 * v51);
      v67 = objc_msgSend(v149, "numberOfResizableCapInsets");
      v68 = (const void *)objc_msgSend(objc_retainAutorelease(v149), "resizableCapInsets");
      v69 = objc_retainAutorelease(v60);
      v70 = (void *)objc_msgSend(v69, "resizableCapInsetsBufferWithCount:", v67);
      if (v70)
      {
        memcpy(v70, v68, 16 * v67);
        objc_msgSend(v69, "effectComponent");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v160[0] = MEMORY[0x1E0C809B0];
        v160[1] = 3221225472;
        v160[2] = __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke;
        v160[3] = &unk_1E5119530;
        v72 = v19;
        v160[4] = v19;
        objc_msgSend(v71, "performChanges:", v160);

        -[PXGMetalRenderer test_renderSnapshotHandler](v19, "test_renderSnapshotHandler");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGMetalRenderer test_renderSnapshotHandler](v19, "test_renderSnapshotHandler");
        v74 = (void *)objc_claimAutoreleasedReturnValue();

        v13 = v147;
        v12 = v148;
        if (v74)
        {
          -[PXGMetalRenderer setTest_renderSnapshotHandler:](v19, "setTest_renderSnapshotHandler:", 0);
          objc_msgSend(v151, "renderTexture");
          v137 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v137 = 0;
        }
        v77 = objc_retainAutorelease(v69);
        v78 = objc_msgSend(v77, "uniforms");
        v79 = v78;
        v80 = (uint32x4_t)vceqq_f32(*(float32x4_t *)&v19[1]._nextFrameId, (float32x4_t)xmmword_1A7C0C280);
        v80.i32[3] = v80.i32[2];
        if ((vminvq_u32(v80) & 0x80000000) != 0)
        {
          -[PXGMetalRenderer visibleRectInRenderCoordinates](v19, "visibleRectInRenderCoordinates", v137);
          v102 = v101;
          v104 = v103;
          v106 = v105;
          v108 = v107;
          -[PXGMetalRenderer renderOrigin](v19, "renderOrigin");
          +[PXGMetalRenderer _configureUniformGeometries:renderRect:drawingScale:renderOrigin:](PXGMetalRenderer, "_configureUniformGeometries:renderRect:drawingScale:renderOrigin:", v79, v102, v104, v106, v108, 1.0, v109, v110);
        }
        else
        {
          v81 = 0;
          v82 = *(_OWORD *)&v19[1].super.isa;
          v83 = *(_OWORD *)&v19[1]._device;
          v84 = *(_OWORD *)&v19[1]._yCbCrMatricesBuffer;
          *(_OWORD *)(v78 + 32) = *(_OWORD *)&v19[1]._commandQueue;
          *(_OWORD *)(v78 + 48) = v84;
          *(_OWORD *)v78 = v82;
          *(_OWORD *)(v78 + 16) = v83;
          v85 = *(_OWORD *)&v19[1]._lastOffscreenEffectRenderTime;
          v86 = *(_OWORD *)&v19[1]._offscreenEffectTexture;
          v87 = *(_OWORD *)&v19[1]._clampToZeroSampler;
          *(_OWORD *)(v78 + 96) = *(_OWORD *)&v19[1]._workQueue;
          *(_OWORD *)(v78 + 112) = v87;
          *(_OWORD *)(v78 + 64) = v85;
          *(_OWORD *)(v78 + 80) = v86;
          v88 = *(_OWORD *)&v19[1]._pipelinesLock._os_unfair_lock_opaque;
          v89 = *(_OWORD *)&v19[1]._pipelinesCount;
          v90 = *(_OWORD *)&v19[1]._renderStatePool;
          *(_OWORD *)(v78 + 224) = *(_OWORD *)&v19[1]._compilationQueue;
          *(_OWORD *)(v78 + 240) = v90;
          *(_OWORD *)(v78 + 192) = v88;
          *(_OWORD *)(v78 + 208) = v89;
          *(_QWORD *)(v78 + 256) = v19[1]._nextFrameId;
          v91 = *(float32x4_t *)(v78 + 64);
          v92 = *(float32x4_t *)(v78 + 80);
          v93 = *(float32x4_t *)(v78 + 96);
          v94 = *(float32x4_t *)(v78 + 112);
          v95 = *(_OWORD *)(v78 + 16);
          v96 = *(_OWORD *)(v78 + 32);
          v97 = *(_OWORD *)(v78 + 48);
          v173[0] = *(_OWORD *)v78;
          v173[1] = v95;
          v173[2] = v96;
          v173[3] = v97;
          *(_OWORD *)buf = 0u;
          v176 = 0u;
          v177 = 0u;
          v178 = 0u;
          do
          {
            *(float32x4_t *)&buf[v81 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v91, COERCE_FLOAT(v173[v81])), v92, *(float32x2_t *)&v173[v81], 1), v93, (float32x4_t)v173[v81], 2), v94, (float32x4_t)v173[v81], 3);
            ++v81;
          }
          while (v81 != 4);
          v98 = v176;
          v99 = v177;
          v100 = v178;
          *(_OWORD *)(v78 + 128) = *(_OWORD *)buf;
          *(_OWORD *)(v78 + 144) = v98;
          *(_OWORD *)(v78 + 160) = v99;
          *(_OWORD *)(v78 + 176) = v100;
        }
        objc_msgSend(v151, "scale", v137);
        *(float *)&v111 = v111;
        *(_DWORD *)(v79 + 264) = LODWORD(v111);
        objc_msgSend(v151, "renderSize");
        v144 = v112;
        v142 = v113;
        -[PXGMetalRenderer renderOrigin](v19, "renderOrigin");
        v140 = v115;
        v141 = v114;
        objc_msgSend(v151, "renderBoundsInPoints");
        v139 = v116;
        v118 = v117;
        v120 = v119;
        v122 = v121;
        -[PXGMetalRenderer visibleRectInRenderCoordinates](v19, "visibleRectInRenderCoordinates");
        v124 = v123;
        v126 = v125;
        v128 = v127;
        v130 = v129;
        -[PXGMetalRenderer offscreenEffectScale](v19, "offscreenEffectScale");
        v159[0] = v144;
        v159[1] = v142;
        v159[2] = v141;
        v159[3] = v140;
        v159[4] = v139;
        v159[5] = v118;
        v159[6] = v120;
        v159[7] = v122;
        v159[8] = v124;
        v159[9] = v126;
        v159[10] = v128;
        v159[11] = v130;
        v159[12] = v131;
        v159[13] = objc_msgSend(v151, "colorPixelFormat");
        v159[14] = objc_msgSend(v151, "sampleCount");
        objc_msgSend(v77, "setValues:", v159);
        v155[0] = MEMORY[0x1E0C809B0];
        v155[1] = 3221225472;
        v155[2] = __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2;
        v155[3] = &unk_1E5145688;
        v132 = v73;
        v158 = v132;
        v133 = v138;
        v156 = v133;
        v157 = v19;
        -[PXGMetalRenderer _renderToMainDestination:withCompletionCompletion:](v19, "_renderToMainDestination:withCompletionCompletion:", v77, v155);
        objc_storeStrong((id *)&v19->_lastFrameRenderState, v77);
        -[PXGMetalRenderer recordingSession](v19, "recordingSession");
        v134 = (void *)objc_claimAutoreleasedReturnValue();

        if (v134)
        {
          -[PXGMetalRenderer recordingSession](v19, "recordingSession");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXGMetalRecordingFrameEndEvent event](PXGMetalRecordingFrameEndEvent, "event");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "recordEvent:", v136);

          v72 = v19;
        }
        v72->_didPerformFirstRender = 1;

      }
      else
      {
        PXAssertGetLog();
        v76 = objc_claimAutoreleasedReturnValue();
        v13 = v147;
        v12 = v148;
        if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v67;
          _os_log_fault_impl(&dword_1A6789000, v76, OS_LOG_TYPE_FAULT, "PXGMetalRenderer failed to allocate resizableCapInsetsBuffer with count %ld, unable to render.", buf, 0xCu);
        }

      }
    }
    else
    {
      PXAssertGetLog();
      v75 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v51;
        _os_log_fault_impl(&dword_1A6789000, v75, OS_LOG_TYPE_FAULT, "PXGMetalRenderer failed to allocate metal buffers for numberOfSprites:%ld, unable to render.", buf, 0xCu);
      }

      v13 = v147;
      v12 = v148;
    }
    v16 = v146;
    v17 = v152;

  }
}

- (id)test_renderSnapshotHandler
{
  return self->_test_renderSnapshotHandler;
}

void __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2(uint64_t a1)
{
  void *v1;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v1 = *(void **)(a1 + 48);
  if (v1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 304);
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3;
      v4[3] = &unk_1E5148CE0;
      v6 = v1;
      v5 = *(id *)(a1 + 32);
      dispatch_async(v3, v4);

    }
  }
}

- (void)metalTextureConverter:(id)a3 didCreateTexture:(id)a4 options:(id)a5
{
  id v8;
  PXGMetalTextureConverter *v9;
  PXGMetalTextureConverter *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 didPerformFirstRender;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[2];

  v8 = a4;
  v9 = (PXGMetalTextureConverter *)a3;
  os_unfair_lock_lock(&self->_metalLock);
  v10 = self->_textureConverter;
  os_unfair_lock_unlock(&self->_metalLock);

  if (v10 == v9)
  {
    -[PXGMetalRenderer recordingSession](self, "recordingSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PXGMetalRenderer recordingSession](self, "recordingSession");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXGMetalRecordingTextureCreatedEvent eventWithTexture:options:recordingComponent:](PXGMetalRecordingTextureCreatedEvent, "eventWithTexture:options:recordingComponent:", v8, a5, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recordEvent:", v13);

    }
    v24 = v8;
    v25 = 0;
    memset(v28, 0, sizeof(v28));
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    v27 = 0;
    BYTE8(v28[0]) = 0;
    v14 = objc_msgSend(v8, "shaderFlags");
    if (a5.var0)
    {
      -[PXGMetalRenderer entityManager](self, "entityManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "effectComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "effectForId:", a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (id)objc_msgSend(v17, "shader");
      v14 |= 0x400000u;

    }
    -[PXGMetalRenderer renderDestination](self, "renderDestination");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "colorPixelFormat");

    didPerformFirstRender = self->_didPerformFirstRender;
    if (self->_didPerformFirstRender)
    {
      if (objc_msgSend(v8, "isOpaque"))
      {
        BYTE12(v28[1]) = 0;
        DWORD1(v28[0]) = v14;
        -[PXGMetalRenderer _pipelineForRenderTexture:colorPixelFormat:waitForCompilation:](self, "_pipelineForRenderTexture:colorPixelFormat:waitForCompilation:", &v24, v19, 1);

      }
      BYTE12(v28[1]) = 0;
      DWORD1(v28[0]) = v14 | 0x100000;
      -[PXGMetalRenderer _pipelineForRenderTexture:colorPixelFormat:waitForCompilation:](self, "_pipelineForRenderTexture:colorPixelFormat:waitForCompilation:", &v24, v19, 1);

      if (a5.var0)
        dispatch_sync((dispatch_queue_t)self->_compilationQueue, &__block_literal_global_251);
    }
    BYTE12(v28[1]) = objc_msgSend(v8, "isOpaque");
    DWORD1(v28[0]) = v14;
    -[PXGMetalRenderer _pipelineForRenderTexture:colorPixelFormat:waitForCompilation:](self, "_pipelineForRenderTexture:colorPixelFormat:waitForCompilation:", &v24, v19, didPerformFirstRender);

  }
}

- (unint64_t)destinationColorSpaceName
{
  void *v2;
  unint64_t v3;

  -[PXGMetalRenderer renderDestination](self, "renderDestination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "destinationColorSpaceName");

  return v3;
}

- (BOOL)wantsToDriveRender
{
  return 1;
}

- (BOOL)wantsMipmaps
{
  void *v3;
  _BOOL4 v4;

  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "enableMipmaps"))
    v4 = !-[PXGMetalRenderer lowMemoryMode](self, "lowMemoryMode");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (BOOL)wantsBGRATextures
{
  return 0;
}

- (void)setEntityManager:(id)a3
{
  void *v5;
  PXGEntityManager *v6;

  v6 = (PXGEntityManager *)a3;
  if (self->_entityManager != v6)
  {
    objc_storeStrong((id *)&self->_entityManager, a3);
    -[PXGEntityManager effectComponent](v6, "effectComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", self);

  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- ($1816C37EF4263922E01E14025B0212CC)_handleCompiledRenderPipelineState:(SEL)a3 forColorProgram:(id)a4 shader:(id)a5 shaderFlags:(id)a6 colorPixelFormat:(int)a7 pipelineIndex:(unint64_t)a8 isOpaque:(int64_t)a9
{
  id v18;
  id v19;
  os_unfair_lock_s *p_pipelinesLock;
  $1816C37EF4263922E01E14025B0212CC *pipelines;
  $1816C37EF4263922E01E14025B0212CC *v22;
  id v23;
  id v24;
  $1816C37EF4263922E01E14025B0212CC *result;
  id var3;
  unint64_t v27;
  int v28;
  _BOOL4 var5;
  id v30;

  v30 = a4;
  v18 = a5;
  v19 = a6;
  p_pipelinesLock = &self->_pipelinesLock;
  os_unfair_lock_lock(&self->_pipelinesLock);
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  if (self->_pipelinesCount > a9)
  {
    v28 = a7;
    v27 = a8;
    pipelines = self->_pipelines;
    v22 = &pipelines[a9];
    v23 = v18;
    v24 = v19;
    if (v22->var2 == v23
      && ((var3 = pipelines[a9].var3, var3 == v24) || objc_msgSend(var3, "isEquivalentToShader:", v24))
      && v22->var0 == v28
      && pipelines[a9].var1 == v27)
    {
      var5 = pipelines[a9].var5;

      if (var5 == a10)
      {
        objc_storeStrong(&pipelines[a9].var4, a4);
        __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)retstr, (uint64_t)&pipelines[a9]);
      }
    }
    else
    {

    }
  }
  os_unfair_lock_unlock(p_pipelinesLock);

  return result;
}

- (id)_createPipelineStateForColorProgram:(id)a3 shader:(id)a4 shaderFlags:(int)a5 colorPixelFormat:(unint64_t)a6 depthStencilPixelFormat:(unint64_t)a7 isOpaque:(BOOL)a8
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  int v20;
  unint64_t v21;
  int v22;
  int v23;
  int v24;
  unint64_t v25;
  PXGMetalRenderer *v26;
  id v27;
  MTLDevice *v28;
  MTLLibrary *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  NSObject *v56;
  void *v57;
  id v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  void *v68;
  void *v69;
  void *v70;
  id v72;
  PXGMetalRenderer *v73;
  _BOOL4 v76;
  void *v77;
  void *v78;
  MTLDevice *v79;
  MTLLibrary *v80;
  MTLLibrary *v81;
  id obj;
  id obja;
  void *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t v93[128];
  uint8_t buf[4];
  id v95;
  _DWORD v96[8];
  uint64_t v97;

  v76 = a8;
  v97 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  objc_msgSend(v12, "source");
  v13 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v13, "length");
  kdebug_trace();

  objc_msgSend(v11, "params");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v13) = 4 * (v14 != 0);

  v15 = v13 | (8 * (self->_yCbCrMatricesBuffer != 0));
  objc_msgSend(v11, "TRCLUTs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = 3;
  else
    v17 = 1;

  objc_msgSend(v11, "colorCube");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v17 | (4 * (v18 != 0));

  v20 = objc_msgSend(v11, "numInputs");
  v21 = objc_msgSend(v12, "opcodes");
  v22 = v21;
  v24 = v23;
  v25 = HIDWORD(v21);
  v96[0] = a5;
  v96[1] = v20;
  v78 = v11;
  v96[2] = objc_msgSend(v11, "opcodes");
  v96[3] = v15;
  v96[4] = v19;
  v96[5] = v22;
  v26 = self;
  v96[6] = v25;
  v96[7] = v24;
  v27 = objc_alloc_init(MEMORY[0x1E0CC6AA0]);
  objc_msgSend(v27, "setConstantValues:type:withRange:", v96, 29, 0, 8);
  os_unfair_lock_lock(&self->_metalLock);
  v28 = self->_device;
  v29 = self->_library;
  os_unfair_lock_unlock(&self->_metalLock);
  v84 = v12;
  objc_msgSend(v12, "source");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = v28;
  if (v30)
  {
    if (!self->_didPerformFirstRender && objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      PXGTungstenGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v95 = v12;
        _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_DEFAULT, "Warning, compiling shader %@ on main thread during first render.", buf, 0xCu);
      }

    }
    v80 = v29;
    v72 = v27;
    v73 = self;
    objc_msgSend((id)objc_opt_class(), "mainShaderSource");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v32, "mutableCopy");

    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    objc_msgSend(off_1E50B2CC0, "shaderFunctions");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v90;
      do
      {
        v37 = 0;
        do
        {
          if (*(_QWORD *)v90 != v36)
            objc_enumerationMutation(obj);
          v38 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * v37);
          objc_msgSend(v84, "source");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "sourceForShaderFunction:", v38);
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          if (v40)
          {
            v41 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v38, "name");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "stringWithFormat:", CFSTR("/* <PXGShaderInject(%@)> */\n"), v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            v44 = objc_msgSend(v33, "rangeOfString:", v43);
            v46 = v45;
            if (v44 == 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, v73, CFSTR("PXGMetalRenderer.m"), 591, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("range.location != NSNotFound"));

            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{\n%@\n}\n"), v40);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "insertString:atIndex:", v47, v44 + v46);

          }
          ++v37;
        }
        while (v35 != v37);
        v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
      }
      while (v35);
    }

    objc_msgSend(v84, "parameterBindingDeclarations");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v49, "length"))
      objc_msgSend(v33, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/* <PXGShaderFragmentParameters> */"), v49, 0, 0, objc_msgSend(v33, "length"));
    objc_msgSend(v84, "source");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "otherSource");
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v73;
    if (objc_msgSend(v51, "length"))
      objc_msgSend(v33, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/* <PXGShaderOtherSource> */"), v51, 0, 0, objc_msgSend(v33, "length"));
    v88 = 0;
    v29 = (MTLLibrary *)-[MTLDevice newLibraryWithSource:options:error:](v79, "newLibraryWithSource:options:error:", v33, 0, &v88);
    v52 = v88;

    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "handleFailureInMethod:object:file:lineNumber:description:", a2, v73, CFSTR("PXGMetalRenderer.m"), 608, CFSTR("Failed to create library:%@"), v52);

    }
    v27 = v72;
  }
  v87 = 0;
  v53 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](v29, "newFunctionWithName:constantValues:error:", CFSTR("vertex_main"), v27, &v87);
  v54 = v87;
  v55 = v54;
  if (v53)
  {
    if (!v54)
      goto LABEL_33;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("PXGMetalRenderer.m"), 613, CFSTR("Failed to create vertex function:%@"), v55);

    if (!v55)
      goto LABEL_33;
  }
  PXGTungstenGetLog();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v95 = v55;
    _os_log_impl(&dword_1A6789000, v56, OS_LOG_TYPE_DEBUG, "Warning compiling vertex shader:%@", buf, 0xCu);
  }

LABEL_33:
  v86 = 0;
  v81 = v29;
  v57 = (void *)-[MTLLibrary newFunctionWithName:constantValues:error:](v29, "newFunctionWithName:constantValues:error:", CFSTR("fragment_main"), v27, &v86);
  v58 = v86;
  v59 = v58;
  if (v57)
  {
    if (!v58)
      goto LABEL_38;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("PXGMetalRenderer.m"), 620, CFSTR("Failed to create fragment function:%@"), v59);

    if (!v59)
      goto LABEL_38;
  }
  PXGTungstenGetLog();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v95 = v59;
    _os_log_impl(&dword_1A6789000, v60, OS_LOG_TYPE_DEBUG, "Warning compiling fragment shader:%@", buf, 0xCu);
  }

LABEL_38:
  obja = v55;
  v61 = (void *)objc_opt_new();
  objc_msgSend(v61, "setVertexFunction:", v53);
  objc_msgSend(v61, "setFragmentFunction:", v57);
  objc_msgSend(v61, "setDepthAttachmentPixelFormat:", a7);
  objc_msgSend(v61, "setStencilAttachmentPixelFormat:", a7);
  -[PXGMetalRenderer renderDestination](v26, "renderDestination");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setRasterSampleCount:", objc_msgSend(v62, "sampleCount"));

  objc_msgSend(v61, "colorAttachments");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "objectAtIndexedSubscript:", 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v64, "setPixelFormat:", a6);
  objc_msgSend(v64, "setBlendingEnabled:", !v76);
  objc_msgSend(v64, "setRgbBlendOperation:", 0);
  objc_msgSend(v64, "setAlphaBlendOperation:", 0);
  objc_msgSend(v64, "setSourceRGBBlendFactor:", 1);
  objc_msgSend(v64, "setSourceAlphaBlendFactor:", 1);
  objc_msgSend(v64, "setDestinationRGBBlendFactor:", 5);
  objc_msgSend(v64, "setDestinationAlphaBlendFactor:", 5);
  v85 = 0;
  v65 = (void *)-[MTLDevice newRenderPipelineStateWithDescriptor:error:](v79, "newRenderPipelineStateWithDescriptor:error:", v61, &v85);
  v66 = v85;
  if (!v65)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "handleFailureInMethod:object:file:lineNumber:description:", a2, v26, CFSTR("PXGMetalRenderer.m"), 644, CFSTR("Failed to create render pipeline state:%@"), v66);

  }
  kdebug_trace();

  return v65;
}

- (void)setIsInvertColorsEnabled:(BOOL)a3
{
  id v4;

  if (self->_isInvertColorsEnabled != a3)
  {
    self->_isInvertColorsEnabled = a3;
    -[PXGMetalRenderer delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rendererNeedsUpdate:", self);

  }
}

- (PXGMetalRenderer)initWithRenderDestination:(id)a3 layoutQueue:(id)a4
{
  id v7;
  id v8;
  PXGMetalRenderer *v9;
  PXGMetalRenderer *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *compilationQueue;
  NSObject *v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  dispatch_semaphore_t v19;
  OS_dispatch_semaphore *inFlightSemaphore;
  PXGMetalRenderStatePool *v21;
  void *v22;
  uint64_t v23;
  PXGMetalRenderStatePool *renderStatePool;
  uint64_t v25;
  PXGSpriteDataStore *spriteRenderDataStore;
  PXGMetalOffscreenTexturesStore *v27;
  PXGMetalOffscreenTexturesStore *offscreenTextureCache;
  objc_super v30;

  v7 = a3;
  v8 = a4;
  v30.receiver = self;
  v30.super_class = (Class)PXGMetalRenderer;
  v9 = -[PXGMetalRenderer init](&v30, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_layoutQueue, a4);
    objc_storeStrong((id *)&v10->_renderDestination, a3);
    -[PXGMetalRenderDestination setDelegate:](v10->_renderDestination, "setDelegate:", v10);
    -[PXGMetalRenderDestination setLayoutQueue:](v10->_renderDestination, "setLayoutQueue:", v8);
    v10->_renderDestinationIsPresentable = objc_msgSend(v7, "conformsToProtocol:", &unk_1EEA42100);
    v10->_renderDestinationWantsCompleteRenderingNotification = objc_opt_respondsToSelector() & 1;
    v10->_pipelinesLock._os_unfair_lock_opaque = 0;
    v10->_metalLock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.photos.metalrenderer-compile", v12);
    compilationQueue = v10->_compilationQueue;
    v10->_compilationQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INITIATED, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.photos.metalrenderer-work", v16);
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_semaphore_create(3);
    inFlightSemaphore = v10->_inFlightSemaphore;
    v10->_inFlightSemaphore = (OS_dispatch_semaphore *)v19;

    v10->_offscreenEffectScale = 1.0;
    -[PXGMetalRenderer _setupMetalIfNeeded](v10, "_setupMetalIfNeeded");
    v21 = [PXGMetalRenderStatePool alloc];
    objc_msgSend(v7, "device");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PXGMetalRenderStatePool initWithDevice:queue:](v21, "initWithDevice:queue:", v22, v8);
    renderStatePool = v10->_renderStatePool;
    v10->_renderStatePool = (PXGMetalRenderStatePool *)v23;

    v25 = objc_msgSend(off_1E50B2CF8, "newSpriteDataStore");
    spriteRenderDataStore = v10->_spriteRenderDataStore;
    v10->_spriteRenderDataStore = (PXGSpriteDataStore *)v25;

    v27 = objc_alloc_init(PXGMetalOffscreenTexturesStore);
    offscreenTextureCache = v10->_offscreenTextureCache;
    v10->_offscreenTextureCache = v27;

  }
  return v10;
}

- (void)_setupMetalIfNeeded
{
  void *v3;
  MTLDevice *v4;
  void *v5;
  NSObject *v6;
  MTLDevice *device;
  MTLDevice *v8;
  MTLCommandQueue *v9;
  MTLCommandQueue *commandQueue;
  void *v11;
  void *v12;
  uint64_t v13;
  MTLSamplerState *v14;
  MTLSamplerState *mirrorRepeatSampler;
  MTLSamplerState *v16;
  MTLSamplerState *clampToZeroSampler;
  id v18;
  MTLDepthStencilState *v19;
  MTLDepthStencilState *depthStencil;
  MTLLibrary *v21;
  MTLLibrary *library;
  PXGColorGradingTexturesStore *v23;
  PXGColorGradingTexturesStore *colorGradingTexturesStore;
  void *v25;
  uint64_t v26;
  void *v27;
  MTLDevice *v28;
  unint64_t v29;
  PXGMetalTextureConverter *v30;
  uint64_t v31;
  void *v32;
  PXGMetalTextureConverter *v33;
  PXGMetalTextureConverter *textureConverter;
  void *v35;
  uint8_t v36[16];

  -[PXGMetalRenderer renderDestination](self, "renderDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "device");
  v4 = (MTLDevice *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E50B2B30, "privateContextWithDevice:commandQueue:", v4, self->_commandQueue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    PXGTungstenGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_ERROR, "Metal Device is nil, this is unexpected and will result in a degraded experience.", v36, 2u);
    }

  }
  os_unfair_lock_lock(&self->_metalLock);
  device = self->_device;
  if (device != v4)
  {
    objc_storeStrong((id *)&self->_device, v4);
    -[PXGMetalRenderStatePool setDevice:](self->_renderStatePool, "setDevice:", self->_device);
    -[PXGMetalRenderer _clearPipelines](self, "_clearPipelines");
    v8 = self->_device;
    if (v8)
    {
      v9 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v8, "newCommandQueue");
      commandQueue = self->_commandQueue;
      self->_commandQueue = v9;

      objc_msgSend(off_1E50B2B30, "privateContextWithDevice:commandQueue:", self->_device, self->_commandQueue);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      -[MTLCommandQueue setGPUPriority:](self->_commandQueue, "setGPUPriority:", 4);
      v12 = (void *)objc_opt_new();
      objc_msgSend(v12, "setMinFilter:", 1);
      objc_msgSend(v12, "setMagFilter:", 1);
      objc_msgSend(v12, "setSAddressMode:", 3);
      objc_msgSend(v12, "setRAddressMode:", 3);
      objc_msgSend(v12, "setTAddressMode:", 3);
      if (-[PXGMetalRenderer wantsMipmaps](self, "wantsMipmaps"))
        v13 = 2;
      else
        v13 = 0;
      objc_msgSend(v12, "setMipFilter:", v13);
      v14 = (MTLSamplerState *)-[MTLDevice newSamplerStateWithDescriptor:](self->_device, "newSamplerStateWithDescriptor:", v12);
      mirrorRepeatSampler = self->_mirrorRepeatSampler;
      self->_mirrorRepeatSampler = v14;

      objc_msgSend(v12, "setSAddressMode:", 4);
      objc_msgSend(v12, "setRAddressMode:", 4);
      objc_msgSend(v12, "setTAddressMode:", 4);
      v16 = (MTLSamplerState *)-[MTLDevice newSamplerStateWithDescriptor:](self->_device, "newSamplerStateWithDescriptor:", v12);
      clampToZeroSampler = self->_clampToZeroSampler;
      self->_clampToZeroSampler = v16;

      v18 = objc_alloc_init(MEMORY[0x1E0CC6A88]);
      objc_msgSend(v18, "setDepthWriteEnabled:", 1);
      objc_msgSend(v18, "setDepthCompareFunction:", 3);
      v19 = (MTLDepthStencilState *)-[MTLDevice newDepthStencilStateWithDescriptor:](self->_device, "newDepthStencilStateWithDescriptor:", v18);
      depthStencil = self->_depthStencil;
      self->_depthStencil = v19;

      objc_msgSend(v11, "library");
      v21 = (MTLLibrary *)objc_claimAutoreleasedReturnValue();
      library = self->_library;
      self->_library = v21;

      v23 = (PXGColorGradingTexturesStore *)objc_msgSend(objc_alloc((Class)off_1E50B28B8), "initWithMetalContext:", v11);
      colorGradingTexturesStore = self->_colorGradingTexturesStore;
      self->_colorGradingTexturesStore = v23;

      -[PXGMetalRenderer _setupConstantBuffers](self, "_setupConstantBuffers");
      v5 = v11;
    }
  }
  -[PXGMetalRenderer renderDestination](self, "renderDestination");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "destinationColorSpaceName");

  if (device == v4)
  {
    -[PXGMetalTextureConverter metalRenderContext](self->_textureConverter, "metalRenderContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "device");
    v28 = (MTLDevice *)objc_claimAutoreleasedReturnValue();
    if (v28 == v4)
    {
      v29 = -[PXGMetalTextureConverter destinationColorSpaceName](self->_textureConverter, "destinationColorSpaceName");

      if (v29 == v26)
      {
        os_unfair_lock_unlock(&self->_metalLock);
        goto LABEL_20;
      }
    }
    else
    {

    }
  }
  if (self->_device)
  {
    v30 = [PXGMetalTextureConverter alloc];
    v31 = -[PXGMetalRenderer presentationType](self, "presentationType");
    -[PXGMetalRenderer layoutQueue](self, "layoutQueue");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = -[PXGMetalTextureConverter initWithContext:presentationType:destinationColorspaceName:layoutQueue:](v30, "initWithContext:presentationType:destinationColorspaceName:layoutQueue:", v5, v31, v26, v32);
    textureConverter = self->_textureConverter;
    self->_textureConverter = v33;

  }
  else
  {
    v32 = self->_textureConverter;
    self->_textureConverter = 0;
  }

  -[PXGMetalTextureConverter setDelegate:](self->_textureConverter, "setDelegate:", self);
  os_unfair_lock_unlock(&self->_metalLock);
  -[PXGMetalRenderer delegate](self, "delegate");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "rendererDidChangeTextureConverter:", self);

LABEL_20:
}

- (OS_dispatch_queue)layoutQueue
{
  return self->_layoutQueue;
}

- (void)_setupSquareGeometryBuffer
{
  double v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v9;
  int v10;
  float32x2_t v11;
  float v12;
  float32x2_t v13;
  unint64_t v14;
  float v15;
  BOOL *v16;
  float32x2_t v17;
  BOOL v18;
  BOOL v20;
  BOOL v22;
  BOOL v24;
  MTLBuffer *v26;
  MTLBuffer *squareGeometryBuffer;
  __int128 v28;
  _BYTE v29[32];
  uint64_t v30;

  v4 = 0;
  v5 = 0;
  v30 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)v29 = 0;
  *(_OWORD *)&v29[16] = 0u;
  v28 = 0u;
  LODWORD(v28) = 1065353216;
  __asm { FMOV            V0.4S, #1.0 }
  *(_OWORD *)&v29[4] = _Q0;
  *(_DWORD *)&v29[28] = 1065353216;
  LODWORD(_Q0) = 0;
  LODWORD(v2) = 1.0;
  do
  {
    v9 = 0;
    v10 = v5 - 3 * ((1431655766 * (unint64_t)v5) >> 32);
    if (v10 == 2)
      v11.f32[0] = 1.0;
    else
      v11.f32[0] = 0.0;
    if (v5 - 6 >= 3)
      v12 = 0.0;
    else
      v12 = 1.0;
    v11.f32[1] = v12;
    if (v10 == 1)
      v13.f32[0] = 1.0;
    else
      v13.f32[0] = 0.0;
    v14 = v5 - 3;
    if (v5 - 3 >= 3)
      v15 = 0.0;
    else
      v15 = 1.0;
    v13.f32[1] = v15;
    v16 = (BOOL *)&_setupSquareGeometryBuffer_nineSlicedSquare + 16 * v4 + 11;
    do
    {
      v17 = *(float32x2_t *)&v29[8 * v9 - 16];
      v18 = v5 <= 2 && v17.f32[1] == 1.0 || v17.f32[1] == 0.0 && v14 < 3;
      v20 = v10 == 1 && v17.f32[0] == 1.0 || v17.f32[0] == 0.0 && v10 == 2;
      if (v14 <= 2 && v17.f32[1] == 1.0)
      {
        v22 = 1;
        if (v10)
          goto LABEL_46;
      }
      else
      {
        v22 = v17.f32[1] == 0.0 && v5 - 6 < 3;
        if (v10)
          goto LABEL_46;
      }
      if (v17.f32[0] == 1.0)
      {
        v24 = 1;
        goto LABEL_52;
      }
LABEL_46:
      v24 = v17.f32[0] == 0.0 && v10 == 1;
LABEL_52:
      *(float32x2_t *)(v16 - 11) = vmla_f32(v11, v13, v17);
      *(v16 - 3) = v18;
      *(v16 - 2) = v20;
      *(v16 - 1) = v22;
      *v16 = v24;
      v16 += 16;
      ++v9;
    }
    while (v9 != 6);
    v4 += 6;
    ++v5;
  }
  while (v5 != 9);
  v26 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", &_setupSquareGeometryBuffer_nineSlicedSquare, 864, 0, *(double *)&_Q0, v2, v28, *(_OWORD *)v29, *(_OWORD *)&v29[16]);
  squareGeometryBuffer = self->_squareGeometryBuffer;
  self->_squareGeometryBuffer = v26;

  -[MTLBuffer setLabel:](self->_squareGeometryBuffer, "setLabel:", CFSTR("NineSlicedSquareGeometryBuffer"));
}

- (void)_clearPipelines
{
  os_unfair_lock_s *p_pipelinesLock;
  uint64_t v4;
  int64_t v5;
  $1816C37EF4263922E01E14025B0212CC *v6;
  id var2;
  id var3;
  id var4;

  p_pipelinesLock = &self->_pipelinesLock;
  os_unfair_lock_lock(&self->_pipelinesLock);
  if (self->_pipelinesCount >= 1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = &self->_pipelines[v4];
      var2 = v6->var2;
      v6->var2 = 0;

      var3 = v6->var3;
      v6->var3 = 0;

      var4 = v6->var4;
      v6->var4 = 0;

      ++v5;
      ++v4;
    }
    while (v5 < self->_pipelinesCount);
  }
  self->_pipelinesCount = 0;
  os_unfair_lock_unlock(p_pipelinesLock);
}

- (void)dealloc
{
  objc_super v3;

  -[PXGMetalRenderer _clearPipelines](self, "_clearPipelines");
  free(self->_pipelines);
  v3.receiver = self;
  v3.super_class = (Class)PXGMetalRenderer;
  -[PXGMetalRenderer dealloc](&v3, sel_dealloc);
}

- (void)_setupYCbCrMatrices
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _BYTE *v9;
  char *v10;
  uint64_t i;
  int IsVideoRange;
  float v13;
  MTLBuffer *v14;
  MTLBuffer *yCbCrMatricesBuffer;
  _BYTE *v17;
  _BYTE v18[768];
  uint64_t v19;

  v2 = 0;
  v19 = *MEMORY[0x1E0C80C00];
  v3 = (char *)&unk_1A7C09008;
  v17 = v18;
  do
  {
    v4 = 0;
    ++v2;
    v5 = 1;
    do
    {
      v6 = 0;
      v7 = v5;
      v8 = v4 + 1;
      v9 = &v17[48 * v4];
      v10 = v3;
      do
      {
        for (i = 0; i != 12; i += 4)
        {
          IsVideoRange = PXGYCbCrMatrixIsVideoRange();
          if ((unint64_t)(v6 - 1) < 2 || (v13 = 1.0, !v6) && IsVideoRange)
            v13 = (float)((float)(1 << *((_BYTE *)&ycbcrInputBitDepth + v8)) + -1.0)
                / (float)(1 << *((_BYTE *)&ycbcrInputBitDepth + v8));
          *(float *)&v9[i] = v13 * *(float *)&v10[i];
        }
        ++v6;
        v9 += 12;
        v10 += 12;
      }
      while (v6 != 4);
      v5 = 0;
      v4 = 1;
    }
    while ((v7 & 1) != 0);
    v17 += 96;
    v3 += 48;
  }
  while (v2 != 8);
  v14 = (MTLBuffer *)-[MTLDevice newBufferWithBytes:length:options:](self->_device, "newBufferWithBytes:length:options:", v18, 768, 0);
  yCbCrMatricesBuffer = self->_yCbCrMatricesBuffer;
  self->_yCbCrMatricesBuffer = v14;

  -[MTLBuffer setLabel:](self->_yCbCrMatricesBuffer, "setLabel:", CFSTR("YCbCrMatrices"));
}

- ($1816C37EF4263922E01E14025B0212CC)_pipelineForRenderTexture:(SEL)a3 colorPixelFormat:(id *)a4 waitForCompilation:(unint64_t)a5
{
  _BOOL4 v6;
  void *v11;
  id v12;
  id var1;
  id v14;
  void *v15;
  int var4;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  void *v30;
  os_unfair_lock_s *p_pipelinesLock;
  $1816C37EF4263922E01E14025B0212CC *pipelines;
  id v33;
  id v34;
  int v35;
  int64_t pipelinesCount;
  uint64_t v37;
  int64_t v38;
  $1816C37EF4263922E01E14025B0212CC *v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  int v44;
  $1816C37EF4263922E01E14025B0212CC *v45;
  id v46;
  void *v47;
  void *v48;
  id var2;
  void *v50;
  id v51;
  void *v52;
  id v53;
  NSObject *compilationQueue;
  id v55;
  $1816C37EF4263922E01E14025B0212CC *result;
  id var3;
  int var5;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  void *v63;
  os_unfair_lock_s *v64;
  void *v65;
  _BOOL4 v66;
  id obj;
  $1816C37EF4263922E01E14025B0212CC *v68;
  void *v69;
  int v70;
  void *v71;
  _QWORD block[4];
  id v73;
  id v74;
  PXGMetalRenderer *v75;
  id v76[4];
  int v77;
  char v78;
  id location[2];
  void *v80;
  void *v81;
  void *v82;
  BOOL v83;

  v6 = a6;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = a4->var0;
  var1 = a4->var1;
  v14 = var1;
  v71 = (void *)a5;
  v66 = v6;
  obj = var1;
  if (objc_msgSend(v11, "enableColorMatching"))
  {
    objc_msgSend(v12, "colorProgram");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  var4 = a4->var4;
  if (!objc_msgSend(v11, "enableRoundedCorners"))
    var4 &= ~0x100000u;
  v17 = BYTE4(a4[1].var1);
  if (-[PXGMetalRenderer isInvertColorsEnabled](self, "isInvertColorsEnabled"))
    v18 = 0x200000;
  else
    v18 = 0;
  v19 = v18 | var4;
  v20 = objc_msgSend(v11, "debugOpaque");
  v70 = v17;
  if (v17)
    v21 = 0x1000000;
  else
    v21 = 0x2000000;
  if (v20)
    v22 = v21;
  else
    v22 = 0;
  if (objc_msgSend(v11, "debugExtendedColorRange"))
    v23 = 0x800000;
  else
    v23 = 0;
  v24 = v19 | v22 | v23;
  if (objc_msgSend(v11, "debugResolution"))
    v25 = 0x4000000;
  else
    v25 = 0;
  if (objc_msgSend(v11, "debugColorTransform"))
    v26 = 0x8000000;
  else
    v26 = 0;
  v27 = v25 | v26;
  if (objc_msgSend(v11, "debugMipmaps"))
    v28 = 0x40000000;
  else
    v28 = 0;
  v29 = v24 | v27 | v28;
  -[PXGMetalRenderer renderDestination](self, "renderDestination");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = (void *)objc_msgSend(v30, "depthStencilPixelFormat");

  p_pipelinesLock = &self->_pipelinesLock;
  os_unfair_lock_lock(&self->_pipelinesLock);
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v68 = retstr;
  v69 = v12;
  if (!v12 || objc_msgSend(v12, "renderPipelineIndex") >= self->_pipelinesCount)
    goto LABEL_31;
  pipelines = self->_pipelines;
  v62 = objc_msgSend(v12, "renderPipelineIndex");
  v33 = v15;
  v34 = v14;
  v60 = (uint64_t)&pipelines[v62];
  if (*(id *)(v60 + 16) != v33
    || (var3 = pipelines[v62].var3, var3 != v34) && !objc_msgSend(var3, "isEquivalentToShader:", v34)
    || *(_DWORD *)v60 != (_DWORD)v29
    || (void *)pipelines[v62].var1 != v71)
  {

LABEL_31:
    v35 = 0;
    goto LABEL_32;
  }
  var5 = pipelines[v62].var5;

  if (var5 == v70)
  {
    __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)v68, v60);
    v35 = 1;
  }
  else
  {
    v35 = 0;
  }
  p_pipelinesLock = &self->_pipelinesLock;
LABEL_32:
  pipelinesCount = self->_pipelinesCount;
  if (pipelinesCount >= 1)
  {
    v61 = v35;
    v63 = v11;
    v64 = p_pipelinesLock;
    v37 = 0;
    v38 = 0;
    while (1)
    {
      v39 = self->_pipelines;
      v40 = (uint64_t)&v39[v37];
      v41 = v15;
      v42 = v14;
      if (v39[v37].var2 == v41
        && ((v43 = *(id *)(v40 + 24), v43 == v42) || objc_msgSend(v43, "isEquivalentToShader:", v42))
        && *(_DWORD *)v40 == (_DWORD)v29
        && (void *)v39[v37].var1 == v71)
      {
        v44 = v39[v37].var5;

        if (v44 == v70)
        {
          __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)v68, v40);
          objc_msgSend(v69, "setRenderPipelineIndex:", v38);
          v11 = v63;
          p_pipelinesLock = v64;
          goto LABEL_45;
        }
      }
      else
      {

      }
      ++v38;
      pipelinesCount = self->_pipelinesCount;
      ++v37;
      if (v38 >= pipelinesCount)
      {
        v11 = v63;
        p_pipelinesLock = v64;
        v35 = v61;
        break;
      }
    }
  }
  if (v35)
  {
LABEL_45:
    os_unfair_lock_unlock(p_pipelinesLock);
  }
  else
  {
    self->_pipelinesCount = pipelinesCount + 1;
    -[PXGMetalRenderer _pipelinesLock_resizePipelinesStorageIfNeeded](self, "_pipelinesLock_resizePipelinesStorageIfNeeded");
    v45 = &self->_pipelines[pipelinesCount];
    objc_storeStrong(&v45->var2, v15);
    objc_storeStrong(&v45->var3, obj);
    v45->var0 = v29;
    v45->var1 = (unint64_t)v71;
    v46 = v45->var4;
    v45->var4 = 0;

    v45->var5 = v70;
    __copy_assignment_8_8_t0w16_s16_s24_s32_t40w1((uint64_t)v68, (uint64_t)v45);
    objc_msgSend(v69, "setRenderPipelineIndex:", pipelinesCount);
    os_unfair_lock_unlock(p_pipelinesLock);
    if (v66)
    {
      -[PXGMetalRenderer _createPipelineStateForColorProgram:shader:shaderFlags:colorPixelFormat:depthStencilPixelFormat:isOpaque:](self, "_createPipelineStateForColorProgram:shader:shaderFlags:colorPixelFormat:depthStencilPixelFormat:isOpaque:", v15, v14, v29, v71, v65, v70 != 0);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v59) = v70 != 0;
      -[PXGMetalRenderer _handleCompiledRenderPipelineState:forColorProgram:shader:shaderFlags:colorPixelFormat:pipelineIndex:isOpaque:](self, "_handleCompiledRenderPipelineState:forColorProgram:shader:shaderFlags:colorPixelFormat:pipelineIndex:isOpaque:", v47, v15, v14, v29, v71, pipelinesCount, v59);
      *(_OWORD *)&v68->var0 = *(_OWORD *)location;
      v48 = v80;
      v80 = 0;
      var2 = v68->var2;
      v68->var2 = v48;

      v50 = v81;
      v81 = 0;
      v51 = v68->var3;
      v68->var3 = v50;

      v52 = v82;
      v82 = 0;
      v53 = v68->var4;
      v68->var4 = v52;

      v68->var5 = v83;
    }
    else
    {
      objc_initWeak(location, self);
      compilationQueue = self->_compilationQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __82__PXGMetalRenderer__pipelineForRenderTexture_colorPixelFormat_waitForCompilation___block_invoke;
      block[3] = &unk_1E51194E0;
      objc_copyWeak(v76, location);
      v73 = v15;
      v55 = v14;
      v77 = v29;
      v76[1] = v71;
      v76[2] = v65;
      v78 = v70;
      v76[3] = (id)pipelinesCount;
      v74 = v55;
      v75 = self;
      dispatch_async(compilationQueue, block);

      objc_destroyWeak(v76);
      objc_destroyWeak(location);
    }
  }

  return result;
}

- (CGRect)converRectToRenderCoordinates:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  -[PXGMetalRenderer renderOrigin](self, "renderOrigin");
  PXPointSubtract();
  v7 = width;
  v8 = height;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)renderImmediately
{
  id v2;

  -[PXGMetalRenderer renderDestination](self, "renderDestination");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "renderImmediately");

}

- (void)releaseResources
{
  PXGMetalRenderState *lastFrameRenderState;
  void *v4;
  id v5;

  lastFrameRenderState = self->_lastFrameRenderState;
  self->_lastFrameRenderState = 0;

  -[PXGMetalRenderer renderDestination](self, "renderDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "releaseCachedResources");

  -[PXGMetalOffscreenTexturesStore removeAllTextures](self->_offscreenTextureCache, "removeAllTextures");
  -[PXGMetalRenderStatePool clearReusePool](self->_renderStatePool, "clearReusePool");
  -[PXGMetalRenderer delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rendererNeedsUpdate:", self);

}

- (void)setLowMemoryMode:(BOOL)a3
{
  if (self->_lowMemoryMode != a3)
  {
    self->_lowMemoryMode = a3;
    -[PXGMetalRenderDestination setLowMemoryMode:](self->_renderDestination, "setLowMemoryMode:");
  }
}

- (void)setOffscreenEffectScale:(double)a3
{
  id v5;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_offscreenEffectScale = a3;
    -[PXGMetalRenderer delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rendererNeedsUpdate:", self);

  }
}

- (id)renderSnapshotForRequest:(id *)a3
{
  PXGMetalRenderState *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MTLDevice *device;
  void *v18;
  _QWORD v19[4];
  PXGMetalRenderState *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  MTLDevice *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = self->_lastFrameRenderState;
  if (v4)
  {
    kdebug_trace();
    -[PXGMetalRenderer renderDestination](self, "renderDestination");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v27 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[PXGMetalRenderState values](v4, "values");
    objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 0, (unint64_t)0.0, (unint64_t)0.0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSampleCount:", 0);
    objc_msgSend(v6, "setTextureType:", 2);
    objc_msgSend(v6, "setStorageMode:", 2);
    objc_msgSend(v6, "setUsage:", 7);
    v7 = (void *)-[MTLDevice newTextureWithDescriptor:](self->_device, "newTextureWithDescriptor:", v6);
    objc_msgSend(v7, "setLabel:", CFSTR("PXGMetalRenderer Snapshot"));
    if (v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
      -[NSObject colorAttachments](v8, "colorAttachments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "clearColor");
      objc_msgSend(v10, "setClearColor:");
      objc_msgSend(v10, "setLoadAction:", 2);
      objc_msgSend(v10, "setStoreAction:", 1);
      objc_msgSend(v10, "setTexture:", v7);
      objc_msgSend(v5, "depthStencilTexture");
      v18 = v5;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject depthAttachment](v8, "depthAttachment");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTexture:", v11);
      objc_msgSend(v12, "setLoadAction:", 2);
      objc_msgSend(v12, "setStoreAction:", 0);
      objc_msgSend(v12, "setClearDepth:", 1.0);
      -[NSObject stencilAttachment](v8, "stencilAttachment");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setTexture:", v11);
      objc_msgSend(v13, "setLoadAction:", 2);
      objc_msgSend(v13, "setStoreAction:", 0);
      objc_msgSend(v13, "setClearStencil:", 0);
      -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLabel:", CFSTR("PXGMetalRenderer Snapshot"));
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __45__PXGMetalRenderer_renderSnapshotForRequest___block_invoke;
      v19[3] = &unk_1E51438B0;
      v20 = v4;
      -[PXGMetalRenderer _renderToCommandBuffer:renderState:renderPassDescriptor:withCompletionCompletion:](self, "_renderToCommandBuffer:renderState:renderPassDescriptor:withCompletionCompletion:", v14, v20, v8, v19);
      objc_msgSend(v14, "commit");
      objc_msgSend(v14, "waitUntilScheduled");
      v15 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B2B50), "initWithTexture:", v7);

      v5 = v18;
    }
    else
    {
      PXGTungstenGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        device = self->_device;
        *(_DWORD *)buf = 138412546;
        v30 = v6;
        v31 = 2112;
        v32 = device;
        _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Failed to allocate snapshot texture, descriptor:%@ device:%@", buf, 0x16u);
      }
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_renderToMainDestination:(id)a3 withCompletionCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  intptr_t (*v14)(uint64_t, uint64_t);
  void *v15;
  PXGMetalRenderer *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_inFlightSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  -[PXGMetalRenderer renderDestination](self, "renderDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentRenderPassDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLabel:", CFSTR("PXGMetalRenderer Main Destination"));
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __70__PXGMetalRenderer__renderToMainDestination_withCompletionCompletion___block_invoke;
    v15 = &unk_1E511E568;
    v16 = self;
    v17 = v7;
    -[PXGMetalRenderer _renderToCommandBuffer:renderState:renderPassDescriptor:withCompletionCompletion:](self, "_renderToCommandBuffer:renderState:renderPassDescriptor:withCompletionCompletion:", v10, v6, v9, &v12);
    objc_msgSend(v10, "commit", v12, v13, v14, v15, v16);
    objc_msgSend(v10, "waitUntilScheduled");
    if (self->_renderDestinationIsPresentable)
    {
      -[PXGMetalRenderer renderDestination](self, "renderDestination");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "present");

    }
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_inFlightSemaphore);
  }

}

- (void)_renderToCommandBuffer:(id)a3 renderState:(id)a4 renderPassDescriptor:(id)a5 withCompletionCompletion:(id)a6
{
  id v10;
  int64_t nextFrameId;
  id v12;
  id v13;
  id v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  PXGMetalOffscreenTexturesStore *offscreenTextureCache;
  MTLDevice *device;
  void *v37;
  void *v38;
  PXGMetalRenderPass *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  unint64_t v44;
  PXGMetalRenderPass *v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  void *v49;
  BOOL v50;
  char v51;
  void *v52;
  float v53;
  double v54;
  PXGMetalOffscreenTexturesStore *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  PXGMetalOffscreenTexturesStore *v63;
  uint64_t v64;
  void *v65;
  double v66;
  PXGMetalRenderPass *v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  float v84;
  float v85;
  float v86;
  float v87;
  void *v88;
  void *v89;
  _BOOL4 v90;
  void *v91;
  double v92;
  CGFloat v93;
  double v94;
  CGFloat v95;
  double v96;
  CGFloat v97;
  double v98;
  CGFloat v99;
  double MinX;
  double MinY;
  CGFloat MaxY;
  uint64_t v103;
  float v104;
  float64x2_t v105;
  const __CFString *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t k;
  id v125;
  id v126;
  id v127;
  id v128;
  id v129;
  int64_t v130;
  id v131;
  PXGMetalRenderPass *v132;
  PXGMetalRenderPass *v133;
  uint64_t v134;
  double v135;
  uint64_t v136;
  CGFloat MaxX;
  id v138;
  id v139;
  id obj;
  id obja;
  __int128 v142;
  uint64_t v143;
  id v144;
  id v145;
  PXGMetalRenderer *v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  _QWORD v150[4];
  id v151;
  id v152;
  int64_t v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD v158[4];
  id v159;
  uint64_t v160;
  float32x2_t v161;
  _QWORD v162[4];
  id v163;
  _QWORD v164[4];
  float v165;
  float v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  _QWORD v171[3];
  _QWORD v172[3];
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  _QWORD aBlock[4];
  id v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  uint64_t v186;
  _QWORD v187[3];
  _QWORD v188[4];
  id v189;
  id v190;
  id v191;
  uint64_t *v192;
  _QWORD *v193;
  uint64_t *v194;
  uint64_t *v195;
  _QWORD *v196;
  uint64_t v197;
  uint64_t v198;
  id v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  uint64_t v207;
  unint64_t v208;
  unint64_t v209;
  uint64_t v210;
  double v211;
  uint64_t v212;
  double v213;
  double v214;
  double v215;
  double v216;
  uint64_t v217;
  uint64_t *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t v224;
  _QWORD v225[4];
  uint64_t v226;
  uint64_t *v227;
  uint64_t v228;
  uint64_t v229;
  _QWORD v230[5];
  id v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  uint64_t v239;
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  _QWORD v243[4];
  CGRect v244;
  CGRect v245;
  CGRect v246;
  CGRect v247;

  v243[1] = *MEMORY[0x1E0C80C00];
  v147 = a3;
  v10 = a4;
  v131 = a5;
  v129 = a6;
  nextFrameId = self->_nextFrameId;
  v146 = self;
  self->_nextFrameId = nextFrameId + 1;
  v130 = nextFrameId;
  objc_msgSend(v10, "prepareForRender:");
  v144 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "effectComponent");
  obj = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v138 = (id)objc_msgSend(obj, "effectIds");
  v12 = objc_retainAutorelease(v10);
  v136 = objc_msgSend(v12, "spriteStyles");
  v13 = objc_retainAutorelease(v12);
  v134 = objc_msgSend(v13, "spriteEntities");
  v14 = objc_retainAutorelease(v13);
  v143 = objc_msgSend(v14, "uniforms");
  v15 = *(float *)(v143 + 264);
  v239 = 0;
  v237 = 0u;
  v238 = 0u;
  v235 = 0u;
  v236 = 0u;
  v233 = 0u;
  v234 = 0u;
  v232 = 0u;
  if (v14)
  {
    objc_msgSend(v14, "values");
    v142 = v233;
  }
  else
  {
    v142 = 0uLL;
  }
  PXSizeScale();
  v17 = v16;
  v19 = v18;
  v148 = *((_QWORD *)&v238 + 1);
  objc_msgSend(v131, "colorAttachments");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "clearColor");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  if (v29 > 0.0 && v29 < 1.0)
  {
    v23 = v23 / v29;
    v25 = v25 / v29;
    v27 = v27 / v29;
  }
  objc_msgSend(v14, "captureSpriteTextures");
  v230[0] = 0;
  v230[1] = v230;
  v230[2] = 0x3032000000;
  v230[3] = __Block_byref_object_copy__19448;
  v230[4] = __Block_byref_object_dispose__19449;
  v231 = 0;
  v226 = 0;
  v227 = &v226;
  v228 = 0x2020000000;
  v229 = 0;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v225[0] = 0;
  v225[1] = v225;
  v225[2] = 0x2020000000;
  v225[3] = 0;
  v221 = 0;
  v222 = &v221;
  v223 = 0x2020000000;
  v224 = 0;
  v217 = 0;
  v218 = &v217;
  v219 = 0x2020000000;
  v220 = 0;
  v188[0] = MEMORY[0x1E0C809B0];
  v188[1] = 3221225472;
  v188[2] = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke;
  v188[3] = &unk_1E5119580;
  v192 = &v221;
  v197 = v136;
  v198 = v134;
  v199 = v138;
  v31 = obj;
  v204 = v236;
  v205 = v237;
  v206 = v238;
  v200 = v232;
  v201 = v233;
  v202 = v234;
  v203 = v235;
  v128 = v31;
  v189 = v31;
  v193 = v225;
  v207 = v239;
  v194 = &v217;
  v32 = v14;
  v208 = (unint64_t)v17;
  v209 = (unint64_t)v19;
  v210 = 1;
  v135 = v15;
  v211 = v15;
  v190 = v32;
  v195 = &v226;
  v212 = v148;
  v213 = v23;
  v214 = v25;
  v215 = v27;
  v216 = v29;
  v33 = v144;
  v191 = v33;
  v196 = v230;
  objc_msgSend(v30, "enumerateObjectsUsingBlock:", v188);
  if ((unint64_t)(v218[3] + v222[3]) >= 4)
    v34 = 4;
  else
    v34 = v218[3] + v222[3];
  offscreenTextureCache = v146->_offscreenTextureCache;
  device = v146->_device;
  v187[0] = (unint64_t)v17;
  v187[1] = (unint64_t)v19;
  v187[2] = 1;
  -[PXGMetalOffscreenTexturesStore willRenderFrameWithDevice:size:sampleCount:pixelFormat:preloadTexturesCount:](offscreenTextureCache, "willRenderFrameWithDevice:size:sampleCount:pixelFormat:preloadTexturesCount:", device, v187, v239, v148, v34);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("captureSpriteZPosition"), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v243[0] = v37;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v243, 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "sortUsingDescriptors:", v38);

  v39 = objc_alloc_init(PXGMetalRenderPass);
  -[PXGMetalRenderPass setRenderPassDescriptor:](v39, "setRenderPassDescriptor:", v131);
  -[PXGMetalRenderPass setPixelFormat:](v39, "setPixelFormat:", v148);
  -[PXGMetalRenderPass setRenderRect:](v39, "setRenderRect:", v234, v235);
  objc_msgSend(v33, "addObject:", v39);
  v132 = v39;
  v183 = v236;
  v184 = v237;
  v185 = v238;
  v179 = v232;
  v180 = v233;
  v181 = v234;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_3;
  aBlock[3] = &unk_1E51195D0;
  v186 = v239;
  v182 = v235;
  v145 = v32;
  v178 = v145;
  v40 = _Block_copy(aBlock);
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  obja = v30;
  v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v173, v242, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v174;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v174 != v42)
          objc_enumerationMutation(obja);
        (*((void (**)(void *, _QWORD, _QWORD, double))v40 + 2))(v40, *(_QWORD *)(*((_QWORD *)&v173 + 1) + 8 * i), 0, 1.0);
      }
      v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v173, v242, 16);
    }
    while (v41);
  }

  v44 = 0;
  v133 = 0;
  while (v44 < objc_msgSend(v33, "count"))
  {
    objc_msgSend(v33, "objectAtIndexedSubscript:", v44);
    v45 = (PXGMetalRenderPass *)objc_claimAutoreleasedReturnValue();
    -[PXGMetalRenderPass captureSpriteTexture](v45, "captureSpriteTexture");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
      v48 = objc_msgSend(v46, "behavior") == 2;
    else
      v48 = 0;
    -[PXGMetalRenderPass captureSpriteTexture](v133, "captureSpriteTexture");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (v49)
      v50 = v45 == v132;
    else
      v50 = 1;
    v51 = v50;

    if ((v51 & 1) != 0)
    {
      if (!v47)
        goto LABEL_49;
      if (!v48)
      {
LABEL_36:
        -[PXGMetalRenderPass captureSpriteZPosition](v45, "captureSpriteZPosition");
        -[PXGMetalRenderPass setMinZ:](v45, "setMinZ:");
        v55 = v146->_offscreenTextureCache;
        if (v45)
          -[PXGMetalRenderPass renderSize](v45, "renderSize");
        else
          memset(v172, 0, sizeof(v172));
        -[PXGMetalOffscreenTexturesStore checkoutOffscreenTextureWithSize:pixelFormat:](v55, "checkoutOffscreenTextureWithSize:pixelFormat:", v172, -[PXGMetalRenderPass pixelFormat](v45, "pixelFormat"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (v52)
        {
          v56 = objc_alloc_init(MEMORY[0x1E0CC6B50]);
          objc_msgSend(v56, "colorAttachments");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "objectAtIndexedSubscript:", 0);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          -[PXGMetalRenderPass clearColor](v45, "clearColor");
          objc_msgSend(v58, "setClearColor:");
          objc_msgSend(v58, "setLoadAction:", 2);
          objc_msgSend(v58, "setStoreAction:", 1);
          objc_msgSend(v58, "setTexture:", v52);
          objc_msgSend(v131, "depthAttachment");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setDepthAttachment:", v59);

          objc_msgSend(v131, "stencilAttachment");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setStencilAttachment:", v60);

        }
        else
        {
          v56 = 0;
        }
        -[PXGMetalRenderPass setRenderPassDescriptor:](v45, "setRenderPassDescriptor:", v56);

LABEL_43:
        -[PXGMetalRenderPass offscreenKernelEffect](v45, "offscreenKernelEffect");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "kernel");
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        if (v62)
        {
          v63 = v146->_offscreenTextureCache;
          if (v45)
            -[PXGMetalRenderPass renderSize](v45, "renderSize");
          else
            memset(v171, 0, sizeof(v171));
          -[PXGMetalOffscreenTexturesStore checkoutOffscreenTextureWithSize:pixelFormat:](v63, "checkoutOffscreenTextureWithSize:pixelFormat:", v171, -[PXGMetalRenderPass pixelFormat](v45, "pixelFormat"));
          v64 = objc_claimAutoreleasedReturnValue();

          v52 = (void *)v64;
        }
        -[PXGMetalRenderPass captureSpriteTexture](v45, "captureSpriteTexture");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGMetalRenderPass drawingScale](v45, "drawingScale");
        (*((void (**)(void *, void *, void *, double))v40 + 2))(v40, v65, v52, 1.0 / v66);

LABEL_49:
        if (v48)
          goto LABEL_51;
        goto LABEL_50;
      }
LABEL_34:
      objc_msgSend(v47, "snapshotTexture");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_43;
    }
    if (v48)
    {
      if (!v47)
        goto LABEL_51;
      goto LABEL_34;
    }
    -[PXGMetalRenderPass captureSpriteZPosition](v133, "captureSpriteZPosition");
    *(float *)&v54 = v53 + -0.00000011921;
    -[PXGMetalRenderPass setMaxZ:](v45, "setMaxZ:", v54);
    if (v47)
      goto LABEL_36;
LABEL_50:
    v67 = v45;

    v133 = v67;
LABEL_51:

    ++v44;
  }
  -[PXGMetalRenderer _parseAndSortRenderTextures:willPerformOffscreenPass:](v146, "_parseAndSortRenderTextures:willPerformOffscreenPass:", v145, v227[3] > 0);
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  v139 = v33;
  v68 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v167, v241, 16);
  if (v68)
  {
    v149 = *(_QWORD *)v168;
    do
    {
      for (j = 0; j != v68; ++j)
      {
        if (*(_QWORD *)v168 != v149)
          objc_enumerationMutation(v139);
        v70 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * j);
        objc_msgSend(v70, "renderPassDescriptor");
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (v71)
        {
          objc_msgSend(v70, "renderPassDescriptor");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "renderCommandEncoderWithDescriptor:", v72);
          v73 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "captureSpriteTexture");
          v74 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v70, "renderRect");
          v76 = v75;
          v78 = v77;
          v80 = v79;
          v82 = v81;
          objc_msgSend(v70, "drawingScale");
          +[PXGMetalRenderer _configureUniformGeometries:renderRect:drawingScale:renderOrigin:](PXGMetalRenderer, "_configureUniformGeometries:renderRect:drawingScale:renderOrigin:", v143, v76, v78, v80, v82, v83, v142);
          objc_msgSend(v70, "minZ");
          v85 = v84;
          objc_msgSend(v70, "maxZ");
          v87 = v86;
          v164[0] = MEMORY[0x1E0C809B0];
          v164[1] = 3221225472;
          v164[2] = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_5;
          v164[3] = &__block_descriptor_40_e33_B16__0________NSRange_QQ_fiCBBB_8l;
          v165 = v85;
          v166 = v86;
          v88 = _Block_copy(v164);
          if (v74)
          {
            v162[0] = MEMORY[0x1E0C809B0];
            v162[1] = 3221225472;
            v162[2] = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_9;
            v162[3] = &unk_1E5119678;
            v163 = v88;
            v88 = _Block_copy(v162);
            objc_msgSend(v70, "captureSpriteTexture");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = objc_msgSend(v89, "behavior") == 1;

            if (v90)
            {
              objc_msgSend(v70, "captureSpriteTexture");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "captureRect");
              v93 = v92;
              v95 = v94;
              v97 = v96;
              v99 = v98;

              v244.origin.x = v93;
              v244.origin.y = v95;
              v244.size.width = v97;
              v244.size.height = v99;
              MinX = CGRectGetMinX(v244);
              v245.origin.x = v93;
              v245.origin.y = v95;
              v245.size.width = v97;
              v245.size.height = v99;
              MinY = CGRectGetMinY(v245);
              v246.origin.x = v93;
              v246.origin.y = v95;
              v246.size.width = v97;
              v246.size.height = v99;
              MaxX = CGRectGetMaxX(v246);
              v247.origin.x = v93;
              v247.origin.y = v95;
              v247.size.width = v97;
              v247.size.height = v99;
              MaxY = CGRectGetMaxY(v247);
              *(float *)&v103 = MinX;
              v104 = MinY;
              *((float *)&v103 + 1) = v104;
              v105.f64[0] = MaxX;
              v105.f64[1] = MaxY;
              v158[0] = MEMORY[0x1E0C809B0];
              v158[1] = 3221225472;
              v158[2] = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_10;
              v158[3] = &unk_1E51196A0;
              v159 = v88;
              v160 = v103;
              v161 = vcvt_f32_f64(v105);
              v88 = _Block_copy(v158);

            }
            v106 = CFSTR("Offscreen");
          }
          else
          {
            v106 = CFSTR("Main");
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ pass [%.2f < z <= %.2f]"), v106, v85, v87, v128);
          v107 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "setLabel:", v107);

          objc_msgSend(v70, "setDrawCalls:", -[PXGMetalRenderer _drawSpritesWithRenderPass:renderState:commandEncoder:passingTest:](v146, "_drawSpritesWithRenderPass:renderState:commandEncoder:passingTest:", v70, v145, v73, v88));
          objc_msgSend(v73, "endEncoding");

        }
        objc_msgSend(v70, "offscreenKernelEffect");
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v108, "kernel");
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        if (v109)
        {
          objc_msgSend(v70, "renderPassDescriptor");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "colorAttachments");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "objectAtIndexedSubscript:", 0);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "texture");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v113;
          if (v113)
          {
            v115 = v113;
          }
          else
          {
            objc_msgSend(v70, "captureSpriteTexture");
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "snapshotTexture");
            v115 = (id)objc_claimAutoreleasedReturnValue();

          }
          if (v115)
          {
            objc_msgSend(v70, "captureSpriteTexture");
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "texture");
            v118 = (void *)objc_claimAutoreleasedReturnValue();

            if (v118)
            {
              objc_msgSend(v70, "offscreenKernelEffect");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v119, "kernel");
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v120, "encodeToCommandBuffer:sourceTexture:destinationTexture:targetScale:", v147, v115, v118, v135);

            }
          }

        }
      }
      v68 = objc_msgSend(v139, "countByEnumeratingWithState:objects:count:", &v167, v241, 16);
    }
    while (v68);
  }

  v156 = 0u;
  v157 = 0u;
  v154 = 0u;
  v155 = 0u;
  v121 = obja;
  v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v154, v240, 16);
  if (v122)
  {
    v123 = *(_QWORD *)v155;
    do
    {
      for (k = 0; k != v122; ++k)
      {
        if (*(_QWORD *)v155 != v123)
          objc_enumerationMutation(v121);
        (*((void (**)(void *, _QWORD, _QWORD, double))v40 + 2))(v40, *(_QWORD *)(*((_QWORD *)&v154 + 1) + 8 * k), 0, 1.0);
      }
      v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v154, v240, 16);
    }
    while (v122);
  }

  v125 = v145;
  kdebug_trace();

  v150[0] = MEMORY[0x1E0C809B0];
  v150[1] = 3221225472;
  v150[2] = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_11;
  v150[3] = &unk_1E51196C8;
  v126 = v125;
  v151 = v126;
  v127 = v129;
  v152 = v127;
  v153 = v130;
  objc_msgSend(v147, "addCompletedHandler:", v150);

  _Block_object_dispose(&v217, 8);
  _Block_object_dispose(&v221, 8);
  _Block_object_dispose(v225, 8);
  _Block_object_dispose(&v226, 8);
  _Block_object_dispose(v230, 8);

}

- (void)_parseAndSortRenderTextures:(id)a3 willPerformOffscreenPass:(BOOL)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  float v18;
  float v19;
  float v20;
  float v21;
  void *v22;
  uint64_t v23;
  float v24;
  float v25;
  uint64_t *v26;
  char v27;
  unsigned __int8 v28;
  int v29;
  int v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int *v33;
  float v34;
  uint64_t v35;
  uint64_t v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  float v42;
  float v43;
  _BOOL4 v46;
  int v47;
  uint64_t v48;
  __int128 v49;
  int32x2_t v50;
  float *v51;
  unsigned int v52;
  _BOOL4 v53;
  BOOL v54;
  int v55;
  void *v56;
  int v57;
  uint64_t v58;
  float32x2_t v59;
  float32x2_t v60;
  float v61;
  int v62;
  int v63;
  int v64;
  int v65;
  uint64_t *v66;
  uint64_t *v67;
  BOOL v68;
  BOOL v69;
  uint64_t v70;
  float32x2_t v71;
  void *v72;
  NSObject *v73;
  void *v76;
  void *v77;
  id v78;
  id v79;
  double v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  id obj;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t j;
  uint64_t v90;
  _BOOL4 v91;
  float v92;
  id v93;
  float32x2_t v94;
  float v95;
  float v96;
  int v97;
  void (**v98)(void);
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  int v103;
  uint64_t v104;
  BOOL v105;
  unsigned int *v106;
  void *v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _QWORD aBlock[4];
  id v114;
  id v115;
  __int128 *p_buf;
  uint64_t *v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  char v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  uint8_t v131[128];
  __int128 buf;
  uint64_t v133;
  char *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  _BYTE v139[128];
  uint64_t v140;

  v91 = a4;
  v140 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "hasParsedRenderTextures") & 1) == 0)
  {
    objc_msgSend(v4, "setHasParsedRenderTextures:", 1);
    v78 = v4;
    objc_msgSend(v4, "textures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "opaqueTextures");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "translucentTextures");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "removeAllTextures");
    objc_msgSend(v76, "removeAllTextures");
    objc_msgSend(v78, "effectComponent");
    v93 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v101 = objc_msgSend(v93, "effectIds");
    v127 = 0u;
    v128 = 0u;
    v129 = 0u;
    v130 = 0u;
    obj = v5;
    v6 = 0;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v128;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v128 != v8)
            objc_enumerationMutation(obj);
          v6 += objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * i), "spriteCount");
        }
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
      }
      while (v7);
    }

    objc_msgSend(v78, "renderPassStateForSpriteCount:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v88 = objc_msgSend(v10, "spriteIndexes");
      v83 = objc_msgSend(v11, "textureInfos");
      v12 = objc_retainAutorelease(v78);
      v100 = objc_msgSend(v12, "spriteEntities");
      v13 = objc_retainAutorelease(v12);
      v99 = objc_msgSend(v13, "spriteGeometries");
      v14 = objc_retainAutorelease(v13);
      v82 = objc_msgSend(v14, "spriteOriginalGeometries");
      v15 = objc_retainAutorelease(v14);
      v81 = objc_msgSend(v15, "spriteInfos");
      v16 = objc_retainAutorelease(v15);
      v17 = objc_msgSend(v16, "spriteStyles");
      v18 = *(float *)(objc_msgSend(objc_retainAutorelease(v16), "uniforms") + 264);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v133 = 0x6010000000;
      v134 = PXSharedLibraryAssistantPeopleViewController__ivarWeakLayout;
      v135 = 0u;
      v136 = 0u;
      v137 = 0u;
      v138 = 0u;
      v123 = 0;
      v124 = &v123;
      v125 = 0x2020000000;
      v126 = 0;
      v119 = 0;
      v120 = &v119;
      v121 = 0x2020000000;
      v122 = 0;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __73__PXGMetalRenderer__parseAndSortRenderTextures_willPerformOffscreenPass___block_invoke;
      aBlock[3] = &unk_1E51196F0;
      p_buf = &buf;
      v117 = &v119;
      v118 = &v123;
      v114 = v77;
      v115 = v76;
      v98 = (void (**)(void))_Block_copy(aBlock);
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v79 = obj;
      v86 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
      if (!v86)
        goto LABEL_81;
      v90 = 0;
      v80 = v18;
      v85 = *(_QWORD *)v110;
      v19 = *(float *)off_1E50B8248;
      v20 = *((float *)off_1E50B8248 + 1);
      v21 = *((float *)off_1E50B8248 + 2);
      v95 = *((float *)off_1E50B8248 + 3);
      v94 = *(float32x2_t *)off_1E50B81E8;
      v96 = *((float *)off_1E50B81E8 + 2);
      v92 = *((float *)off_1E50B81E8 + 3);
      v108 = v17;
      while (1)
      {
        for (j = 0; j != v86; ++j)
        {
          if (*(_QWORD *)v110 != v85)
            objc_enumerationMutation(v79);
          v22 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
          v23 = objc_msgSend(v22, "spriteCount");
          if ((_DWORD)v23)
          {
            objc_msgSend(v22, "getSpriteIndexes:maxSpriteCount:", v88 + 4 * v90, v23);
            objc_msgSend(v22, "getTextureInfos:forSpriteIndexes:geometries:spriteStyles:spriteInfos:screenScale:count:", v83 + (v90 << 6), v88 + 4 * v90, v82, v17, v81, v23, v80);
            v103 = objc_msgSend(v22, "isOpaque");
            v102 = objc_msgSend(v22, "isAtlas");
            objc_msgSend(v22, "alpha");
            v25 = v24;
            v104 = objc_msgSend(v22, "shaderFlags");
            if (v104 >= 0x10000)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGMetalRenderer.m"), 1488, CFSTR("Invalid texture shader flags:%u specified for texture:%@"), v104, v22);

            }
            v26 = v124;
            *((_BYTE *)v124 + 24) = 0;
            *((_BYTE *)v120 + 24) = 0;
            v27 = *((_BYTE *)v26 + 24);
            v28 = objc_msgSend(v22, "isCaptureTexture");
            v29 = 0;
            v30 = 0;
            v31 = 0;
            v105 = 0;
            v107 = 0;
            v32 = *((_QWORD *)&buf + 1);
            *(_QWORD *)(*((_QWORD *)&buf + 1) + 32) = v22;
            *(_QWORD *)(v32 + 40) = 0;
            *(_QWORD *)(v32 + 56) = 0;
            *(_QWORD *)(v32 + 64) = 0;
            *(_QWORD *)(v32 + 48) = v90;
            *(_BYTE *)(v32 + 72) = 0;
            *(_BYTE *)(v32 + 92) = v27;
            *(int32x2_t *)(v32 + 76) = vdup_n_s32(0x7F7FFFFFu);
            *(_QWORD *)(v32 + 84) = 0x80000000800000;
            *(_WORD *)(v32 + 93) = v28;
            v23 = v23;
            v33 = (unsigned int *)(v88 + 4 * v90);
            v97 = 1;
            v34 = 3.4028e38;
            v87 = v23;
            while (1)
            {
              v35 = *v33;
              v106 = v33 + 1;
              v36 = *(unsigned int *)(v100 + 4 * v35);
              v37 = *(_DWORD *)(v101 + 4 * v36);
              if (v37 != v30)
                break;
LABEL_26:
              v40 = v17 + 160 * v35;
              v42 = *(float *)(v40 + 36);
              v43 = *(float *)(v40 + 40);
              v41 = v40 + 36;
              v46 = v42 == v19 && v43 == v20 && *(float *)(v41 + 8) == v21 && *(float *)(v41 + 12) == v95;
              v47 = 0;
              if (*(float *)(v17 + 160 * v35 + 56) != 0.0)
              {
                v48 = v17 + 160 * v35;
                v49 = *(_OWORD *)(v48 + 20);
                if (COERCE_FLOAT(*(_QWORD *)(v48 + 28)) == v96)
                {
                  v50 = vceq_f32(*(float32x2_t *)&v49, v94);
                  if ((vand_s8((int8x8_t)v50, (int8x8_t)vdup_lane_s32(v50, 1)).u32[0] & 1) != 0)
                    v47 = *((float *)&v49 + 3) == v92;
                }
                v47 ^= 1u;
              }
              v51 = (float *)(v17 + 160 * v35);
              v52 = *(unsigned __int8 *)(v41 + 34);
              if (!v103 || (*v51 == 1.0 ? (v53 = v46) : (v53 = 0), v53 ? (v54 = v52 > 3) : (v54 = 1), v54))
                v55 = 0;
              else
                v55 = v97 & (v47 ^ 1);
              v56 = v11;
              if ((v102 & 1) != 0)
                v57 = 0;
              else
                v57 = v25 == 0.0 || *v51 == 0.0;
              v58 = v99 + 20 * v35;
              v59 = *(float32x2_t *)v58;
              v60 = *(float32x2_t *)(v58 + 12);
              v61 = *(float *)(v58 + 8) + *(float *)(v108 + 160 * v35 + 52);
              if (v46)
                v62 = 0;
              else
                v62 = 0x100000;
              if (v105)
                v63 = 0x400000;
              else
                v63 = 0;
              if (v47)
                v64 = 0x10000000;
              else
                v64 = 0;
              v65 = v63 | v62 | v64 | v104;
              if (v65 == v29
                && (v66 = v124, *((unsigned __int8 *)v124 + 24) == v55)
                && ((v55 ^ 1 | v91) != 1 || v61 == v34)
                && ((v67 = v120, v37 == v30) ? (v68 = *((unsigned __int8 *)v120 + 24) == v57) : (v68 = 0),
                    v68 ? (v69 = v52 == v31) : (v69 = 0),
                    v69))
              {
                v70 = *((_QWORD *)&buf + 1);
              }
              else
              {
                v98[2]();
                v70 = *((_QWORD *)&buf + 1);
                *(float *)(*((_QWORD *)&buf + 1) + 64) = v61;
                *(_DWORD *)(v70 + 68) = v65;
                *(_BYTE *)(v70 + 72) = v52;
                *(_QWORD *)(v70 + 40) = v107;
                *(_BYTE *)(v70 + 92) = v55;
                v66 = v124;
                v67 = v120;
              }
              v71 = vmul_f32(v60, (float32x2_t)0x3F0000003F000000);
              *(float32x2_t *)(v70 + 76) = vminnm_f32(*(float32x2_t *)(v70 + 76), vsub_f32(v59, v71));
              *(float32x2_t *)(v70 + 84) = vmaxnm_f32(*(float32x2_t *)(v70 + 84), vadd_f32(v59, v71));
              ++*(_QWORD *)(v70 + 56);
              v34 = v61;
              *((_BYTE *)v66 + 24) = v55;
              *((_BYTE *)v67 + 24) = v57;
              v29 = v65;
              v30 = v37;
              v31 = v52;
              --v23;
              v11 = v56;
              v17 = v108;
              v33 = v106;
              if (!v23)
              {
                v98[2]();

                v90 += v87;
                goto LABEL_79;
              }
            }
            if (v37)
            {
              objc_msgSend(v93, "effectForId:", *(unsigned int *)(v101 + 4 * v36));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "shader");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v39)
              {
                v97 = objc_msgSend(v39, "isOpaque");
LABEL_25:
                v105 = v39 != 0;
                v107 = v39;
                goto LABEL_26;
              }
            }
            else
            {

              v39 = 0;
            }
            v97 = 1;
            goto LABEL_25;
          }
LABEL_79:
          ;
        }
        v86 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
        if (!v86)
        {
LABEL_81:

          _Block_object_dispose(&v119, 8);
          _Block_object_dispose(&v123, 8);
          _Block_object_dispose(&buf, 8);
          goto LABEL_85;
        }
      }
    }
    PXAssertGetLog();
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_fault_impl(&dword_1A6789000, v73, OS_LOG_TYPE_FAULT, "PXGMetalRenderer failed to allocate metal buffers for totalSpritesToDraw: %ld, unable to render.", (uint8_t *)&buf, 0xCu);
    }

LABEL_85:
    v4 = v78;
  }

}

- (void)setTest_renderSnapshotHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id test_renderSnapshotHandler;
  id v8;

  v4 = a3;
  if (self->_test_renderSnapshotHandler != v4)
  {
    v8 = v4;
    if (self->_renderDestinationIsPresentable)
    {
      -[PXGMetalRenderer renderDestination](self, "renderDestination");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "test_configureForRenderSnapshot");

    }
    v6 = (void *)objc_msgSend(v8, "copy");
    test_renderSnapshotHandler = self->_test_renderSnapshotHandler;
    self->_test_renderSnapshotHandler = v6;

    v4 = v8;
  }

}

- (int64_t)_drawSpritesWithRenderPass:(id)a3 renderState:(id)a4 commandEncoder:(id)a5 passingTest:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  MTLBuffer *yCbCrMatricesBuffer;
  void *v21;
  void *v22;
  void *v23;
  const void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  PXGMetalRenderer *v33;
  int64_t v34;
  _QWORD aBlock[4];
  id v37;
  id v38;
  id v39;
  PXGMetalRenderer *v40;
  id v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[4];
  _QWORD v59[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v12;
  kdebug_trace();
  objc_msgSend(v14, "pushDebugGroup:", CFSTR("PXGRender Draw Sprites"));
  v15 = objc_retainAutorelease(v11);
  objc_msgSend(v14, "setVertexBytes:length:atIndex:", objc_msgSend(v15, "uniforms"), 272, 0);
  objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", self->_squareGeometryBuffer, 0, 1);
  objc_msgSend(v15, "spriteGeometriesBuffer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", v16, 0, 3);

  objc_msgSend(v15, "spriteStylesBuffer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", v17, 0, 4);

  objc_msgSend(v15, "resizableCapInsetsBuffer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", v18, 0, 6);

  objc_msgSend(v14, "setDepthStencilState:", self->_depthStencil);
  v19 = objc_retainAutorelease(v15);
  objc_msgSend(v14, "setFragmentBytes:length:atIndex:", objc_msgSend(v19, "uniforms"), 272, 0);
  yCbCrMatricesBuffer = self->_yCbCrMatricesBuffer;
  if (yCbCrMatricesBuffer)
    objc_msgSend(v14, "setFragmentBuffer:offset:atIndex:", yCbCrMatricesBuffer, 0, 3);
  objc_msgSend(v19, "currentRenderPassState");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "spriteIndexesMetalBuffer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", v22, 0, 2);

  objc_msgSend(v21, "spriteTextureInfosMetalBuffer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setVertexBuffer:offset:atIndex:", v23, 0, 5);

  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x2020000000;
  v59[3] = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v58[3] = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  if (v13)
    v24 = v13;
  else
    v24 = &__block_literal_global_246;
  v57 = 0;
  v25 = _Block_copy(v24);
  if (v19)
  {
    objc_msgSend(v19, "values");
  }
  else
  {
    v53 = 0;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v46 = 0u;
  }
  v45 = v47;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__PXGMetalRenderer__drawSpritesWithRenderPass_renderState_commandEncoder_passingTest___block_invoke_2;
  aBlock[3] = &unk_1E5119738;
  v26 = v25;
  v41 = v26;
  v27 = v19;
  v37 = v27;
  v28 = v10;
  v38 = v28;
  v29 = v14;
  v39 = v29;
  v40 = self;
  v42 = v58;
  v43 = v59;
  v44 = &v54;
  v30 = _Block_copy(aBlock);
  objc_msgSend(v27, "opaqueTextures");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "drawWithOrder:enumerationBlock:", 1, v30);

  objc_msgSend(v27, "translucentTextures");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "drawWithOrder:enumerationBlock:", 0, v30);

  objc_msgSend(v29, "popDebugGroup");
  v33 = self;
  kdebug_trace();

  v34 = v55[3];
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v59, 8);

  return v34;
}

- (int64_t)_drawRenderTexture:(id *)a3 forRenderPass:(id)a4 withCommandEncoder:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  float v21;
  void *v27;
  int v28;
  __int32 v29;
  uint32x4_t v30;
  uint32x4_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  MTLSamplerState *v37;
  uint64_t v38;
  MTLSamplerState **p_clampToZeroSampler;
  MTLSamplerState *v40;
  NSUInteger length;
  NSUInteger location;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  int64_t v47;
  NSObject *v48;
  os_signpost_id_t v49;
  os_signpost_id_t v50;
  __CFString *v51;
  id var0;
  __CFString *v53;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  int8x16_t v61;
  __int128 v62;
  id v63;
  id v64;
  id v65;
  char v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  uint8_t buf[32];
  _BYTE v72[10];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3->var0;
  -[PXGMetalRenderer interactionState](self, "interactionState");
  v11 = v70;
  v68 = 0u;
  v69 = 0u;
  v67 = 0u;
  -[PXGMetalRenderer _pipelineForRenderTexture:colorPixelFormat:waitForCompilation:](self, "_pipelineForRenderTexture:colorPixelFormat:waitForCompilation:", a3, objc_msgSend(v8, "pixelFormat"), v70 < 1);
  v12 = a3->var1;
  -[PXGMetalRenderer recordingSession](self, "recordingSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[PXGMetalRenderer recordingSession](self, "recordingSession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v67;
    v15 = (id)v68;
    v63 = v15;
    v64 = *((id *)&v68 + 1);
    v65 = (id)v69;
    v66 = BYTE8(v69);
    if (PXGMetalRenderEvent)
    {
      +[PXGMetalRenderEvent eventWithRenderTexture:pipeline:](PXGMetalRenderEvent, "eventWithRenderTexture:pipeline:", a3, &v62);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {

      v16 = 0;
    }
    objc_msgSend(v14, "recordEvent:", v16);

    -[PXGMetalRenderer recordingSession](self, "recordingSession");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "frameState");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spriteIndexes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addRecordedSpriteIndexes:", v19);

  }
  if ((_QWORD)v69)
    goto LABEL_7;
  if (self->_didPerformFirstRender)
    goto LABEL_19;
  dispatch_sync((dispatch_queue_t)self->_compilationQueue, &__block_literal_global_249);
  -[PXGMetalRenderer _pipelineForRenderTexture:colorPixelFormat:waitForCompilation:](self, "_pipelineForRenderTexture:colorPixelFormat:waitForCompilation:", a3, objc_msgSend(v8, "pixelFormat"), v11 < 1);
  v67 = *(_OWORD *)buf;
  v55 = *(_QWORD *)&buf[16];
  *(_QWORD *)&buf[16] = 0;
  v56 = (void *)v68;
  *(_QWORD *)&v68 = v55;

  v57 = *(_QWORD *)&buf[24];
  *(_QWORD *)&buf[24] = 0;
  v58 = (void *)*((_QWORD *)&v68 + 1);
  *((_QWORD *)&v68 + 1) = v57;

  v59 = *(_QWORD *)v72;
  *(_QWORD *)v72 = 0;
  v60 = (void *)v69;
  *(_QWORD *)&v69 = v59;

  BYTE8(v69) = v72[8];
  if ((_QWORD)v69)
  {
LABEL_7:
    objc_msgSend(v9, "setRenderPipelineState:");
    memset(buf, 0, sizeof(buf));
    v20 = objc_msgSend(v10, "isOpaque");
    v21 = 0.0;
    if (v20)
      v21 = 1.0;
    *(float *)buf = v21;
    __asm { FMOV            V0.4S, #1.0 }
    *(_OWORD *)&buf[16] = _Q0;
    objc_msgSend(off_1E50B5CD0, "sharedInstance", _Q0, v62, v63);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "debugSharedTextures");

    if (v28)
    {
      v29 = objc_msgSend(v10, "spriteCount");
      v30.i32[0] = 1;
      v31.i32[0] = v29;
      *(int8x16_t *)&buf[16] = vbslq_s8((int8x16_t)vdupq_lane_s32((int32x2_t)*(_OWORD *)&vcgtq_u32(v31, v30), 0), (int8x16_t)xmmword_1A7C0C290, v61);
    }
    objc_msgSend(v9, "setFragmentBytes:length:atIndex:", buf, 32, 1);
    v32 = (id)v68;
    objc_msgSend(v32, "params");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFragmentBuffer:offset:atIndex:", v33, 0, 2);

    objc_msgSend(v32, "TRCLUTs");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFragmentTexture:atIndex:", v34, 1);

    objc_msgSend(v32, "colorCube");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFragmentTexture:atIndex:", v35, 2);

    v36 = 112;
    if (a3->var5 < 4u)
      v36 = 104;
    v37 = (MTLSamplerState *)*(id *)((char *)&self->super.isa + v36);
    if (v12)
    {
      v38 = objc_msgSend(v12, "sampler");
      p_clampToZeroSampler = &self->_clampToZeroSampler;
      switch(v38)
      {
        case 0:
        case 2:
          goto LABEL_16;
        case 1:
        case 3:
          p_clampToZeroSampler = &self->_mirrorRepeatSampler;
LABEL_16:
          v40 = *p_clampToZeroSampler;

          v37 = v40;
          break;
        default:
          break;
      }
    }
    objc_msgSend(v9, "setFragmentSamplerState:atIndex:", v37, 0);
    location = a3->var2.location;
    length = a3->var2.length;
    objc_msgSend(v9, "setVertexBufferOffset:atIndex:", 4 * location, 2);
    objc_msgSend(v9, "setVertexBufferOffset:atIndex:", location << 6, 5);
    objc_msgSend(v10, "texture");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFragmentTexture:atTextureIndex:samplerState:atSamplerIndex:", v43, 0, v37, 0);
    objc_msgSend(v10, "chromaTexture");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFragmentTexture:atIndex:", v44, 4);

    objc_msgSend(v12, "encodeBindableArgumentsWithEncoder:", v9);
    objc_msgSend(v9, "drawPrimitives:vertexStart:vertexCount:instanceCount:", 3, 0, 54, length);
    v45 = objc_msgSend(v43, "width");
    v46 = objc_msgSend(v43, "height");

    v47 = v46 * v45;
  }
  else
  {
LABEL_19:
    PXGTungstenGetLog();
    v48 = (id)objc_claimAutoreleasedReturnValue();
    v49 = os_signpost_id_make_with_pointer(v48, self);
    if (v49 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v50 = v49;
      if (os_signpost_enabled(v48))
      {
        v51 = CFSTR("YES");
        var0 = a3->var0;
        *(_DWORD *)buf = 134218754;
        if (v11 < 1)
          v51 = CFSTR("NO");
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v51;
        *(_WORD *)&buf[22] = 2112;
        *(_QWORD *)&buf[24] = var0;
        *(_WORD *)v72 = 2112;
        *(_QWORD *)&v72[2] = *((_QWORD *)&v68 + 1);
        v53 = v51;
        _os_signpost_emit_with_name_impl(&dword_1A6789000, v48, OS_SIGNPOST_EVENT, v50, "PXGMetalRendererMissingRenderPipelineState", "Context=%{signpost.telemetry:string2}lu isScrolling:%@ renderTexture:%@ shader:%@", buf, 0x2Au);

      }
    }

    v47 = 0;
  }

  return v47;
}

- (void)effectComponent:(id)a3 prepareForEffect:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD);
  void *v10;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  objc_msgSend(v5, "shader");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[PXGMetalRenderer _preloadShader:](self, "_preloadShader:", v6);
  objc_msgSend(v5, "kernel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__PXGMetalRenderer_effectComponent_prepareForEffect___block_invoke;
    v11[3] = &unk_1E5148D08;
    v11[4] = self;
    v12 = v7;
    v9 = (void (**)(_QWORD))_Block_copy(v11);
    v10 = v9;
    if (self->_didPerformFirstRender)
      v9[2](v9);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

- (void)_preloadShader:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[2];
  __int128 v12;
  _BYTE v13[20];
  uint64_t v14;
  char v15;
  __int16 v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (self->_device)
  {
    v11[0] = 0;
    memset(v13, 0, sizeof(v13));
    v17 = 0;
    v11[1] = v4;
    v12 = 0x7FFFFFFFFFFFFFFFuLL;
    *(_DWORD *)&v13[4] = 0x400000;
    v14 = 0;
    v15 = objc_msgSend(v4, "isOpaque");
    v16 = 0;
    -[PXGMetalRenderer renderDestination](self, "renderDestination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "colorPixelFormat");

    -[PXGMetalRenderer _pipelineForRenderTexture:colorPixelFormat:waitForCompilation:](self, "_pipelineForRenderTexture:colorPixelFormat:waitForCompilation:", v11, v7, 0);
    if (objc_msgSend(v5, "isOpaque"))
    {
      v15 = 0;
      -[PXGMetalRenderer _pipelineForRenderTexture:colorPixelFormat:waitForCompilation:](self, "_pipelineForRenderTexture:colorPixelFormat:waitForCompilation:", v11, v7, 0);

    }
  }

}

- (void)_preloadKernel:(id)a3
{
  MTLDevice *device;

  device = self->_device;
  if (device)
    objc_msgSend(a3, "preloadWithDevice:", device);
}

- (__n128)cameraConfiguration
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 592);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 576);
  *(_OWORD *)(a2 + 176) = v2;
  *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 608);
  v3 = *(_OWORD *)(a1 + 528);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 512);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 560);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 544);
  *(_OWORD *)(a2 + 144) = v4;
  v5 = *(_OWORD *)(a1 + 464);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 448);
  *(_OWORD *)(a2 + 48) = v5;
  v6 = *(_OWORD *)(a1 + 496);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 480);
  *(_OWORD *)(a2 + 80) = v6;
  result = *(__n128 *)(a1 + 432);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 416);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void)setRecordingSession:(id)a3
{
  objc_storeStrong((id *)&self->_recordingSession, a3);
}

- (PXGMetalRendererTestingDelegate)testingDelegate
{
  return (PXGMetalRendererTestingDelegate *)objc_loadWeakRetained((id *)&self->_testingDelegate);
}

- (void)setTestingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_testingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_testingDelegate);
  objc_storeStrong((id *)&self->_layoutQueue, 0);
  objc_storeStrong((id *)&self->_recordingSession, 0);
  objc_storeStrong((id *)&self->_renderDestination, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_test_renderSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_storeStrong((id *)&self->_offscreenTextureCache, 0);
  objc_storeStrong((id *)&self->_colorGradingTexturesStore, 0);
  objc_storeStrong((id *)&self->_textureConverter, 0);
  objc_storeStrong((id *)&self->_lastFrameRenderState, 0);
  objc_storeStrong((id *)&self->_spriteRenderDataStore, 0);
  objc_storeStrong((id *)&self->_renderStatePool, 0);
  objc_storeStrong((id *)&self->_inFlightSemaphore, 0);
  objc_storeStrong((id *)&self->_compilationQueue, 0);
  objc_storeStrong((id *)&self->_depthStencil, 0);
  objc_storeStrong((id *)&self->_clampToZeroSampler, 0);
  objc_storeStrong((id *)&self->_mirrorRepeatSampler, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_offscreenEffectTexture, 0);
  objc_storeStrong((id *)&self->_offscreenTexture, 0);
  objc_storeStrong((id *)&self->_yCbCrMatricesBuffer, 0);
  objc_storeStrong((id *)&self->_squareGeometryBuffer, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

void __53__PXGMetalRenderer_effectComponent_prepareForEffect___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 160);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PXGMetalRenderer_effectComponent_prepareForEffect___block_invoke_2;
  v4[3] = &unk_1E5148D08;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

uint64_t __53__PXGMetalRenderer_effectComponent_prepareForEffect___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_preloadKernel:", *(_QWORD *)(a1 + 40));
}

void __86__PXGMetalRenderer__drawSpritesWithRenderPass_renderState_commandEncoder_passingTest___block_invoke_2(uint64_t a1, uint64_t a2)
{
  char v4;
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  if (!*(_BYTE *)(a2 + 62) && (*(unsigned int (**)(void))(*(_QWORD *)(a1 + 64) + 16))())
  {
    v4 = 1;
    *(_BYTE *)(a2 + 62) = 1;
    if (objc_msgSend(*(id *)a2, "isCaptureTexture") && (v5 = *(id *)a2) != 0)
    {
      v20 = v5;
      v6 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "uniforms");
      objc_msgSend(*(id *)(a1 + 40), "renderRect");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      objc_msgSend(v20, "drawingScale");
      +[PXGMetalRenderer _configureUniformGeometries:renderRect:drawingScale:renderOrigin:](PXGMetalRenderer, "_configureUniformGeometries:renderRect:drawingScale:renderOrigin:", v6, v8, v10, v12, v14, v15, *(double *)(a1 + 96), *(double *)(a1 + 104));
      objc_msgSend(*(id *)(a1 + 48), "setVertexBytes:length:atIndex:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "uniforms"), 272, 0);
      v4 = 0;
    }
    else
    {
      v20 = 0;
    }
    v16 = objc_msgSend(*(id *)(a1 + 56), "_drawRenderTexture:forRenderPass:withCommandEncoder:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v18 = *(_QWORD *)(v17 + 24);
    if (v18 <= v16)
      v18 = v16;
    *(_QWORD *)(v17 + 24) = v18;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) += v16;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    if ((v4 & 1) == 0)
    {
      v19 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "uniforms");
      objc_msgSend(*(id *)(a1 + 40), "renderRect");
      +[PXGMetalRenderer _configureUniformGeometries:renderRect:drawingScale:renderOrigin:](PXGMetalRenderer, "_configureUniformGeometries:renderRect:drawingScale:renderOrigin:", v19);
      objc_msgSend(*(id *)(a1 + 48), "setVertexBytes:length:atIndex:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "uniforms"), 272, 0);
    }

  }
}

uint64_t __86__PXGMetalRenderer__drawSpritesWithRenderPass_renderState_commandEncoder_passingTest___block_invoke()
{
  return 1;
}

double __73__PXGMetalRenderer__parseAndSortRenderTextures_willPerformOffscreenPass___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  _OWORD *v3;
  void *v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  double result;
  _OWORD v9[4];

  v1 = *(_QWORD *)(a1[6] + 8);
  if (*(_QWORD *)(v1 + 56))
  {
    if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
    {
      v3 = (_OWORD *)(v1 + 32);
      if (*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
        v4 = (void *)a1[4];
      else
        v4 = (void *)a1[5];
      v5 = v3[1];
      v9[0] = *v3;
      v9[1] = v5;
      v6 = v3[3];
      v9[2] = v3[2];
      v9[3] = v6;
      objc_msgSend(v4, "addTexture:", v9);
    }
    v7 = *(_QWORD *)(a1[6] + 8);
    *(_QWORD *)(v7 + 48) += *(_QWORD *)(v7 + 56);
    *(_QWORD *)(v7 + 56) = 0;
    *(int32x2_t *)(*(_QWORD *)(a1[6] + 8) + 76) = vdup_n_s32(0x7F7FFFFFu);
    result = 2.84809454e-306;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 84) = 0x80000000800000;
  }
  return result;
}

void __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  BOOL v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  BOOL v35;

  v3 = a2;
  v4 = objc_msgSend(v3, "behavior");
  if (!v4)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v5 = v4 == 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_2;
  v11[3] = &unk_1E5119558;
  v19 = *(_OWORD *)(a1 + 96);
  v20 = *(_QWORD *)(a1 + 112);
  v12 = *(id *)(a1 + 32);
  v25 = *(_OWORD *)(a1 + 184);
  v26 = *(_OWORD *)(a1 + 200);
  v27 = *(_OWORD *)(a1 + 216);
  v28 = *(_QWORD *)(a1 + 232);
  v21 = *(_OWORD *)(a1 + 120);
  v22 = *(_OWORD *)(a1 + 136);
  v23 = *(_OWORD *)(a1 + 152);
  v24 = *(_OWORD *)(a1 + 168);
  v35 = v5;
  v16 = *(_OWORD *)(a1 + 64);
  v6 = *(id *)(a1 + 40);
  v30 = *(_QWORD *)(a1 + 256);
  v17 = *(_QWORD *)(a1 + 80);
  v29 = *(_OWORD *)(a1 + 240);
  v31 = *(_QWORD *)(a1 + 264);
  v13 = v6;
  v14 = v3;
  v32 = *(_QWORD *)(a1 + 272);
  v7 = *(_OWORD *)(a1 + 296);
  v33 = *(_OWORD *)(a1 + 280);
  v34 = v7;
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 88);
  v15 = v8;
  v18 = v9;
  v10 = v3;
  objc_msgSend(v10, "enumerateSpriteIndexes:", v11);

}

void __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3, double a4)
{
  double *v7;
  double *v8;
  double *v9;
  double *v10;
  id v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  float64x2_t (*v18)(uint64_t, unsigned int, _BYTE *);
  void *v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  double *v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;

  v7 = (double *)&v26;
  v8 = (double *)&v26 + 1;
  v9 = (double *)&v27;
  v10 = (double *)&v27 + 1;
  v11 = a2;
  v12 = a3;
  v13 = objc_msgSend(v11, "behavior");
  v22 = 0;
  v23 = (double *)&v22;
  v24 = 0x4010000000;
  v25 = &unk_1A7E74EE7;
  v14 = *(_OWORD *)(a1 + 120);
  v26 = *(_OWORD *)(a1 + 104);
  v27 = v14;
  if (v13)
  {
    v15 = *(void **)(a1 + 32);
    if (v15)
    {
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_4;
      v19 = &unk_1E51195A8;
      v20 = v15;
      v21 = &v22;
      objc_msgSend(v11, "enumerateSpriteIndexes:", &v16);

      v7 = v23 + 4;
      v8 = v23 + 5;
      v9 = v23 + 6;
      v10 = v23 + 7;
    }
  }
  objc_msgSend(v11, "setCaptureRect:", *v7, *v8, *v9, *v10, v16, v17, v18, v19);
  objc_msgSend(v11, "setSpriteGeometries:", objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "spriteGeometries"));
  objc_msgSend(v11, "setDrawingScale:", a4);
  objc_msgSend(v11, "setTexture:", v12);
  _Block_object_dispose(&v22, 8);

}

BOOL __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  float v2;

  v2 = *(float *)(a2 + 32);
  return v2 > *(float *)(a1 + 32) && v2 <= *(float *)(a1 + 36);
}

BOOL __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return *(float *)(a2 + 32) > *(float *)(a1 + 32);
}

BOOL __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  return *(float *)(a2 + 32) <= *(float *)(a1 + 32);
}

uint64_t __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_9(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    return *(_BYTE *)(a2 + 61) == 0;
  return result;
}

uint64_t __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_10(_QWORD *a1, uint64_t a2)
{
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  int8x8_t v8;
  __int8 v9;

  if (!(*(unsigned int (**)(void))(a1[4] + 16))()
    || (v4 = (float32x2_t)a1[5], v5 = *(float32x2_t *)(a2 + 44), (vmvn_s8((int8x8_t)vcge_f32(v5, v4)).u32[0] & 1) != 0)
    || (v6 = *(float32x2_t *)(a2 + 52),
        v7 = (float32x2_t)a1[6],
        v8 = vmvn_s8((int8x8_t)vcge_f32((float32x2_t)vext_s8((int8x8_t)v5, (int8x8_t)v7, 4uLL), (float32x2_t)vext_s8((int8x8_t)v4, (int8x8_t)v6, 4uLL))), ((v8.i32[1] | v8.i32[0]) & 1) != 0))
  {
    v9 = 0;
  }
  else
  {
    v9 = vcge_f32(v7, v6).i8[4];
  }
  return v9 & 1;
}

void __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1A85CE17C]();
  kdebug_trace();
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "keepAlive");
  objc_autoreleasePoolPop(v3);

}

uint64_t __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_8()
{
  return 1;
}

float64x2_t __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_4(uint64_t a1, unsigned int a2, _BYTE *a3)
{
  uint64_t v5;
  float32x2_t v6;
  float64x2_t *v7;
  float64x2_t v8;
  float64x2_t result;

  v5 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "spriteGeometries") + 20 * a2;
  v6 = *(float32x2_t *)(v5 + 12);
  v7 = *(float64x2_t **)(*(_QWORD *)(a1 + 40) + 8);
  v8 = vcvtq_f64_f32(vadd_f32(*(float32x2_t *)v5, vmul_f32(v6, (float32x2_t)0xBF000000BF000000)));
  result = vcvtq_f64_f32(v6);
  v7[2] = v8;
  v7[3] = result;
  *a3 = 1;
  return result;
}

void __101__PXGMetalRenderer__renderToCommandBuffer_renderState_renderPassDescriptor_withCompletionCompletion___block_invoke_2(uint64_t a1, unsigned int a2, _BYTE *a3)
{
  uint64_t v7;
  void *v8;
  _DWORD *v9;
  void *v10;
  uint64_t v11;
  float64x2_t v12;
  uint64x2_t v13;
  uint64_t v14;
  float v17;
  float v18;
  int v19;
  PXGMetalRenderPass *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  float32x2_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  float32x2_t v37;
  uint64x2_t v38;
  uint64x2_t v39;
  uint64_t v40;

  v7 = *(_QWORD *)(a1 + 96);
  if (*(_DWORD *)(*(_QWORD *)(a1 + 112) + 4 * *(unsigned int *)(*(_QWORD *)(a1 + 104) + 4 * a2)))
  {
    objc_msgSend(*(id *)(a1 + 32), "effectForId:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (_DWORD *)(v7 + 160 * a2);
  objc_msgSend(v8, "setScale:", *(double *)(a1 + 216));
  objc_msgSend(v8, "kernel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (*(_BYTE *)(a1 + 312))
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  v11 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "spriteGeometries") + 20 * a2;
  if (*(_BYTE *)(a1 + 312))
  {
    v13 = *(uint64x2_t *)(a1 + 240);
    v14 = *(_QWORD *)(a1 + 256);
  }
  else
  {
    v12 = vmulq_n_f64(vcvtq_f64_f32(*(float32x2_t *)(v11 + 12)), *(double *)(a1 + 264));
    v13 = vcvtq_u64_f64(v12);
    v14 = 1;
  }
  LODWORD(v12.f64[0]) = *v9;
  if (*(float *)v9 != 0.0 && v13.i64[0] != 0 && v13.i64[1] != 0)
  {
    v37 = *(float32x2_t *)(v11 + 12);
    v38 = v13;
    v18 = *(float *)v11;
    v17 = *(float *)(v11 + 4);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v19 = objc_msgSend(*(id *)(a1 + 48), "isOpaque", v12.f64[0]);
    v20 = objc_alloc_init(PXGMetalRenderPass);
    -[PXGMetalRenderPass setCaptureSpriteTexture:](v20, "setCaptureSpriteTexture:", *(_QWORD *)(a1 + 48));
    LODWORD(v21) = *(_DWORD *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "spriteGeometries") + 20 * a2 + 8);
    -[PXGMetalRenderPass setCaptureSpriteZPosition:](v20, "setCaptureSpriteZPosition:", v21);
    if (v10)
      v22 = v8;
    else
      v22 = 0;
    -[PXGMetalRenderPass setOffscreenKernelEffect:](v20, "setOffscreenKernelEffect:", v22);
    if (v10)
      objc_msgSend(v8, "drawingScale");
    else
      v23 = 1.0;
    -[PXGMetalRenderPass setDrawingScale:](v20, "setDrawingScale:", v23);
    v39 = v38;
    v40 = v14;
    -[PXGMetalRenderPass setRenderSize:](v20, "setRenderSize:", &v39);
    if (*(_BYTE *)(a1 + 312))
    {
      v24 = *(double *)(a1 + 184);
      v25 = *(double *)(a1 + 192);
      v26 = *(double *)(a1 + 200);
      v27 = *(double *)(a1 + 208);
    }
    else
    {
      v28 = vmul_f32(v37, (float32x2_t)0x3F0000003F000000);
      v24 = (float)(v18 - v28.f32[0]);
      v25 = (float)(v17 - v28.f32[1]);
      v26 = v37.f32[0];
      v27 = v37.f32[1];
    }
    -[PXGMetalRenderPass setRenderRect:](v20, "setRenderRect:", v24, v25, v26, v27);
    -[PXGMetalRenderPass setPixelFormat:](v20, "setPixelFormat:", PXGOffscreenMetalPixelFormatForDrawableFormat());
    v29 = 0.0;
    v30 = 0.0;
    v31 = 0.0;
    v32 = 0.0;
    if (v19)
    {
      v32 = *(double *)(a1 + 280);
      v31 = *(double *)(a1 + 288);
      v30 = *(double *)(a1 + 296);
      v29 = *(double *)(a1 + 304);
    }
    -[PXGMetalRenderPass setClearColor:](v20, "setClearColor:", v32, v31, v30, v29);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v20);
    v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    if (!v33)
    {
      v34 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v35 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v36 = *(void **)(v35 + 40);
      *(_QWORD *)(v35 + 40) = v34;

      v33 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    }
    objc_msgSend(v33, "addObject:", *(_QWORD *)(a1 + 48));
    *a3 = 1;

  }
}

intptr_t __70__PXGMetalRenderer__renderToMainDestination_withCompletionCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[6];

  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 225))
  {
    v4 = *(NSObject **)(v3 + 304);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PXGMetalRenderer__renderToMainDestination_withCompletionCompletion___block_invoke_2;
    v7[3] = &unk_1E5144EB8;
    v7[4] = v3;
    v7[5] = a2;
    dispatch_async(v4, v7);
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(void))(v5 + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 168));
}

void __70__PXGMetalRenderer__renderToMainDestination_withCompletionCompletion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "renderDestination");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notifyDidCompleteRenderForFrameID:", *(_QWORD *)(a1 + 40));

}

uint64_t __45__PXGMetalRenderer_renderSnapshotForRequest___block_invoke()
{
  return kdebug_trace();
}

uint64_t __111__PXGMetalRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __82__PXGMetalRenderer__pipelineForRenderTexture_colorPixelFormat_waitForCompilation___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v2 = (id *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_createPipelineStateForColorProgram:shader:shaderFlags:colorPixelFormat:depthStencilPixelFormat:isOpaque:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 92));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  v5 = objc_loadWeakRetained(v2);
  v6 = v5;
  if (v5)
  {
    LOBYTE(v8) = *(_BYTE *)(a1 + 92);
    objc_msgSend(v5, "_handleCompiledRenderPipelineState:forColorProgram:shader:shaderFlags:colorPixelFormat:pipelineIndex:isOpaque:", v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 88), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 80), v8);
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
  }

  if ((_QWORD)v13)
  {
    v7 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 304);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__PXGMetalRenderer__pipelineForRenderTexture_colorPixelFormat_waitForCompilation___block_invoke_2;
    block[3] = &unk_1E5147280;
    objc_copyWeak(&v10, v2);
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(v7, block);
    objc_destroyWeak(&v10);
  }

}

void __82__PXGMetalRenderer__pipelineForRenderTexture_colorPixelFormat_waitForCompilation___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rendererNeedsUpdate:", *(_QWORD *)(a1 + 32));

}

+ (id)_loadAndPreprocessShaderSourceWithFilename:(id)a3 extension:(id)a4
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  SEL v31;
  id v32;
  id v33;
  id v34;

  v7 = (void *)MEMORY[0x1E0CB34D0];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLForResource:withExtension:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v11, 4, &v34);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v34;
  v14 = (void *)objc_msgSend(v12, "mutableCopy");

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGMetalRenderer.m"), 196, CFSTR("Error:%@ loading file at path:%@"), v13, v11);

  }
  v33 = v13;
  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("^#include \"(.*)\"$"), 16, &v33);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v33;

  v17 = objc_msgSend(v14, "length");
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __73__PXGMetalRenderer__loadAndPreprocessShaderSourceWithFilename_extension___block_invoke;
  v26[3] = &unk_1E51194B8;
  v31 = a2;
  v32 = a1;
  v27 = v15;
  v28 = v16;
  v29 = v11;
  v18 = v14;
  v30 = v18;
  v19 = v11;
  v20 = v16;
  v21 = v15;
  objc_msgSend(v18, "enumerateSubstringsInRange:options:usingBlock:", 0, v17, 256, v26);
  v22 = v30;
  v23 = v18;

  return v23;
}

+ (NSString)mainShaderSource
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXGMetalRenderer.m"), 212, CFSTR("Dynamic shader source is not currently supported, see rdar://78532560"));

  abort();
}

+ (void)_configureUniformGeometries:(id *)a3 renderRect:(CGRect)a4 drawingScale:(double)a5 renderOrigin:(CGPoint)a6
{
  CGFloat height;
  CGFloat width;
  void *v9;
  float32x4_t v10;
  float32x4_t v11;
  double v12;
  float32x4_t v13;
  float32x4_t v14;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  float32x4_t v21;
  int32x4_t v22;
  float32x2_t v23;
  float32x2_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float32x4_t v28;
  float32x4_t v29;
  int32x4_t v30;
  float32x4_t v31;
  int32x4_t v32;
  int8x16_t v33;
  uint64_t v34;
  __int128 v35;
  float64x2_t v36;
  __int128 v37;
  __int128 v38;
  float32x4_t v39;
  float32x4_t v40;
  float32x4_t v41;
  float32x4_t v42;
  __int128 v43;
  float64x2_t v44;
  __int128 v45;
  __int128 v46;
  float32x4_t v47;
  float32x4_t v48;
  float32x4_t v49;
  float32x4_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  float64x2_t v54;
  __int128 v55;
  __int128 v56;
  float64x2_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  float64x2_t v62;
  __int128 v63;
  float32x4_t v64;
  float32x4_t v65;
  float32x4_t v66;
  __int128 v67;
  CGFloat x;
  CGFloat y;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v74;
  float32x4_t v75;
  float32x4_t v76;
  id v77;
  __int128 v78;
  float64x2_t v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  float64x2_t v83;
  __int128 v84;
  __int128 v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  x = a6.x;
  y = a6.y;
  height = a4.size.height;
  width = a4.size.width;
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v77 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B5CD0, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cameraZoomFactor");

  PXGCameraForVisibleRect();
  v72 = v11;
  v74 = v10;
  if (objc_msgSend(v77, "wantsPerspectiveDebug"))
  {
    objc_msgSend(v77, "perspectiveAngle");
    *(float *)&v12 = v12 + v74.f32[0];
    v13.i32[3] = 0;
    v13.i32[0] = LODWORD(v12);
    *(uint64_t *)((char *)v13.i64 + 4) = *(uint64_t *)((char *)v74.i64 + 4);
    v75 = v13;
  }
  else
  {
    v14 = v74;
    v14.i32[3] = 0;
    v75 = v14;
  }
  v15 = 0.0;
  if ((PXFloatApproximatelyEqualToFloat() & 1) != 0)
  {
    v16 = 0.0;
  }
  else
  {
    PXRectScaleFromCenter();
    v16 = v17;
    v15 = v18;
    width = v19;
    height = v20;
  }
  +[PXGMetalRenderer maxZPosition](PXGMetalRenderer, "maxZPosition");
  if (objc_msgSend(v77, "wantsOrthogonalProjection")
    && (objc_msgSend(v77, "wantsPerspectiveDebug") & 1) == 0)
  {
    v70 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 16);
    v71 = *(float32x4_t *)MEMORY[0x1E0C83FF0];
    v73 = *(float32x4_t *)(MEMORY[0x1E0C83FF0] + 32);
    v67 = *(_OWORD *)(MEMORY[0x1E0C83FF0] + 48);
    PXMatrixMakeTranslation();
    v62 = v44;
    v63 = v43;
    v60 = v46;
    v61 = v45;
    *(CGFloat *)&v43 = v16;
    v44.f64[0] = v15;
    *(CGFloat *)&v45 = width;
    *(CGFloat *)&v46 = height;
    CGRectGetMinX(*(CGRect *)((char *)&v44 - 8));
    v86.origin.x = v16;
    v86.origin.y = v15;
    v86.size.width = width;
    v86.size.height = height;
    CGRectGetMaxX(v86);
    v87.origin.x = v16;
    v87.origin.y = v15;
    v87.size.width = width;
    v87.size.height = height;
    CGRectGetMinY(v87);
    v88.origin.x = v16;
    v88.origin.y = v15;
    v88.size.width = width;
    v88.size.height = height;
    CGRectGetMaxY(v88);
    PXMatrixMakeOrthoProjection();
  }
  else
  {
    v21 = vsubq_f32(v72, v75);
    v22 = (int32x4_t)vmulq_f32(v21, v21);
    v22.i32[0] = vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v22, 2), vadd_f32(*(float32x2_t *)v22.i8, (float32x2_t)vdup_lane_s32(*(int32x2_t *)v22.i8, 1))).u32[0];
    v23 = vrsqrte_f32((float32x2_t)v22.u32[0]);
    v24 = vmul_f32(v23, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v23, v23)));
    v25 = vmulq_n_f32(v21, vmul_f32(v24, vrsqrts_f32((float32x2_t)v22.u32[0], vmul_f32(v24, v24))).f32[0]);
    v26 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v25, (int32x4_t)v25), (int8x16_t)v25, 0xCuLL);
    v27 = vmlaq_f32(vmulq_f32(v26, (float32x4_t)xmmword_1A7C0C2A0), (float32x4_t)xmmword_1A7C0C2B0, v25);
    v28 = v25;
    v29 = (float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v27, (int32x4_t)v27), (int8x16_t)v27, 0xCuLL);
    v30 = (int32x4_t)vmulq_f32(v27, v27);
    v30.i32[0] = vadd_f32((float32x2_t)vdup_lane_s32(*(int32x2_t *)v30.i8, 1), vadd_f32((float32x2_t)*(_OWORD *)&vdupq_laneq_s32(v30, 2), *(float32x2_t *)v30.i8)).u32[0];
    *(float32x2_t *)v25.f32 = vrsqrte_f32((float32x2_t)v30.u32[0]);
    *(float32x2_t *)v25.f32 = vmul_f32(*(float32x2_t *)v25.f32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(*(float32x2_t *)v25.f32, *(float32x2_t *)v25.f32)));
    v31 = vmulq_n_f32(v29, vmul_f32(*(float32x2_t *)v25.f32, vrsqrts_f32((float32x2_t)v30.u32[0], vmul_f32(*(float32x2_t *)v25.f32, *(float32x2_t *)v25.f32))).f32[0]);
    v32 = (int32x4_t)vmlaq_f32(vmulq_f32((float32x4_t)vextq_s8((int8x16_t)vuzp1q_s32((int32x4_t)v31, (int32x4_t)v31), (int8x16_t)v31, 0xCuLL), vnegq_f32(v28)), v31, v26);
    v31.i32[3] = 0;
    v33 = vextq_s8((int8x16_t)vuzp1q_s32(v32, v32), (int8x16_t)v32, 0xCuLL);
    v33.i32[3] = 0;
    v70 = (float32x4_t)v33;
    v71 = v31;
    v28.i32[3] = 0;
    v73 = v28;
    PXMatrixMakeTranslation();
    v34 = 0;
    v78 = v35;
    v79 = v36;
    v80 = v37;
    v81 = v38;
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    do
    {
      *(__int128 *)((char *)&v82 + v34) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v71, COERCE_FLOAT(*(__int128 *)((char *)&v78 + v34))), v70, *(float32x2_t *)((char *)&v78 + v34), 1), v73, *(float32x4_t *)((char *)&v78 + v34), 2), (float32x4_t)xmmword_1A7C0C2C0, *(float32x4_t *)((char *)&v78 + v34), 3);
      v34 += 16;
    }
    while (v34 != 64);
    v67 = xmmword_1A7C0C2C0;
    v62 = v83;
    v63 = v82;
    v60 = v85;
    v61 = v84;
    PXMatrixMakePerspectiveProjection();
  }
  v76 = v39;
  v65 = v41;
  v66 = v40;
  v64 = v42;
  PXMatrixMakeScale();
  v51 = 0;
  v78 = v63;
  v79 = v62;
  v80 = v61;
  v81 = v60;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  do
  {
    *(__int128 *)((char *)&v82 + v51) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v47, COERCE_FLOAT(*(__int128 *)((char *)&v78 + v51))), v48, *(float32x2_t *)((char *)&v78 + v51), 1), v49, *(float32x4_t *)((char *)&v78 + v51), 2), v50, *(float32x4_t *)((char *)&v78 + v51), 3);
    v51 += 16;
  }
  while (v51 != 64);
  v52 = 0;
  v53 = v82;
  v54 = v83;
  v55 = v84;
  v56 = v85;
  *(_OWORD *)&a3->var4 = v82;
  *(float64x2_t *)&a3[4].var4 = v54;
  *(_OWORD *)&a3[8].var4 = v55;
  *(_OWORD *)&a3[12].var4 = v56;
  *(float32x4_t *)&a3[16].var4 = v76;
  *(float32x4_t *)&a3[20].var4 = v66;
  *(float32x4_t *)&a3[24].var4 = v65;
  *(float32x4_t *)&a3[28].var4 = v64;
  *(float32x4_t *)&a3[48].var4 = v71;
  *(float32x4_t *)&a3[52].var4 = v70;
  *(float32x4_t *)&a3[56].var4 = v73;
  *(_OWORD *)&a3[60].var4 = v67;
  v78 = v53;
  v79 = v54;
  v80 = v55;
  v81 = v56;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  do
  {
    *(__int128 *)((char *)&v82 + v52) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v76, COERCE_FLOAT(*(__int128 *)((char *)&v78 + v52))), v66, *(float32x2_t *)((char *)&v78 + v52), 1), v65, *(float32x4_t *)((char *)&v78 + v52), 2), v64, *(float32x4_t *)((char *)&v78 + v52), 3);
    v52 += 16;
  }
  while (v52 != 64);
  v57 = v83;
  v58 = v84;
  v59 = v85;
  *(_OWORD *)&a3[32].var4 = v82;
  *(float64x2_t *)&a3[36].var4 = v57;
  *(_OWORD *)&a3[40].var4 = v58;
  *(_OWORD *)&a3[44].var4 = v59;
  v57.f64[0] = x;
  v57.f64[1] = y;
  *(float32x2_t *)&a3[64].var4 = vcvt_f32_f64(v57);

}

void __73__PXGMetalRenderer__loadAndPreprocessShaderSourceWithFilename_extension___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = objc_msgSend(v7, "length");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PXGMetalRenderer__loadAndPreprocessShaderSourceWithFilename_extension___block_invoke_2;
  v11[3] = &unk_1E5119490;
  v12 = v7;
  v16 = *(_OWORD *)(a1 + 64);
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v15 = *(id *)(a1 + 56);
  v17 = a3;
  v18 = a4;
  v10 = v7;
  objc_msgSend(v8, "enumerateMatchesInString:options:range:usingBlock:", v10, 0, 0, v9, v11);

}

void __73__PXGMetalRenderer__loadAndPreprocessShaderSourceWithFilename_extension___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(a2, "rangeAtIndex:", 1);
  objc_msgSend(v3, "substringWithRange:", v4, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByDeletingPathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXGMetalRenderer _loadAndPreprocessShaderSourceWithFilename:extension:](PXGMetalRenderer, "_loadAndPreprocessShaderSourceWithFilename:extension:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("PXGMetalRenderer.m"), 204, CFSTR("Error:%@ including file at path:%@"), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
  objc_msgSend(*(id *)(a1 + 56), "replaceCharactersInRange:withString:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v8);

}

@end
