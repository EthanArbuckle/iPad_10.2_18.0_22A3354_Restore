@implementation CACLabeledElementsOverlayManager

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[CACSimpleContentViewManager setContentViewManagerDelegate:](self, "setContentViewManagerDelegate:", obj);
  }

}

- (void)showLabeledElementsOverlayWithLabeledElements:(id)a3
{
  -[CACLabeledElementsOverlayManager showLabeledElementsOverlayWithLabeledElements:forceNoArrow:](self, "showLabeledElementsOverlayWithLabeledElements:forceNoArrow:", a3, 0);
}

- (void)showLabeledElementsOverlayWithLabeledElements:(id)a3 forceNoArrow:(BOOL)a4
{
  -[CACLabeledElementsOverlayManager showLabeledElementsOverlayWithLabeledElements:forceNoArrow:startingNumberedLabelsAtIndex:](self, "showLabeledElementsOverlayWithLabeledElements:forceNoArrow:startingNumberedLabelsAtIndex:", a3, a4, 1);
}

- (void)showLabeledElementsOverlayWithLabeledElements:(id)a3 forceNoArrow:(BOOL)a4 startingNumberedLabelsAtIndex:(unint64_t)a5
{
  _BOOL8 v6;
  id v8;
  _QWORD v9[5];

  v6 = a4;
  v8 = a3;
  -[CACLabeledElementsOverlayManager clearLabeledElements](self, "clearLabeledElements");
  -[CACLabeledElementsOverlayManager addLabeledElements:forceNoArrow:startingNumberedLabelsAtIndex:](self, "addLabeledElements:forceNoArrow:startingNumberedLabelsAtIndex:", v8, v6, a5);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __125__CACLabeledElementsOverlayManager_showLabeledElementsOverlayWithLabeledElements_forceNoArrow_startingNumberedLabelsAtIndex___block_invoke_2;
  v9[3] = &unk_24F2AD350;
  v9[4] = self;
  -[CACSimpleContentViewManager showViewControllerWithCreationHandler:updateHandler:](self, "showViewControllerWithCreationHandler:updateHandler:", &__block_literal_global_41, v9);
}

CACLabeledElementsOverlayViewController *__125__CACLabeledElementsOverlayManager_showLabeledElementsOverlayWithLabeledElements_forceNoArrow_startingNumberedLabelsAtIndex___block_invoke()
{
  return objc_alloc_init(CACLabeledElementsOverlayViewController);
}

uint64_t __125__CACLabeledElementsOverlayManager_showLabeledElementsOverlayWithLabeledElements_forceNoArrow_startingNumberedLabelsAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLabeledElements:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (NSArray)labeledElementsCopy
{
  CACLabeledElementsOverlayManager *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_labeledElements, "copy");
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)clearLabeledElements
{
  NSMutableArray *labeledElements;
  uint64_t v3;
  NSMutableArray *v4;
  CACLabeledElementsOverlayManager *obj;

  obj = self;
  objc_sync_enter(obj);
  labeledElements = obj->_labeledElements;
  if (labeledElements)
  {
    -[NSMutableArray removeAllObjects](labeledElements, "removeAllObjects");
  }
  else
  {
    v3 = objc_opt_new();
    v4 = obj->_labeledElements;
    obj->_labeledElements = (NSMutableArray *)v3;

  }
  objc_sync_exit(obj);

}

- (void)addLabeledElements:(id)a3 forceNoArrow:(BOOL)a4 startingNumberedLabelsAtIndex:(unint64_t)a5
{
  void *v6;
  CACLabeledElementsOverlayManager *v7;
  id v8;

  v8 = a3;
  -[CACLabeledElementsOverlayManager _optimizeLabeledElements:startingNumberedLabelsAtIndex:forceNoArrow:](self, "_optimizeLabeledElements:startingNumberedLabelsAtIndex:forceNoArrow:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableArray addObjectsFromArray:](v7->_labeledElements, "addObjectsFromArray:", v6);
  objc_sync_exit(v7);

}

- (id)_optimizeLabeledElements:(id)a3 startingNumberedLabelsAtIndex:(unint64_t)a4 forceNoArrow:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  void *v34;
  float v35;
  double v36;
  float v37;
  double v38;
  float v39;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  float v51;
  uint64_t v52;
  void *v53;
  float v54;
  double v55;
  float v56;
  double v57;
  float v58;
  float v60;
  double v61;
  double v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t k;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t m;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  uint64_t v99;
  double v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  double v111;
  double v112;
  uint64_t n;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  CGFloat v122;
  CGFloat v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t ii;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t jj;
  void *v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  double v160;
  float v161;
  double v162;
  double v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t kk;
  void *v174;
  double v175;
  double v176;
  double v178;
  double v179;
  double v181;
  double v182;
  double v183;
  double MaxY;
  double v185;
  double v186;
  double v187;
  double v188;
  id v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t mm;
  void *v194;
  double v195;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  double v201;
  double v202;
  void *v203;
  double v204;
  double v205;
  CACLabeledElementsOverlayManager *v206;
  double v207;
  id obja;
  CGFloat rect2;
  _BOOL4 v211;
  CGFloat rect;
  void *v213;
  CGFloat v214;
  void *v215;
  int v216;
  CGFloat v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  _BYTE v254[128];
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  _BYTE v258[128];
  _BYTE v259[128];
  _BYTE v260[128];
  _BYTE v261[128];
  _BYTE v262[128];
  uint64_t v263;
  CGRect v264;
  CGRect v265;
  CGRect v266;
  CGRect v267;
  CGRect v268;
  CGRect v269;
  CGRect v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  CGRect v276;
  CGRect v277;
  CGRect v278;
  CGRect v279;

  v5 = a5;
  v263 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[CACLabeledElementsOverlayManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v206 = self;
  objc_msgSend(v8, "screenForLabeledElementsOverlayManager:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;
  v13 = v12;
  rect2 = v14;
  v16 = v15;

  v17 = (void *)objc_opt_new();
  v250 = 0u;
  v251 = 0u;
  v252 = 0u;
  v253 = 0u;
  v18 = v7;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v250, v262, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v251;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v251 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v250 + 1) + 8 * i);
        objc_msgSend(v23, "interfaceOrientedRectangle");
        v279.origin.x = v11;
        v279.origin.y = v13;
        v279.size.width = rect2;
        v279.size.height = v16;
        if (CGRectIntersectsRect(v264, v279))
          objc_msgSend(v17, "addObject:", v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v250, v262, 16);
    }
    while (v20);
  }
  rect = v16;
  v213 = v18;

  v24 = (void *)objc_opt_new();
  objc_msgSend(v17, "sortUsingComparator:", &__block_literal_global_179);
  v25 = objc_msgSend(v17, "count");
  if (v25 >= 1)
  {
    v26 = v25;
    v27 = 0;
    do
    {
      v28 = (void *)objc_opt_new();
      objc_msgSend(v24, "addObject:", v28);
      objc_msgSend(v17, "objectAtIndex:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v29);
      objc_msgSend(v29, "interfaceOrientedRectangle");
      v31 = v30;
      objc_msgSend(v29, "interfaceOrientedRectangle");
      if (++v27 < v26)
      {
        v33 = (uint64_t)(v31 + v32 * 0.5);
        while (1)
        {
          v34 = v29;
          objc_msgSend(v17, "objectAtIndex:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = (float)(v33 / (unint64_t)objc_msgSend(v28, "count"));
          objc_msgSend(v29, "interfaceOrientedRectangle");
          v37 = v36;
          objc_msgSend(v29, "interfaceOrientedRectangle");
          v39 = v38 + v37;
          if (v35 < v37 || v35 > v39)
            break;
          objc_msgSend(v28, "addObject:", v29);
          v33 = (uint64_t)(float)((float)((float)(v37 + v39) * 0.5) + (float)v33);
          if (v26 == ++v27)
          {

            goto LABEL_21;
          }
        }
      }

    }
    while (v27 < v26);
  }
LABEL_21:
  v211 = v5;
  v203 = v17;
  v201 = v13;
  if (objc_msgSend(v24, "count"))
  {
    v41 = 0;
    v215 = v24;
    do
    {
      objc_msgSend(v24, "objectAtIndex:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "sortUsingComparator:", &__block_literal_global_180_0);
      v43 = objc_msgSend(v42, "count");
      if (v43 >= 2)
      {
        v44 = v43;
        objc_msgSend(v42, "objectAtIndex:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "interfaceOrientedRectangle");
        v47 = v46;
        objc_msgSend(v45, "interfaceOrientedRectangle");
        v49 = v48;
        objc_msgSend(v45, "interfaceOrientedRectangle");
        v51 = v49 + v50 * 0.5;
        v52 = 1;
        while (1)
        {
          objc_msgSend(v42, "objectAtIndex:", v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v51 / (float)v52;
          objc_msgSend(v53, "interfaceOrientedRectangle");
          v56 = v55;
          objc_msgSend(v53, "interfaceOrientedRectangle");
          v58 = v57 + v56;
          if (v54 < v56 || v54 > v58)
            break;
          objc_msgSend(v53, "interfaceOrientedRectangle");
          v60 = v47;
          if (v61 > (float)(v60 + 200.0))
            break;
          v51 = v51 + (float)((float)(v56 + v58) * 0.5);
          objc_msgSend(v53, "interfaceOrientedRectangle");
          v47 = v62;
          ++v52;

          if (v44 == v52)
            goto LABEL_34;
        }
        v63 = v44 - v52;
        v64 = objc_alloc(MEMORY[0x24BDBCEB8]);
        objc_msgSend(v42, "subarrayWithRange:", v52, v63);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = (void *)objc_msgSend(v64, "initWithArray:", v65);

        objc_msgSend(v215, "insertObject:atIndex:", v66, v41 + 1);
        objc_msgSend(v42, "removeObjectsInRange:", v52, v63);

LABEL_34:
        v24 = v215;
      }
      ++v41;

    }
    while (v41 < objc_msgSend(v24, "count"));
  }
  v67 = (void *)objc_opt_new();
  objc_msgSend(v67, "setNumberStyle:", 1);
  -[CACLabeledElementsOverlayManager delegate](v206, "delegate");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "localeForLabeledElementsOverlayManager:", v206);
  v69 = objc_claimAutoreleasedReturnValue();

  if (v69)
    objc_msgSend(v67, "setLocale:", v69);
  v199 = (void *)v69;
  v200 = v67;
  v70 = (void *)objc_opt_new();
  v246 = 0u;
  v247 = 0u;
  v248 = 0u;
  v249 = 0u;
  v71 = v24;
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v246, v261, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v247;
    do
    {
      for (j = 0; j != v73; ++j)
      {
        if (*(_QWORD *)v247 != v74)
          objc_enumerationMutation(v71);
        v76 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * j);
        v242 = 0u;
        v243 = 0u;
        v244 = 0u;
        v245 = 0u;
        v77 = v76;
        v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v242, v260, 16);
        if (v78)
        {
          v79 = v78;
          v80 = *(_QWORD *)v243;
          do
          {
            for (k = 0; k != v79; ++k)
            {
              if (*(_QWORD *)v243 != v80)
                objc_enumerationMutation(v77);
              objc_msgSend(v70, "addObject:", *(_QWORD *)(*((_QWORD *)&v242 + 1) + 8 * k));
            }
            v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v242, v260, 16);
          }
          while (v79);
        }

      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v246, v261, 16);
    }
    while (v73);
  }

  v82 = (void *)objc_opt_class();
  -[CACLabeledElementsOverlayManager delegate](v206, "delegate");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "assignNumbersToLabeledElements:numberingStrategy:startingNumber:", v70, objc_msgSend(v83, "shouldAssignNumbersRandomlyInLabeledElementsOverlayManager:", v206), a4);

  objc_msgSend(v70, "firstObject");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v197 = v84;
  v198 = v71;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v84, "element");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "application");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "bundleId");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v216 = objc_msgSend(v87, "isEqualToString:", CFSTR("com.apple.mobilesafari")) ^ 1;

  }
  else
  {
    LOBYTE(v216) = 0;
  }
  v202 = v11;
  v240 = 0u;
  v241 = 0u;
  v238 = 0u;
  v239 = 0u;
  obja = v70;
  v88 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v238, v259, 16);
  if (v88)
  {
    v89 = v88;
    v90 = *(_QWORD *)v239;
    do
    {
      for (m = 0; m != v89; ++m)
      {
        if (*(_QWORD *)v239 != v90)
          objc_enumerationMutation(obja);
        v92 = *(void **)(*((_QWORD *)&v238 + 1) + 8 * m);
        objc_msgSend(v92, "interfaceOrientedRectangle");
        v94 = v93;
        v96 = v95;
        v98 = v97;
        objc_msgSend(v92, "setArrowOrientation:", !v211);
        if ((v216 & 1) != 0)
        {
          v99 = 0;
        }
        else
        {
          +[CACLabeledBadgeView badgeFontSize](CACLabeledBadgeView, "badgeFontSize");
          if (v98 >= v100 * 0.75)
            v99 = 0;
          else
            v99 = 2;
        }
        objc_msgSend(v92, "setBadgePresentation:", v99);
        objc_msgSend(v92, "numberedLabel");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        +[CACLabeledBadgeView sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:](CACLabeledBadgeView, "sizeOfBadgeGivenNumberOfDisplayedDigits:arrowOrientation:badgePresentation:badgeIndicator:", objc_msgSend(v101, "length"), objc_msgSend(v92, "arrowOrientation"), objc_msgSend(v92, "badgePresentation"), objc_msgSend(v92, "badgeIndicatorMask"));
        v103 = v102;
        v105 = v104;

        objc_msgSend(v92, "labelRectangle");
        objc_msgSend(v92, "setLabelRectangle:", v94, v96 + v98 - v105 + -2.0, v103, v105);
      }
      v89 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v238, v259, 16);
    }
    while (v89);
  }

  -[CACLabeledElementsOverlayManager delegate](v206, "delegate");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v106, "didAssignNumbersInLabeledElementsOverlayManager:", v206);

  v236 = 0u;
  v237 = 0u;
  v234 = 0u;
  v235 = 0u;
  v107 = v213;
  v108 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v234, v258, 16);
  if (v108)
  {
    v109 = v108;
    v110 = *(_QWORD *)v235;
    v111 = 1.0;
    v112 = 2.0;
    do
    {
      for (n = 0; n != v109; ++n)
      {
        if (*(_QWORD *)v235 != v110)
          objc_enumerationMutation(v107);
        v114 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * n);
        objc_msgSend(v114, "interfaceOrientedRectangle");
        if (v211)
        {
          objc_msgSend(v114, "labelRectangle");
          objc_msgSend(v114, "setLabelRectangle:", v120 - (v119 + v111), v121 + v112);
          continue;
        }
        v122 = v115;
        if (v118 < 200.0)
        {
          v214 = v118;
          v217 = v117;
          v123 = v116;
          objc_msgSend(v114, "labelRectangle");
          v125 = v124;
          v127 = v126;
          v129 = v128;
          v131 = v130 - (v126 + -4.0);
          -[CACLabeledElementsOverlayManager _findLabeledElementsThatIntersectsLabelRect:fromLabeledElement:justLabelRect:additionalElements:](v206, "_findLabeledElementsThatIntersectsLabelRect:fromLabeledElement:justLabelRect:additionalElements:", v114, 0, v107, v131, v124);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v132, "count"))
            goto LABEL_91;
          v204 = v129;
          v205 = v125;
          v207 = v127;
          v232 = 0u;
          v233 = 0u;
          v230 = 0u;
          v231 = 0u;
          v133 = v132;
          v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v230, v257, 16);
          if (v134)
          {
            v135 = v134;
            v136 = *(_QWORD *)v231;
            v131 = 0.0;
            do
            {
              for (ii = 0; ii != v135; ++ii)
              {
                if (*(_QWORD *)v231 != v136)
                  objc_enumerationMutation(v133);
                objc_msgSend(*(id *)(*((_QWORD *)&v230 + 1) + 8 * ii), "interfaceOrientedRectangle");
                x = v265.origin.x;
                y = v265.origin.y;
                width = v265.size.width;
                height = v265.size.height;
                if (CGRectGetMaxX(v265) > v131)
                {
                  v266.origin.x = x;
                  v266.origin.y = y;
                  v266.size.width = width;
                  v266.size.height = height;
                  MaxX = CGRectGetMaxX(v266);
                  v267.origin.x = v122;
                  v267.origin.y = v123;
                  v267.size.height = v214;
                  v267.size.width = v217;
                  if (MaxX < CGRectGetMaxX(v267))
                  {
                    v268.origin.x = x;
                    v268.origin.y = y;
                    v268.size.width = width;
                    v268.size.height = height;
                    v131 = CGRectGetMaxX(v268);
                  }
                }
              }
              v135 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v230, v257, 16);
            }
            while (v135);
          }
          else
          {
            v131 = 0.0;
          }

          v269.origin.x = v122;
          v269.origin.y = v123;
          v269.size.width = v217;
          v269.size.height = v214;
          v111 = 1.0;
          v112 = 2.0;
          v127 = v207;
          if (v131 <= CGRectGetMinX(v269))
          {
            v270.origin.x = v122;
            v270.origin.y = v123;
            v270.size.width = v217;
            v270.size.height = v214;
            if (CGRectGetMinX(v270) - v131 < v207)
            {
              v129 = v204;
              v125 = v205;
LABEL_91:
              objc_msgSend(v114, "setLabelRectangle:", v131, v125, v127, v129);
            }
          }

          continue;
        }
      }
      v109 = objc_msgSend(v107, "countByEnumeratingWithState:objects:count:", &v234, v258, 16);
    }
    while (v109);
  }

  v228 = 0u;
  v229 = 0u;
  v226 = 0u;
  v227 = 0u;
  v143 = v107;
  v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v226, v256, 16);
  if (v144)
  {
    v145 = v144;
    v146 = *(_QWORD *)v227;
    do
    {
      for (jj = 0; jj != v145; ++jj)
      {
        if (*(_QWORD *)v227 != v146)
          objc_enumerationMutation(v143);
        v148 = *(void **)(*((_QWORD *)&v226 + 1) + 8 * jj);
        if (v211 || (objc_msgSend(*(id *)(*((_QWORD *)&v226 + 1) + 8 * jj), "interfaceOrientedRectangle"), v149 < 30.0))
        {
          objc_msgSend(v148, "labelRectangle");
          v151 = v150;
          v153 = v152;
          v155 = v154;
          v157 = v156;
          objc_msgSend(v148, "interfaceOrientedRectangle");
          v159 = v158;
          objc_msgSend(v148, "labelRectangle");
          v161 = (v159 - v160) * 0.5;
          v162 = v153 - truncf(v161);
          if (v211)
            v151 = v151 + 8.0;
        }
        else
        {
          objc_msgSend(v148, "labelRectangle");
          v151 = v163;
          v165 = v164;
          v155 = v166;
          v157 = v167;
          objc_msgSend(v148, "interfaceOrientedRectangle");
          v162 = v165 - (v168 + -15.0);
        }
        objc_msgSend(v148, "setLabelRectangle:", v151, v162, v155, v157);
      }
      v145 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v226, v256, 16);
    }
    while (v145);
  }

  v224 = 0u;
  v225 = 0u;
  v222 = 0u;
  v223 = 0u;
  v169 = v143;
  v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v222, v255, 16);
  if (v170)
  {
    v171 = v170;
    v172 = *(_QWORD *)v223;
    do
    {
      for (kk = 0; kk != v171; ++kk)
      {
        if (*(_QWORD *)v223 != v172)
          objc_enumerationMutation(v169);
        v174 = *(void **)(*((_QWORD *)&v222 + 1) + 8 * kk);
        objc_msgSend(v174, "labelRectangle");
        if (v175 < v202 && v175 < v176)
          objc_msgSend(v174, "setLabelRectangle:", 1.0);
        objc_msgSend(v174, "labelRectangle");
        if (v178 < v201 && v178 < v179)
          objc_msgSend(v174, "setLabelRectangle:");
        objc_msgSend(v174, "labelRectangle");
        v181 = v271.origin.x;
        v182 = v271.size.width;
        v183 = v271.size.height;
        MaxY = CGRectGetMaxY(v271);
        v272.origin.x = v202;
        v272.origin.y = v201;
        v272.size.width = rect2;
        v272.size.height = rect;
        if (MaxY > CGRectGetMaxY(v272))
        {
          v273.origin.x = v202;
          v273.origin.y = v201;
          v273.size.width = rect2;
          v273.size.height = rect;
          objc_msgSend(v174, "setLabelRectangle:", v181, CGRectGetMaxY(v273) - v183 + -1.0, v182, v183);
        }
        objc_msgSend(v174, "labelRectangle");
        v185 = v274.origin.y;
        v186 = v274.size.width;
        v187 = v274.size.height;
        v188 = CGRectGetMaxX(v274);
        v275.origin.x = v202;
        v275.origin.y = v201;
        v275.size.width = rect2;
        v275.size.height = rect;
        if (v188 > CGRectGetMaxX(v275))
        {
          v276.origin.x = v202;
          v276.origin.y = v201;
          v276.size.width = rect2;
          v276.size.height = rect;
          objc_msgSend(v174, "setLabelRectangle:", CGRectGetMaxX(v276) - v186 + -1.0, v185, v186, v187);
        }
      }
      v171 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v222, v255, 16);
    }
    while (v171);
  }

  v220 = 0u;
  v221 = 0u;
  v218 = 0u;
  v219 = 0u;
  v189 = v169;
  v190 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v218, v254, 16);
  if (v190)
  {
    v191 = v190;
    v192 = *(_QWORD *)v219;
    do
    {
      for (mm = 0; mm != v191; ++mm)
      {
        if (*(_QWORD *)v219 != v192)
          objc_enumerationMutation(v189);
        v194 = *(void **)(*((_QWORD *)&v218 + 1) + 8 * mm);
        if (objc_msgSend(v194, "arrowOrientation"))
        {
          if (objc_msgSend(v194, "badgePresentation"))
          {
            objc_msgSend(v194, "labelRectangle");
            v195 = CGRectGetMaxX(v277);
            objc_msgSend(v194, "interfaceOrientedRectangle");
            if (v195 > CGRectGetMaxX(v278))
              objc_msgSend(v194, "setArrowOrientation:", 0);
          }
        }
      }
      v191 = objc_msgSend(v189, "countByEnumeratingWithState:objects:count:", &v218, v254, 16);
    }
    while (v191);
  }

  return obja;
}

uint64_t __104__CACLabeledElementsOverlayManager__optimizeLabeledElements_startingNumberedLabelsAtIndex_forceNoArrow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  uint64_t v16;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "interfaceOrientedRectangle");
  v7 = v6;
  objc_msgSend(v5, "interfaceOrientedRectangle");
  v9 = v8;

  v10 = v7 + v9 * 0.5;
  objc_msgSend(v4, "interfaceOrientedRectangle");
  v12 = v11;
  objc_msgSend(v4, "interfaceOrientedRectangle");
  v14 = v13;

  v15 = v12 + v14 * 0.5;
  v16 = -1;
  if (v10 >= v15)
    v16 = 1;
  if (v10 == v15)
    return 0;
  else
    return v16;
}

uint64_t __104__CACLabeledElementsOverlayManager__optimizeLabeledElements_startingNumberedLabelsAtIndex_forceNoArrow___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "interfaceOrientedRectangle");
  v7 = v6;
  objc_msgSend(v5, "interfaceOrientedRectangle");
  if (v7 == v8)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v4, "interfaceOrientedRectangle");
    v11 = v10;
    objc_msgSend(v5, "interfaceOrientedRectangle");
    if (v11 >= v12)
      v9 = 1;
    else
      v9 = -1;
  }

  return v9;
}

- (id)_findLabeledElementsThatIntersectsLabelRect:(CGRect)a3 fromLabeledElement:(id)a4 justLabelRect:(BOOL)a5 additionalElements:(id)a6
{
  _BOOL4 v7;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;
  CGRect v35;
  CGRect v36;

  v7 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v34 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObjectsFromArray:", self->_labeledElements);
  objc_msgSend(v16, "addObjectsFromArray:", v14);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v30;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v30 != v20)
          objc_enumerationMutation(v17);
        v22 = *(id *)(*((_QWORD *)&v29 + 1) + 8 * v21);
        if (v22 != v13)
        {
          v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v21);
          if (v7)
            objc_msgSend(v23, "labelRectangle");
          else
            objc_msgSend(v23, "interfaceOrientedRectangle", (_QWORD)v29);
          v36.origin.x = v24;
          v36.origin.y = v25;
          v36.size.width = v26;
          v36.size.height = v27;
          v35.origin.x = x;
          v35.origin.y = y;
          v35.size.width = width;
          v35.size.height = height;
          if (CGRectIntersectsRect(v35, v36))
            objc_msgSend(v15, "addObject:", v22);
        }
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v19);
  }

  return v15;
}

+ (void)assignNumbersToLabeledElements:(id)a3 numberingStrategy:(int)a4 startingNumber:(int64_t)a5
{
  id v7;
  uint64_t v8;
  char *v9;
  uint64_t i;
  uint64_t j;
  uint32_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v26;
  int64_t v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void *v36;
  void *v37;
  int64_t v38;
  id v39;
  char *v40;
  int v41;
  _QWORD *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = objc_msgSend(v7, "count");
  v40 = (char *)malloc_type_calloc(v8 + a5, 8uLL, 0x100004000313F17uLL);
  v42 = malloc_type_calloc(v8 + a5, 8uLL, 0x100004000313F17uLL);
  v41 = a4;
  if (a4 == 1)
  {
    v9 = v40;
    if (v8 >= 1)
    {
      for (i = 0; i != v8; ++i)
        *(_QWORD *)&v40[8 * i] = i + 1;
      for (j = 0; j != v8; ++j)
      {
        v12 = arc4random_uniform(v8);
        if (j != v12)
        {
          v13 = *(_QWORD *)&v40[8 * j];
          *(_QWORD *)&v40[8 * j] = *(_QWORD *)&v40[8 * v12];
          *(_QWORD *)&v40[8 * v12] = v13;
        }
      }
    }
  }
  else
  {
    v38 = a5;
    v39 = v7;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v14 = v7;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    v9 = v40;
    if (v15)
    {
      v16 = v15;
      v17 = 0;
      v18 = *(_QWORD *)v48;
      do
      {
        v19 = 0;
        v20 = &v40[8 * v17];
        do
        {
          if (*(_QWORD *)v48 != v18)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v19), "label");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "integerValue");

          v23 = v22 - 1;
          v24 = v22 >= 1 && v22 <= v8;
          if (v24 && !*(_QWORD *)&v20[8 * v19] && !v42[v23] && v41 == 0)
          {
            *(_QWORD *)&v20[8 * v19] = v22;
            v42[v23] = v17 + v19 + 1;
          }
          ++v19;
        }
        while (v16 != v19);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        v17 += v19;
      }
      while (v16);
    }

    v7 = v39;
    if (v8 >= 1)
    {
      v26 = 0;
      do
      {
        v27 = v38;
        if (*(_QWORD *)&v40[8 * v26])
        {
          ++v26;
        }
        else
        {
          while (v42[v27++ - 1])
            ;
          *(_QWORD *)&v40[8 * v26++] = v27 - 1;
          v42[v27 - 2] = v26;
        }
      }
      while (v26 != v8);
    }
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v29 = v7;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v30)
  {
    v31 = v30;
    v32 = 0;
    v33 = *(_QWORD *)v44;
    do
    {
      v34 = 0;
      v35 = &v9[8 * v32];
      do
      {
        if (*(_QWORD *)v44 != v33)
          objc_enumerationMutation(v29);
        v36 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v34);
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), *(_QWORD *)&v35[8 * v34]);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setNumberedLabel:", v37);

        ++v34;
      }
      while (v31 != v34);
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      v32 += v34;
      v9 = v40;
    }
    while (v31);
  }

  free(v9);
  free(v42);

}

- (void)startDelayedDimmingOfNumbers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  dispatch_time_t v10;
  id v11;
  _QWORD block[5];

  -[CACSimpleContentViewManager setPendingDimmingTransactionID:](self, "setPendingDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID") + 1);
  -[CACSimpleContentViewManager setActiveDimmingTransactionID:](self, "setActiveDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID"));
  -[CACSimpleContentViewManager viewController](self, "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", 1.0);

  -[CACLabeledElementsOverlayManager delegate](self, "delegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isOverlayFadingEnabledForLabeledElementsOverlayManager:", self) & 1) == 0)
    goto LABEL_7;
  -[CACLabeledElementsOverlayManager delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isAlwaysShowingLabeledElementsOverlayManager:", self) & 1) == 0)
  {

LABEL_7:
    return;
  }
  -[CACLabeledElementsOverlayManager delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isHandlingDisambiguationForLabeledElementsOverlayManager:", self);

  if ((v7 & 1) == 0)
  {
    -[CACLabeledElementsOverlayManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "overlayFadeDelayForLabeledElementsOverlayManager:", self);
    v10 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__CACLabeledElementsOverlayManager_startDelayedDimmingOfNumbers__block_invoke;
    block[3] = &unk_24F2AA860;
    block[4] = self;
    dispatch_after(v10, MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __64__CACLabeledElementsOverlayManager_startDelayedDimmingOfNumbers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "activeDimmingTransactionID");
  result = objc_msgSend(*(id *)(a1 + 32), "pendingDimmingTransactionID");
  if (v2 == result)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __64__CACLabeledElementsOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2;
    v4[3] = &unk_24F2AA860;
    v4[4] = *(_QWORD *)(a1 + 32);
    return objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:completion:", v4, 0, 1.0);
  }
  return result;
}

void __64__CACLabeledElementsOverlayManager_startDelayedDimmingOfNumbers__block_invoke_2(uint64_t a1)
{
  float v2;
  double v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overlayFadeOpacityForLabeledElementsOverlayManager:", *(_QWORD *)(a1 + 32));
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v3);

}

- (void)stopDelayedDimmingOfNumbers
{
  void *v3;
  id v4;

  -[CACSimpleContentViewManager setPendingDimmingTransactionID:](self, "setPendingDimmingTransactionID:", -[CACSimpleContentViewManager pendingDimmingTransactionID](self, "pendingDimmingTransactionID") + 1);
  -[CACSimpleContentViewManager viewController](self, "viewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 1.0);

}

- (BOOL)isOverlay
{
  return 1;
}

- (void)hide
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACLabeledElementsOverlayManager;
  -[CACSimpleContentViewManager hide](&v2, sel_hide);
}

- (void)hideWithoutAnimation
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CACLabeledElementsOverlayManager;
  -[CACSimpleContentViewManager hideWithoutAnimation](&v2, sel_hideWithoutAnimation);
}

- (void)hideAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CACLabeledElementsOverlayManager_hideAnimated_completion___block_invoke;
  block[3] = &unk_24F2AA860;
  block[4] = self;
  v6 = a4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v7.receiver = self;
  v7.super_class = (Class)CACLabeledElementsOverlayManager;
  -[CACSimpleContentViewManager hideAnimated:completion:](&v7, sel_hideAnimated_completion_, v4, v6);

}

uint64_t __60__CACLabeledElementsOverlayManager_hideAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearLabeledElements");
}

- (CACLabeledElementsOverlayManagerDelegate)delegate
{
  return (CACLabeledElementsOverlayManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_labeledElements, 0);
}

@end
