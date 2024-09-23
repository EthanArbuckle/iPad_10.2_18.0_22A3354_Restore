@implementation _UICollectionLayoutAuxillaryItemSolver

- (id)queryFramesIntersectingRect:(float64_t)a3 frameOffset:(float64_t)a4
{
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  float64_t v14;
  _UIRTree *v15;
  void *v16;
  _UIRTree *v17;
  void *v18;
  _UIRTree *v19;
  _QWORD *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  float64x2_t v24;
  float64x2_t v25;
  _QWORD v31[4];
  id v32;
  uint64_t v33;
  float64_t v34;
  float64_t v35;
  float64_t v36;
  float64_t v37;
  double v38;
  double v39;
  uint64_t v40;
  float64x2_t v41;
  float64x2_t v42;
  _UIRTree *v43;
  char v44;

  if (a1)
  {
    v10 = -[_UICollectionLayoutAuxillaryItemSolver memoizedSupplementaryKind](a1);
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = *(_QWORD *)(a1 + 72);
    v13 = *(void **)(a1 + 104);
    v14 = MEMORY[0x1E0C809B0];
    if (!v13)
    {
      v15 = objc_alloc_init(_UIRTree);
      v16 = *(void **)(a1 + 72);
      v41.f64[0] = v14;
      *(_QWORD *)&v41.f64[1] = 3221225472;
      *(_QWORD *)&v42.f64[0] = __65___UICollectionLayoutAuxillaryItemSolver__updateGeometricIndexer__block_invoke;
      *(_QWORD *)&v42.f64[1] = &unk_1E16B8FD0;
      v17 = v15;
      v43 = v17;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", &v41);
      v18 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v17;
      v19 = v17;

      v13 = *(void **)(a1 + 104);
    }
    v20 = v13;

    *(float64_t *)v31 = v14;
    v31[1] = 3221225472;
    v31[2] = __82___UICollectionLayoutAuxillaryItemSolver_queryFramesIntersectingRect_frameOffset___block_invoke;
    v31[3] = &unk_1E16B9348;
    v33 = v12;
    v34 = a2;
    v35 = a3;
    v36 = a4;
    v37 = a5;
    v38 = a6;
    v39 = a7;
    v40 = v10;
    v21 = v11;
    v32 = v21;
    v22 = v21;
    if (v20)
    {
      v44 = 0;
      v23 = (_QWORD *)v20[1];
      v24.f64[0] = a2;
      v25.f64[0] = a4;
      v24.f64[1] = a3;
      v25.f64[1] = a5;
      v41 = vaddq_f64(v24, vminnmq_f64(v25, (float64x2_t)0));
      v42 = vabsq_f64(v25);
      _UIRTreeContainerNode<unsigned long>::enumerateElementsIntersecting(v23, &v41, &v44, (uint64_t)v31);
      v22 = v32;
    }

  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (uint64_t)memoizedSupplementaryKind
{
  uint64_t result;
  id WeakRetained;

  result = *(_QWORD *)(a1 + 8);
  if (!result)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    *(_QWORD *)(a1 + 8) = objc_msgSend(WeakRetained, "auxillaryHostAuxillaryKind");

    return *(_QWORD *)(a1 + 8);
  }
  return result;
}

- (id)supplementaryFrames
{
  if (a1)
    a1 = (id *)a1[9];
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementaryItemGeometricIndexer, 0);
  objc_storeStrong((id *)&self->_supplementaryFramesKeyedByKindIndex, 0);
  objc_storeStrong((id *)&self->_enrolledSupplementaryFramesDict, 0);
  objc_storeStrong((id *)&self->_unpinnedFrames, 0);
  objc_storeStrong((id *)&self->_frames, 0);
  objc_destroyWeak((id *)&self->_auxillaryHost);
  objc_storeStrong((id *)&self->_supplementariesThatCanAffectContentSize, 0);
  objc_storeStrong((id *)&self->_pinnedSupplementaryIndexes, 0);
  objc_storeStrong((id *)&self->_elementKinds, 0);
  objc_storeStrong((id *)&self->_memoizedAuxillaryItems, 0);
}

- (uint64_t)initWithAuxillaryHost:(void *)a1
{
  id *v3;
  uint64_t v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)_UICollectionLayoutAuxillaryItemSolver;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  v4 = (uint64_t)v3;
  if (v3)
  {
    objc_storeWeak(v3 + 8, a2);
    *(_QWORD *)(v4 + 8) = 0;
    *(_QWORD *)(v4 + 56) = 0;
    -[_UICollectionLayoutAuxillaryItemSolver resolve](v4);
  }
  return v4;
}

- (void)resolve
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double *v36;
  double Width;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  CGFloat v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  id v49;
  _UICollectionLayoutAuxillaryOffsets *v50;
  uint64_t v51;
  id v52;
  id v53;
  CGFloat v54;
  id v55;
  _UICollectionLayoutAuxillaryOffsets *v56;
  double v57;
  double v58;
  double v59;
  double *v60;
  double v61;
  CGFloat *v62;
  double v63;
  CGFloat *v64;
  double v65;
  double *v66;
  CGFloat *v67;
  _BOOL4 v68;
  char v69;
  CGFloat *v70;
  CGFloat v71;
  CGFloat v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double Height;
  double v100;
  const char *v101;
  double v102;
  double v103;
  double v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  id *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  _UICollectionLayoutAuxillaryOffsets *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  double v130;
  double v131;
  unint64_t v132;
  double v133;
  CGFloat v134;
  double v135;
  id v136;
  id v137;
  id v138;
  CGFloat v139;
  CGFloat v140;
  void *v141;
  id obj;
  double obja;
  id *location;
  id *locationa;
  uint64_t v146;
  int v147;
  id v148;
  void *v149;
  double v150;
  id self;
  _QWORD v152[5];
  id v153;
  id v154;
  uint64_t *v155;
  CGFloat v156;
  CGFloat v157;
  double v158;
  double v159;
  CGFloat v160;
  CGFloat v161;
  uint64_t v162;
  char *v163;
  char v164;
  _QWORD v165[5];
  id v166;
  id v167;
  id *v168;
  id v169;
  id v170;
  _UICollectionLayoutAuxillaryOffsets *v171;
  uint64_t *v172;
  uint64_t *v173;
  uint64_t *v174;
  char *v175;
  CGFloat v176;
  CGFloat v177;
  double v178;
  double v179;
  CGFloat v180;
  CGFloat v181;
  void *v182;
  uint64_t v183;
  char v184;
  uint64_t v185;
  uint64_t *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  double *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  CGFloat *v194;
  uint64_t v195;
  void *v196;
  CGFloat v197;
  CGFloat v198;
  double v199;
  double v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  _BYTE v205[128];
  uint64_t v206;
  CGRect v207;
  CGRect v208;
  CGRect v209;
  CGRect v210;
  CGRect v211;
  CGRect v212;
  CGRect v213;

  v206 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (id *)(a1 + 64);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    *(_QWORD *)(v1 + 56) = 0;
    if (!WeakRetained)
    {
LABEL_112:

      return;
    }
    v4 = objc_loadWeakRetained(v2);

    v141 = WeakRetained;
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "handleFailureInMethod:object:file:lineNumber:description:", sel_memoizedSupplementaryItems, v1, CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 802, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.auxillaryHost"));

    }
    v5 = *(void **)(v1 + 16);
    self = (id)v1;
    if (!v5)
    {
      v148 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v201 = 0u;
      v202 = 0u;
      v203 = 0u;
      v204 = 0u;
      location = v2;
      v6 = objc_loadWeakRetained(v2);
      objc_msgSend(v6, "auxillaryHostAuxillaryItems");
      obj = (id)objc_claimAutoreleasedReturnValue();

      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v201, v205, 16);
      if (!v7)
        goto LABEL_47;
      v146 = *(_QWORD *)v202;
      while (1)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v202 != v146)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * v8);
          objc_msgSend(v9, "boundarySupplementaryItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            v11 = objc_loadWeakRetained(location);
            v12 = objc_msgSend(v11, "auxillaryHostLayoutAxis");
            if ((unint64_t)(v12 - 3) > 0xFFFFFFFFFFFFFFFDLL && (v13 = objc_msgSend(v10, "alignment")) != 0)
            {
              if (v12 == 1)
              {
                if (v13 - 2 >= 3)
                  v14 = 8 * (v13 - 6 < 3);
                else
                  v14 = 2;
                if (v13 <= 8)
                {
                  if (((1 << v13) & 0x70) != 0)
                  {
                    v16 = 10;
                    v17 = 4;
                    goto LABEL_24;
                  }
                  if (((1 << v13) & 0x106) != 0)
                  {
                    v16 = 10;
                    v17 = 1;
                    goto LABEL_24;
                  }
                }
                v17 = 0;
                v16 = 10;
              }
              else
              {
                if (v12 == 2 && v13 < 9)
                  v14 = qword_186679A28[v13 - 1];
                else
                  v14 = 0;
                v16 = 5;
                if (v13 - 2 >= 3)
                  v17 = 8 * (v13 - 6 < 3);
                else
                  v17 = 2;
              }
LABEL_24:
              v18 = (v14 & v16) != 0;
              objc_msgSend(v10, "offset");
              objc_msgSend(off_1E1679968, "layoutAnchorWithEdges:absoluteOffset:", v17 | v14);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v18 & objc_msgSend(v10, "extendsBoundary")) == 1)
              {
                if ((unint64_t)(v14 - 1) > 7)
                  v20 = 0;
                else
                  v20 = qword_1866799E8[v14 - 1];
                objc_msgSend(off_1E1679968, "layoutAnchorWithEdges:", v20 | v17);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v21 = 0;
              }
              v15 = (id)objc_msgSend(v10, "copyWithContainerAnchor:itemAnchor:", v19, v21);

            }
            else
            {
              v15 = v10;
            }

            objc_msgSend(v148, "addObject:", v15);
            goto LABEL_39;
          }
          objc_msgSend(v148, "addObject:", v9);
LABEL_39:
          if (!*((_BYTE *)self + 32))
          {
            objc_msgSend(v9, "size");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "isEstimated");

            if (v23)
              *((_BYTE *)self + 32) = 1;
          }

          ++v8;
        }
        while (v7 != v8);
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v201, v205, 16);
        v7 = v24;
        if (!v24)
        {
LABEL_47:

          v25 = (void *)*((_QWORD *)self + 2);
          *((_QWORD *)self + 2) = v148;

          v5 = (void *)*((_QWORD *)self + 2);
          WeakRetained = v141;
          v1 = (uint64_t)self;
          break;
        }
      }
    }
    v26 = v5;
    if (!objc_msgSend(v26, "count"))
    {
LABEL_111:

      WeakRetained = v141;
      goto LABEL_112;
    }
    v147 = objc_msgSend(WeakRetained, "auxillaryHostShouldLayoutRTL");
    v27 = objc_msgSend(WeakRetained, "auxillaryHostLayoutAxis");
    v149 = (void *)-[_UICollectionLayoutAuxillaryItemSolver memoizedSupplementaryKind](v1);
    objc_msgSend(WeakRetained, "auxillaryHostContainer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolve, self, CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 250, CFSTR("CompositionalLayout internal bug: Auxiliary host %@ returned a nil host container"), v141);

    }
    v29 = *MEMORY[0x1E0C9D538];
    v30 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v141, "auxillaryHostContentSize");
    v32 = v31;
    v34 = v33;
    v132 = v27 - 1;
    if (v27 == 1)
      v35 = 2;
    else
      v35 = v27 == 2;
    v36 = (double *)MEMORY[0x1E0C9D820];
    if (v27)
    {
      v207.origin.x = v29;
      v207.origin.y = v30;
      v207.size.width = v32;
      v207.size.height = v34;
      Width = CGRectGetWidth(v207);
      v208.origin.x = v29;
      v208.origin.y = v30;
      v208.size.width = v32;
      v208.size.height = v34;
      if (fabs(Width * CGRectGetHeight(v208)) < 2.22044605e-16)
      {
        objc_msgSend(v28, "contentSize");
        v40 = _UISizeValueForAxis(v35, v38, v39);
        v32 = _UISetSizeValueForAxis(v35, v32, v34, v40);
        v34 = v41;
      }
      v32 = _UISizeClampToMinimumSizeForAxis(v27, v32, v34, *v36, v36[1]);
      v34 = v42;
    }
    v43 = v30;
    v44 = v29;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v141, "auxillaryHostAdditionalFrameOffset");
      v44 = v45;
      v43 = v46;
    }
    objc_msgSend(v141, "auxillaryHostSupplementaryEnroller");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "handleFailureInMethod:object:file:lineNumber:description:", sel_resolve, self, CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 274, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("supplementaryEnroller"));

    }
    objc_msgSend(v141, "auxillaryHostPreferredSizes");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v50 = objc_alloc_init(_UICollectionLayoutAuxillaryOffsets);
    v51 = v27;
    v52 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v193 = 0;
    v194 = (CGFloat *)&v193;
    v195 = 0x4010000000;
    v196 = &unk_18685B0AF;
    v197 = v29;
    v198 = v30;
    v199 = v32;
    v200 = v34;
    v189 = 0;
    v190 = (double *)&v189;
    v191 = 0x2020000000;
    v192 = 0;
    v185 = 0;
    v186 = &v185;
    v187 = 0x2020000000;
    v188 = 0;
    v165[0] = MEMORY[0x1E0C809B0];
    v165[1] = 3221225472;
    v165[2] = __49___UICollectionLayoutAuxillaryItemSolver_resolve__block_invoke;
    v165[3] = &unk_1E16B9370;
    v175 = sel_resolve;
    v165[4] = self;
    v136 = v47;
    v166 = v136;
    v53 = v28;
    v167 = v53;
    locationa = v48;
    v168 = locationa;
    v176 = v29;
    v177 = v30;
    v178 = v32;
    v179 = v34;
    v134 = v44;
    v180 = v44;
    v181 = v43;
    v54 = v43;
    v184 = v147;
    v182 = v149;
    v55 = v49;
    v169 = v55;
    v138 = v52;
    v137 = v52;
    v170 = v137;
    v172 = &v185;
    v56 = v50;
    v171 = v56;
    v173 = &v189;
    v183 = v51;
    v174 = &v193;
    objc_msgSend(v26, "enumerateObjectsUsingBlock:", v165);
    v57 = v190[3];
    v58 = v32;
    v59 = v34;
    v60 = (double *)MEMORY[0x1E0C9D820];
    if (v57 > 0.0)
    {
      v58 = v32 + _UISetSizeValueForAxis(v51, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), v57);
      v59 = v34 + v61;
    }
    v209.origin.x = v29;
    v209.origin.y = v30;
    v139 = v32;
    v140 = v34;
    v209.size.width = v32;
    v209.size.height = v34;
    v213.origin.x = v29;
    v213.origin.y = v30;
    v213.size.width = v58;
    v213.size.height = v59;
    if (!CGRectEqualToRect(v209, v213))
    {
      v62 = v194;
      v194[4] = v29;
      v62[5] = v30;
      v62[6] = v58;
      v62[7] = v59;
      v152[0] = MEMORY[0x1E0C809B0];
      v152[1] = 3221225472;
      v152[2] = __49___UICollectionLayoutAuxillaryItemSolver_resolve__block_invoke_2;
      v152[3] = &unk_1E16B9398;
      v152[4] = self;
      v153 = v53;
      v156 = v29;
      v157 = v30;
      v158 = v58;
      v159 = v59;
      v160 = v134;
      v161 = v54;
      v164 = v147;
      v162 = v51;
      v163 = sel_resolve;
      v154 = v55;
      v155 = &v193;
      objc_msgSend(v154, "enumerateObjectsUsingBlock:", v152);

    }
    obja = 0.0;
    if (v186[3] >= 1 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v141, "auxillaryHostPaddingBeforeBoundarySupplementaries");
      obja = v63;
      if (v63 > 0.0)
      {
        if (v51 == 1)
        {
          v67 = v194;
          v65 = v63;
          v194[4] = v194[4] - v63;
          v66 = v67 + 6;
        }
        else
        {
          if (v51 != 2)
            goto LABEL_74;
          v64 = v194;
          v65 = v63;
          v194[5] = v194[5] - v63;
          v66 = v64 + 7;
        }
        *v66 = v65 + *v66;
      }
    }
LABEL_74:
    v210.origin.x = v29;
    v210.origin.y = v30;
    v210.size.width = v58;
    v210.size.height = v59;
    v68 = !CGRectIsEmpty(v210);
    v69 = v149 == (void *)4 || v68;
    if ((v69 & 1) != 0)
    {
      v70 = v194;
      v71 = v194[6];
      v72 = v194[7];
      v73 = v71;
      v74 = v72;
LABEL_90:
      v103 = _UIRectSubtractingRectYieldingDirectionalInsets(v29, v30, v139, v140, v70[4], v70[5], v71, v72);
      v104 = v102;
      v106 = v105;
      v108 = v107;
      if (v186[3])
        v109 = 0;
      else
        v109 = v69;
      if ((v109 & 1) == 0)
      {
        if (fabs(v102) >= 2.22044605e-16 || fabs(v103) >= 2.22044605e-16)
        {
          v110 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v203 = 0u;
          v204 = 0u;
          v201 = 0u;
          v202 = 0u;
          v111 = v55;
          v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v201, v205, 16);
          if (v112)
          {
            v113 = *(_QWORD *)v202;
            do
            {
              v114 = 0;
              do
              {
                if (*(_QWORD *)v202 != v113)
                  objc_enumerationMutation(v111);
                v115 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * v114);
                if (v115)
                {
                  v116 = *(double *)(v115 + 64);
                  v117 = *(double *)(v115 + 72);
                  v118 = *(double *)(v115 + 80);
                  v119 = *(double *)(v115 + 88);
                  v120 = *(void **)(v115 + 16);
                }
                else
                {
                  v120 = 0;
                  v117 = 0.0;
                  v116 = 0.0;
                  v119 = 0.0;
                  v118 = 0.0;
                }
                v121 = -[_UICollectionLayoutFramesQueryResult copyWithFrame:index:]((id *)v115, v120, v116 - v104, v117 - v103, v118, v119);
                objc_msgSend(v110, "addObject:", v121);

                ++v114;
              }
              while (v112 != v114);
              v122 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v201, v205, 16);
              v112 = v122;
            }
            while (v122);
          }

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v55);
          v110 = (id)objc_claimAutoreleasedReturnValue();
        }
        v123 = objc_msgSend(v110, "mutableCopy");

        v55 = (id)v123;
      }
      objc_setProperty_nonatomic_copy(self, v101, v55, 80);
      objc_storeStrong((id *)self + 5, v138);
      -[_UICollectionLayoutAuxillaryItemSolver setFrames:]((uint64_t)self, v55);
      *((double *)self + 14) = v73;
      *((double *)self + 15) = v74;
      *((double *)self + 18) = v103;
      *((double *)self + 19) = v104;
      *((_QWORD *)self + 20) = v106;
      *((_QWORD *)self + 21) = v108;
      *((double *)self + 16) = -v104;
      *((double *)self + 17) = -v103;
      v124 = (void *)*((_QWORD *)self + 6);
      *((_QWORD *)self + 6) = v56;
      v125 = v56;

      v126 = (void *)*((_QWORD *)self + 13);
      *((_QWORD *)self + 13) = 0;

      _Block_object_dispose(&v185, 8);
      _Block_object_dispose(&v189, 8);
      _Block_object_dispose(&v193, 8);

      goto LABEL_111;
    }
    objc_msgSend(v53, "contentSize");
    objc_msgSend(v53, "contentSize");
    v77 = v75;
    v78 = v76;
    if (v132 > 1)
    {
      v133 = *v60;
      v135 = v60[1];
      if (v51)
      {
        v85 = v60[1];
        v83 = *v60;
LABEL_89:
        v73 = v83 + _UISetSizeValueForAxis(v51, v133, v135, obja);
        v74 = v85 + v100;
        v70 = v194;
        v71 = v194[6];
        v72 = v194[7];
        goto LABEL_90;
      }
      v86 = _UISetSizeValueForAxis(1, v75, v76, 1000000.0);
      v88 = v87;
      -[_UICollectionLayoutAuxillaryItemSolver _rearrangedFramesForFrames:container:primaryContentFrame:frameOffset:preferredSizes:layoutRTL:supplementaryKind:]((uint64_t)self, v55, v53, (uint64_t)locationa, v147, v149, v29, v30, v86, v87, v29, v30);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v89 = -[_UICollectionLayoutAuxillaryItemSolver _requiredContentSizeForSupplementaryFrames:forLayoutAxis:containerSize:]((uint64_t)self, v82, 1, v86, v88);
      v130 = v90;
      v131 = v89;
      v91 = _UISetSizeValueForAxis(2, v77, v78, 1000000.0);
      v93 = v92;
      -[_UICollectionLayoutAuxillaryItemSolver _rearrangedFramesForFrames:container:primaryContentFrame:frameOffset:preferredSizes:layoutRTL:supplementaryKind:]((uint64_t)self, v55, v53, (uint64_t)locationa, v147, v149, v29, v30, v91, v92, v29, v30);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = -[_UICollectionLayoutAuxillaryItemSolver _requiredContentSizeForSupplementaryFrames:forLayoutAxis:containerSize:]((uint64_t)self, v94, 2, v91, v93);
      v150 = v96;
      v97 = v95;
      v83 = _UISizeValueForAxis(1, v131, v130);
      v211.origin.x = v29;
      v211.origin.y = v30;
      v211.size.width = v58;
      v211.size.height = v59;
      v98 = CGRectGetWidth(v211);
      if (v83 < v98)
        v83 = v98;
      v85 = _UISizeValueForAxis(2, v97, v150);
      v212.origin.x = v29;
      v212.origin.y = v30;
      v212.size.width = v58;
      v212.size.height = v59;
      Height = CGRectGetHeight(v212);
      if (v85 < Height)
        v85 = Height;

    }
    else
    {
      v79 = _UISetSizeValueForAxis(v51, v75, v76, 1000000.0);
      v81 = v80;
      -[_UICollectionLayoutAuxillaryItemSolver _rearrangedFramesForFrames:container:primaryContentFrame:frameOffset:preferredSizes:layoutRTL:supplementaryKind:]((uint64_t)self, v55, v53, (uint64_t)locationa, v147, v149, v29, v30, v79, v80, v29, v30);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = -[_UICollectionLayoutAuxillaryItemSolver _requiredContentSizeForSupplementaryFrames:forLayoutAxis:containerSize:]((uint64_t)self, v82, v51, v79, v81);
      v85 = v84;
      v133 = *v60;
      v135 = v60[1];
    }

    goto LABEL_89;
  }
}

- (double)_sizeForSupplementaryItem:(uint64_t)a3 container:(uint64_t)a4 preferredSizes:(uint64_t)a5 preferredIndex:
{
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  _BYTE *v21;
  void *v22;
  double v23;
  double v24;
  void *v26;

  if (!a1)
    return 0.0;
  v10 = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(v10, "auxillaryHostTraitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  objc_msgSend(a2, "size");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_effectiveSizeForContainer:displayScale:ignoringInsets:", a3, 0, v13);
  v16 = v15;
  v18 = v17;

  if (a4)
  {
    objc_msgSend(a2, "elementKind");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionPreferredSizes objectForKeyedSubscript:](a4, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICollectionPreferredSizes objectAtIndexedSubscript:]((uint64_t)v20, a5);
    v21 = (_BYTE *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if (_UICollectionViewCompositionalLayoutShouldRespectPreferredSizeOnEstimatedAxisOnly())
      {
        objc_msgSend(a2, "size");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = -[_UICollectionPreferredSize preferredSizeForOriginalSize:layoutSize:]((uint64_t)v21, v22, v16, v18);
        v18 = v23;

      }
      else if (!v21[48])
      {
        v16 = -[_UICollectionPreferredSize fittingSize]((uint64_t)v21);
        v18 = v24;
      }
      if (v16 == *MEMORY[0x1E0C9D820] && v18 == *(double *)(MEMORY[0x1E0C9D820] + 8))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__sizeForSupplementaryItem_container_preferredSizes_preferredIndex_, a1, CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 590, CFSTR("Preferred size is ZERO for auxiliary item %@ in container %@"), a2, a3);

      }
    }

  }
  return v16;
}

- (double)_frameForSupplementaryItem:(void *)a3 container:(int)a4 primaryContentFrame:(double)a5 supplementaryItemSize:(double)a6 frameOffset:(double)a7 layoutRTL:(double)a8
{
  id WeakRetained;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  CGFloat Width;
  CGFloat Height;
  void *v58;
  char v59;
  double v60;
  double v62;
  CGFloat v63;
  CGRect v64;
  CGRect v65;

  if (!a1)
    return 0.0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v24 = objc_msgSend(WeakRetained, "auxillaryHostLayoutAxis");
  v25 = 0.0;
  if (v24 && (v24 != 1 ? (v26 = v24 == 2) : (v26 = 2), v26))
  {
    objc_msgSend(a3, "contentInsets");
    if (v26 != 1)
    {
      v25 = 0.0;
      v28 = 0.0;
      goto LABEL_11;
    }
    v29 = 0.0;
  }
  else
  {
    v29 = 0.0;
    v28 = 0.0;
  }
  v27 = 0.0;
LABEL_11:
  v30 = a5 + v28;
  v31 = a7 - (v25 + v28);
  v32 = a6 + v27;
  v33 = a8 - (v29 + v27);
  objc_msgSend(a3, "effectiveContentSize");
  v62 = v35;
  v63 = v34;
  objc_msgSend(a2, "containerAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "itemAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_itemFrameForContainerRect:itemSize:itemLayoutAnchor:", v37, v30, v32, v31, v33, a9, a10);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  objc_msgSend(a2, "_effectiveContentInsets");
  v47 = v39 + v46;
  v49 = v43 - (v48 + v46);
  v51 = v41 + v50;
  v53 = v45 - (v50 + v52);
  v54 = a11 + v39 + v46;
  v55 = a12 + v51;
  v64.origin.x = v39 + v46;
  v64.origin.y = v51;
  v64.size.width = v49;
  v64.size.height = v53;
  Width = CGRectGetWidth(v64);
  v65.origin.x = v47;
  v65.origin.y = v51;
  v65.size.width = v49;
  v65.size.height = v53;
  Height = CGRectGetHeight(v65);
  if (a4)
  {
    objc_msgSend(a2, "item");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "ignoresRTL");

    if ((v59 & 1) == 0 && fabs(v63 * v62) >= 2.22044605e-16)
    {
      _UIApplyRTLTransformForFrameWithDimension(v54, v55, Width, Height, v63);
      v54 = v60;
    }
  }

  return v54;
}

- (id)supplementaryFrameWithKind:(uint64_t)a3 index:(double)a4 additionalFrameOffset:(double)a5
{
  id *v5;
  void *v10;
  id *v11;
  id *v13;
  void *v15;

  v5 = a1;
  if (a1)
  {
    if (!objc_msgSend(a2, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_supplementaryFrameWithKind_index_additionalFrameOffset_, v5, CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("kind.length"));

    }
    +[_UICollectionLayoutFramesQueryResult kindIndexKeyForKind:index:]((uint64_t)_UICollectionLayoutFramesQueryResult, a2, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5[12], "objectForKeyedSubscript:", v10);
    v11 = (id *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (a4 != *MEMORY[0x1E0C9D538] || a5 != *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      v13 = -[_UICollectionLayoutFramesQueryResult copyWithOffset:](v11, a4, a5);

      v5 = v13;
    }

  }
  return v5;
}

- (void)setFrames:(uint64_t)a1
{
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 72), a2);
    v4 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = 0;

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = a2;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(uint64_t **)(*((_QWORD *)&v20 + 1) + 8 * v11);
          if (v12)
            v13 = (void *)v12[6];
          else
            v13 = 0;
          v14 = v13;
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v14, (_QWORD)v20);

          -[_UICollectionLayoutFramesQueryResult kindIndexKey](v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, v15);

          ++v11;
        }
        while (v9 != v11);
        v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v9 = v16;
      }
      while (v16);
    }

    v17 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = v5;
    v18 = v5;

    v19 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = v6;

  }
}

- (id)_rearrangedFramesForFrames:(void *)a3 container:(uint64_t)a4 primaryContentFrame:(int)a5 frameOffset:(void *)a6 preferredSizes:(double)a7 layoutRTL:(double)a8 supplementaryKind:(double)a9
{
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _UICollectionLayoutFramesQueryResult *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id *v39;
  void *v40;
  uint64_t v41;
  id obj;
  uint64_t v44;
  id v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = a2;
  v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v51)
  {
    v44 = *(_QWORD *)v53;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v53 != v44)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v19);
        -[_UICollectionLayoutFramesQueryResult auxillaryItem]((_QWORD *)v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          if (v20)
            goto LABEL_8;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", sel__rearrangedFramesForFrames_container_primaryContentFrame_frameOffset_preferredSizes_layoutRTL_supplementaryKind_, a1, CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 469, CFSTR("Failed to retrieve auxillary item from result."));

          if (v20)
          {
LABEL_8:
            v22 = *(_QWORD *)(v20 + 16);
            goto LABEL_9;
          }
        }
        v22 = 0;
LABEL_9:
        v23 = -[_UICollectionLayoutAuxillaryItemSolver _sizeForSupplementaryItem:container:preferredSizes:preferredIndex:](a1, v21, (uint64_t)a3, a4, v22);
        v25 = -[_UICollectionLayoutAuxillaryItemSolver _frameForSupplementaryItem:container:primaryContentFrame:supplementaryItemSize:frameOffset:layoutRTL:](a1, v21, a3, a5, a7, a8, a9, a10, v23, v24, a11, a12);
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v32 = [_UICollectionLayoutFramesQueryResult alloc];
        if (v20)
        {
          v33 = *(_BYTE *)(v20 + 8) != 0;
          v34 = *(void **)(v20 + 16);
          v35 = *(void **)(v20 + 32);
          objc_msgSend(v21, "item");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = *(void **)(v20 + 48);
        }
        else
        {
          objc_msgSend(v21, "item");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = 0;
          v33 = 0;
          v34 = 0;
          v37 = 0;
        }
        v38 = v37;
        v39 = -[_UICollectionLayoutFramesQueryResult initWithFrame:adjustedForPinning:index:zIndex:resultKind:item:auxillaryKind:supplementaryEnrollmentIdentifier:]((id *)&v32->super.isa, v33, v34, (void *)1, v35, v36, a6, v38, v25, v27, v29, v31);

        objc_msgSend(v50, "addObject:", v39);
        ++v19;
      }
      while (v51 != v19);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      v51 = v41;
    }
    while (v41);
  }

  return v50;
}

- (_QWORD)elementKinds
{
  _QWORD *v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[3];
    if (!v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v4 = (id)v1[9];
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v4);
            -[_UICollectionLayoutFramesQueryResult auxillaryItem](*(_QWORD **)(*((_QWORD *)&v13 + 1) + 8 * v8));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "elementKind", (_QWORD)v13);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v10, "length"))
              objc_msgSend(v3, "addObject:", v10);

            ++v8;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v6);
      }

      v11 = (void *)v1[3];
      v1[3] = v3;

      v2 = (void *)v1[3];
    }
    a1 = v2;
  }
  return a1;
}

- (double)_requiredContentSizeForSupplementaryFrames:(uint64_t)a3 forLayoutAxis:(double)a4 containerSize:(double)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat Height;
  CGFloat Width;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  double MinY;
  double MaxY;
  uint64_t v40;
  void *v43;
  double v44;
  double v45;
  _QWORD v46[5];
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v44 = a4;
  v45 = a5;
  v61 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__requiredContentSizeForSupplementaryFrames_forLayoutAxis_containerSize_, a1, CFSTR("_UICollectionLayoutAuxillaryItemSolver.m"), 714, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("layoutAxis == UIAxisVertical || layoutAxis == UIAxisHorizontal"), *(_QWORD *)&v44, *(_QWORD *)&v45);

  }
  if (!objc_msgSend(a2, "count"))
    return *MEMORY[0x1E0C9D820];
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = a2;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v56;
    v10 = 0.0;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v56 != v9)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v11);
        if (v12)
        {
          v13 = *(double *)(v12 + 64);
          v14 = *(double *)(v12 + 72);
        }
        else
        {
          v14 = 0.0;
          v13 = 0.0;
        }
        v15 = _UIPointValueForAxis(a3, v13, v14);
        v16 = fabs(v15);
        if (v16 > v10 && v15 < 0.0)
          v10 = v16;
        ++v11;
      }
      while (v8 != v11);
      v18 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      v8 = v18;
    }
    while (v18);
  }
  else
  {
    v10 = 0.0;
  }

  v20 = _UISetPointValueForAxis(a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v10);
  v22 = v21;
  v23 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v24 = v7;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v52;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v52 != v26)
          objc_enumerationMutation(v24);
        v28 = *(double **)(*((_QWORD *)&v51 + 1) + 8 * v27);
        if (v28)
        {
          v30 = v28[8];
          v29 = v28[9];
          v31 = v28[10];
          Height = v28[11];
        }
        else
        {
          v29 = 0.0;
          v31 = 0.0;
          Height = 0.0;
          v30 = 0.0;
        }
        if (v10 > 0.0)
        {
          v62.origin.x = v30;
          v62.origin.y = v29;
          v62.size.width = v31;
          v62.size.height = Height;
          Width = CGRectGetWidth(v62);
          v63.origin.x = v30;
          v63.origin.y = v29;
          v63.size.width = v31;
          v63.size.height = Height;
          Height = CGRectGetHeight(v63);
          v30 = v20 + v30;
          v29 = v22 + v29;
          v31 = Width;
        }
        v34 = v30;
        v35 = v29;
        v36 = v31;
        v37 = Height;
        if (a3 == 2)
        {
          MinY = CGRectGetMinY(*(CGRect *)&v34);
          v64.origin.x = v30;
          v64.origin.y = v29;
          v64.size.width = v31;
          v64.size.height = Height;
          MaxY = CGRectGetMaxY(v64);
        }
        else
        {
          MinY = CGRectGetMinX(*(CGRect *)&v34);
          v65.origin.x = v30;
          v65.origin.y = v29;
          v65.size.width = v31;
          v65.size.height = Height;
          MaxY = CGRectGetMaxX(v65);
        }
        objc_msgSend(v23, "addIndexesInRange:", (uint64_t)MinY, (uint64_t)MaxY - (uint64_t)MinY);
        ++v27;
      }
      while (v25 != v27);
      v40 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      v25 = v40;
    }
    while (v40);
  }

  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __113___UICollectionLayoutAuxillaryItemSolver__requiredContentSizeForSupplementaryFrames_forLayoutAxis_containerSize___block_invoke;
  v46[3] = &unk_1E16B93C0;
  v46[4] = &v47;
  objc_msgSend(v23, "enumerateRangesUsingBlock:", v46);
  v19 = _UISetSizeValueForAxis(a3, v44, v45, (double)v48[3]);
  _Block_object_dispose(&v47, 8);

  return v19;
}

- (void)resolveSupplementaryItemsForVisibleBounds:(CGFloat)a3
{
  id WeakRetained;
  id v11;
  void *v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  id v17;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    if (WeakRetained)
    {
      v17 = WeakRetained;
      v11 = a1[5];
      if (objc_msgSend(v11, "count"))
      {
        v12 = (void *)objc_msgSend(a1[10], "mutableCopy");
        if (objc_msgSend(v12, "count"))
        {
          v13 = -[_UICollectionLayoutAuxillaryItemSolver _visiblePinningRectFromVisibleRect:auxillaryHost:]((uint64_t)a1, v17, a2, a3, a4, a5);
          -[_UICollectionLayoutAuxillaryItemSolver _updateSupplementaryFrames:atIndexes:forPinningToVisibleRect:]((uint64_t)a1, v12, v11, v13, v14, v15, v16);
          -[_UICollectionLayoutAuxillaryItemSolver setFrames:]((uint64_t)a1, v12);
        }

      }
      WeakRetained = v17;
    }

  }
}

- (void)_updateSupplementaryFrames:(void *)a3 atIndexes:(CGFloat)a4 forPinningToVisibleRect:(CGFloat)a5
{
  void *v13;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id WeakRetained;
  CGRect v21;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    if (WeakRetained)
    {
      if (objc_msgSend(a3, "count"))
      {
        v21.origin.x = a4;
        v21.origin.y = a5;
        v21.size.width = a6;
        v21.size.height = a7;
        if (!CGRectIsNull(v21))
        {
          objc_msgSend(a2, "objectsAtIndexes:", a3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "count"))
          {
            v14 = objc_msgSend(WeakRetained, "auxillaryHostWantsOverlapAdjustmentForMatchingAlignmentsOnly");
            objc_msgSend(WeakRetained, "auxillaryHostPinningRect");
            _UIPinnedNonOverlappingFramesForContentFrameVisibleFrame(v13, v14, v15, v16, v17, v18, a4, a5, a6, a7);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a2, "replaceObjectsAtIndexes:withObjects:", a3, v19);

          }
        }
      }
    }

  }
}

- (double)_visiblePinningRectFromVisibleRect:(CGFloat)a3 auxillaryHost:(CGFloat)a4
{
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double result;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  if (!a1)
    return 0.0;
  objc_msgSend(a2, "auxillaryHostPinningRect");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19.origin.x = a3;
  v19.origin.y = a4;
  v19.size.width = a5;
  v19.size.height = a6;
  if (CGRectIsEmpty(v19))
    return *MEMORY[0x1E0C9D628];
  v20.origin.x = a3;
  v20.origin.y = a4;
  v20.size.width = a5;
  v20.size.height = a6;
  v22.origin.x = v11;
  v22.origin.y = v13;
  v22.size.width = v15;
  v22.size.height = v17;
  if (!CGRectIntersectsRect(v20, v22))
    return *MEMORY[0x1E0C9D628];
  v21.origin.x = a3;
  v21.origin.y = a4;
  v21.size.width = a5;
  v21.size.height = a6;
  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  *(_QWORD *)&result = (unint64_t)CGRectIntersection(v21, v23);
  return result;
}

- (id)unpinnedFramesOfPinnedSupplementaries
{
  if (a1)
    a1 = (id *)a1[10];
  return a1;
}

- (id)supplementaryFrameWithKind:(uint64_t)a3 index:
{
  if (a1)
  {
    -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:additionalFrameOffset:](a1, a2, a3, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)unpinnedSupplementaryFrameWithKind:(uint64_t)a3 index:
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  _QWORD *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (objc_msgSend(a1[10], "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = a1[10];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD **)(*((_QWORD *)&v19 + 1) + 8 * v10);
          if (v11)
            v12 = v11[2];
          else
            v12 = 0;
          if (v12 == a3)
          {
            -[_UICollectionLayoutFramesQueryResult auxillaryItem](*(_QWORD **)(*((_QWORD *)&v19 + 1) + 8 * v10));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "elementKind", (_QWORD)v19);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", a2);

            if ((v15 & 1) != 0)
            {
              v18 = v11;

              return v18;
            }
          }
          ++v10;
        }
        while (v8 != v10);
        v16 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v8 = v16;
      }
      while (v16);
    }

    return 0;
  }
  -[_UICollectionLayoutAuxillaryItemSolver supplementaryFrameWithKind:index:](a1, a2, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
