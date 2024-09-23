@implementation PXGDecorationTextureProvider

- (_NSRange)requestTexturesForSpritesInRange:(_PXGSpriteIndexRange)a3 geometries:(id *)a4 styles:(id *)a5 infos:(id *)a6 inLayout:(id)a7
{
  id v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  int v27;
  float32x2_t *v28;
  float32x2_t v29;
  void *v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  unsigned int v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  NSUInteger v53;
  NSUInteger v54;
  uint64_t v55;
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  id *v60;
  id v61;
  id v62;
  NSUInteger v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  char v70;
  void *v71;
  uint64_t v72;
  int v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  id *v79;
  void *v80;
  uint64_t v81;
  $786F7D2F4E5B3A0CBB66DF574B7D98CF *v82;
  dispatch_queue_t queuea;
  NSObject *queue;
  void *v85;
  void (**v86)(void *, _QWORD);
  unsigned int v87;
  NSObject *v88;
  void *v89;
  void *v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  _QWORD *v96;
  id v97[2];
  __int128 v98;
  __int128 v99;
  __int128 v100;
  float64x2_t v101;
  double v102;
  uint64_t v103;
  int v104;
  __int128 v105;
  int v106;
  _QWORD v107[4];
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  int v112;
  _QWORD v113[5];
  id v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  int v118;
  _QWORD block[4];
  id v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  _OWORD v128[2];
  __int128 v129;
  __int128 v130;
  __int128 v131;
  id location;
  _QWORD v133[4];
  id v134;
  id v135;
  NSObject *v136;
  id v137;
  NSObject *v138;
  id v139;
  id v140;
  id *v141;
  id v142;
  id v143;
  uint64_t *v144;
  uint8_t *v145;
  _QWORD *v146;
  uint64_t *v147;
  uint64_t *v148;
  uint64_t *v149;
  uint64_t *v150;
  _QWORD v151[5];
  id v152;
  uint64_t v153;
  uint64_t *v154;
  uint64_t v155;
  char v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  char v160;
  uint64_t v161;
  uint64_t *v162;
  uint64_t v163;
  char v164;
  uint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD aBlock[5];
  uint64_t v170;
  uint64_t *v171;
  uint64_t v172;
  uint64_t (*v173)(uint64_t, uint64_t);
  void (*v174)(uint64_t);
  id v175;
  uint64_t v176;
  uint64_t *v177;
  uint64_t v178;
  int v179;
  objc_super v180;
  uint8_t buf[8];
  __int128 v182;
  void *v183;
  __int128 v184;
  __int128 v185;
  uint64_t v186;
  _NSRange result;

  v186 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v180.receiver = self;
  v180.super_class = (Class)PXGDecorationTextureProvider;
  v82 = a6;
  v65 = -[PXGTextureProvider requestTexturesForSpritesInRange:geometries:styles:infos:inLayout:](&v180, sel_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout_, a3, a4, a5, a6, v12);
  v63 = v13;
  v91 = v12;
  v87 = objc_msgSend(v91, "numberOfDecoratingSpritesPerDecoratedSprite");
  if (v87)
  {
    objc_msgSend(v91, "decoratedLayout");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "displayAssetSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = HIDWORD(*(unint64_t *)&a3);
    objc_msgSend(v15, "displayAssetFetchResultForSpritesInRange:inLayout:", (a3.location / v87) | ((unint64_t)((a3.location + a3.length - 1) / v87 - a3.location / v87 + 1) << 32), v14);
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v91, "assetBadgeDecorationSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "assetProgressDecorationSource");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "selectionDecorationSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "highlightDecorationSource");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "solidColorOverlayDecorationSource");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "dragDecorationSource");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "debugDecorationSource");
    queuea = (dispatch_queue_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "viewDecorationSource");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGDecorationTextureProvider overlayViewSource](self, "overlayViewSource");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "selectedSpriteIndexesInLayout:", v14);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "highlightedSpriteIndexesInLayout:", v14);
    v79 = (id *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "draggingSpriteIndexesInLayout:", v14);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "solidColorOverlayForLayout:", v14);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v91, "debugDecorationIndex");
    v70 = objc_opt_respondsToSelector();
    v176 = 0;
    v177 = &v176;
    v178 = 0x2020000000;
    v179 = -1;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v182 = buf;
    *((_QWORD *)&v182 + 1) = 0x4010000000;
    v183 = &unk_1A7E74EE7;
    v184 = 0u;
    v185 = 0u;
    v170 = 0;
    v171 = &v170;
    v172 = 0x3032000000;
    v173 = __Block_byref_object_copy__60721;
    v174 = __Block_byref_object_dispose__60722;
    v175 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke;
    aBlock[3] = &unk_1E511EAE8;
    aBlock[4] = &v170;
    v19 = _Block_copy(aBlock);
    v165 = 0;
    v166 = &v165;
    v167 = 0x2020000000;
    v168 = 0x7FFFFFFFFFFFFFFFLL;
    v161 = 0;
    v162 = &v161;
    v163 = 0x2020000000;
    v164 = 0;
    v157 = 0;
    v158 = &v157;
    v159 = 0x2020000000;
    v160 = 0;
    v153 = 0;
    v154 = &v153;
    v155 = 0x2020000000;
    v156 = 0;
    v151[0] = 0;
    v151[1] = v151;
    v151[2] = 0x3032000000;
    v151[3] = __Block_byref_object_copy__60721;
    v151[4] = __Block_byref_object_dispose__60722;
    v152 = 0;
    v133[0] = MEMORY[0x1E0C809B0];
    v133[1] = 3221225472;
    v133[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2;
    v133[3] = &unk_1E511EB10;
    v144 = &v176;
    v69 = v89;
    v134 = v69;
    v77 = v17;
    v135 = v77;
    v145 = buf;
    v88 = v14;
    v136 = v88;
    v56 = v85;
    v137 = v56;
    v62 = v19;
    v143 = v62;
    v146 = v151;
    v58 = queuea;
    v138 = v58;
    v147 = &v165;
    v57 = v18;
    v139 = v57;
    v148 = &v161;
    v59 = v80;
    v140 = v59;
    v149 = &v157;
    v60 = v79;
    v141 = v60;
    v150 = &v153;
    v61 = v78;
    v142 = v61;
    v86 = (void (**)(void *, _QWORD))_Block_copy(v133);
    objc_initWeak(&location, self);
    -[PXGTextureProvider requestQueue](self, "requestQueue");
    queue = objc_claimAutoreleasedReturnValue();
    v20 = v91;
    objc_msgSend(v91, "displayScale");
    v22 = v21;
    objc_msgSend(v91, "textureScale");
    v24 = v23;
    objc_msgSend(v91, "viewEnvironment");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v91, "userInterfaceDirection");
    v81 = objc_msgSend(v91, "decorationSizeClass");
    -[PXGDecorationTextureProvider badgeDrawingHelper](self, "badgeDrawingHelper");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3.length)
    {
      v25 = v22 * v24;
      v26 = v76;
      if (v64)
        v26 = v64;
      v71 = v26;
      v27 = (int)v65;
      do
      {
        v28 = (float32x2_t *)((char *)v82 + 40 * a3.location);
        v29 = v28[1];
        v30 = (void *)objc_msgSend(v20, "decoratingTypeForSpriteIndex:", a3);
        v86[2](v86, a3.location / v87);
        v130 = 0u;
        v131 = 0u;
        v129 = 0u;
        if (v90)
        {
          v31 = *((_BYTE *)v154 + 24);
          v32 = *((_BYTE *)v158 + 24);
          v33 = *((unsigned __int8 *)v162 + 24);
          v34 = v166[3];
          v35 = *((unsigned int *)v177 + 6);
          v36 = *(_OWORD *)(v182 + 48);
          v128[0] = *(_OWORD *)(v182 + 32);
          v128[1] = v36;
          BYTE1(v55) = v31;
          LOBYTE(v55) = v32;
          objc_msgSend(v90, "decorationSpriteInfoForDecoratedSpriteIndex:decorationType:decoratingLayout:assetDecorationInfo:overallSelectionOrder:isItemSelected:isItemHighlighted:isItemDragged:", v35, v30, v91, v128, v34, v33, v55);
        }
        -[NSObject spriteDataStore](v88, "spriteDataStore");
        v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v38 = objc_msgSend(v37, "styles");
        v128[0] = *(_OWORD *)(v38 + 160 * *((unsigned int *)v177 + 6) + 36);

        *((_QWORD *)&v129 + 1) = v81;
        if (v28->i8[0] == 1)
        {
          v39 = v76;
          if (v30 == (void *)3)
            v39 = v71;
          v40 = v39;
          v41 = objc_msgSend(v40, "viewClassForSpriteAtIndex:inLayout:", a3, v91);
          if (v41)
          {
            objc_msgSend(v91, "captionDecorationSource");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "wantsCaptionDecorationsInLayout:", v88);
            v44 = objc_msgSend(v77, "wantsInteractiveFavoriteBadgesInLayout:", v88);
            v45 = objc_msgSend(v77, "wantsFileSizeBadgesInLayout:", v88);
            v46 = v43;
            if (v44)
              v46 = v43 | 2;
            if (v45)
              v46 |= 8uLL;
            if (*((_BYTE *)v162 + 24))
              v47 = v46 | 4;
            else
              v47 = v46;
            if ((v70 & 1) != 0)
            {
              objc_msgSend(v69, "objectAtIndex:", *((unsigned int *)v177 + 6));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v77, "shouldShowSavedToLibraryBadgeForAsset:inLayout:", v48, v91))
                v47 |= 0x10uLL;

            }
            objc_msgSend(v40, "viewUserDataForSpriteAtIndex:inLayout:", a3, v91);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (void *)objc_msgSend(v49, "copyWithZone:", 0);

            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3;
            block[3] = &unk_1E511EB38;
            v120 = v50;
            v51 = v50;
            objc_copyWeak(&v121, &location);
            v122 = v129;
            v123 = v130;
            v124 = v131;
            v125 = v41;
            v126 = v47;
            v127 = v27;
            dispatch_async(queue, block);
            objc_destroyWeak(&v121);

          }
          else if (+[PXGAssetDecorationView wantsDecorationViewForConfiguration:](PXGAssetDecorationView, "wantsDecorationViewForConfiguration:", v171[5]))
          {
            v113[0] = MEMORY[0x1E0C809B0];
            v113[1] = 3221225472;
            v113[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_4;
            v113[3] = &unk_1E511EB60;
            objc_copyWeak(&v114, &location);
            v115 = v129;
            v116 = v130;
            v117 = v131;
            v113[4] = &v170;
            v118 = v27;
            dispatch_async(queue, v113);
            objc_destroyWeak(&v114);
          }
          else
          {
            *(_QWORD *)&v129 = 0;
            v107[0] = MEMORY[0x1E0C809B0];
            v107[1] = 3221225472;
            v107[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_5;
            v107[3] = &unk_1E511EB88;
            objc_copyWeak(&v108, &location);
            v109 = v129;
            v110 = v130;
            v111 = v131;
            v112 = v27;
            dispatch_async(queue, v107);
            objc_destroyWeak(&v108);
          }

        }
        else
        {
          v92[0] = MEMORY[0x1E0C809B0];
          v92[1] = 3221225472;
          v92[2] = __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_6;
          v92[3] = &unk_1E511EBB0;
          v96 = v151;
          v97[1] = v30;
          v104 = v73;
          objc_copyWeak(v97, &location);
          v98 = v129;
          v99 = v130;
          v100 = v131;
          v93 = v90;
          v94 = v74;
          v101 = vcvtq_f64_f32(v29);
          v105 = v128[0];
          v102 = v25;
          v106 = v27;
          v95 = v75;
          v103 = v72;
          dispatch_async(queue, v92);

          objc_destroyWeak(v97);
        }
        ++v27;
        a3 = (_PXGSpriteIndexRange)(a3.location + 1);
        --v16;
        v20 = v91;
      }
      while (v16);
    }

    objc_destroyWeak(&location);
    _Block_object_dispose(v151, 8);

    _Block_object_dispose(&v153, 8);
    _Block_object_dispose(&v157, 8);
    _Block_object_dispose(&v161, 8);
    _Block_object_dispose(&v165, 8);

    _Block_object_dispose(&v170, 8);
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v176, 8);

    v52 = v88;
  }
  else
  {
    PXAssertGetLog();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
      *(_QWORD *)buf = 67109378;
      LOWORD(v182) = 2112;
      *(_QWORD *)((char *)&v182 + 2) = v91;
      _os_log_fault_impl(&dword_1A6789000, v52, OS_LOG_TYPE_FAULT, "unexpected numberOfDecoratingSpritesPerDecoratedSprite %i for decoratingLayout %@, failing gracefully", buf, 0x12u);
    }
  }

  v53 = (NSUInteger)v65;
  v54 = v63;
  result.length = v54;
  result.location = v53;
  return result;
}

- (PXGViewSource)overlayViewSource
{
  return (PXGViewSource *)objc_loadWeakRetained((id *)&self->_overlayViewSource);
}

uint64_t __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_2(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;

  v2 = *(_QWORD *)(*(_QWORD *)(result + 112) + 8);
  if (*(_DWORD *)(v2 + 24) != a2)
  {
    v3 = result;
    *(_DWORD *)(v2 + 24) = a2;
    v4 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(result + 112) + 8) + 24);
    if (objc_msgSend(*(id *)(result + 32), "count") > v4)
    {
      objc_msgSend(*(id *)(v3 + 32), "objectAtIndex:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 112) + 8) + 24));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(v3 + 40);
      if (v6)
      {
        objc_msgSend(v6, "assetDecorationInfoForAsset:atSpriteIndex:inLayout:", v5, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 112) + 8) + 24), *(_QWORD *)(v3 + 48));
        v7 = *(_QWORD *)(*(_QWORD *)(v3 + 120) + 8);
        *(_OWORD *)(v7 + 32) = v17;
        *(_OWORD *)(v7 + 48) = v18;
      }
      v8 = *(void **)(v3 + 56);
      if (v8)
      {
        objc_msgSend(v8, "loadStatusForAsset:atSpriteIndex:inLayout:", v5, *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 112) + 8) + 24), *(_QWORD *)(v3 + 48));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(v3 + 104) + 16))();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLoadStatus:", v9);

      }
      objc_msgSend(*(id *)(v3 + 64), "debugDecorationAtSpriteIndex:asset:inLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 112) + 8) + 24), v5, *(_QWORD *)(v3 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      v13 = *(_QWORD *)(*(_QWORD *)(v3 + 128) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

    }
    v15 = *(void **)(v3 + 72);
    if (v15)
      v16 = objc_msgSend(v15, "overallSelectionOrderAtSpriteIndex:inLayout:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 112) + 8) + 24), *(_QWORD *)(v3 + 48));
    else
      v16 = 0x7FFFFFFFFFFFFFFFLL;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 136) + 8) + 24) = v16;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 144) + 8) + 24) = objc_msgSend(*(id *)(v3 + 80), "containsIndex:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 112)+ 8)+ 24));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 152) + 8) + 24) = objc_msgSend(*(id *)(v3 + 88), "containsIndex:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 112)+ 8)+ 24));
    result = objc_msgSend(*(id *)(v3 + 96), "containsIndex:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v3 + 112) + 8) + 24));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v3 + 160) + 8) + 24) = result;
  }
  return result;
}

id __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke(uint64_t a1)
{
  void *v2;
  PXGAssetDecorationViewConfiguration *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    v3 = objc_alloc_init(PXGAssetDecorationViewConfiguration);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return v2;
}

void __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  __int128 v4;
  _OWORD v5[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(unsigned int *)(a1 + 88);
  v4 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v4;
  v5[2] = *(_OWORD *)(a1 + 72);
  objc_msgSend(WeakRetained, "_requestViewTextureForDecorationInfo:customViewClass:userData:decorationOptions:requestID:", v5, 0, 0, 0, v3);

}

- (void)_requestViewTextureForDecorationInfo:(PXGDecorationBadgeInfo *)a3 customViewClass:(Class)a4 userData:(id)a5 decorationOptions:(unint64_t)a6 requestID:(int)a7
{
  uint64_t v7;
  PXGDecorationViewPayload *v12;
  id v13;

  v7 = *(_QWORD *)&a7;
  v13 = a5;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v7))
  {
    if (a3->var0)
    {
      v12 = -[PXGDecorationViewPayload initWithDecorationOptions:viewClass:userData:]([PXGDecorationViewPayload alloc], "initWithDecorationOptions:viewClass:userData:", a6, a4, v13);
      -[PXGTextureProvider providePayload:forRequestID:](self, "providePayload:forRequestID:", v12, v7);

    }
    else
    {
      -[PXGTextureProvider provideNothingForRequestID:](self, "provideNothingForRequestID:", v7);
    }
  }

}

void __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _OWORD v15[3];

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v2 && *(_QWORD *)(a1 + 72) == *(_DWORD *)(a1 + 160))
    v3 = v2;
  else
    v3 = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(unsigned int *)(a1 + 180);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 152);
  v10 = *(_OWORD *)(a1 + 96);
  v15[0] = *(_OWORD *)(a1 + 80);
  v15[1] = v10;
  v15[2] = *(_OWORD *)(a1 + 112);
  LODWORD(v11) = *(_DWORD *)(a1 + 164);
  LODWORD(v12) = *(_DWORD *)(a1 + 168);
  LODWORD(v13) = *(_DWORD *)(a1 + 172);
  LODWORD(v14) = *(_DWORD *)(a1 + 176);
  objc_msgSend(WeakRetained, "_requestTextureForDecorationInfo:drawingHelper:solidColorOverlay:debugDecoration:targetSize:cornerRadius:screenScale:requestID:viewEnvironment:userInterfaceDirection:", v15, v5, v6, v3, v7, v8, *(double *)(a1 + 128), *(double *)(a1 + 136), v11, v12, v13, v14, *(double *)(a1 + 144), v9);

}

- (PXGDecorationTextureProvider)init
{
  return -[PXGDecorationTextureProvider initWithBadgeDrawingHelper:](self, "initWithBadgeDrawingHelper:", 0);
}

- (PXGDecorationTextureProvider)initWithBadgeDrawingHelper:(id)a3
{
  PXGDecorationDefaultBadgeDrawingHelper *v4;
  PXGDecorationTextureProvider *v5;
  PXGDecorationDefaultBadgeDrawingHelper *v6;
  objc_super v8;

  v4 = (PXGDecorationDefaultBadgeDrawingHelper *)a3;
  v8.receiver = self;
  v8.super_class = (Class)PXGDecorationTextureProvider;
  v5 = -[PXGCGImageTextureProvider init](&v8, sel_init);
  if (v5)
  {
    v6 = v4;
    if (!v4)
      v6 = objc_alloc_init(PXGDecorationDefaultBadgeDrawingHelper);
    objc_storeStrong((id *)&v5->_badgeDrawingHelper, v6);
    if (!v4)

  }
  return v5;
}

- (void)_requestTextureForDecorationInfo:(PXGDecorationBadgeInfo *)a3 drawingHelper:(id)a4 solidColorOverlay:(id)a5 debugDecoration:(id)a6 targetSize:(CGSize)a7 cornerRadius:(id)a8 screenScale:(double)a9 requestID:(int)a10 viewEnvironment:(id)a11 userInterfaceDirection:(unint64_t)a12
{
  int v12;
  int v13;
  int v14;
  double v15;
  void *v16;
  uint64_t v17;
  double v18;
  int v19;
  int v20;
  int v21;
  int v22;
  double height;
  double width;
  id v29;
  id v30;
  id v31;
  id v32;
  double v33;
  double v34;
  double v35;
  double v36;
  char IsZero;
  __int128 v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  _QWORD v42[5];
  int v43;
  char v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  double v50;
  double v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  double v55;
  uint64_t v56;
  int v57;
  int v58;
  int v59;
  int v60;
  _OWORD v61[4];

  v16 = *(void **)&a8.var0.var1[2];
  v17 = *(_QWORD *)&a8.var0.var0.var0;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = LODWORD(a9);
  height = a7.height;
  width = a7.width;
  v29 = a4;
  v30 = a5;
  v31 = a6;
  v32 = v16;
  if (-[PXGTextureProvider isRequestActive:](self, "isRequestActive:", v17))
  {
    if (a3->var0)
    {
      IsZero = PXPixelSizeAreaIsZero();
      if (v31 || (IsZero & 1) == 0)
        goto LABEL_5;
    }
    else if (v31)
    {
LABEL_5:
      v38 = *(_OWORD *)&a3->var2;
      v61[0] = *(_OWORD *)&a3->var0;
      v61[1] = v38;
      v61[2] = *(_OWORD *)&a3->var4;
      LODWORD(v33) = v22;
      LODWORD(v34) = v21;
      LODWORD(v35) = v20;
      LODWORD(v36) = v19;
      objc_msgSend(v29, "cacheKeyForDecorationInfo:solidColorOverlay:debugDecoration:targetSize:cornerRadius:screenScale:viewEnvironment:userInterfaceDirection:", v61, v30, v31, v32, *(_QWORD *)&a10, width, height, v33, v34, v35, v36, v18);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = MEMORY[0x1E0C809B0];
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke;
      v45[3] = &unk_1E511EC00;
      v50 = width;
      v51 = height;
      v46 = v29;
      v41 = *(_OWORD *)&a3->var2;
      v52 = *(_OWORD *)&a3->var0;
      v53 = v41;
      v54 = *(_OWORD *)&a3->var4;
      v47 = v30;
      v48 = v31;
      v57 = v22;
      v58 = v21;
      v59 = v20;
      v60 = v19;
      v55 = v18;
      v49 = v32;
      v56 = *(_QWORD *)&a10;
      v42[0] = v40;
      v42[1] = 3221225472;
      v42[2] = __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke_3;
      v42[3] = &unk_1E5140FB0;
      v44 = 0;
      v42[4] = self;
      v43 = v17;
      -[PXGCGImageTextureProvider requestCGImageWithCacheKey:imageProvider:resultHandler:](self, "requestCGImageWithCacheKey:imageProvider:resultHandler:", v39, v45, v42);

      goto LABEL_8;
    }
    -[PXGTextureProvider provideNothingForRequestID:](self, "provideNothingForRequestID:", v17);
  }
LABEL_8:

}

- (void)setOverlayViewSource:(id)a3
{
  objc_storeWeak((id *)&self->_overlayViewSource, a3);
}

- (PXGDecorationBadgeDrawingHelper)badgeDrawingHelper
{
  return self->_badgeDrawingHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeDrawingHelper, 0);
  objc_destroyWeak((id *)&self->_overlayViewSource);
}

uint64_t __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke(uint64_t a1)
{
  __int128 v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke_2;
  v7[3] = &unk_1E511EBD8;
  v8 = *(id *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 96);
  v12 = *(_OWORD *)(a1 + 80);
  v13 = v2;
  v14 = *(_OWORD *)(a1 + 112);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v17 = *(_OWORD *)(a1 + 144);
  v15 = *(_QWORD *)(a1 + 128);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 136);
  v11 = v3;
  v16 = v4;
  v5 = MEMORY[0x1A85CCE98](0, 0, v7, *(double *)(a1 + 64), *(double *)(a1 + 72));

  return v5;
}

uint64_t __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  char v2;
  void *v3;
  uint64_t v4;
  __int128 v6;
  char v7;
  __int16 v8;
  char v9;
  int v10;
  char v11;
  _BYTE v12[7];

  v9 = 0;
  v8 = 0;
  memset(v12, 0, sizeof(v12));
  v2 = *(_BYTE *)(a1 + 44);
  v3 = *(void **)(a1 + 32);
  v4 = *(unsigned int *)(a1 + 40);
  v6 = *(_OWORD *)off_1E50B83E0;
  v7 = v2;
  v10 = 1065353216;
  v11 = 0;
  return objc_msgSend(v3, "provideCGImage:options:forRequestID:", a2, &v6, v4);
}

uint64_t __198__PXGDecorationTextureProvider__requestTextureForDecorationInfo_drawingHelper_solidColorOverlay_debugDecoration_targetSize_cornerRadius_screenScale_requestID_viewEnvironment_userInterfaceDirection___block_invoke_2(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  double v17;
  _OWORD v19[2];
  __int128 v20;

  v6 = a6;
  v7 = a5;
  v11 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a1 + 112);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = *(_QWORD *)(a1 + 120);
  v16 = *(_OWORD *)(a1 + 80);
  v19[0] = *(_OWORD *)(a1 + 64);
  v19[1] = v16;
  v20 = *(_OWORD *)(a1 + 96);
  HIDWORD(v17) = DWORD1(v20);
  LODWORD(v17) = *(_DWORD *)(a1 + 128);
  LODWORD(v16) = *(_DWORD *)(a1 + 132);
  LODWORD(a5) = *(_DWORD *)(a1 + 136);
  LODWORD(a6) = *(_DWORD *)(a1 + 140);
  return objc_msgSend(v11, "drawWithDecorationInfo:solidColorOverlay:debugDecoration:cornerRadius:context:viewport:screenScale:viewEnvironment:userInterfaceDirection:", v19, v10, v13, a2, v14, v15, v17, *(double *)&v16, a5, a6, a3, a4, v7, v6, v12);
}

void __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _OWORD v8[3];

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "prepareForRender");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 96);
  v5 = *(_QWORD *)(a1 + 104);
  v6 = *(unsigned int *)(a1 + 112);
  v7 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v7;
  v8[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(WeakRetained, "_requestViewTextureForDecorationInfo:customViewClass:userData:decorationOptions:requestID:", v8, v4, v3, v5, v6);

}

void __98__PXGDecorationTextureProvider_requestTexturesForSpritesInRange_geometries_styles_infos_inLayout___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_opt_class();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v5 = *(unsigned int *)(a1 + 96);
  v6 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v6;
  v7[2] = *(_OWORD *)(a1 + 80);
  objc_msgSend(WeakRetained, "_requestViewTextureForDecorationInfo:customViewClass:userData:decorationOptions:requestID:", v7, v3, v4, 0, v5);

}

@end
