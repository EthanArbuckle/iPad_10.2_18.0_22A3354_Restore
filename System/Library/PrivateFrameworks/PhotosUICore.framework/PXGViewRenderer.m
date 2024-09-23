@implementation PXGViewRenderer

- (void)renderSpritesWithTextures:(id)a3 dataStore:(id)a4 presentationDataStore:(id)a5 presentationMetadataStore:(id)a6 layout:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  __int128 v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  void *v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  void *v56;
  PXGViewRenderer *v57;
  NSMutableDictionary *reusableViewInfoBySpriteIndex;
  uint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  $3BA783FF50B239963188BE194EBFFEBA *textureInfos;
  uint64_t v69;
  id v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  unint64_t v76;
  $3BA783FF50B239963188BE194EBFFEBA *v77;
  uint64_t v78;
  __int128 *v79;
  uint64_t v80;
  _PXGReusableViewInfo *v81;
  int v82;
  int v83;
  BOOL v84;
  void *v85;
  char v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  char v91;
  uint64_t v92;
  void *v93;
  void *v94;
  char v95;
  void *v96;
  void *v97;
  _PXGViewSetupParameters *v98;
  _BOOL4 v99;
  _PXGReusableViewInfo *v100;
  __int128 *v101;
  __int128 v102;
  __int128 v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  objc_class *v116;
  void *v117;
  uint64_t v118;
  objc_class *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  id v123;
  id v124;
  void (**v125)(void *, _QWORD);
  uint64_t v126;
  void *v127;
  id v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t j;
  NSMutableDictionary *trackingContainerViewInfoBySpriteIndex;
  void *v134;
  void *v135;
  void *v136;
  void *v138;
  uint64_t v139;
  id v140;
  void *v141;
  id v142;
  void *v143;
  id v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  id obj;
  uint64_t v150;
  uint64_t v151;
  id v152;
  void *v153;
  PXGViewRenderer *v154;
  uint64_t v155;
  char v156;
  $3BA783FF50B239963188BE194EBFFEBA *v157;
  char isKindOfClass;
  __int128 *v159;
  void *v160;
  void *v161;
  id v162;
  void *v163;
  _QWORD v164[5];
  __int128 v165;
  __int128 v166;
  uint64_t v167;
  double v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  _QWORD v173[5];
  id v174;
  id v175;
  __int128 v176;
  __int128 v177;
  uint64_t v178;
  uint64_t v179;
  double v180;
  _OWORD v181[4];
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  _QWORD aBlock[4];
  id v191;
  _QWORD v192[5];
  _QWORD v193[4];
  id v194;
  id v195;
  _QWORD v196[4];
  id v197;
  uint64_t v198;
  CGFloat v199;
  CGFloat v200;
  CGFloat v201;
  CGFloat v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  uint64_t v209;
  __int128 v210;
  __int128 v211;
  uint64_t v212;
  _BYTE v213[128];
  _BYTE v214[128];
  _BYTE v215[128];
  uint64_t v216;
  CGRect v217;
  CGRect v218;
  CGRect v219;

  v216 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v144 = a4;
  v13 = a5;
  v14 = a6;
  v162 = a7;
  -[PXGViewRenderer recordingSession](self, "recordingSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[PXGViewRenderer recordingSession](self, "recordingSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGViewRenderer visibleRect](self, "visibleRect");
    v18 = v17;
    v20 = v19;
    -[PXGViewRenderer visibleRect](self, "visibleRect");
    v22 = v21;
    v24 = v23;
    -[PXGViewRenderer _screenScale](self, "_screenScale");
    +[PXGViewRecordingFrameStartEvent eventWithViewSize:renderOrigin:screenScale:](PXGViewRecordingFrameStartEvent, "eventWithViewSize:renderOrigin:screenScale:", v18, v20, v22, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recordEvent:", v26);

  }
  -[PXGViewRenderer _screenScale](self, "_screenScale");
  v28 = v27;
  objc_storeStrong((id *)&self->_lastPresentationDataStore, a5);
  v212 = 0;
  v29 = 0uLL;
  v210 = 0u;
  v211 = 0u;
  if (v144)
  {
    objc_msgSend(v144, "sprites");
    v29 = 0uLL;
  }
  v209 = 0;
  v207 = v29;
  v208 = v29;
  v143 = v13;
  if (v13)
  {
    objc_msgSend(v13, "sprites");
    v151 = v208;
    v146 = v209;
    v147 = *((_QWORD *)&v208 + 1);
  }
  else
  {
    v146 = 0;
    v147 = 0;
    v151 = 0;
  }
  v142 = objc_retainAutorelease(v14);
  v139 = objc_msgSend(v142, "resizableCapInsets");
  -[PXGViewRenderer visibleRect](self, "visibleRect");
  self->_renderedVisibleOrigin.x = v30;
  self->_renderedVisibleOrigin.y = v31;
  PXEdgeInsetsInsetRect();
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v154 = self;
  -[PXGViewRenderer scrollViewController](self, "scrollViewController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "visibleRectOutsideBounds");
  v219.origin.x = v41;
  v219.origin.y = v42;
  v219.size.width = v43;
  v219.size.height = v44;
  v217.origin.x = v33;
  v217.origin.y = v35;
  v217.size.width = v37;
  v217.size.height = v39;
  v218 = CGRectUnion(v217, v219);
  x = v218.origin.x;
  y = v218.origin.y;
  width = v218.size.width;
  height = v218.size.height;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = 0u;
  v204 = 0u;
  v205 = 0u;
  v206 = 0u;
  v50 = v12;
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v203, v215, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v204;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v204 != v53)
          objc_enumerationMutation(v50);
        v55 = *(void **)(*((_QWORD *)&v203 + 1) + 8 * i);
        v196[0] = MEMORY[0x1E0C809B0];
        v196[1] = 3221225472;
        v196[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke;
        v196[3] = &unk_1E5117E50;
        v198 = v151;
        v199 = x;
        v200 = y;
        v201 = width;
        v202 = height;
        v197 = v49;
        objc_msgSend(v55, "enumerateSpriteIndexes:", v196);

      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v203, v215, 16);
    }
    while (v52);
  }

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v154;
  reusableViewInfoBySpriteIndex = v154->_reusableViewInfoBySpriteIndex;
  v59 = MEMORY[0x1E0C809B0];
  v193[0] = MEMORY[0x1E0C809B0];
  v193[1] = 3221225472;
  v193[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2;
  v193[3] = &unk_1E5117E78;
  v60 = v49;
  v194 = v60;
  v61 = v56;
  v195 = v61;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](reusableViewInfoBySpriteIndex, "enumerateKeysAndObjectsUsingBlock:", v193);
  v192[0] = v59;
  v192[1] = 3221225472;
  v192[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3;
  v192[3] = &unk_1E5148928;
  v192[4] = v154;
  v141 = v61;
  objc_msgSend(v61, "enumerateIndexesUsingBlock:", v192);
  v152 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = v59;
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_4;
  aBlock[3] = &unk_1E5117EA0;
  v140 = v162;
  v191 = v140;
  v138 = _Block_copy(aBlock);
  v186 = 0u;
  v187 = 0u;
  v188 = 0u;
  v189 = 0u;
  obj = v50;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v186, v214, 16);
  v153 = v60;
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v187;
    v145 = *(_QWORD *)v187;
    do
    {
      v65 = 0;
      v148 = v63;
      do
      {
        if (*(_QWORD *)v187 != v64)
          objc_enumerationMutation(obj);
        v66 = *(void **)(*((_QWORD *)&v186 + 1) + 8 * v65);
        v67 = objc_msgSend(v66, "spriteCount");
        -[PXGViewRenderer _resizeBuffersForSpriteCount:](v57, "_resizeBuffersForSpriteCount:", v67);
        objc_msgSend(v66, "getSpriteIndexes:maxSpriteCount:", v57->_spriteIndexes, v67);
        objc_opt_class();
        v161 = v66;
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v75 = 0;
            goto LABEL_82;
          }
          v70 = v66;
          objc_msgSend(v70, "payload");
          v71 = objc_claimAutoreleasedReturnValue();
          v163 = (void *)v71;
          if (v71)
          {
            v72 = (void *)v71;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              goto LABEL_28;
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v118 = objc_claimAutoreleasedReturnValue();
            v119 = (objc_class *)objc_opt_class();
            NSStringFromClass(v119);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = v72;
            v115 = (void *)v118;
            objc_msgSend(v120, "px_descriptionForAssertionMessage");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "handleFailureInMethod:object:file:lineNumber:description:", a2, v57, CFSTR("PXGViewRenderer.m"), 390, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("payloadTexture.payload"), v117, v121);

            v66 = v161;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = (objc_class *)objc_opt_class();
            NSStringFromClass(v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "handleFailureInMethod:object:file:lineNumber:description:", a2, v57, CFSTR("PXGViewRenderer.m"), 390, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("payloadTexture.payload"), v117);
          }

          v72 = v163;
LABEL_28:
          v73 = objc_msgSend(v72, "viewClass");

          v69 = v73;
          textureInfos = 0;
          if (!v69)
            goto LABEL_81;
          goto LABEL_29;
        }
        textureInfos = v57->_textureInfos;
        if (textureInfos)
          objc_msgSend(v66, "getTextureInfos:forSpriteIndexes:geometries:spriteStyles:spriteInfos:screenScale:count:", v57->_textureInfos, v57->_spriteIndexes, v151, v147, v146, v67, v28);
        v69 = objc_opt_class();
        v163 = 0;
        if (!v69)
          goto LABEL_81;
LABEL_29:
        v155 = v69;
        objc_msgSend(v163, "userData");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if (v74)
        {
          isKindOfClass = 1;
        }
        else
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
        }

        if (objc_msgSend(v66, "spriteCount"))
        {
          v150 = v65;
          v76 = 0;
          v156 = isKindOfClass ^ 1;
          v77 = textureInfos;
          v157 = textureInfos;
          while (1)
          {
            v78 = v57->_spriteIndexes[v76];
            if (objc_msgSend(v60, "containsIndex:", v78))
              break;
LABEL_79:
            ++v76;
            v77 += 16;
            if (v76 >= objc_msgSend(v66, "spriteCount"))
            {
              v63 = v148;
              v64 = v145;
              v65 = v150;
              goto LABEL_81;
            }
          }
          if (textureInfos)
            v79 = (__int128 *)v77;
          else
            v79 = 0;
          v159 = v79;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v78);
          v80 = objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKeyedSubscript:](v57->_reusableViewInfoBySpriteIndex, "objectForKeyedSubscript:", v80);
          v81 = (_PXGReusableViewInfo *)objc_claimAutoreleasedReturnValue();
          if (PXFloatGreaterThanFloat())
          {
            v82 = 1;
            if (!v81)
              goto LABEL_51;
LABEL_49:
            objc_msgSend(v163, "userData");
            v87 = objc_claimAutoreleasedReturnValue();
            if (!v87)
              goto LABEL_51;
            v88 = (void *)v87;
            -[_PXGReusableViewInfo view](v81, "view");
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v163, "userData");
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = objc_msgSend(v89, "shouldReloadForUserData:", v90);

            if ((v91 & 1) == 0)
            {
LABEL_51:
              -[_PXGReusableViewInfo view](v81, "view");
              v92 = objc_claimAutoreleasedReturnValue();
              if (!v92
                || (v93 = (void *)v92,
                    -[_PXGReusableViewInfo view](v81, "view"),
                    v94 = (void *)objc_claimAutoreleasedReturnValue(),
                    v95 = objc_opt_isKindOfClass(),
                    v94,
                    v93,
                    (v95 & 1) != 0))
              {
                v57 = v154;
                v96 = (void *)v80;
LABEL_55:
                v66 = v161;
                if ((v81 != 0) | v156 & 1 || !v82)
                {
                  if ((v81 != 0) | v156 & 1)
                    v100 = v81;
                  else
                    v100 = 0;
                  v99 = v100 != 0;
                  if ((isKindOfClass & v99) != 0)
                  {
LABEL_64:
                    v98 = objc_alloc_init(_PXGViewSetupParameters);
                    goto LABEL_65;
                  }
                  v98 = 0;
                  v81 = v100;
                }
                else
                {
                  -[PXGViewRenderer _dequeueViewWithClass:](v57, "_dequeueViewWithClass:", v155);
                  v97 = (void *)objc_claimAutoreleasedReturnValue();
                  v81 = -[_PXGReusableViewInfo initWithReusableView:]([_PXGReusableViewInfo alloc], "initWithReusableView:", v97);
                  -[NSMutableDictionary setObject:forKeyedSubscript:](v57->_reusableViewInfoBySpriteIndex, "setObject:forKeyedSubscript:", v81, v96);
                  v98 = objc_alloc_init(_PXGViewSetupParameters);
                  -[_PXGViewSetupParameters setNeedsParenting:](v98, "setNeedsParenting:", 1);

                  v99 = v81 != 0;
                  if ((isKindOfClass & v99) != 0)
                  {
                    if (!v98)
                      goto LABEL_64;
LABEL_65:
                    -[_PXGViewSetupParameters setTexture:](v98, "setTexture:", v161);
                    v101 = v159;
                    if (!v159)
                      v101 = (__int128 *)off_1E50B83B8;
                    v102 = v101[1];
                    v182 = *v101;
                    v183 = v102;
                    v103 = v101[3];
                    v184 = v101[2];
                    v185 = v103;
                    v181[0] = v182;
                    v181[1] = v183;
                    v181[2] = v184;
                    v181[3] = v103;
                    -[_PXGViewSetupParameters setTextureInfo:](v98, "setTextureInfo:", v181);
                    -[_PXGViewSetupParameters setSpriteIndex:](v98, "setSpriteIndex:", v78);
                    -[_PXGReusableViewInfo view](v81, "view");
                    v104 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_PXGViewSetupParameters setNeedsParenting:](v98, "setNeedsParenting:", objc_msgSend(v104, "pxg_hasSuperview") ^ 1);

                    v60 = v153;
                    if (-[PXGViewRenderer shouldSeparateViewLayers](v57, "shouldSeparateViewLayers"))
                      v105 = objc_msgSend(v163, "shouldSeparateViewLayers");
                    else
                      v105 = 0;
                    -[_PXGViewSetupParameters setSeparateLayers:](v98, "setSeparateLayers:", v105);
                    -[PXGViewRenderer recordingSession](v57, "recordingSession");
                    v107 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v107)
                    {
                      -[PXGViewRenderer recordingSession](v57, "recordingSession");
                      v160 = (void *)objc_claimAutoreleasedReturnValue();
                      -[_PXGViewSetupParameters texture](v98, "texture");
                      v108 = (void *)objc_claimAutoreleasedReturnValue();
                      v109 = v96;
                      v110 = -[_PXGViewSetupParameters spriteIndex](v98, "spriteIndex");
                      v111 = -[_PXGViewSetupParameters needsParenting](v98, "needsParenting");
                      v112 = v110;
                      v96 = v109;
                      v60 = v153;
                      +[PXGViewRecordingViewEvent eventWithSpriteTexture:payload:spriteIndex:needsParenting:](PXGViewRecordingViewEvent, "eventWithSpriteTexture:payload:spriteIndex:needsParenting:", v108, v163, v112, v111);
                      v113 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v160, "recordEvent:", v113);

                      v66 = v161;
                      -[PXGViewRenderer recordingSession](v57, "recordingSession");
                      v106 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v106, "frameState");
                      v114 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v114, "addRecordedSpriteIndex:", -[_PXGViewSetupParameters spriteIndex](v98, "spriteIndex"));

LABEL_75:
                    }
                    goto LABEL_76;
                  }
                }
                v60 = v153;
                if (v99)
                {
                  -[_PXGReusableViewInfo view](v81, "view");
                  v106 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v106, "pxg_becomeReusable");
                  goto LABEL_75;
                }
LABEL_76:
                if (v98)
                  objc_msgSend(v152, "setObject:forKeyedSubscript:", v98, v96);

                textureInfos = v157;
                goto LABEL_79;
              }
            }
          }
          else
          {
            v83 = PXFloatGreaterThanFloat();
            if (v81)
              v84 = v83 == 0;
            else
              v84 = 0;
            if (!v84)
            {
              v82 = v83;
              if (!v81)
                goto LABEL_51;
              goto LABEL_49;
            }
            -[_PXGReusableViewInfo view](v81, "view");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = objc_msgSend(v85, "shouldReuseWhenInvisible");

            v82 = 0;
            if ((v86 & 1) == 0)
              goto LABEL_49;
          }
          v57 = v154;
          v96 = (void *)v80;
          -[NSMutableDictionary setObject:forKeyedSubscript:](v154->_reusableViewInfoBySpriteIndex, "setObject:forKeyedSubscript:", 0, v80);
          -[PXGViewRenderer _makeViewInfoReusable:](v154, "_makeViewInfoReusable:", v81);

          v81 = 0;
          goto LABEL_55;
        }
LABEL_81:
        v75 = v163;
LABEL_82:

        ++v65;
      }
      while (v65 != v63);
      v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v186, v214, 16);
      v63 = v122;
    }
    while (v122);
  }

  v173[0] = MEMORY[0x1E0C809B0];
  v173[1] = 3221225472;
  v173[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_5;
  v173[3] = &unk_1E5117F18;
  v176 = v207;
  v177 = v208;
  v173[4] = v57;
  v178 = v209;
  v123 = v138;
  v175 = v123;
  v179 = v139;
  v180 = v28;
  v124 = v152;
  v174 = v124;
  v125 = (void (**)(void *, _QWORD))_Block_copy(v173);
  v126 = objc_msgSend(v124, "count");
  while (objc_msgSend(v124, "count"))
  {
    objc_msgSend(v124, "allValues");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = 0u;
    v170 = 0u;
    v171 = 0u;
    v172 = 0u;
    v128 = v127;
    v129 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v169, v213, 16);
    if (v129)
    {
      v130 = v129;
      v131 = *(_QWORD *)v170;
      do
      {
        for (j = 0; j != v130; ++j)
        {
          if (*(_QWORD *)v170 != v131)
            objc_enumerationMutation(v128);
          v125[2](v125, *(_QWORD *)(*((_QWORD *)&v169 + 1) + 8 * j));
        }
        v130 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v169, v213, 16);
      }
      while (v130);
    }

    if (objc_msgSend(v124, "count") == v126)
    {

      break;
    }
    v126 = objc_msgSend(v124, "count");

  }
  v164[1] = 3221225472;
  v165 = v207;
  trackingContainerViewInfoBySpriteIndex = v57->_trackingContainerViewInfoBySpriteIndex;
  v164[0] = MEMORY[0x1E0C809B0];
  v164[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_4_79;
  v164[3] = &unk_1E5117F40;
  v164[4] = v57;
  v166 = v208;
  v167 = v209;
  v168 = v28;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](trackingContainerViewInfoBySpriteIndex, "enumerateKeysAndObjectsUsingBlock:", v164);
  -[PXGViewRenderer _shiftViewsToCompensateForDeferredVisibleOrigin](v57, "_shiftViewsToCompensateForDeferredVisibleOrigin");
  -[PXGViewRenderer recordingSession](v57, "recordingSession");
  v134 = (void *)objc_claimAutoreleasedReturnValue();

  if (v134)
  {
    -[PXGViewRenderer recordingSession](v57, "recordingSession");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXGViewRecordingFrameEndEvent event](PXGViewRecordingFrameEndEvent, "event");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v135, "recordEvent:", v136);

  }
}

- (PXGTungstenRecordingSession)recordingSession
{
  return self->_recordingSession;
}

- (void)_resizeBuffersForSpriteCount:(int64_t)a3
{
  if (self->_spriteBufferCapacity < a3)
  {
    self->_spriteBufferCapacity = a3;
    self->_spriteIndexes = (unsigned int *)malloc_type_realloc(self->_spriteIndexes, 4 * a3, 0x100004052888210uLL);
    self->_textureInfos = ($3BA783FF50B239963188BE194EBFFEBA *)malloc_type_realloc(self->_textureInfos, a3 << 6, 0x100004011B15C4DuLL);
  }
}

void __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_5(double *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 *v8;
  __int128 v9;
  char v10;
  int v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  char v17;
  id WeakRetained;
  NSObject *v19;
  uint64_t v20;
  id v21;
  id v22;
  int v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void (**v28)(void *, _QWORD *);
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  int v34;
  int *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[5];
  _QWORD v55[4];
  id v56;
  _QWORD aBlock[6];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[16];
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "spriteIndex");
  v5 = *(void **)(*((_QWORD *)a1 + 4) + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = 0;
  v59 = &v58;
  v60 = 0x4010000000;
  v61 = &unk_1A7E74EE7;
  v62 = 0u;
  v63 = 0u;
  v53 = *((_QWORD *)a1 + 10);
  v8 = (__int128 *)(*((_QWORD *)a1 + 9) + 32 * v4);
  v9 = v8[1];
  v62 = *v8;
  v63 = v9;
  v51 = *((_QWORD *)a1 + 11) + 40 * v4;
  v10 = *(_BYTE *)(v51 + 34);
  objc_msgSend(v7, "view");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "needsParenting") & 1) != 0)
  {
LABEL_2:
    v11 = (*(uint64_t (**)(void))(*((_QWORD *)a1 + 6) + 16))();
    v12 = (_QWORD *)*((_QWORD *)a1 + 4);
    if (v11 == -1)
    {
      if ((v10 & 0x20) == 0)
      {
        objc_msgSend(v52, "pxg_addToScrollViewController:", v12[46]);
        goto LABEL_25;
      }
      objc_msgSend(v12, "_ensureUnderlayHostingView");
      WeakRetained = objc_loadWeakRetained((id *)(*((_QWORD *)a1 + 4) + 32));
      objc_msgSend(v52, "pxg_insertIntoView:atIndex:", WeakRetained, 0);
      goto LABEL_24;
    }
    v13 = (void *)v12[2];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      WeakRetained = 0;
      goto LABEL_22;
    }
    objc_msgSend(v15, "view");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v17 = objc_opt_respondsToSelector();

      if ((v17 & 1) != 0)
      {
        WeakRetained = v15;
        objc_msgSend(v7, "setHostingViewInfo:", WeakRetained);
        objc_msgSend(WeakRetained, "addHostedViewInfo:", v7);
        objc_msgSend(WeakRetained, "view");
        v19 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "pxg_addToHostingView:", v19);
LABEL_20:

LABEL_22:
LABEL_24:

        goto LABEL_25;
      }
    }
    else
    {

    }
    PXGTungstenGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v15, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v25;
      v26 = v25;
      _os_log_impl(&dword_1A6789000, v19, OS_LOG_TYPE_DEFAULT, "View class %{public}@ could not host sprites with PXGPresentationTypeView because it does not implement one or more of the view-hosting methods.", buf, 0xCu);

    }
    WeakRetained = 0;
    goto LABEL_20;
  }
  v20 = *((_QWORD *)a1 + 4);
  if ((v10 & 0x20) != 0)
  {
    if ((objc_msgSend(v52, "pxg_isChildOfScrollViewController:", *(_QWORD *)(v20 + 368)) & 1) != 0)
      goto LABEL_2;
  }
  else
  {
    v21 = objc_loadWeakRetained((id *)(v20 + 32));
    if (v21)
    {
      v22 = objc_loadWeakRetained((id *)(*((_QWORD *)a1 + 4) + 32));
      v23 = objc_msgSend(v52, "pxg_isChildOfView:", v22);

      if (v23)
        goto LABEL_2;
    }
  }
LABEL_25:
  v27 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_73;
  aBlock[3] = &unk_1E5117EC8;
  *(double *)&aBlock[4] = a1[4];
  aBlock[5] = &v58;
  v28 = (void (**)(void *, _QWORD *))_Block_copy(aBlock);
  objc_msgSend(v7, "hostingViewInfo");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v55[0] = v27;
    v55[1] = 3221225472;
    v55[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2_75;
    v55[3] = &unk_1E5117EF0;
    v56 = v7;
    v28[2](v28, v55);

  }
  v31 = objc_loadWeakRetained((id *)(*((_QWORD *)a1 + 4) + 32));
  if (v31)
  {
    objc_msgSend(v7, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_loadWeakRetained((id *)(*((_QWORD *)a1 + 4) + 32));
    v34 = objc_msgSend(v32, "pxg_isChildOfView:", v33);

    if (v34)
    {
      v54[0] = v27;
      v54[1] = 3221225472;
      v54[2] = __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3_77;
      v54[3] = &unk_1E5117EF0;
      *(double *)&v54[4] = a1[4];
      v28[2](v28, v54);
    }
  }
  v35 = (int *)(*((_QWORD *)a1 + 12) + 16 * *(unsigned __int16 *)(v53 + 160 * v4 + 68));
  v36 = *v35;
  v37 = v35[1];
  v38 = v35[2];
  v39 = v35[3];
  v66 = 0u;
  v67 = 0u;
  *(_OWORD *)buf = 0u;
  v65 = 0u;
  if (v3)
    objc_msgSend(v3, "textureInfo");
  objc_msgSend(v7, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "texture");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v59;
  v43 = a1[13];
  LOBYTE(v50) = objc_msgSend(v3, "separateLayers");
  LODWORD(v44) = v36;
  LODWORD(v45) = v37;
  LODWORD(v46) = v38;
  LODWORD(v47) = v39;
  objc_msgSend(v40, "pxg_configureWithTexture:geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:", v41, v42 + 4, v51, v53 + 160 * v4, buf, v7, v44, v45, v46, v47, v43, v50);

  v48 = (void *)*((_QWORD *)a1 + 5);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "removeObjectForKey:", v49);

  _Block_object_dispose(&v58, 8);
}

- (BOOL)shouldSeparateViewLayers
{
  return self->_shouldSeparateViewLayers;
}

- (void)_shiftViewsToCompensateForDeferredVisibleOrigin
{
  PXScrollViewController *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (-[PXScrollViewController deferContentOffsetUpdates](self->_scrollViewController, "deferContentOffsetUpdates")
    && (PXPointIsNull() & 1) == 0)
  {
    v3 = self->_scrollViewController;
    -[PXScrollViewController visibleOrigin](v3, "visibleOrigin");
    v5 = v4;
    v7 = v6;
    PXPointSubtract();
    v9 = v8;
    v11 = v10;
    if ((PXPointApproximatelyEqualToPoint() & 1) == 0)
    {
      kdebug_trace();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      -[NSMutableDictionary objectEnumerator](self->_reusableViewInfoBySpriteIndex, "objectEnumerator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v29;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v29 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v16), "view");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "pxg_shiftPosition:", v9, v11);

            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v14);
      }

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      -[NSMutableDictionary objectEnumerator](self->_trackingContainerViewInfoBySpriteIndex, "objectEnumerator", 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v25;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v22), "view");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "pxg_shiftPosition:", v9, v11);

            ++v22;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v20);
      }

      self->_renderedVisibleOrigin.x = v5;
      self->_renderedVisibleOrigin.y = v7;
    }

  }
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

- (PXScrollViewController)scrollViewController
{
  return self->_scrollViewController;
}

- (double)_screenScale
{
  void *v2;
  double v3;
  double v4;

  -[PXScrollViewController scrollView](self->_scrollViewController, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_screenScale");
  v4 = v3;

  return v4;
}

- (void)updateWithChangeDetails:(id)a3
{
  uint64_t v5;
  NSMutableDictionary *reusableViewInfoBySpriteIndex;
  id v7;
  NSMutableDictionary *trackingContainerViewInfoBySpriteIndex;
  _QWORD v9[6];
  _QWORD v10[5];

  v5 = MEMORY[0x1E0C809B0];
  reusableViewInfoBySpriteIndex = self->_reusableViewInfoBySpriteIndex;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__PXGViewRenderer_updateWithChangeDetails___block_invoke;
  v10[3] = &unk_1E5117E00;
  v10[4] = self;
  v7 = a3;
  objc_msgSend(v7, "applyToDictionary:removalHandler:", reusableViewInfoBySpriteIndex, v10);
  trackingContainerViewInfoBySpriteIndex = self->_trackingContainerViewInfoBySpriteIndex;
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __43__PXGViewRenderer_updateWithChangeDetails___block_invoke_2;
  v9[3] = &unk_1E5117E28;
  v9[4] = self;
  v9[5] = a2;
  objc_msgSend(v7, "applyToDictionary:removalHandler:", trackingContainerViewInfoBySpriteIndex, v9);

}

- (void)setVisibleRect:(CGRect)a3
{
  self->_visibleRect = a3;
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

  *(_OWORD *)(a1 + 112) = *(_OWORD *)a3;
  v3 = *(_OWORD *)(a3 + 16);
  v4 = *(_OWORD *)(a3 + 32);
  v5 = *(_OWORD *)(a3 + 64);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(a1 + 176) = v5;
  *(_OWORD *)(a1 + 128) = v3;
  *(_OWORD *)(a1 + 144) = v4;
  v6 = *(_OWORD *)(a3 + 80);
  v7 = *(_OWORD *)(a3 + 96);
  v8 = *(_OWORD *)(a3 + 128);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a3 + 112);
  *(_OWORD *)(a1 + 240) = v8;
  *(_OWORD *)(a1 + 192) = v6;
  *(_OWORD *)(a1 + 208) = v7;
  result = *(__n128 *)(a3 + 144);
  v10 = *(_OWORD *)(a3 + 160);
  v11 = *(_OWORD *)(a3 + 192);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a3 + 176);
  *(_OWORD *)(a1 + 304) = v11;
  *(__n128 *)(a1 + 256) = result;
  *(_OWORD *)(a1 + 272) = v10;
  return result;
}

- (unsigned)presentationType
{
  return 1;
}

- (void)setScrollViewController:(id)a3
{
  PXScrollViewController *v5;
  PXScrollViewController *scrollViewController;
  PXScrollViewController *v7;

  v5 = (PXScrollViewController *)a3;
  scrollViewController = self->_scrollViewController;
  if (scrollViewController != v5)
  {
    v7 = v5;
    -[PXScrollViewController unregisterObserver:](scrollViewController, "unregisterObserver:", self);
    objc_storeStrong((id *)&self->_scrollViewController, a3);
    -[PXScrollViewController registerObserver:](self->_scrollViewController, "registerObserver:", self);
    v5 = v7;
  }

}

- (PXGTextureConverter)textureConverter
{
  return self->_textureConverter;
}

uint64_t __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  double v3;
  float32x2_t v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v2 = *(_QWORD *)(result + 40) + 32 * a2;
  v3 = *(double *)(result + 48);
  v4 = vmul_f32(*(float32x2_t *)(v2 + 24), (float32x2_t)0x3F0000003F000000);
  if (*(double *)v2 - v4.f32[0] <= v3 + *(double *)(result + 64) && *(double *)v2 + v4.f32[0] >= v3)
  {
    v6 = *(double *)(result + 56);
    v7 = *(double *)(v2 + 8);
    v8 = v4.f32[1];
    v9 = v7 - v8;
    v10 = v7 + v8;
    if (v9 <= *(double *)(result + 72) + v6 && v10 >= v6)
      return objc_msgSend(*(id *)(result + 32), "addIndex:", v10);
  }
  return result;
}

uint64_t __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = objc_msgSend(a2, "unsignedIntegerValue");
  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", v3);
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", v3);
  return result;
}

- (id)_dequeueViewWithClass:(Class)a3
{
  void *v4;
  id v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_reusableViewsByClass, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    objc_msgSend(v5, "pxg_prepareForReuse");
  }
  else
  {
    v5 = objc_alloc_init(a3);
  }

  return v5;
}

uint64_t __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_4(uint64_t a1, uint64_t a2)
{
  int v2;
  id v4;
  id v5;
  void *v6;
  void *v7;
  unsigned int v8;
  BOOL v9;
  void *v10;
  id v11;
  uint64_t v12;

  v2 = a2;
  objc_msgSend(*(id *)(a1 + 32), "leafSublayoutForSpriteIndex:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextViewHostingLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  while (1)
  {
    v7 = v5;
    v8 = objc_msgSend(*(id *)(a1 + 32), "convertSpriteIndex:fromLayout:", objc_msgSend(v5, "viewHostingSpriteIndexForSublayout:", v6), v5);
    v9 = v8 == v2 && v5 == v4;
    v10 = v4;
    if (!v9)
    {
      v10 = v5;
      if (v8 != -1)
        break;
    }
    v11 = v10;

    objc_msgSend(v11, "nextViewHostingLayout");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v7;
    if (!v5)
    {
      v12 = 0xFFFFFFFFLL;
      v6 = v7;
      goto LABEL_13;
    }
  }
  if (v5)
    v12 = v8;
  else
    v12 = 0xFFFFFFFFLL;

LABEL_13:
  return v12;
}

- (BOOL)wantsToDriveRender
{
  return 0;
}

- (BOOL)wantsMipmaps
{
  return 0;
}

- (BOOL)wantsBGRATextures
{
  return 0;
}

- (void)setEntityManager:(id)a3
{
  objc_storeStrong((id *)&self->_entityManager, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)destinationColorSpaceName
{
  return 0;
}

- (void)setShouldSeparateViewLayers:(BOOL)a3
{
  self->_shouldSeparateViewLayers = a3;
}

- (PXGViewRenderer)init
{
  PXGViewRenderer *v2;
  PXGViewTextureConverter *v3;
  PXGTextureConverter *textureConverter;
  uint64_t v5;
  NSMutableDictionary *reusableViewsByClass;
  uint64_t v7;
  NSMutableDictionary *reusableViewInfoBySpriteIndex;
  uint64_t v9;
  NSMutableDictionary *trackingContainerViewInfoBySpriteIndex;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXGViewRenderer;
  v2 = -[PXGViewRenderer init](&v16, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXGViewTextureConverter);
    textureConverter = v2->_textureConverter;
    v2->_textureConverter = (PXGTextureConverter *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    reusableViewsByClass = v2->_reusableViewsByClass;
    v2->_reusableViewsByClass = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    reusableViewInfoBySpriteIndex = v2->_reusableViewInfoBySpriteIndex;
    v2->_reusableViewInfoBySpriteIndex = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    trackingContainerViewInfoBySpriteIndex = v2->_trackingContainerViewInfoBySpriteIndex;
    v2->_trackingContainerViewInfoBySpriteIndex = (NSMutableDictionary *)v9;

    v2->_renderedVisibleOrigin = *(CGPoint *)off_1E50B8580;
    PXEdgeInsetsMake();
    v2->_loadInsets.top = v11;
    v2->_loadInsets.left = v12;
    v2->_loadInsets.bottom = v13;
    v2->_loadInsets.right = v14;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_spriteIndexes);
  free(self->_textureInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXGViewRenderer;
  -[PXGViewRenderer dealloc](&v3, sel_dealloc);
}

- (void)_ensureUnderlayHostingView
{
  UIView **p_underlayHostingView;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  char v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[16];

  p_underlayHostingView = &self->_underlayHostingView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_underlayHostingView);

  if (!WeakRetained)
  {
    -[PXGViewRenderer rootView](self, "rootView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_underlayHostingView, v6);

    v7 = objc_loadWeakRetained((id *)p_underlayHostingView);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewRenderer.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_underlayHostingView != nil"));

    }
    v8 = objc_loadWeakRetained((id *)p_underlayHostingView);
    v9 = objc_msgSend(v8, "enableUnderlaySupport");

    if ((v9 & 1) == 0)
    {
      PXAssertGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1A6789000, v10, OS_LOG_TYPE_FAULT, "PXGView.enableUnderlaySupport must be turned on when PXGSpriteInfoFlagsUnderlay is used", buf, 2u);
      }

    }
  }
}

- (void)_makeViewInfoReusable:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v4, "hostedViewInfos", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v9++), "removeFromSuperViewInfo");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "hostedViewInfos");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "hostedViewInfos");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_error_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Some children are left: %@", buf, 0xCu);

    }
  }
  objc_msgSend(v4, "removeFromSuperViewInfo");
  objc_msgSend(v4, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pxg_becomeReusable");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_reusableViewsByClass, "objectForKeyedSubscript:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_reusableViewsByClass, "setObject:forKeyedSubscript:", v14, objc_opt_class());
  }
  objc_msgSend(v14, "addObject:", v13);

}

- (id)renderSnapshotForRequest:(id *)a3
{
  return 0;
}

- (id)viewForSpriteIndex:(unsigned int)a3
{
  NSMutableDictionary *reusableViewInfoBySpriteIndex;
  void *v4;
  void *v5;
  void *v6;

  reusableViewInfoBySpriteIndex = self->_reusableViewInfoBySpriteIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](reusableViewInfoBySpriteIndex, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)trackingContainerViewForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  NSMutableDictionary *trackingContainerViewInfoBySpriteIndex;
  void *v7;
  _PXGReusableViewInfo *v8;
  PXGTrackingContainerView *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  PXGTrackingContainerView *v14;
  NSMutableDictionary *v15;
  void *v16;
  PXGSpriteDataStore *lastPresentationDataStore;
  void *v18;
  objc_class *v20;
  _OWORD v21[2];
  uint64_t v22;

  v3 = *(_QWORD *)&a3;
  trackingContainerViewInfoBySpriteIndex = self->_trackingContainerViewInfoBySpriteIndex;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](trackingContainerViewInfoBySpriteIndex, "objectForKeyedSubscript:", v7);
  v8 = (_PXGReusableViewInfo *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_PXGReusableViewInfo view](v8, "view");
    v9 = (PXGTrackingContainerView *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewRenderer.m"), 608, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("viewInfo.view"), v12);
      goto LABEL_11;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGTrackingContainerView px_descriptionForAssertionMessage](v9, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewRenderer.m"), 608, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("viewInfo.view"), v12, v13);

LABEL_11:
    }
  }
  else
  {
    v14 = [PXGTrackingContainerView alloc];
    v9 = -[PXGTrackingContainerView initWithFrame:](v14, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = -[_PXGReusableViewInfo initWithReusableView:]([_PXGReusableViewInfo alloc], "initWithReusableView:", v9);
    v15 = self->_trackingContainerViewInfoBySpriteIndex;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v8, v16);

    lastPresentationDataStore = self->_lastPresentationDataStore;
    if (lastPresentationDataStore)
    {
      -[PXGSpriteDataStore sprites](lastPresentationDataStore, "sprites");
    }
    else
    {
      v22 = 0;
      memset(v21, 0, sizeof(v21));
    }
    -[PXGViewRenderer _screenScale](self, "_screenScale");
    -[PXGViewRenderer _configureTrackingContainerView:spriteIndex:sprites:screenScale:](self, "_configureTrackingContainerView:spriteIndex:sprites:screenScale:", v8, v3, v21);
    -[PXScrollViewController addSubview:](self->_scrollViewController, "addSubview:", v9);
    -[PXGViewRenderer delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "rendererNeedsUpdate:", self);

  }
  return v9;
}

- (void)_configureTrackingContainerView:(id)a3 spriteIndex:(unsigned int)a4 sprites:(id *)a5 screenScale:(double)a6
{
  id v11;
  void *v12;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var3;
  char *v14;
  char *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  BOOL v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  _OWORD v35[10];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  if (a5->var0 > a4)
  {
    v11 = a3;
    objc_msgSend(v11, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_4:
        var3 = a5->var3;
        v14 = (char *)a5->var2 + 32 * a4;
        v15 = (char *)a5->var4 + 40 * a4;
        v16 = (_OWORD *)((char *)var3 + 160 * a4);
        v17 = v16[1];
        v35[0] = *v16;
        v35[1] = v17;
        v18 = v16[2];
        v19 = v16[3];
        v20 = v16[5];
        v35[4] = v16[4];
        v35[5] = v20;
        v35[2] = v18;
        v35[3] = v19;
        v21 = v16[6];
        v22 = v16[7];
        v23 = v16[9];
        v35[8] = v16[8];
        v35[9] = v23;
        v35[6] = v21;
        v35[7] = v22;
        LODWORD(v35[0]) = 1065353216;
        v24 = -[PXGViewRenderer shouldSeparateViewLayers](self, "shouldSeparateViewLayers");
        LODWORD(v25) = *(_DWORD *)off_1E50B8290;
        LODWORD(v26) = *((_DWORD *)off_1E50B8290 + 1);
        LODWORD(v27) = *((_DWORD *)off_1E50B8290 + 2);
        LODWORD(v28) = *((_DWORD *)off_1E50B8290 + 3);
        LOBYTE(v34) = v24;
        objc_msgSend(v12, "pxg_configureWithTexture:geometry:info:style:textureInfo:resizableCapInsets:reusableViewInfo:screenScale:separateLayers:", 0, v14, v15, v35, 0, v11, v25, v26, v27, v28, a6, v34);

        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewRenderer.m"), 630, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("viewInfo.view"), v31, v33);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGViewRenderer.m"), 630, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("viewInfo.view"), v31);
    }

    goto LABEL_4;
  }
}

- (void)releaseResources
{
  void *v3;
  char v4;

  -[PXGViewRenderer interactionState](self, "interactionState");
  if (!v4)
  {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_reusableViewInfoBySpriteIndex, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_10375);
    -[NSMutableDictionary removeAllObjects](self->_reusableViewInfoBySpriteIndex, "removeAllObjects");
    -[PXGViewRenderer delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rendererNeedsUpdate:", self);

  }
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_reusableViewsByClass, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_82);
  -[NSMutableDictionary removeAllObjects](self->_reusableViewsByClass, "removeAllObjects");
}

- (PXGEntityManager)entityManager
{
  return self->_entityManager;
}

- (id)test_renderSnapshotHandler
{
  return self->_test_renderSnapshotHandler;
}

- (void)setTest_renderSnapshotHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (PXGRendererDelegate)delegate
{
  return (PXGRendererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- ($EDEBC7EA21717A15148E9A8A98906629)interactionState
{
  __int128 v3;
  CGSize v4;

  v3 = *(_OWORD *)&self[6].var8.size.height;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[6].var8.origin.y;
  *(_OWORD *)&retstr->var4 = v3;
  v4 = *(CGSize *)&self[7].var5;
  retstr->var8.origin = *(CGPoint *)&self[7].var1;
  retstr->var8.size = v4;
  return self;
}

- (__n128)cameraConfiguration
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;

  v2 = *(_OWORD *)(a1 + 288);
  *(_OWORD *)(a2 + 160) = *(_OWORD *)(a1 + 272);
  *(_OWORD *)(a2 + 176) = v2;
  *(_OWORD *)(a2 + 192) = *(_OWORD *)(a1 + 304);
  v3 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)(a2 + 96) = *(_OWORD *)(a1 + 208);
  *(_OWORD *)(a2 + 112) = v3;
  v4 = *(_OWORD *)(a1 + 256);
  *(_OWORD *)(a2 + 128) = *(_OWORD *)(a1 + 240);
  *(_OWORD *)(a2 + 144) = v4;
  v5 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(a2 + 48) = v5;
  v6 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)(a2 + 64) = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(a2 + 80) = v6;
  result = *(__n128 *)(a1 + 128);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 112);
  *(__n128 *)(a2 + 16) = result;
  return result;
}

- (BOOL)lowMemoryMode
{
  return self->_lowMemoryMode;
}

- (void)setLowMemoryMode:(BOOL)a3
{
  self->_lowMemoryMode = a3;
}

- (void)setRecordingSession:(id)a3
{
  objc_storeStrong((id *)&self->_recordingSession, a3);
}

- (UIView)rootView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_rootView);
}

- (void)setRootView:(id)a3
{
  objc_storeWeak((id *)&self->_rootView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rootView);
  objc_storeStrong((id *)&self->_recordingSession, 0);
  objc_storeStrong((id *)&self->_scrollViewController, 0);
  objc_storeStrong((id *)&self->_textureConverter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_test_renderSnapshotHandler, 0);
  objc_storeStrong((id *)&self->_entityManager, 0);
  objc_storeStrong((id *)&self->_lastPresentationDataStore, 0);
  objc_destroyWeak((id *)&self->_underlayHostingView);
  objc_storeStrong((id *)&self->_trackingContainerViewInfoBySpriteIndex, 0);
  objc_storeStrong((id *)&self->_reusableViewInfoBySpriteIndex, 0);
  objc_storeStrong((id *)&self->_reusableViewsByClass, 0);
}

void __35__PXGViewRenderer_releaseResources__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
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
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "pxg_removeFromSuperview");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __35__PXGViewRenderer_releaseResources__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  objc_msgSend(a3, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pxg_removeFromSuperview");

}

void __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", v4);
  objc_msgSend(*(id *)(a1 + 32), "_makeViewInfoReusable:", v3);

}

void __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_4_79(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  double v8;
  __int128 v9;
  _OWORD v10[2];
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(a2, "unsignedIntValue");
  v8 = *(double *)(a1 + 80);
  v9 = *(_OWORD *)(a1 + 56);
  v10[0] = *(_OWORD *)(a1 + 40);
  v10[1] = v9;
  v11 = *(_QWORD *)(a1 + 72);
  objc_msgSend(v5, "_configureTrackingContainerView:spriteIndex:sprites:screenScale:", v6, v7, v10, v8);

}

void __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_73(uint64_t a1, void *a2)
{
  void *v3;
  double (**v4)(id, id, double, double);
  id v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 368);
  v4 = a2;
  objc_msgSend(v3, "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v4[2](v4, v9, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v8 = v7;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v8;

}

double __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_2_75(uint64_t a1, void *a2, double a3, double a4)
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "hostingViewInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertHostedChildCenter:fromGlobalLayer:", v7, a3, a4);
  v11 = v10;

  return v11;
}

double __110__PXGViewRenderer_renderSpritesWithTextures_dataStore_presentationDataStore_presentationMetadataStore_layout___block_invoke_3_77(uint64_t a1, void *a2, double a3, double a4)
{
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  double v10;
  double v11;

  v6 = (id *)(*(_QWORD *)(a1 + 32) + 32);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertPoint:fromLayer:", v7, a3, a4);
  v11 = v10;

  return v11;
}

uint64_t __43__PXGViewRenderer_updateWithChangeDetails___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_makeViewInfoReusable:");
}

void __43__PXGViewRenderer_updateWithChangeDetails___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v11;
  void *v12;
  id v13;

  objc_msgSend(a3, "view");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v5, v6, CFSTR("PXGViewRenderer.m"), 264, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("viewInfo.view"), v8);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("PXGViewRenderer.m"), 264, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("viewInfo.view"), v8, v12);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v13, "setIsSpriteRemoved:", 1);

}

@end
