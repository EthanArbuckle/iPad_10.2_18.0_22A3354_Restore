@implementation SXHorizontalStackLayoutCalculator

- (SXHorizontalStackLayoutCalculator)init
{
  SXHorizontalStackLayoutCalculator *v2;
  uint64_t v3;
  NSMutableArray *items;
  uint64_t v5;
  NSMutableArray *flexibleItems;
  uint64_t v7;
  NSMutableArray *sortedItems;
  uint64_t v9;
  NSMutableDictionary *componentsGroupedByMaximumWidth;
  uint64_t v11;
  NSMutableDictionary *componentsGroupedByMinimumWidth;
  uint64_t v13;
  NSMutableDictionary *minimumWidths;
  uint64_t v15;
  NSMutableDictionary *maximumWidths;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)SXHorizontalStackLayoutCalculator;
  v2 = -[SXHorizontalStackLayoutCalculator init](&v18, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    items = v2->_items;
    v2->_items = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    flexibleItems = v2->_flexibleItems;
    v2->_flexibleItems = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    sortedItems = v2->_sortedItems;
    v2->_sortedItems = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    componentsGroupedByMaximumWidth = v2->_componentsGroupedByMaximumWidth;
    v2->_componentsGroupedByMaximumWidth = (NSMutableDictionary *)v9;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    componentsGroupedByMinimumWidth = v2->_componentsGroupedByMinimumWidth;
    v2->_componentsGroupedByMinimumWidth = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    minimumWidths = v2->_minimumWidths;
    v2->_minimumWidths = (NSMutableDictionary *)v13;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    maximumWidths = v2->_maximumWidths;
    v2->_maximumWidths = (NSMutableDictionary *)v15;

  }
  return v2;
}

- (void)addFlexibleItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[SXHorizontalStackLayoutCalculator flexibleItems](self, "flexibleItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

    -[SXHorizontalStackLayoutCalculator sortedItems](self, "sortedItems");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);

  }
}

- (void)addItemWithMinimumWidth:(double)a3 maximumWidth:(double)a4 identifier:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v8 = a5;
  if (v8)
  {
    v33 = v8;
    -[SXHorizontalStackLayoutCalculator items](self, "items");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v33);

    -[SXHorizontalStackLayoutCalculator sortedItems](self, "sortedItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v33);

    -[SXHorizontalStackLayoutCalculator combinedMaximumWidth](self, "combinedMaximumWidth");
    -[SXHorizontalStackLayoutCalculator setCombinedMaximumWidth:](self, "setCombinedMaximumWidth:", floor(a4) + v11);
    -[SXHorizontalStackLayoutCalculator combinedMinimumWidth](self, "combinedMinimumWidth");
    -[SXHorizontalStackLayoutCalculator setCombinedMinimumWidth:](self, "setCombinedMinimumWidth:", floor(a3) + v12);
    -[SXHorizontalStackLayoutCalculator componentsGroupedByMinimumWidth](self, "componentsGroupedByMinimumWidth");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;

    -[SXHorizontalStackLayoutCalculator componentsGroupedByMaximumWidth](self, "componentsGroupedByMaximumWidth");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKey:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      v23 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v23;

    objc_msgSend(v18, "addObject:", v33);
    objc_msgSend(v24, "addObject:", v33);
    -[SXHorizontalStackLayoutCalculator componentsGroupedByMinimumWidth](self, "componentsGroupedByMinimumWidth");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v18, v26);

    -[SXHorizontalStackLayoutCalculator componentsGroupedByMaximumWidth](self, "componentsGroupedByMaximumWidth");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setObject:forKey:", v24, v28);

    -[SXHorizontalStackLayoutCalculator minimumWidths](self, "minimumWidths");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setObject:forKey:", v30, v33);

    -[SXHorizontalStackLayoutCalculator maximumWidths](self, "maximumWidths");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a4);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v32, v33);

    v8 = v33;
  }

}

- (id)layoutForComponentWidth:(double)a3
{
  SXHorizontalStackLayout *v5;
  void *v6;
  SXHorizontalStackLayout *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  unint64_t v76;
  void *v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t n;
  uint64_t v83;
  double v84;
  double v85;
  void *v86;
  void *v87;
  double v88;
  double v89;
  double v90;
  double *v91;
  void *v92;
  BOOL v93;
  double v94;
  void *v95;
  unint64_t v96;
  void *v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  uint64_t ii;
  double v102;
  void *v103;
  void *v104;
  id v105;
  uint64_t v106;
  double v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  void *v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  uint64_t jj;
  uint64_t v124;
  double v125;
  uint64_t v127;
  id obj;
  id v129;
  int v130;
  id v131;
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
  _QWORD v164[4];
  SXHorizontalStackLayout *v165;
  uint64_t *v166;
  uint64_t *v167;
  double v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  char v172;
  uint64_t v173;
  double *v174;
  uint64_t v175;
  uint64_t v176;
  _BYTE v177[128];
  _BYTE v178[128];
  _BYTE v179[128];
  _BYTE v180[128];
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  uint64_t v185;

  v185 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(SXHorizontalStackLayout);
  v173 = 0;
  v174 = (double *)&v173;
  v175 = 0x2020000000;
  v176 = 0;
  v169 = 0;
  v170 = &v169;
  v171 = 0x2020000000;
  v172 = 0;
  -[SXHorizontalStackLayoutCalculator maximumWidths](self, "maximumWidths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v164[0] = MEMORY[0x24BDAC760];
  v164[1] = 3221225472;
  v164[2] = __61__SXHorizontalStackLayoutCalculator_layoutForComponentWidth___block_invoke;
  v164[3] = &unk_24D688D38;
  v7 = v5;
  v165 = v7;
  v166 = &v173;
  v168 = a3;
  v167 = &v169;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v164);

  if (*((_BYTE *)v170 + 24))
  {
    v174[3] = 0.0;
    -[SXHorizontalStackLayoutCalculator componentsGroupedByMaximumWidth](self, "componentsGroupedByMaximumWidth");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sortedArrayUsingSelector:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reverseObjectEnumerator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v184, 16);
    if (v12)
    {
      v127 = *(_QWORD *)v161;
      do
      {
        v129 = (id)v12;
        for (i = 0; i != v129; i = (char *)i + 1)
        {
          if (*(_QWORD *)v161 != v127)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)i);
          -[SXHorizontalStackLayoutCalculator componentsGroupedByMaximumWidth](self, "componentsGroupedByMaximumWidth", v127);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKey:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "doubleValue");
          v18 = v17;
          -[SXHorizontalStackLayoutCalculator combinedMaximumWidth](self, "combinedMaximumWidth");
          if (v19 >= 1.0)
            v20 = v19;
          else
            v20 = 1.0;
          v158 = 0u;
          v159 = 0u;
          v156 = 0u;
          v157 = 0u;
          v21 = v16;
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v156, v183, 16);
          if (v22)
          {
            v23 = floor(v18 / v20 * a3);
            v24 = *(_QWORD *)v157;
            while (2)
            {
              for (j = 0; j != v22; ++j)
              {
                if (*(_QWORD *)v157 != v24)
                  objc_enumerationMutation(v21);
                v26 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * j);
                -[SXHorizontalStackLayoutCalculator minimumWidths](self, "minimumWidths");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "objectForKey:", v26);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "doubleValue");
                v30 = v29;

                if (v30 >= v23)
                  v23 = v30;
                -[SXHorizontalStackLayout setWidth:forIdentifier:](v7, "setWidth:forIdentifier:", v26, v23);
                v31 = v23 + v174[3];
                v174[3] = v31;
                if (v31 > a3)
                {

                  v130 = 1;
                  goto LABEL_25;
                }
              }
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v156, v183, 16);
              if (v22)
                continue;
              break;
            }
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v160, v184, 16);
        v130 = 0;
      }
      while (v12);
    }
    else
    {
      v130 = 0;
    }
LABEL_25:

    v32 = v174[3];
    -[SXHorizontalStackLayoutCalculator items](self, "items");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "count");

    v34 = a3 - v32;
    if (a3 - v32 > 0.0)
    {
      -[SXHorizontalStackLayoutCalculator items](self, "items");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      -[SXHorizontalStackLayoutCalculator maximumWidths](self, "maximumWidths");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "keysSortedByValueUsingSelector:", sel_compare_);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v154 = 0u;
      v155 = 0u;
      v152 = 0u;
      v153 = 0u;
      v39 = v38;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v152, v182, 16);
      if (v40)
      {
        v41 = *(_QWORD *)v153;
        do
        {
          for (k = 0; k != v40; ++k)
          {
            if (*(_QWORD *)v153 != v41)
              objc_enumerationMutation(v39);
            v43 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * k);
            -[SXHorizontalStackLayout widthForIdentifier:](v7, "widthForIdentifier:", v43);
            v45 = v44;
            -[SXHorizontalStackLayoutCalculator maximumWidths](self, "maximumWidths");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKey:", v43);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v47, "doubleValue");
            if (v34 / (double)v36 + v45 < v48)
              v48 = v34 / (double)v36 + v45;
            v49 = floor(v48);
            -[SXHorizontalStackLayout setWidth:forIdentifier:](v7, "setWidth:forIdentifier:", v43, v49);
            v50 = v49 - v45;
            v174[3] = v50 + v174[3];

            v34 = v34 - v50;
            --v36;
          }
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v152, v182, 16);
        }
        while (v40);
      }

    }
    if (v130)
    {
      v174[3] = 0.0;
      -[SXHorizontalStackLayoutCalculator items](self, "items");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "count");

      -[SXHorizontalStackLayoutCalculator minimumWidths](self, "minimumWidths");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "keysSortedByValueUsingSelector:", sel_compare_);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "reverseObjectEnumerator");
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      v131 = v55;
      v56 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v148, v181, 16);
      if (v56)
      {
        v57 = *(_QWORD *)v149;
        do
        {
          for (m = 0; m != v56; ++m)
          {
            if (*(_QWORD *)v149 != v57)
              objc_enumerationMutation(v131);
            v59 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * m);
            -[SXHorizontalStackLayoutCalculator minimumWidths](self, "minimumWidths");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "objectForKey:", v59);
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            -[SXHorizontalStackLayoutCalculator maximumWidths](self, "maximumWidths");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v62, "objectForKey:", v59);
            v63 = (void *)objc_claimAutoreleasedReturnValue();

            v64 = v174[3];
            objc_msgSend(v61, "doubleValue");
            v66 = v65;
            -[SXHorizontalStackLayoutCalculator combinedMinimumWidth](self, "combinedMinimumWidth");
            v68 = v67;
            objc_msgSend(v63, "doubleValue");
            v70 = (a3 - v64) / (double)v52;
            if (v68 >= 1.0)
              v71 = v68;
            else
              v71 = 1.0;
            v72 = v66 / v71 * a3;
            if (v72 >= v70)
              v70 = v72;
            if (v70 < v69)
              v69 = v70;
            v73 = floor(v69);
            -[SXHorizontalStackLayout setWidth:forIdentifier:](v7, "setWidth:forIdentifier:", v59, v73);
            v174[3] = v73 + v174[3];

            --v52;
          }
          v56 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v148, v181, 16);
        }
        while (v56);
      }

      v74 = a3 - v174[3];
      if (v74 > 0.0)
      {
        -[SXHorizontalStackLayoutCalculator items](self, "items");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "count");

        -[SXHorizontalStackLayoutCalculator maximumWidths](self, "maximumWidths");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "keysSortedByValueUsingSelector:", sel_compare_);
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        v146 = 0u;
        v147 = 0u;
        v144 = 0u;
        v145 = 0u;
        v79 = v78;
        v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v144, v180, 16);
        if (v80)
        {
          v81 = *(_QWORD *)v145;
          do
          {
            for (n = 0; n != v80; ++n)
            {
              if (*(_QWORD *)v145 != v81)
                objc_enumerationMutation(v79);
              v83 = *(_QWORD *)(*((_QWORD *)&v144 + 1) + 8 * n);
              -[SXHorizontalStackLayout widthForIdentifier:](v7, "widthForIdentifier:", v83);
              v85 = v84;
              -[SXHorizontalStackLayoutCalculator maximumWidths](self, "maximumWidths");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "objectForKey:", v83);
              v87 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v87, "doubleValue");
              if (v74 / (double)v76 + v85 < v88)
                v88 = v74 / (double)v76 + v85;
              v89 = floor(v88);
              -[SXHorizontalStackLayout setWidth:forIdentifier:](v7, "setWidth:forIdentifier:", v83, v89);
              v90 = v89 - v85;
              v174[3] = v90 + v174[3];

              v74 = v74 - v90;
              --v76;
            }
            v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v144, v180, 16);
          }
          while (v80);
        }

      }
    }

  }
  v91 = v174;
  if (v174[3] < a3)
  {
    -[SXHorizontalStackLayoutCalculator flexibleItems](self, "flexibleItems");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = objc_msgSend(v92, "count") == 0;

    v91 = v174;
    if (!v93)
    {
      v94 = v174[3];
      -[SXHorizontalStackLayoutCalculator flexibleItems](self, "flexibleItems");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v95, "count");

      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      -[SXHorizontalStackLayoutCalculator flexibleItems](self, "flexibleItems");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v140, v179, 16);
      if (v98)
      {
        v99 = floor((a3 - v94) / (double)v96);
        v100 = *(_QWORD *)v141;
        do
        {
          for (ii = 0; ii != v98; ++ii)
          {
            if (*(_QWORD *)v141 != v100)
              objc_enumerationMutation(v97);
            -[SXHorizontalStackLayout setWidth:forIdentifier:](v7, "setWidth:forIdentifier:", *(_QWORD *)(*((_QWORD *)&v140 + 1) + 8 * ii), v99);
            v174[3] = v99 + v174[3];
          }
          v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v140, v179, 16);
        }
        while (v98);
      }

      v91 = v174;
    }
  }
  v102 = v91[3];
  if (v102 < a3)
  {
    -[SXHorizontalStackLayoutCalculator sortedItems](self, "sortedItems");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "reverseObjectEnumerator");
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    v105 = v104;
    v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v136, v178, 16);
    if (v106)
    {
      v107 = a3 - v102;
      v108 = *(_QWORD *)v137;
LABEL_77:
      v109 = 0;
      while (1)
      {
        if (*(_QWORD *)v137 != v108)
          objc_enumerationMutation(v105);
        v110 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * v109);
        -[SXHorizontalStackLayout widthForIdentifier:](v7, "widthForIdentifier:", v110);
        v112 = v111;
        -[SXHorizontalStackLayoutCalculator maximumWidths](self, "maximumWidths");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "objectForKey:", v110);
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "doubleValue");
        v116 = v115;

        v117 = v107 + v112;
        if (v116 >= v107 + v112)
          v118 = v107 + v112;
        else
          v118 = v116;
        if (v116 <= 0.0)
          v107 = 0.0;
        else
          v107 = v118 - v112;
        if (v116 > 0.0)
          v117 = v118;
        -[SXHorizontalStackLayout setWidth:forIdentifier:](v7, "setWidth:forIdentifier:", v110, v117);
        if (v107 < 2.22044605e-16)
          break;
        if (v106 == ++v109)
        {
          v106 = objc_msgSend(v105, "countByEnumeratingWithState:objects:count:", &v136, v178, 16);
          if (v106)
            goto LABEL_77;
          break;
        }
      }
    }

  }
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  -[SXHorizontalStackLayoutCalculator sortedItems](self, "sortedItems");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v132, v177, 16);
  if (v120)
  {
    v121 = *(_QWORD *)v133;
    v122 = 0.0;
    do
    {
      for (jj = 0; jj != v120; ++jj)
      {
        if (*(_QWORD *)v133 != v121)
          objc_enumerationMutation(v119);
        v124 = *(_QWORD *)(*((_QWORD *)&v132 + 1) + 8 * jj);
        -[SXHorizontalStackLayout setPosition:forIdentifier:](v7, "setPosition:forIdentifier:", v124, v122);
        -[SXHorizontalStackLayout widthForIdentifier:](v7, "widthForIdentifier:", v124);
        v122 = v122 + v125;
      }
      v120 = objc_msgSend(v119, "countByEnumeratingWithState:objects:count:", &v132, v177, 16);
    }
    while (v120);
  }

  _Block_object_dispose(&v169, 8);
  _Block_object_dispose(&v173, 8);
  return v7;
}

void __61__SXHorizontalStackLayoutCalculator_layoutForComponentWidth___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  double v8;
  double v9;

  v7 = a2;
  objc_msgSend(a3, "doubleValue");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "setWidth:forIdentifier:", v7);

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > *(double *)(a1 + 56))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (NSMutableArray)items
{
  return self->_items;
}

- (NSMutableArray)flexibleItems
{
  return self->_flexibleItems;
}

- (NSMutableArray)sortedItems
{
  return self->_sortedItems;
}

- (NSMutableDictionary)componentsGroupedByMaximumWidth
{
  return self->_componentsGroupedByMaximumWidth;
}

- (NSMutableDictionary)componentsGroupedByMinimumWidth
{
  return self->_componentsGroupedByMinimumWidth;
}

- (NSMutableDictionary)minimumWidths
{
  return self->_minimumWidths;
}

- (NSMutableDictionary)maximumWidths
{
  return self->_maximumWidths;
}

- (double)combinedMaximumWidth
{
  return self->_combinedMaximumWidth;
}

- (void)setCombinedMaximumWidth:(double)a3
{
  self->_combinedMaximumWidth = a3;
}

- (double)combinedMinimumWidth
{
  return self->_combinedMinimumWidth;
}

- (void)setCombinedMinimumWidth:(double)a3
{
  self->_combinedMinimumWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumWidths, 0);
  objc_storeStrong((id *)&self->_minimumWidths, 0);
  objc_storeStrong((id *)&self->_componentsGroupedByMinimumWidth, 0);
  objc_storeStrong((id *)&self->_componentsGroupedByMaximumWidth, 0);
  objc_storeStrong((id *)&self->_sortedItems, 0);
  objc_storeStrong((id *)&self->_flexibleItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
