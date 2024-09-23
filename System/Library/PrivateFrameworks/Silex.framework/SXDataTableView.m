@implementation SXDataTableView

- (id)initWithDataSource:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)SXDataTableView;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 53, v3);
  }

  return a1;
}

- (void)setBlueprint:(id *)a1
{
  double v4;
  double v5;
  double v6;
  id v7;

  v7 = a2;
  if (a1)
  {
    -[SXDataTableView reset]((uint64_t)a1);
    objc_msgSend(v7, "tableSize");
    v5 = v4;
    objc_msgSend(v7, "tableSize");
    objc_msgSend(a1, "setFrame:", 0.0, 0.0, v5, v6);
    -[SXDataTableView layoutCellsForBlueprint:](a1, v7);
    -[SXDataTableView prepareDrawingForBlueprint:](a1, v7);
    objc_storeStrong(a1 + 55, a2);
  }

}

- (void)reset
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 448), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_89);
    objc_msgSend(*(id *)(a1 + 456), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_1_0);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 448);
    *(_QWORD *)(a1 + 448) = v2;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 456);
    *(_QWORD *)(a1 + 456) = v4;

  }
}

- (void)layoutCellsForBlueprint:(id *)a1
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id *v7;
  id *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id WeakRetained;
  void *v36;
  id v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double Height;
  id v43;
  unint64_t v44;
  uint64_t v45;
  double v46;
  CGFloat MinX;
  CGFloat MinY;
  void *v49;
  CGFloat rect;
  CGFloat v51;
  id v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v52 = a2;
  if (a1 && objc_msgSend(v52, "numberOfRows"))
  {
    v3 = 0;
    while (1)
    {
      -[SXDataTableView viewForRowAtIndex:]((uint64_t)a1, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v52;
      if (v4)
      {
        objc_msgSend(v52, "rectForRowAtIndex:", v3);
        objc_msgSend(v4, "setFrame:");
        objc_msgSend(a1, "addSubview:", v4);
        v5 = v52;
      }
      if (objc_msgSend(v5, "numberOfColumns", v4))
        break;
LABEL_26:

      if (++v3 >= (unint64_t)objc_msgSend(v52, "numberOfRows"))
        goto LABEL_27;
    }
    v6 = 0;
    if (v49)
      v7 = (id *)v49;
    else
      v7 = a1;
    while (1)
    {
      v8 = v7;
      -[SXDataTableView viewForColumnAtIndex:]((uint64_t)a1, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v52, "rectForColumnAtIndex:", v6);
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        v18 = v9;

        objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
        objc_msgSend(a1, "addSubview:", v18);
        v19 = v52;
        v8 = (id *)v18;
      }
      else
      {
        v19 = v52;
      }
      objc_msgSend(v19, "cellRectForIndexPath:", v3, v6);
      v51 = v20;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      objc_msgSend(v52, "cellContentRectForIndexPath:", v3, v6);
      v28 = v27;
      v30 = v29;
      v32 = v31;
      v34 = v33;
      WeakRetained = objc_loadWeakRetained(a1 + 53);
      objc_msgSend(WeakRetained, "dataTableView:viewForCellAtIndexPath:constraintToSize:", a1, v3, v6, v32, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_loadWeakRetained(a1 + 54);
      v38 = objc_msgSend(v37, "verticalAlignmentForCellAtIndexPath:", v3, v6);

      objc_msgSend(v36, "frame");
      v40 = v39;
      objc_msgSend(v36, "frame");
      rect = v41;
      if ((v38 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      {
        if (v38 != 3)
          goto LABEL_18;
        objc_msgSend(v36, "frame");
        Height = CGRectGetHeight(v53);
      }
      else
      {
        v34 = v34 * 0.5;
        objc_msgSend(v36, "frame");
        Height = CGRectGetHeight(v54) * 0.5;
      }
      v30 = v30 + v34 - Height;
LABEL_18:
      v43 = objc_loadWeakRetained(a1 + 54);
      v44 = objc_msgSend(v43, "horizontalAlignmentForCellAtIndexPath:", v3, v6);

      if (v44 <= 1)
        v45 = 1;
      else
        v45 = v44;
      v46 = v32 - v40;
      if (v45 == 3)
        goto LABEL_24;
      if (v45 == 2)
      {
        v46 = v46 * 0.5;
LABEL_24:
        v28 = v28 + v46;
      }
      v55.origin.x = v51;
      v55.origin.y = v22;
      v55.size.width = v24;
      v55.size.height = v26;
      MinX = CGRectGetMinX(v55);
      v56.origin.x = v51;
      v56.origin.y = v22;
      v56.size.width = v24;
      v56.size.height = v26;
      MinY = CGRectGetMinY(v56);
      v57.origin.x = v28;
      v57.origin.y = v30;
      v57.size.width = v40;
      v57.size.height = rect;
      v58 = CGRectOffset(v57, MinX, MinY);
      objc_msgSend(v36, "setFrame:", v58.origin.x, v58.origin.y, v58.size.width, v58.size.height);
      objc_msgSend(v8, "addSubview:", v36);

      if (++v6 >= (unint64_t)objc_msgSend(v52, "numberOfColumns"))
        goto LABEL_26;
    }
  }
LABEL_27:

}

- (void)prepareDrawingForBlueprint:(id *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat x;
  double v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  BOOL v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  BOOL v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  unint64_t v73;
  __int128 v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  CGFloat v89;
  CGFloat v90;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat v94;
  double v95;
  CGFloat rect1a;
  CGFloat rect1;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  double v101;
  double v102;
  CGFloat v103;
  CGFloat rect;
  CGFloat v105;
  CGFloat v106;
  CGFloat v107;
  _QWORD v108[4];
  id v109;
  _QWORD *v110;
  _QWORD *v111;
  _QWORD *v112;
  id v113;
  _QWORD v114[4];
  id v115;
  _QWORD *v116;
  _QWORD *v117;
  _QWORD *v118;
  id v119;
  _QWORD v120[4];
  id v121;
  _QWORD *v122;
  id v123;
  _QWORD v124[4];
  id v125;
  _QWORD *v126;
  id v127;
  id location;
  _QWORD v129[4];
  __int128 v130;
  __int128 v131;
  _QWORD v132[4];
  __int128 v133;
  __int128 v134;
  _QWORD v135[4];
  __int128 v136;
  __int128 v137;
  _QWORD v138[4];
  __int128 v139;
  __int128 v140;
  _QWORD v141[4];
  id v142;
  double v143;
  double v144;
  double v145;
  double v146;
  _QWORD v147[4];
  id v148;
  CGFloat v149;
  CGFloat v150;
  CGFloat v151;
  CGFloat v152;
  _QWORD v153[4];
  id v154;
  CGFloat v155;
  CGFloat v156;
  CGFloat v157;
  CGFloat v158;
  _QWORD v159[4];
  id v160;
  CGFloat v161;
  CGFloat v162;
  double v163;
  double v164;
  _QWORD v165[4];
  id v166;
  double v167;
  double v168;
  double v169;
  double v170;
  _QWORD v171[4];
  id v172;
  double v173;
  double v174;
  double v175;
  double v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = objc_msgSend(v3, "numberOfRows");
    v6 = MEMORY[0x24BDAC760];
    if (v5)
    {
      v7 = 0;
      v89 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v90 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v87 = *MEMORY[0x24BDBF090];
      v88 = *(double *)(MEMORY[0x24BDBF090] + 24);
      v84 = v4;
      do
      {
        if (objc_msgSend(v4, "numberOfColumns"))
        {
          v8 = 0;
          do
          {
            objc_msgSend(v4, "cellRectForIndexPath:", v7, v8);
            v10 = v9;
            v101 = v11;
            v102 = v9;
            v12 = v11;
            v14 = v13;
            v16 = v15;
            objc_msgSend(v4, "cellContentRectForIndexPath:", v7, v8);
            v98 = v18;
            v100 = v17;
            v94 = v20;
            rect1a = v19;
            objc_msgSend(v4, "rectForColumnDividerAtIndexPath:", v7, v8);
            v105 = v22;
            v106 = v21;
            v107 = v23;
            rect = v24;
            objc_msgSend(v4, "rectForRowDividerAtIndexPath:", v7, v8);
            v26 = v25;
            v103 = v27;
            v29 = v28;
            v31 = v30;
            v177.origin.x = v10;
            v177.origin.y = v12;
            v177.size.width = v14;
            v177.size.height = v16;
            MinX = CGRectGetMinX(v177);
            v178.origin.x = v10;
            v178.origin.y = v12;
            v178.size.width = v14;
            v178.size.height = v16;
            MinY = CGRectGetMinY(v178);
            v179.origin.y = v98;
            v179.origin.x = v100;
            v179.size.height = v94;
            v179.size.width = rect1a;
            v180 = CGRectOffset(v179, MinX, MinY);
            x = v180.origin.x;
            width = v180.size.width;
            y = v180.origin.y;
            height = v180.size.height;
            v180.origin.y = v105;
            v180.origin.x = v106;
            v180.size.width = v107;
            v180.size.height = rect;
            v95 = v14;
            rect1 = v31;
            v35 = v14 + CGRectGetWidth(v180);
            v99 = v29;
            v181.origin.x = v26;
            v181.origin.y = v103;
            v181.size.width = v29;
            v181.size.height = v31;
            v36 = v16 + CGRectGetHeight(v181);
            -[SXDataTableView dataSource](a1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "backgroundColorForRowAtIndex:", v7);
            v38 = (void *)objc_claimAutoreleasedReturnValue();

            if (v38)
            {
              v171[0] = v6;
              v171[1] = 3221225472;
              v171[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke;
              v171[3] = &unk_24D68D550;
              v173 = v102;
              v174 = v101;
              v175 = v35;
              v176 = v36;
              v172 = v38;
              v39 = (void *)MEMORY[0x219A070A8](v171);
              -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v39, v7, v8);

            }
            -[SXDataTableView dataSource](a1);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "backgroundColorForColumnAtIndex:", v8);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if (v41)
            {
              v165[0] = v6;
              v165[1] = 3221225472;
              v165[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_2;
              v165[3] = &unk_24D68D550;
              v167 = v102;
              v168 = v101;
              v169 = v35;
              v170 = v36;
              v166 = v41;
              v42 = (void *)MEMORY[0x219A070A8](v165);
              -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v42, v7, v8);

            }
            -[SXDataTableView dataSource](a1);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "backgroundColorForCellAtIndexPath:", v7, v8);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              -[SXDataTableView dataSource](a1);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "paddingForCellAtIndexPath:", v7, v8);
              v46 = x;
              v48 = v47;
              v50 = v49;
              v86 = v51;
              v53 = v52;

              v182.origin.x = v46;
              v182.origin.y = y;
              v182.size.width = width;
              v182.size.height = height;
              v85 = CGRectGetMinX(v182) - v53;
              v183.origin.x = v46;
              v183.origin.y = y;
              v183.size.width = width;
              v183.size.height = height;
              v54 = CGRectGetMinY(v183) - v48;
              v184.origin.x = v46;
              v184.origin.y = y;
              v184.size.width = width;
              v184.size.height = height;
              v55 = v50 + v53 + CGRectGetWidth(v184);
              v185.origin.x = v46;
              v185.origin.y = y;
              v185.size.width = width;
              v185.size.height = height;
              v56 = CGRectGetHeight(v185);
              v159[0] = v6;
              v159[1] = 3221225472;
              v159[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_3;
              v159[3] = &unk_24D68D550;
              v161 = v85;
              v162 = v54;
              v163 = v55;
              v164 = v86 + v48 + v56;
              v160 = v44;
              v57 = (void *)MEMORY[0x219A070A8](v159);
              -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v57, v7, v8);

            }
            -[SXDataTableView dataSource](a1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "rowDividerAtIndex:", v7);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v59, "color");
            v60 = objc_claimAutoreleasedReturnValue();
            if (v60)
            {
              v61 = (void *)v60;
              v186.size.width = v99;
              v186.origin.x = v26;
              v186.origin.y = v103;
              v186.size.height = rect1;
              v188.origin.x = v87;
              v188.size.height = v88;
              v188.size.width = v89;
              v188.origin.y = v90;
              v62 = CGRectEqualToRect(v186, v188);

              if (!v62)
              {
                v153[0] = v6;
                v153[1] = 3221225472;
                v153[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_4;
                v153[3] = &unk_24D68D550;
                v154 = v59;
                v155 = v26;
                v156 = v103;
                v157 = v99;
                v158 = rect1;
                v63 = (void *)MEMORY[0x219A070A8](v153);
                -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v63, v7, v8);

              }
            }
            -[SXDataTableView dataSource](a1);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "columnDividerAtIndex:", v8);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v65, "color");
            v66 = objc_claimAutoreleasedReturnValue();
            if (v66)
            {
              v67 = (void *)v66;
              v187.origin.y = v105;
              v187.origin.x = v106;
              v187.size.width = v107;
              v187.size.height = rect;
              v189.origin.x = v87;
              v189.size.height = v88;
              v189.size.width = v89;
              v189.origin.y = v90;
              v68 = CGRectEqualToRect(v187, v189);

              if (!v68)
              {
                v147[0] = MEMORY[0x24BDAC760];
                v147[1] = 3221225472;
                v147[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_5;
                v147[3] = &unk_24D68D550;
                v148 = v65;
                v149 = v106;
                v150 = v105;
                v151 = v107;
                v152 = rect;
                v69 = (void *)MEMORY[0x219A070A8](v147);
                -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v69, v7, v8);

              }
            }
            -[SXDataTableView dataSource](a1);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "cellBorderForCellAtIndexPath:", v7, v8);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            if (v71)
            {
              v141[0] = MEMORY[0x24BDAC760];
              v141[1] = 3221225472;
              v141[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_6;
              v141[3] = &unk_24D68D550;
              v143 = v102;
              v144 = v101;
              v145 = v95;
              v146 = v16;
              v142 = v71;
              v72 = (void *)MEMORY[0x219A070A8](v141);
              -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v72, v7, v8);

            }
            ++v8;
            v4 = v84;
            v73 = objc_msgSend(v84, "numberOfColumns");
            v6 = MEMORY[0x24BDAC760];
          }
          while (v8 < v73);
        }
        ++v7;
      }
      while (v7 < objc_msgSend(v4, "numberOfRows"));
    }
    v138[0] = 0;
    v138[1] = v138;
    v138[2] = 0x4010000000;
    v138[3] = "";
    v74 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
    v139 = *MEMORY[0x24BDBF090];
    v140 = v74;
    v135[0] = 0;
    v135[1] = v135;
    v135[2] = 0x4010000000;
    v135[3] = "";
    v136 = v139;
    v137 = v74;
    v132[0] = 0;
    v132[1] = v132;
    v132[2] = 0x4010000000;
    v132[3] = "";
    v133 = v139;
    v134 = v74;
    v129[0] = 0;
    v129[1] = v129;
    v129[2] = 0x4010000000;
    v129[3] = "";
    v130 = v139;
    v131 = v74;
    objc_initWeak(&location, a1);
    v124[0] = v6;
    v124[1] = 3221225472;
    v124[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_7;
    v124[3] = &unk_24D68D578;
    objc_copyWeak(&v127, &location);
    v126 = v138;
    v75 = v4;
    v125 = v75;
    v76 = (void *)MEMORY[0x219A070A8](v124);
    -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v76, 0, 0x7FFFFFFFFFFFFFFFLL);
    v120[0] = v6;
    v120[1] = 3221225472;
    v120[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_8;
    v120[3] = &unk_24D68D578;
    objc_copyWeak(&v123, &location);
    v122 = v135;
    v77 = v75;
    v121 = v77;
    v78 = (void *)MEMORY[0x219A070A8](v120);
    -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v78, objc_msgSend(v77, "numberOfRows") - 1, 0x7FFFFFFFFFFFFFFFLL);
    v114[0] = MEMORY[0x24BDAC760];
    v114[1] = 3221225472;
    v114[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_9;
    v114[3] = &unk_24D68D5A0;
    objc_copyWeak(&v119, &location);
    v116 = v129;
    v79 = v77;
    v115 = v79;
    v117 = v138;
    v118 = v135;
    v80 = (void *)MEMORY[0x219A070A8](v114);
    -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v80, 0x7FFFFFFFFFFFFFFFLL, objc_msgSend(v79, "numberOfColumns") - 1);
    v108[0] = MEMORY[0x24BDAC760];
    v108[1] = 3221225472;
    v108[2] = __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_10;
    v108[3] = &unk_24D68D5C8;
    objc_copyWeak(&v113, &location);
    v110 = v132;
    v111 = v138;
    v109 = v79;
    v112 = v135;
    v81 = (void *)MEMORY[0x219A070A8](v108);
    -[SXDataTableView draw:forIndexPath:]((uint64_t)a1, v81, 0x7FFFFFFFFFFFFFFFLL, 0);
    v82 = a1[57];
    objc_msgSend(v82, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_7_3);

    v83 = a1[56];
    objc_msgSend(v83, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_8_0);

    objc_msgSend(a1, "setNeedsDisplay");
    objc_destroyWeak(&v113);

    objc_destroyWeak(&v119);
    objc_destroyWeak(&v123);

    objc_destroyWeak(&v127);
    objc_destroyWeak(&location);
    _Block_object_dispose(v129, 8);
    _Block_object_dispose(v132, 8);
    _Block_object_dispose(v135, 8);
    _Block_object_dispose(v138, 8);
  }

}

void __24__SXDataTableView_reset__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "removeFromSuperview");

}

void __24__SXDataTableView_reset__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "removeFromSuperview");

}

- (id)viewForRowAtIndex:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (a1)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = *(id *)(a1 + 448);
    objc_msgSend(v4, "numberWithUnsignedInteger:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v7;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 == v10)
      {
        v9 = 0;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 424));
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0
          && (v13 = objc_loadWeakRetained((id *)(a1 + 424)),
              objc_msgSend(v13, "dataTableView:drawViewForRowAtIndex:", a1, a2),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v13,
              v9))
        {
          v14 = *(void **)(a1 + 448);
          v15 = (void *)MEMORY[0x24BDD16E0];
          v16 = v14;
          objc_msgSend(v15, "numberWithUnsignedInteger:", a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v9, v17);
        }
        else
        {
          v18 = *(void **)(a1 + 448);
          v19 = (void *)MEMORY[0x24BDBCEF8];
          v20 = v18;
          objc_msgSend(v19, "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v17, v16);

          v9 = 0;
        }

      }
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)viewForColumnAtIndex:(uint64_t)a1
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  char v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  if (a1)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    v5 = *(id *)(a1 + 456);
    objc_msgSend(v4, "numberWithUnsignedInteger:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v7;
    if (!v8)
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 == v10)
      {
        v9 = 0;
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)(a1 + 424));
        v12 = objc_opt_respondsToSelector();

        if ((v12 & 1) != 0
          && (v13 = objc_loadWeakRetained((id *)(a1 + 424)),
              objc_msgSend(v13, "dataTableView:drawViewForColumnAtIndex:", a1, a2),
              v9 = (void *)objc_claimAutoreleasedReturnValue(),
              v13,
              v9))
        {
          v14 = *(void **)(a1 + 456);
          v15 = (void *)MEMORY[0x24BDD16E0];
          v16 = v14;
          objc_msgSend(v15, "numberWithUnsignedInteger:", a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v9, v17);
        }
        else
        {
          v18 = *(void **)(a1 + 456);
          v19 = (void *)MEMORY[0x24BDBCEF8];
          v20 = v18;
          objc_msgSend(v19, "null");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a2);
          v16 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKey:", v17, v16);

          v9 = 0;
        }

      }
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)dataSource
{
  if (WeakRetained)
    WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 54);
  return WeakRetained;
}

- (uint64_t)indexPathForPoint:(CGFloat)a3
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CGPoint v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  if (!a1)
    return 0;
  if (!objc_msgSend(*(id *)(a1 + 440), "numberOfRows"))
    return -1;
  v6 = 0;
  v7 = -1;
  do
  {
    objc_msgSend(*(id *)(a1 + 440), "rectForRowAtIndex:", v6);
    v10.x = a2;
    v10.y = a3;
    if (CGRectContainsPoint(v12, v10) && objc_msgSend(*(id *)(a1 + 440), "numberOfColumns"))
    {
      v8 = 0;
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 440), "rectForColumnAtIndex:", v8);
        v11.x = a2;
        v11.y = a3;
        if (CGRectContainsPoint(v13, v11))
          break;
        if (++v8 >= (unint64_t)objc_msgSend(*(id *)(a1 + 440), "numberOfColumns"))
          goto LABEL_11;
      }
      v7 = v6;
    }
LABEL_11:
    ++v6;
  }
  while (v6 < objc_msgSend(*(id *)(a1 + 440), "numberOfRows"));
  return v7;
}

- (uint64_t)blueprint
{
  if (result)
    return *(_QWORD *)(result + 440);
  return result;
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke(uint64_t a1, CGContext *a2, double a3, double a4)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v10;
  CGRect v11;

  v10 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGContextFillRect(a2, v11);
}

- (void)draw:(uint64_t)a3 forIndexPath:(uint64_t)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a1)
  {
    -[SXDataTableView viewForRowAtIndex:](a1, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXDataTableView viewForColumnAtIndex:](a1, a4);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (!v8)
    {
      if (v7)
        v8 = (uint64_t)v7;
      else
        v8 = a1;
    }
    -[SXDataTableDrawView drawBlocks](v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v10, "addObject:", v11);

  }
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v10;
  CGRect v11;

  v10 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGContextFillRect(a2, v11);
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_3(uint64_t a1, CGContext *a2, double a3, double a4)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v10;
  CGRect v11;

  v10 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  x = v10.origin.x;
  y = v10.origin.y;
  width = v10.size.width;
  height = v10.size.height;
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGColor"));
  v11.origin.x = x;
  v11.origin.y = y;
  v11.size.width = width;
  v11.size.height = height;
  CGContextFillRect(a2, v11);
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_4(uint64_t a1, CGContext *a2, double a3, double a4)
{
  id v8;
  CGRect v9;

  objc_msgSend(*(id *)(a1 + 32), "color");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v8, "CGColor"));

  v9 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  CGContextFillRect(a2, v9);
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_5(uint64_t a1, CGContext *a2, double a3, double a4)
{
  id v8;
  CGRect v9;

  objc_msgSend(*(id *)(a1 + 32), "color");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v8, "CGColor"));

  v9 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  CGContextFillRect(a2, v9);
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_6(uint64_t a1, CGContext *a2, double a3, double a4)
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat v19;
  void *v20;
  double v21;
  CGFloat v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double MaxX;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  CGFloat v38;
  void *v39;
  double v40;
  CGFloat v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  CGFloat v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  CGFloat v58;
  double MaxY;
  void *v60;
  double v61;
  CGFloat v62;
  CGFloat v63;
  void *v64;
  double v65;
  CGFloat v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  CGFloat v75;
  double v76;
  void *v77;
  double v78;
  CGFloat v79;
  void *v80;
  double v81;
  CGFloat v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  void *v87;
  double v88;
  CGFloat v89;
  void *v90;
  id v91;
  CGFloat recta;
  void *rect;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;

  v94 = CGRectOffset(*(CGRect *)(a1 + 40), -a3, -a4);
  x = v94.origin.x;
  y = v94.origin.y;
  width = v94.size.width;
  height = v94.size.height;
  objc_msgSend(*(id *)(a1 + 32), "top");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(*(id *)(a1 + 32), "top");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(*(id *)(a1 + 32), "top");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "width");
      v16 = v15;

      if (v16 > 0.0)
      {
        v95.origin.x = x;
        v95.origin.y = y;
        v95.size.width = width;
        v95.size.height = height;
        MinX = CGRectGetMinX(v95);
        v96.origin.x = x;
        v96.origin.y = y;
        v96.size.width = width;
        v96.size.height = height;
        MinY = CGRectGetMinY(v96);
        v97.origin.x = x;
        v97.origin.y = y;
        v97.size.width = width;
        v97.size.height = height;
        v19 = CGRectGetWidth(v97);
        objc_msgSend(*(id *)(a1 + 32), "top");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "width");
        v22 = v21;

        objc_msgSend(*(id *)(a1 + 32), "top");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "color");
        v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v24, "CGColor"));

        v98.origin.x = MinX;
        v98.origin.y = MinY;
        v98.size.width = v19;
        v98.size.height = v22;
        CGContextFillRect(a2, v98);
      }
    }
    else
    {

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "right");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v26 = (void *)v25;
    objc_msgSend(*(id *)(a1 + 32), "right");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)v27;
      objc_msgSend(*(id *)(a1 + 32), "right");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "width");
      v31 = v30;

      if (v31 > 0.0)
      {
        v99.origin.x = x;
        v99.origin.y = y;
        v99.size.width = width;
        v99.size.height = height;
        MaxX = CGRectGetMaxX(v99);
        objc_msgSend(*(id *)(a1 + 32), "right");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "width");
        recta = MaxX - v34;
        v100.origin.x = x;
        v100.origin.y = y;
        v100.size.width = width;
        v100.size.height = height;
        v35 = CGRectGetMinY(v100);
        objc_msgSend(*(id *)(a1 + 32), "top");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "width");
        v38 = v35 + v37;
        objc_msgSend(*(id *)(a1 + 32), "right");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "width");
        v41 = v40;
        v101.origin.x = x;
        v101.origin.y = y;
        v101.size.width = width;
        v101.size.height = height;
        v42 = CGRectGetHeight(v101);
        objc_msgSend(*(id *)(a1 + 32), "top");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "width");
        v45 = v44;
        objc_msgSend(*(id *)(a1 + 32), "bottom");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "width");
        v48 = v42 - (v45 + v47);

        objc_msgSend(*(id *)(a1 + 32), "right");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "color");
        v50 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v50, "CGColor"));

        v102.origin.x = recta;
        v102.origin.y = v38;
        v102.size.width = v41;
        v102.size.height = v48;
        CGContextFillRect(a2, v102);
      }
    }
    else
    {

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "bottom");
  v51 = objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    v52 = (void *)v51;
    objc_msgSend(*(id *)(a1 + 32), "bottom");
    v53 = objc_claimAutoreleasedReturnValue();
    if (v53)
    {
      v54 = (void *)v53;
      objc_msgSend(*(id *)(a1 + 32), "bottom");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "width");
      v57 = v56;

      if (v57 > 0.0)
      {
        v103.origin.x = x;
        v103.origin.y = y;
        v103.size.width = width;
        v103.size.height = height;
        v58 = CGRectGetMinX(v103);
        v104.origin.x = x;
        v104.origin.y = y;
        v104.size.width = width;
        v104.size.height = height;
        MaxY = CGRectGetMaxY(v104);
        objc_msgSend(*(id *)(a1 + 32), "bottom");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "width");
        v62 = MaxY - v61;
        v105.origin.x = x;
        v105.origin.y = y;
        v105.size.width = width;
        v105.size.height = height;
        v63 = CGRectGetWidth(v105);
        objc_msgSend(*(id *)(a1 + 32), "bottom");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "width");
        v66 = v65;

        objc_msgSend(*(id *)(a1 + 32), "bottom");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "color");
        v68 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v68, "CGColor"));

        v106.origin.x = v58;
        v106.origin.y = v62;
        v106.size.width = v63;
        v106.size.height = v66;
        CGContextFillRect(a2, v106);
      }
    }
    else
    {

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "left");
  v69 = objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    rect = (void *)v69;
    objc_msgSend(*(id *)(a1 + 32), "left");
    v70 = objc_claimAutoreleasedReturnValue();
    if (v70)
    {
      v71 = (void *)v70;
      objc_msgSend(*(id *)(a1 + 32), "left");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "width");
      v74 = v73;

      if (v74 > 0.0)
      {
        v107.origin.x = x;
        v107.origin.y = y;
        v107.size.width = width;
        v107.size.height = height;
        v75 = CGRectGetMinX(v107);
        v108.origin.x = x;
        v108.origin.y = y;
        v108.size.width = width;
        v108.size.height = height;
        v76 = CGRectGetMinY(v108);
        objc_msgSend(*(id *)(a1 + 32), "top");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "width");
        v79 = v76 + v78;
        objc_msgSend(*(id *)(a1 + 32), "left");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "width");
        v82 = v81;
        v109.origin.x = x;
        v109.origin.y = y;
        v109.size.width = width;
        v109.size.height = height;
        v83 = CGRectGetHeight(v109);
        objc_msgSend(*(id *)(a1 + 32), "top");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "width");
        v86 = v85;
        objc_msgSend(*(id *)(a1 + 32), "bottom");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "width");
        v89 = v83 - (v86 + v88);

        objc_msgSend(*(id *)(a1 + 32), "left");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "color");
        v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v91, "CGColor"));

        v110.origin.x = v75;
        v110.origin.y = v79;
        v110.size.width = v82;
        v110.size.height = v89;
        CGContextFillRect(a2, v110);
      }
    }
    else
    {

    }
  }
}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_7(uint64_t a1, CGContext *a2)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  -[SXDataTableView dataSource](WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableBorder");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "top");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableSize");
    v8 = v7;
    objc_msgSend(v14, "left");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "width");
    v10 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
    v10[4] = 0;
    v10[5] = 0;
    v10[6] = v8;
    v10[7] = v11;

    objc_msgSend(v14, "top");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "color");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v13, "CGColor"));

    CGContextFillRect(a2, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  }

}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_8(uint64_t a1, CGContext *a2)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  -[SXDataTableView dataSource](WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableBorder");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "bottom");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableSize");
    v8 = v7;
    objc_msgSend(v19, "bottom");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "width");
    v11 = v8 - v10;
    objc_msgSend(*(id *)(a1 + 32), "tableSize");
    v13 = v12;
    objc_msgSend(v19, "bottom");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "width");
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v15 + 32) = 0;
    *(double *)(v15 + 40) = v11;
    *(_QWORD *)(v15 + 48) = v13;
    *(_QWORD *)(v15 + 56) = v16;

    objc_msgSend(v19, "bottom");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "color");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v18, "CGColor"));

    CGContextFillRect(a2, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  }

}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_9(uint64_t a1, CGContext *a2)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  CGFloat Height;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  -[SXDataTableView dataSource](WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableBorder");
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "right");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableSize");
    v8 = v7;
    objc_msgSend(v22, "right");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "width");
    v11 = v8 - v10;
    Height = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
    objc_msgSend(v22, "right");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "width");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 32), "tableSize");
    v17 = v16 - CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
    v18 = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(double *)(v19 + 32) = v11;
    *(CGFloat *)(v19 + 40) = Height;
    *(_QWORD *)(v19 + 48) = v15;
    *(double *)(v19 + 56) = v17 - v18;

    objc_msgSend(v22, "right");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "color");
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v21, "CGColor"));

    CGContextFillRect(a2, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  }

}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_10(uint64_t a1, CGContext *a2)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  CGFloat Height;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  CGFloat v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  -[SXDataTableView dataSource](WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tableBorder");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "left");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    Height = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
    objc_msgSend(v17, "left");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "width");
    v10 = v9;
    objc_msgSend(*(id *)(a1 + 32), "tableSize");
    v12 = v11 - CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
    v13 = CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v14 + 32) = 0;
    *(CGFloat *)(v14 + 40) = Height;
    *(_QWORD *)(v14 + 48) = v10;
    *(double *)(v14 + 56) = v12 - v13;

    objc_msgSend(v17, "left");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CGContextSetFillColorWithColor(a2, (CGColorRef)objc_msgSend(v16, "CGColor"));

    CGContextFillRect(a2, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32));
  }

}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_11(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setNeedsDisplay");

}

void __46__SXDataTableView_prepareDrawingForBlueprint___block_invoke_12(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setNeedsDisplay");

}

- (CGPoint)originOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)setDataSource:(id *)result
{
  if (result)
    return (id *)objc_storeWeak(result + 54, a2);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnViews, 0);
  objc_storeStrong((id *)&self->_rowViews, 0);
  objc_storeStrong((id *)&self->_blueprint, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_viewDataSource);
}

@end
