@implementation _TVLockupFactory

- (_TVLockupFactory)init
{
  _TVLockupFactory *v2;
  _TVLockupFactory *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TVLockupFactory;
  v2 = -[_TVLockupFactory init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_TVLockupFactory _registerLockup](v2, "_registerLockup");
  return v3;
}

- (void)_registerLockup
{
  id v2;

  +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_registerViewCreatorEx:withType:", &__block_literal_global_45, 24);

}

+ (TVCellMetrics)cellMetricsForCollectionElement:(SEL)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v8;
  _TVStackingPosterView *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _TVStackingPosterView *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  CGFloat v47;
  void *v48;
  objc_class *v49;
  _TVOrganizerView *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  void (*v57)(_QWORD *, CGSize *);
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  void *v72;
  TVCellMetrics *result;
  unsigned int v74;
  void *v76;
  id v77;
  _TVOrganizerView *v78;
  id obj;
  id v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  _TVStackingPosterView *v89;
  _QWORD *v90;
  id v91;
  int v93;
  uint64_t v94;
  int v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  CGSize v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  CGSize cellSize;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  _QWORD v130[10];
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  void *v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  void *v140;
  __int128 v141;
  __int128 v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  void *v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  void *v152;
  __int128 v153;
  __int128 v154;
  uint64_t v155;
  CGSize *v156;
  uint64_t v157;
  void *v158;
  __int128 v159;
  _BYTE v160[128];
  _BYTE v161[128];
  _BYTE v162[128];
  _BYTE v163[128];
  uint64_t v164;

  v164 = *MEMORY[0x24BDAC8D0];
  v77 = a4;
  objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("TVFactoryKeyCellMetrics"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v77, "updateType") || !v76)
  {
    v74 = objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled");
    objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", 0);
    objc_msgSend(v77, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "tv_contentAlignment");
    if (v6 <= 1)
      v7 = 1;
    else
      v7 = v6;

    v155 = 0;
    v156 = (CGSize *)&v155;
    v157 = 0x3010000000;
    v158 = &unk_222E82B8D;
    v159 = *MEMORY[0x24BDBF148];
    v149 = 0;
    v150 = &v149;
    v151 = 0x4010000000;
    v152 = &unk_222E82B8D;
    v8 = *(_OWORD *)(MEMORY[0x24BDF7718] + 16);
    v153 = *MEMORY[0x24BDF7718];
    v154 = v8;
    v143 = 0;
    v144 = &v143;
    v145 = 0x4010000000;
    v146 = &unk_222E82B8D;
    v147 = v153;
    v148 = v8;
    v137 = 0;
    v138 = &v137;
    v139 = 0x4010000000;
    v140 = &unk_222E82B8D;
    v141 = v153;
    v142 = v8;
    v131 = 0;
    v132 = &v131;
    v133 = 0x4010000000;
    v134 = &unk_222E82B8D;
    v135 = v153;
    v136 = v8;
    v130[0] = MEMORY[0x24BDAC760];
    v130[1] = 3221225472;
    v130[2] = __52___TVLockupFactory_cellMetricsForCollectionElement___block_invoke;
    v130[3] = &unk_24EB883B8;
    v130[4] = &v155;
    v130[5] = &v149;
    v130[6] = &v143;
    v130[7] = &v137;
    v130[8] = &v131;
    v130[9] = v7;
    v90 = (_QWORD *)MEMORY[0x22767F470](v130);
    v9 = [_TVStackingPosterView alloc];
    v10 = *MEMORY[0x24BDBF090];
    v11 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v14 = -[_TVStackingPosterView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x24BDBF090], v11, v12, v13);
    -[_TVStackingPosterView setConfiguresForCollectionViewCell:](v14, "setConfiguresForCollectionViewCell:", 1);
    -[_TVStackingPosterView setMaxBoundsSize:](v14, "setMaxBoundsSize:", v156[2].width, v156[2].height);
    v89 = v14;
    v78 = -[_TVOrganizerView initWithFrame:]([_TVOrganizerView alloc], "initWithFrame:", v10, v11, v12, v13);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    objc_msgSend(v77, "sections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v126, v163, 16);
    if (!v16)
    {
LABEL_15:
      v80 = 0;
      goto LABEL_17;
    }
    v17 = *(_QWORD *)v127;
LABEL_9:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v127 != v17)
        objc_enumerationMutation(v15);
      v19 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * v18);
      objc_msgSend(v19, "attributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("prominent"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      if (v22)
        break;
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v126, v163, 16);
        if (!v16)
          goto LABEL_15;
        goto LABEL_9;
      }
    }
    v80 = v19;
LABEL_17:

    objc_msgSend(v77, "attributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = 0u;
    v125 = 0u;
    v122 = 0u;
    v123 = 0u;
    objc_msgSend(v77, "sections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v162, 16);
    if (!v83)
      goto LABEL_78;
    v81 = *(_QWORD *)v123;
    v25 = *MEMORY[0x24BDBF148];
    v26 = *(double *)(MEMORY[0x24BDBF148] + 8);
LABEL_19:
    v84 = 0;
LABEL_20:
    if (*(_QWORD *)v123 != v81)
      objc_enumerationMutation(obj);
    v85 = *(id *)(*((_QWORD *)&v122 + 1) + 8 * v84);
    objc_msgSend(v85, "attributes");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("homogeneous"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    v95 = v82;
    if (v86)
      v95 = objc_msgSend(v86, "BOOLValue");
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v112 = 0u;
    cellSize = (CGSize)0;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    objc_msgSend(v85, "prototypes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v109, v161, 16);
    if (!v29)
      goto LABEL_76;
    v94 = *(_QWORD *)v110;
    if (v80)
      v30 = v85 == v80;
    else
      v30 = 1;
    v31 = v30;
    v93 = v31;
    v91 = v28;
LABEL_32:
    v32 = 0;
    while (1)
    {
      if (*(_QWORD *)v110 != v94)
        objc_enumerationMutation(v91);
      v33 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v32);
      objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("TVFactoryKeyCellMetrics"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "updateType") || v34 == 0)
        break;
      objc_msgSend(v34, "tv_cellMetricsValue");
      v119 = v106;
      v120 = v107;
      v121 = v108;
      v115 = v102;
      v116 = v103;
      v117 = v104;
      v118 = v105;
      cellSize = v100;
      v114 = v101;
LABEL_62:
      if (v93)
      {
        v57 = (void (*)(_QWORD *, CGSize *))v90[2];
        v106 = v119;
        v107 = v120;
        v108 = v121;
        v102 = v115;
        v103 = v116;
        v104 = v117;
        v105 = v118;
        v100 = cellSize;
        v101 = v114;
        v57(v90, &v100);
      }
      if (v95)
      {
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        objc_msgSend(v85, "prototypes");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v96, v160, 16);
        if (v59)
        {
          v60 = *(_QWORD *)v97;
          do
          {
            for (i = 0; i != v59; ++i)
            {
              if (*(_QWORD *)v97 != v60)
                objc_enumerationMutation(v58);
              v62 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
              v106 = v119;
              v107 = v120;
              v108 = v121;
              v102 = v115;
              v103 = v116;
              v104 = v117;
              v105 = v118;
              v100 = cellSize;
              v101 = v114;
              objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithCellMetrics:", &v100);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setObject:forKeyedSubscript:", v63, CFSTR("TVFactoryKeyCellMetrics"));

            }
            v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v96, v160, 16);
          }
          while (v59);
        }

        v28 = v91;
        goto LABEL_76;
      }

      if (v29 == ++v32)
      {
        v28 = v91;
        v29 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v109, v161, 16);
        if (v29)
          goto LABEL_32;
LABEL_76:

        if (++v84 == v83)
        {
          v83 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v162, 16);
          if (!v83)
          {
LABEL_78:

            objc_msgSend(MEMORY[0x24BDF6F90], "setAnimationsEnabled:", v74);
            retstr->cellSize = v156[2];
            v64 = *((_OWORD *)v150 + 3);
            *(_OWORD *)&retstr->cellPadding.top = *((_OWORD *)v150 + 2);
            *(_OWORD *)&retstr->cellPadding.bottom = v64;
            v65 = *((_OWORD *)v144 + 3);
            *(_OWORD *)&retstr->cellInset.top = *((_OWORD *)v144 + 2);
            *(_OWORD *)&retstr->cellInset.bottom = v65;
            v66 = *((_OWORD *)v138 + 3);
            *(_OWORD *)&retstr->cellInsetAlt.top = *((_OWORD *)v138 + 2);
            *(_OWORD *)&retstr->cellInsetAlt.bottom = v66;
            v67 = *((_OWORD *)v132 + 3);
            *(_OWORD *)&retstr->cellMargin.top = *((_OWORD *)v132 + 2);
            *(_OWORD *)&retstr->cellMargin.bottom = v67;
            v68 = *(_OWORD *)&retstr->cellMargin.top;
            v119 = *(_OWORD *)&retstr->cellInsetAlt.bottom;
            v120 = v68;
            v121 = *(_OWORD *)&retstr->cellMargin.bottom;
            v69 = *(_OWORD *)&retstr->cellInset.top;
            v115 = *(_OWORD *)&retstr->cellPadding.bottom;
            v116 = v69;
            v70 = *(_OWORD *)&retstr->cellInsetAlt.top;
            v117 = *(_OWORD *)&retstr->cellInset.bottom;
            v118 = v70;
            v71 = *(_OWORD *)&retstr->cellPadding.top;
            cellSize = retstr->cellSize;
            v114 = v71;
            objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithCellMetrics:", &cellSize);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v77, "setObject:forKeyedSubscript:", v72, CFSTR("TVFactoryKeyCellMetrics"));

            _Block_object_dispose(&v131, 8);
            _Block_object_dispose(&v137, 8);
            _Block_object_dispose(&v143, 8);
            _Block_object_dispose(&v149, 8);
            _Block_object_dispose(&v155, 8);
            v4 = v76;
            goto LABEL_79;
          }
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
    if (objc_msgSend(v33, "tv_elementType") == 24)
    {
      objc_msgSend(a2, "_configurationIdentifierForElement:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36
        && (objc_msgSend(v87, "objectForKeyedSubscript:", v36),
            v37 = (void *)objc_claimAutoreleasedReturnValue(),
            (v38 = v37) != 0))
      {
        objc_msgSend(v37, "tv_cellMetricsValue");
        v119 = v106;
        v120 = v107;
        v121 = v108;
        v115 = v102;
        v116 = v103;
        v117 = v104;
        v118 = v105;
        cellSize = v100;
        v114 = v101;
      }
      else
      {
        +[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v33);
        v38 = (void *)objc_opt_new();
        objc_msgSend(v38, "setAcceptsFocus:", 1);
        objc_msgSend(a2, "_configureStackingPoster:layout:element:forMetrics:", v89, v38, v33, 1);
        if (v89)
        {
          -[_TVStackingPosterView cellMetrics](v89, "cellMetrics");
        }
        else
        {
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v100 = (CGSize)0;
        }
        v119 = v106;
        v120 = v107;
        v121 = v108;
        v115 = v102;
        v116 = v103;
        v117 = v104;
        v118 = v105;
        cellSize = v100;
        v114 = v101;
        if (v36)
        {
          v106 = v119;
          v107 = v120;
          v108 = v121;
          v102 = v115;
          v103 = v116;
          v104 = v117;
          v105 = v118;
          v100 = cellSize;
          v101 = v114;
          objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithCellMetrics:", &v100);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKeyedSubscript:", v51, v36);

        }
      }

      goto LABEL_61;
    }
    objc_msgSend(v33, "style");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v39, "tv_hasHeight") & 1) != 0)
    {
      objc_msgSend(v33, "style");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "tv_hasWidth");

      if (v41)
      {
        objc_msgSend(v33, "style");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "tv_width");
        v44 = v43;
        objc_msgSend(v33, "style");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "tv_height");
        v47 = v46;
LABEL_60:

        cellSize.width = v44;
        cellSize.height = v47;
        objc_msgSend(v33, "isDisabled");
LABEL_61:
        objc_msgSend(a2, "_validateCellMetrics:", &cellSize);
        v106 = v119;
        v107 = v120;
        v108 = v121;
        v102 = v115;
        v103 = v116;
        v104 = v117;
        v105 = v118;
        v100 = cellSize;
        v101 = v114;
        objc_msgSend(MEMORY[0x24BDD1968], "tv_valueWithCellMetrics:", &v100);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setObject:forKeyedSubscript:", v56, CFSTR("TVFactoryKeyCellMetrics"));

        goto LABEL_62;
      }
    }
    else
    {

    }
    objc_msgSend(v33, "elementName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "objectForKeyedSubscript:", v42);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v45)
    {
      +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = (objc_class *)objc_msgSend(v48, "_extendedCollectionViewCellClassForIKElement:", v33);

      if (v49)
        v50 = (_TVOrganizerView *)objc_alloc_init(v49);
      else
        v50 = v78;
      v45 = v50;
      objc_msgSend(v88, "setObject:forKeyedSubscript:", v50, v42);
    }
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "_viewFromElement:existingView:", v33, v45);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "tv_sizeThatFits:", v25, v26);
    v44 = v54;
    v47 = v55;

    goto LABEL_60;
  }
  v4 = v76;
  objc_msgSend(v76, "tv_cellMetricsValue");
LABEL_79:

  return result;
}

+ (void)updateViewLayoutForCell:(id)a3 forSize:(CGSize)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  _OWORD v41[9];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 buf;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  height = a4.height;
  width = a4.width;
  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend(v7, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subviews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v7, "tv_contentAlignment");
  if (v11 <= 1)
    v12 = 1;
  else
    v12 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = v12;
    v39 = v8;
    v40 = v7;
    v38 = v10;
    v13 = v10;
    objc_msgSend(v13, "setMaxBoundsSize:", width, height);
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v36 = v13;
    objc_msgSend(v13, "components");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v43 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v19, "tv_associatedIKViewElement");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("TVForceUpdate"));
            +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "_viewFromElement:existingView:", v20, v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22 != v19)
            {
              v23 = TVMLKitLogObject;
              if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(_QWORD *)((char *)&buf + 4) = v19;
                _os_log_impl(&dword_222D98000, v23, OS_LOG_TYPE_DEFAULT, "Dropping layout update for label: %@", (uint8_t *)&buf, 0xCu);
              }
            }

          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
      }
      while (v16);
    }

    objc_msgSend(v36, "setNeedsUpdateComponentLayout");
    v7 = v40;
    objc_msgSend(v40, "tv_padding");
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;
    if (v36)
      objc_msgSend(v36, "cellMetrics");
    else
      memset(v41, 0, sizeof(v41));
    v8 = v39;
    *(double *)&buf = width;
    *((double *)&buf + 1) = height;
    v47 = v25;
    v48 = v27;
    v49 = v29;
    v50 = v31;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    objc_msgSend(a1, "_customCellPaddingForCellMetrics:withCollectionCellMetrics:contentAlignment:", v41, &buf, v37);
    objc_msgSend(v36, "setFrame:", v35, v34, width - (v35 + v32), height - (v34 + v33));

    v10 = v38;
  }

}

+ (UIEdgeInsets)_customCellPaddingForCellMetrics:(TVCellMetrics *)a3 withCollectionCellMetrics:(TVCellMetrics *)a4 contentAlignment:(int64_t)a5
{
  double top;
  double height;
  double left;
  double bottom;
  double v9;
  double v10;
  double v11;
  double v12;
  double right;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  UIEdgeInsets result;

  height = a3->cellSize.height;
  top = a3->cellPadding.top;
  left = a3->cellPadding.left;
  bottom = a3->cellPadding.bottom;
  v9 = height - (top + bottom);
  v10 = a4->cellSize.height;
  v11 = a4->cellPadding.top;
  v12 = v10 - (v11 + a4->cellPadding.bottom);
  right = a3->cellPadding.right;
  v14 = v11 - top;
  if (a5 == 3)
  {
    v15 = v12 - v9;
  }
  else
  {
    if (a5 != 2)
      goto LABEL_6;
    v15 = floor((v12 - v9) * 0.5);
  }
  v14 = v14 + v15;
LABEL_6:
  if (v14 <= 0.0)
    v14 = -0.0;
  v16 = top + v14;
  v17 = height + v14;
  if (v17 >= v10)
    v18 = -0.0;
  else
    v18 = v10 - v17;
  v19 = bottom + v18;
  result.right = right;
  result.bottom = v19;
  result.left = left;
  result.top = v16;
  return result;
}

+ (void)_configureCell:(id)a3 layout:(id)a4 element:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _TVStackingPosterView *v14;
  unint64_t v15;
  uint64_t v16;
  _TVStackingPosterView *v17;
  _TVStackingPosterView *v18;
  _TVStackingPosterView *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  uint64_t v48;
  _QWORD v49[6];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _OWORD v56[9];

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[objc_class layoutWithLayout:element:](+[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v9), "layoutWithLayout:element:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subviews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (_TVStackingPosterView *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v11, "contentAlignment");
  if (v15 <= 1)
    v16 = 1;
  else
    v16 = v15;
  if (objc_msgSend(v9, "tv_elementType") == 24)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = v14;
    }
    else
    {
      v18 = [_TVStackingPosterView alloc];
      v17 = -[_TVStackingPosterView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    }
    v19 = v17;
    -[_TVStackingPosterView setSelected:animated:focusUpdateContext:withAnimationCoordinator:](v17, "setSelected:animated:focusUpdateContext:withAnimationCoordinator:", 0, 0, 0, 0);
    -[_TVStackingPosterView setConfiguresForCollectionViewCell:](v19, "setConfiguresForCollectionViewCell:", 1);
    objc_msgSend(v8, "bounds");
    -[_TVStackingPosterView setMaxBoundsSize:](v19, "setMaxBoundsSize:", v20, v21);
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "setAcceptsFocus:", 1);
    objc_msgSend(v22, "setCenterGrowth:", objc_msgSend(v11, "centerGrowth"));
    objc_msgSend(a1, "_configureStackingPoster:layout:element:forMetrics:", v19, v22, v9, 0);
    objc_msgSend(v8, "bounds");
    v24 = v23;
    v26 = v25;
    objc_msgSend(v8, "bounds");
    v28 = v27;
    v30 = v29;
    objc_msgSend(v11, "padding");
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;
    if (v19)
      -[_TVStackingPosterView cellMetrics](v19, "cellMetrics");
    else
      memset(v56, 0, sizeof(v56));
    v49[0] = v28;
    v49[1] = v30;
    v49[2] = v32;
    v49[3] = v34;
    v49[4] = v36;
    v49[5] = v38;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    objc_msgSend(a1, "_customCellPaddingForCellMetrics:withCollectionCellMetrics:contentAlignment:", v56, v49, v16);
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    objc_msgSend(v11, "setPadding:");
    -[_TVStackingPosterView setFrame:](v19, "setFrame:", v42, v40, v24 - (v42 + v46), v26 - (v40 + v44));
    -[_TVStackingPosterView setSelected:animated:focusUpdateContext:withAnimationCoordinator:](v19, "setSelected:animated:focusUpdateContext:withAnimationCoordinator:", objc_msgSend(v8, "isFocused"), 0, 0, 0);

    if (v19 != v14)
    {
      objc_msgSend(v12, "subviews");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "makeObjectsPerformSelector:", sel_removeFromSuperview);

      objc_msgSend(v12, "addSubview:", v19);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v11, "acceptsFocus"))
      v48 = objc_msgSend(v9, "isDisabled") ^ 1;
    else
      v48 = 0;
    objc_msgSend(v8, "setAllowsFocus:", v48);
  }
  objc_msgSend(v8, "tv_setLayout:", v11);

}

+ (void)_configureStackingPoster:(id)a3 layout:(id)a4 element:(id)a5 forMetrics:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  id v33;
  void *v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  char v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  void (**v56)(_QWORD, _QWORD);
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t *v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[4];
  id v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  char v81;
  _QWORD v82[4];
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  _QWORD v88[4];
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v6 = a6;
  v96 = *MEMORY[0x24BDAC8D0];
  v55 = a3;
  v9 = a5;
  v10 = a4;
  v52 = v9;
  -[objc_class layoutWithLayout:element:](+[TVViewLayout layoutClassForElement:](TVViewLayout, "layoutClassForElement:", v9), "layoutWithLayout:element:", v10, v9);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "appDocument");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "templateElement");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "parent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "tv_elementType");

  v15 = objc_msgSend(v49, "tv_elementType") == 72 && v13 != 35;
  v16 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v9, "children");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  objc_msgSend(v9, "children");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  if (v19)
  {
    v54 = 0;
    v20 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v91 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        v23 = objc_msgSend(v22, "tv_elementType");
        if ((!v15 || v23 != 16 && v23 != 35 && v23 != 81) && (!v6 || v23 != 35))
        {
          if (v23 == 35)
          {
            if (!v54)
              v54 = v22;
          }
          else if (v23 != 43 && (v23 != 16 || objc_msgSend(v22, "tv_imageType") != 1))
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("TVConfigureForMetrics"));

            objc_msgSend(v53, "addObject:", v22);
          }
        }
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    }
    while (v19);
  }
  else
  {
    v54 = 0;
  }

  objc_msgSend(v55, "overlayView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v88[0] = MEMORY[0x24BDAC760];
  v88[1] = 3221225472;
  v88[2] = __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke;
  v88[3] = &unk_24EB883E0;
  v51 = v55;
  v89 = v51;
  v56 = (void (**)(_QWORD, _QWORD))MEMORY[0x22767F470](v88);
  v26 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v51, "components");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "arrayWithCapacity:", objc_msgSend(v27, "count"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  objc_msgSend(v51, "components");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v30; ++j)
      {
        if (*(_QWORD *)v85 != v31)
          objc_enumerationMutation(v29);
        v33 = *(id *)(*((_QWORD *)&v84 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v33, "overlayView");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34 == 0;

          if (!v35)
          {
            objc_msgSend(v33, "overlayView");
            v36 = objc_claimAutoreleasedReturnValue();

            v82[0] = MEMORY[0x24BDAC760];
            v82[1] = 3221225472;
            v82[2] = __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_2;
            v82[3] = &unk_24EB883E0;
            v83 = v33;
            v37 = MEMORY[0x22767F470](v82);

            v56 = (void (**)(_QWORD, _QWORD))v37;
            v25 = (void *)v36;
          }
        }
        if (objc_msgSend(v33, "tv_elementType"))
          objc_msgSend(v28, "addObject:", v33);

      }
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    }
    while (v30);
  }

  v78 = 0;
  v79 = &v78;
  v80 = 0x2020000000;
  v81 = 0;
  if (!v15)
  {
    v38 = objc_msgSend(v28, "count");
    if (v38 == objc_msgSend(v53, "count"))
    {
      *((_BYTE *)v79 + 24) = 1;
      v75[0] = MEMORY[0x24BDAC760];
      v75[1] = 3221225472;
      v75[2] = __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_3;
      v75[3] = &unk_24EB85490;
      v76 = v53;
      v77 = &v78;
      objc_msgSend(v28, "enumerateObjectsUsingBlock:", v75);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "acceptsFocus"))
    v40 = objc_msgSend(v52, "isDisabled") ^ 1;
  else
    v40 = 0;
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__10;
  v73 = __Block_byref_object_dispose__10;
  v74 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x2020000000;
  v68 = 1;
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __71___TVLockupFactory__configureStackingPoster_layout_element_forMetrics___block_invoke_23;
  v57[3] = &unk_24EB88408;
  v61 = &v78;
  v41 = v28;
  v58 = v41;
  v64 = v40;
  v42 = v52;
  v59 = v42;
  v62 = &v69;
  v63 = &v65;
  v43 = v39;
  v60 = v43;
  objc_msgSend(v53, "enumerateObjectsUsingBlock:", v57);
  if (v54)
  {
    +[TVInterfaceFactory sharedInterfaceFactory](TVInterfaceFactory, "sharedInterfaceFactory");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_viewFromElement:existingView:", v54, v25);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {
      objc_msgSend(v54, "children");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v47 = v25;
      else
        v47 = 0;
      +[TVMLViewFactory organizerViewWithElements:existingView:](TVMLViewFactory, "organizerViewWithElements:existingView:", v46, v47);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v45, "transferLayoutStylesFromElement:", v54);
      objc_msgSend(v45, "tv_setAssociatedIKViewElement:", v54);
    }
  }
  else
  {
    v45 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56[2](v56, v70[5]);
    v48 = (void *)v70[5];
  }
  else
  {
    ((void (**)(_QWORD, id))v56)[2](v56, v51);
    v48 = v51;
  }
  objc_msgSend(v48, "setOverlayView:", v45);
  if (*((_BYTE *)v66 + 24))
    objc_msgSend(v51, "setNeedsUpdateComponentLayout");
  else
    objc_msgSend(v51, "setComponents:", v43);
  objc_msgSend(v51, "tv_setLayout:", v50);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);

  _Block_object_dispose(&v78, 8);
}

+ (id)_configurationIdentifierForElement:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(void *, void *);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  char isKindOfClass;
  void (**v16)(void *, void *);
  char v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void (**v36)(void *, void *);
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = MEMORY[0x24BDAC760];
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_4;
  v46[3] = &unk_24EB884F0;
  v48 = &__block_literal_global_27_0;
  v5 = v3;
  v47 = v5;
  v49 = &__block_literal_global_31_0;
  v6 = (void (**)(void *, void *))MEMORY[0x22767F470](v46);
  v41[0] = v4;
  v41[1] = 3221225472;
  v41[2] = __55___TVLockupFactory__configurationIdentifierForElement___block_invoke_5;
  v41[3] = &unk_24EB88518;
  v43 = &__block_literal_global_27_0;
  v7 = v5;
  v42 = v7;
  v44 = &__block_literal_global_35;
  v45 = &__block_literal_global_31_0;
  v36 = (void (**)(void *, void *))MEMORY[0x22767F470](v41);
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v7, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v38;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v14, "tv_elementType") != 35 && objc_msgSend(v14, "tv_elementType") != 4)
        {
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          v16 = v6;
          if ((isKindOfClass & 1) == 0 && (objc_opt_class(), v17 = objc_opt_isKindOfClass(), v16 = v36, (v17 & 1) == 0)
            || (v16[2](v16, v14), (v18 = objc_claimAutoreleasedReturnValue()) == 0))
          {
            v34 = 0;
            v20 = v7;
            goto LABEL_18;
          }
          v19 = (void *)v18;
          if (objc_msgSend(v8, "length"))
            objc_msgSend(v8, "appendString:", CFSTR(" "));
          objc_msgSend(v8, "appendString:", v19);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", CFSTR("{"));
  v20 = v7;
  objc_msgSend(v7, "style");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "tv_padding");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%.0f %.0f %.0f %.0f;"),
    CFSTR("padding"),
    v22,
    v25,
    v24,
    v23);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v26);

  objc_msgSend(v7, "style");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "tv_width");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%.0f;"), CFSTR("width"), v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v29);

  objc_msgSend(v7, "style");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "tv_height");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%.0f;"), CFSTR("height"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:", v32);

  objc_msgSend(v9, "appendString:", CFSTR("}["));
  v33 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "appendString:", v33);

  objc_msgSend(v9, "appendString:", CFSTR("]"));
  v34 = (void *)objc_msgSend(v9, "copy");
LABEL_18:

  return v34;
}

@end
