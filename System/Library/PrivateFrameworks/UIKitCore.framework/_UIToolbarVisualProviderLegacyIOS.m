@implementation _UIToolbarVisualProviderLegacyIOS

- (void)_createViewsForItems:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIToolbar *toolbar;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
LABEL_7:

          goto LABEL_12;
        }
        if (!objc_msgSend(v9, "isSystemItem"))
          goto LABEL_11;
        if (objc_msgSend(v9, "systemItem") == 5)
          goto LABEL_7;
        if (objc_msgSend(v9, "systemItem") != 6)
        {
LABEL_11:
          objc_msgSend(v9, "createViewForToolbar:", self->super._toolbar);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setView:", v11);

          objc_msgSend(v9, "setIsMinibarView:", -[UIToolbar isMinibar](self->super._toolbar, "isMinibar"));
        }
LABEL_12:
        objc_msgSend(v9, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          toolbar = self->super._toolbar;
          objc_msgSend(v9, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIView addSubview:](toolbar, "addSubview:", v14);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (void)updateItemsForNewFrame:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[UIToolbar isMinibar](self->super._toolbar, "isMinibar");
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v11, "view", (_QWORD)v25);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12 && (objc_msgSend(v11, "isCustomViewItem") & 1) == 0)
        {
          v19 = objc_msgSend(v11, "isMinibarView");

          if (v5 != v19)
          {
            objc_msgSend(v11, "view");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "superview");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              objc_msgSend(v11, "view");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "removeFromSuperview");

              objc_msgSend(v11, "createViewForToolbar:", self->super._toolbar);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setView:", v22);

              objc_msgSend(v11, "setIsMinibarView:", v5);
              objc_msgSend(v11, "view");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "addSubview:", v23);

            }
            else
            {
              objc_msgSend(v11, "createViewForToolbar:", self->super._toolbar);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setView:", v24);

              objc_msgSend(v11, "setIsMinibarView:", v5);
              v18 = 0;
            }
            goto LABEL_17;
          }
        }
        else
        {

        }
        objc_msgSend(v11, "view");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(v11, "isCustomViewItem");

          if (v15)
          {
            objc_msgSend(v11, "view");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_opt_respondsToSelector();

            if ((v17 & 1) != 0)
            {
              objc_msgSend(v11, "view");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "updateForMiniBarState:", v5);
LABEL_17:

              continue;
            }
          }
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v8);
  }

}

- (id)_repositionedItemsFromItems:(id)a3 withBarButtonFrames:(id *)a4 withHitRects:(id *)a5 buttonIndexes:(id *)a6 textButtonIndexes:(id *)a7
{
  id v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  _BOOL8 v52;
  uint64_t v53;
  id v54;
  void *v55;
  _BOOL8 v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  uint64_t j;
  void *v76;
  double v77;
  double v78;
  void *v79;
  double v80;
  double v81;
  double v82;
  double v83;
  void *v84;
  double v85;
  double v86;
  double v87;
  double v88;
  char v89;
  double v90;
  double v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  uint64_t v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  double v110;
  double v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  double v115;
  void *v116;
  void *v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  uint64_t v130;
  _BOOL8 v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  int v142;
  double v143;
  double v144;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  CGFloat v148;
  double v149;
  void *v150;
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
  double v161;
  void *v162;
  double v163;
  double MaxX;
  double v165;
  double v166;
  double v167;
  void *v168;
  void *v169;
  id v170;
  uint64_t v171;
  void *v172;
  id *v173;
  CGFloat v174;
  CGFloat v175;
  CGFloat v176;
  CGFloat v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t k;
  double v184;
  double v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  void *v192;
  double v193;
  double v194;
  double v195;
  void *v196;
  id v197;
  void *v199;
  _QWORD *v200;
  _QWORD *v201;
  void *v204;
  void *v205;
  id v206;
  uint64_t v207;
  void *v208;
  id v209;
  unint64_t v210;
  id v211;
  double v212;
  double v213;
  double v214;
  uint64_t v215;
  _BOOL4 v216;
  id v217;
  uint64_t v218;
  uint64_t v219;
  CGFloat v220;
  uint64_t v221;
  double v222;
  id obj;
  double obja;
  _UIToolbarVisualProviderLegacyIOS *v225;
  double v226;
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
  _BYTE v243[128];
  _BYTE v244[128];
  _BYTE v245[128];
  double v246;
  double v247;
  uint64_t v248;
  uint64_t v249;
  double v250;
  double v251;
  _BYTE v252[128];
  uint64_t v253;
  CGRect v254;
  CGRect v255;
  CGRect v256;
  CGRect v257;

  v253 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v217 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  v225 = self;
  -[UIView bounds](self->super._toolbar, "bounds");
  v213 = v13;
  v226 = v14;
  v15 = objc_msgSend(v11, "count");
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v199, "handleFailureInMethod:object:file:lineNumber:description:", a2, v225, CFSTR("_UIToolbarVisualProviderLegacyIOS.m"), 141, CFSTR("Can't get button frames when there are no items"));

  }
  v215 = v15;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet", a4, a7);
  v206 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v211 = (id)objc_claimAutoreleasedReturnValue();
  v239 = 0u;
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  obj = v11;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v239, v252, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v218 = 0;
    v221 = 0;
    v19 = 0;
    v20 = *(_QWORD *)v240;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v240 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * i);
        if (objc_msgSend(v22, "isSystemItem") && objc_msgSend(v22, "systemItem") == 5)
        {
          ++v221;
        }
        else if (objc_msgSend(v22, "_flexible"))
        {
          v23 = (void *)MEMORY[0x1E0CB3B18];
          objc_msgSend(v22, "view");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "frame");
          objc_msgSend(v23, "valueWithCGRect:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v25);

          objc_msgSend(v211, "addIndex:", v18 + i);
          ++v19;
        }
        else if (objc_msgSend(v22, "isSystemItem") && objc_msgSend(v22, "systemItem") == 6)
        {
          ++v218;
        }
        else
        {
          objc_msgSend(v22, "view");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "frame");
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v34 = v33;
          objc_msgSend(v22, "width");
          if (v35 <= 0.0
            && (objc_msgSend(v22, "_minimumWidth"), v36 <= 0.0)
            && (objc_msgSend(v22, "_maximumWidth"), v37 <= 0.0))
          {
            if ((objc_msgSend(v22, "isCustomViewItem") & 1) != 0
              || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
            {
              v43 = v32;
            }
            else
            {
              objc_msgSend(v206, "addIndex:", v18 + i);
              objc_msgSend(v26, "sizeThatFits:", v32, v34);
              UICeilToViewScale(v225->super._toolbar);
              v43 = v46;
            }
          }
          else
          {
            objc_msgSend(v22, "_minimumWidth");
            v39 = v38;
            objc_msgSend(v22, "_maximumWidth");
            v41 = v40;
            objc_msgSend(v22, "width");
            v43 = v42;
            if (v42 <= 0.0)
            {
              v44 = v39 > 0.0 && v32 < v39;
              v43 = v39;
              if (!v44)
              {
                if (v32 <= v41 || v41 <= 0.0)
                  v43 = v32;
                else
                  v43 = v41;
              }
            }
          }
          objc_msgSend(v211, "addIndex:", v18 + i);
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v28, v30, v43, v34);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v47);

        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v239, v252, 16);
      v18 += i;
    }
    while (v17);
  }
  else
  {
    v218 = 0;
    v221 = 0;
    v19 = 0;
  }

  objc_msgSend(obj, "firstObject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "view");
  v205 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(obj, "lastObject");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "view");
  v204 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(obj, "firstObject");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "view");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v51, "_isBordered") & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || objc_msgSend(v50, "style") == 1;
  v53 = v215;

  objc_msgSend(obj, "lastObject");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "view");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v55, "_isBordered") & 1) != 0
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || objc_msgSend(v54, "style") == 1;

  v57 = objc_msgSend(v206, "containsIndex:", 0);
  v58 = objc_msgSend(v206, "containsIndex:", v215 - 1);
  -[_UIToolbarVisualProviderLegacyIOS _edgeMarginForBorderedItem:isText:](v225, "_edgeMarginForBorderedItem:isText:", v52, v57);
  v60 = v59;
  -[_UIToolbarVisualProviderLegacyIOS _edgeMarginForBorderedItem:isText:](v225, "_edgeMarginForBorderedItem:isText:", v56, v58);
  v62 = v61;
  v63 = 0.0;
  v64 = 0.0;
  if (v205)
  {
    objc_msgSend(v205, "alignmentRectInsets");
    v64 = v65;
  }
  if (v204)
  {
    objc_msgSend(v204, "alignmentRectInsets");
    v63 = v66;
  }
  v216 = 0;
  if (v221 == 2 && !v19)
    v216 = v218 + objc_msgSend(v206, "count") + 2 != v53;
  v67 = v60 - v64;
  v251 = 0.0;
  v250 = 0.0;
  v249 = 0;
  v248 = 0;
  v247 = 0.0;
  v246 = 0.0;
  if (!(v221 + v19))
  {
    v91 = 0.0;
LABEL_101:
    v212 = v91;
    goto LABEL_102;
  }
  v210 = v221 + v19;
  v237 = 0u;
  v238 = 0u;
  v235 = 0u;
  v236 = 0u;
  v68 = obj;
  v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v235, v245, 16);
  if (v69)
  {
    v70 = v69;
    v71 = 0;
    v219 = 0;
    v72 = 0;
    v73 = *(_QWORD *)v236;
    v74 = 0.0;
    do
    {
      for (j = 0; j != v70; ++j)
      {
        if (*(_QWORD *)v236 != v73)
          objc_enumerationMutation(v68);
        v76 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * j);
        if (v216
          && objc_msgSend(*(id *)(*((_QWORD *)&v235 + 1) + 8 * j), "isSystemItem")
          && objc_msgSend(v76, "systemItem") == 5)
        {
          *(&v250 + v219) = v74;
          *(&v248 + v219++) = v72;
          v74 = 0.0;
          v72 = 0;
        }
        else if (!objc_msgSend(v76, "isSystemItem") || objc_msgSend(v76, "systemItem") != 5)
        {
          if (objc_msgSend(v76, "isSystemItem")
            && ((objc_msgSend(v76, "width"), v77 > 0.0) || objc_msgSend(v76, "systemItem") == 6))
          {
            objc_msgSend(v76, "width");
            v74 = v74 + v78;
            if (objc_msgSend(v76, "systemItem") != 6)
            {
              ++v71;
              ++v72;
            }
          }
          else
          {
            objc_msgSend(v76, "view");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v80 = 0.0;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v81 = 0.0;
              if (objc_msgSend(v79, "_canGetPadding"))
              {
                objc_msgSend(v79, "_paddingForLeft:", 1);
                v81 = v82;
                objc_msgSend(v79, "_paddingForLeft:", 0);
                v80 = v83;
              }
            }
            else
            {
              v81 = 0.0;
            }
            objc_msgSend(v12, "objectAtIndexedSubscript:", v71);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "CGRectValue");
            v86 = v85;
            v88 = v87;

            if (objc_msgSend(v76, "_flexible"))
            {
              v89 = objc_msgSend(v79, "isMemberOfClass:", objc_opt_class());
              v90 = 0.0;
              if ((v89 & 1) == 0)
                objc_msgSend(v79, "sizeThatFits:", v86, v88);
            }
            else
            {
              v90 = v86;
            }
            v74 = v74 + v90 - v81 - v80;
            ++v72;
            ++v71;

          }
        }
      }
      v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v235, v245, 16);
    }
    while (v70);
  }
  else
  {
    v72 = 0;
    v74 = 0.0;
  }
  v92 = v62 - v63;

  if (v72 <= 1)
    v93 = 1;
  else
    v93 = v72;
  v94 = v93 - 1;
  if (!v216)
  {
LABEL_100:
    v216 = 0;
    v91 = (v213 - v74 - (v67 + v92) + (double)v94 * -10.0) / (double)v210;
    goto LABEL_101;
  }
  v95 = v251;
  v96 = v249;
  v97 = (v213 - v251 + (double)v249 * -10.0) * 0.5;
  v98 = floor(v97);
  v99 = ceil(v97);
  v100 = 0.0;
  v212 = 0.0;
  if (v249 >= 1)
    UICeilToViewScale(v225->super._toolbar);
  v101 = v98 - (v67 + v250 + (double)v248 * 10.0 - v100);
  v102 = v99 - (v92 + v74 + (double)v94 * 10.0 + v100);
  v246 = v101;
  v247 = v102;
  if (v101 < 0.0 || v102 < 0.0)
  {
    v103 = fmax((double)(v248 + v96) + -1.0, 0.0);
    if (v74 > 0.0)
      v94 += v248 + v96;
    else
      v94 = (uint64_t)v103;
    v74 = v74 + v95 + v250;
    goto LABEL_100;
  }
  v216 = 1;
LABEL_102:
  _UIControlMostlyInsideEdgeInsets();
  v105 = v104;
  v231 = 0u;
  v232 = 0u;
  v233 = 0u;
  v234 = 0u;
  v209 = obj;
  v106 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v231, v244, 16);
  if (!v106)
  {
    v109 = 0;
    goto LABEL_161;
  }
  v107 = v106;
  v108 = 0;
  v207 = 0;
  v109 = 0;
  v110 = *MEMORY[0x1E0C9D648];
  v111 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v214 = -v105;
  v112 = *(_QWORD *)v232;
  do
  {
    v113 = 0;
    do
    {
      if (*(_QWORD *)v232 != v112)
        objc_enumerationMutation(v209);
      v114 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * v113);
      if (objc_msgSend(v114, "isSystemItem") && objc_msgSend(v114, "systemItem") == 5)
      {
        if (v216)
          v67 = v67 + *(&v246 + v207++);
        else
          v67 = v212 + v67;
        goto LABEL_155;
      }
      if (objc_msgSend(v114, "isSystemItem") && objc_msgSend(v114, "systemItem") == 6)
      {
        objc_msgSend(v114, "width");
        v67 = v67 + v115;
        goto LABEL_155;
      }
      objc_msgSend(v114, "view");
      v116 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", v108);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "CGRectValue");
      v119 = v118;
      v121 = v120;

      if (objc_msgSend(v114, "_flexible"))
      {
        v122 = 0.0;
        if ((objc_msgSend(v116, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
        {
          objc_msgSend(v116, "sizeThatFits:", v119, v121);
          v122 = v123;
        }
      }
      else
      {
        v122 = v119;
      }
      v124 = 0.0;
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v125 = 0.0;
        if (objc_msgSend(v116, "_canGetPadding"))
        {
          objc_msgSend(v116, "_paddingForLeft:", 1);
          v124 = v126;
          objc_msgSend(v116, "_paddingForLeft:", 0);
          v125 = v127;
        }
      }
      else
      {
        v125 = 0.0;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v116, "_useBarHeight"))
        v121 = v226;
      UIRoundToViewScale(v225->super._toolbar);
      v129 = v128;
      v130 = -[UIToolbar barPosition](v225->super._toolbar, "barPosition");
      v132 = v130 != 1 && v130 != 4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v116, "_backgroundVerticalPositionAdjustmentForBarMetrics:", -[UIToolbar isMinibar](v225->super._toolbar, "isMinibar"));
        v129 = v129 + v133;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v116, "_setInTopBar:", v132);
      objc_msgSend(v114, "width");
      v222 = v125;
      if (v134 <= 0.0)
      {
        objc_msgSend(v114, "_minimumWidth");
        if (v136 <= 0.0 || (objc_msgSend(v114, "_minimumWidth"), v122 >= v137))
        {
          objc_msgSend(v114, "_maximumWidth");
          if (v138 <= 0.0)
            goto LABEL_144;
          objc_msgSend(v114, "_maximumWidth");
          if (v122 <= v139)
            goto LABEL_144;
          objc_msgSend(v114, "_maximumWidth");
        }
        else
        {
          objc_msgSend(v114, "_minimumWidth");
        }
      }
      else
      {
        objc_msgSend(v114, "width");
      }
      v122 = v135;
LABEL_144:
      v140 = v67 - v124;
      v141 = round(v67 - v124);
      v142 = objc_msgSend(v114, "_flexible");
      v143 = -0.0;
      if (v142)
        v143 = v212;
      v144 = v122 + v143;
      objc_msgSend(v116, "frame");
      v257.origin.x = v145;
      v257.origin.y = v146;
      v257.size.width = v147;
      v257.size.height = v148;
      v254.origin.x = v141;
      v254.origin.y = v129;
      v254.size.width = v144;
      v254.size.height = v121;
      if (!CGRectEqualToRect(v254, v257))
        objc_msgSend(v208, "addObject:", v114);
      obja = v121;
      v220 = v141;
      if (v109)
      {
        v149 = fmin((v141 - (v110 + v111)) * 0.5, v214);
        objc_msgSend(v217, "lastObject");
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v150, "CGRectValue");
        v152 = v151;
        v154 = v153;
        v156 = v155;
        v157 = v140;
        v158 = v129;
        v160 = v159;

        objc_msgSend(v217, "removeLastObject");
        v161 = v160;
        v129 = v158;
        v140 = v157;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v152, v154, v149 + v156, v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v217, "addObject:", v162);

      }
      else
      {
        v149 = fmin(v141, v214);
      }
      v163 = v144 + v149;
      if (v108 == objc_msgSend(v12, "count") - 1)
      {
        -[UIView bounds](v225->super._toolbar, "bounds");
        MaxX = CGRectGetMaxX(v255);
        v165 = v220;
        v256.origin.x = v220;
        v256.origin.y = v129;
        v256.size.width = v144;
        v166 = v129;
        v167 = obja;
        v256.size.height = obja;
        v163 = v163 + fmin(MaxX - CGRectGetMaxX(v256), v214);
      }
      else
      {
        v166 = v129;
        v167 = obja;
        v165 = v220;
      }
      v67 = v140 + v144 - v222 + 10.0;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", -v149, -v166, v163, v226);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v217, "addObject:", v168);

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v165, v166, v144, v167);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v108, v169);

      v170 = v116;
      ++v108;

      v109 = v170;
      v110 = v165;
      v111 = v144;
LABEL_155:
      ++v113;
    }
    while (v107 != v113);
    v171 = objc_msgSend(v209, "countByEnumeratingWithState:objects:count:", &v231, v244, 16);
    v107 = v171;
  }
  while (v171);
LABEL_161:

  v172 = v217;
  v173 = a5;
  if (v200)
  {
    if ((*((_DWORD *)&v225->super._toolbar->super._viewFlags + 4) & 0x80000) != 0 && v12 && objc_msgSend(v12, "count"))
    {
      -[UIView bounds](v225->super._toolbar, "bounds");
      _UIRTLConvertAllLTRFramesToRTL(v12, v174, v175, v176, v177);
    }
    *v200 = objc_retainAutorelease(v12);
  }
  if (v201)
    *v201 = objc_retainAutorelease(v206);
  if (a6)
    *a6 = objc_retainAutorelease(v211);
  if (a5)
  {
    if ((*((_DWORD *)&v225->super._toolbar->super._viewFlags + 4) & 0x80000) != 0
      && v217
      && objc_msgSend(v217, "count"))
    {
      v227 = 0u;
      v228 = 0u;
      v229 = 0u;
      v230 = 0u;
      v178 = (id)objc_msgSend(v217, "copy");
      v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v227, v243, 16);
      if (v179)
      {
        v180 = v179;
        v181 = 0;
        v182 = *(_QWORD *)v228;
        do
        {
          for (k = 0; k != v180; ++k)
          {
            if (*(_QWORD *)v228 != v182)
              objc_enumerationMutation(v178);
            objc_msgSend(*(id *)(*((_QWORD *)&v227 + 1) + 8 * k), "CGRectValue");
            v185 = v184;
            v187 = v186;
            v189 = v188;
            v191 = v190;
            objc_msgSend(v12, "objectAtIndexedSubscript:", v181 + k);
            v192 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v192, "CGRectValue");
            v194 = v185 + v189 - v193;

            v195 = -v194;
            if (v194 < -0.0)
              v195 = 0.0;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v195, v187, v189, v191);
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v217, "replaceObjectAtIndex:withObject:", v181 + k, v196);

          }
          v180 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v227, v243, 16);
          v181 += k;
        }
        while (v180);
      }

      v172 = v217;
      v173 = a5;
    }
    *v173 = objc_retainAutorelease(v172);
  }
  v197 = v208;

  return v197;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;

  -[_UIToolbarVisualProviderLegacyIOS updateBarBackground](self, "updateBarBackground");
  -[UIView subviews](self->super._toolbar, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _UINavigationButtonUpdateAccessibilityBackgrounds(v3, objc_msgSend(v4, "_graphicsQuality") == 100, 0);

  -[_UIToolbarVisualProviderLegacyIOS positionToolbarButtonsAndResetFontScaleAdjustment:](self, "positionToolbarButtonsAndResetFontScaleAdjustment:", 0);
}

- (void)positionToolbarButtonsAndResetFontScaleAdjustment:(BOOL)a3
{
  id v3;

  v3 = -[_UIToolbarVisualProviderLegacyIOS _positionToolbarButtons:ignoringItem:resetFontScaleAdjustment:actuallyRepositionButtons:](self, "_positionToolbarButtons:ignoringItem:resetFontScaleAdjustment:actuallyRepositionButtons:", 0, 0, a3, 1);
}

- (id)_positionToolbarButtons:(id)a3 ignoringItem:(id)a4 resetFontScaleAdjustment:(BOOL)a5 actuallyRepositionButtons:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  double MinX;
  id v30;
  uint64_t v31;
  uint64_t v32;
  CGFloat width;
  CGFloat y;
  double height;
  double x;
  uint64_t v37;
  uint64_t v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  double MaxX;
  double v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  _BOOL4 v69;
  void (**v70)(_QWORD);
  void *v71;
  void (**v72)(_QWORD);
  double v73;
  double v74;
  double v75;
  void *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  uint64_t m;
  void *v86;
  void *v87;
  double v88;
  double v89;
  void *v90;
  int v91;
  double v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  double v96;
  uint64_t v97;
  uint64_t n;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  double v106;
  void *v107;
  void *v108;
  id v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t ii;
  void *v116;
  double v117;
  void *v118;
  void *v119;
  id v121;
  uint64_t v122;
  void *v123;
  void *v124;
  BOOL v125;
  void (**v126)(_QWORD);
  id v127;
  id v128;
  void *v129;
  void *v130;
  _BOOL4 v131;
  id v132;
  CGFloat rect;
  id recta;
  id v135;
  _UIToolbarVisualProviderLegacyIOS *obj;
  id obja;
  id v138;
  _QWORD v139[4];
  id v140;
  id v141;
  uint64_t v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  id v147;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD aBlock[4];
  id v158;
  BOOL v159;
  BOOL v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  id v169;
  id v170;
  id v171;
  id v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _BYTE v181[128];
  _BYTE v182[128];
  _BYTE v183[128];
  _BYTE v184[128];
  _BYTE v185[128];
  _BYTE v186[128];
  _BYTE v187[128];
  uint64_t v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;
  CGRect v192;
  CGRect v193;
  CGRect v194;
  CGRect v195;

  v131 = a6;
  v6 = a5;
  v188 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v132 = a4;
  if (!v9)
  {
    -[UIToolbar items](self->super._toolbar, "items");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v9, "count"))
  {
    if (v6)
    {
      v175 = 0u;
      v176 = 0u;
      v173 = 0u;
      v174 = 0u;
      v10 = v9;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v173, v186, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v174;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v174 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v173 + 1) + 8 * i), "view");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "_info");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "_setFontScaleAdjustment:", 1.0);

              if (objc_msgSend(v15, "_wantsAccessibilityButtonShapes"))
              {
                objc_msgSend(v15, "_info");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "sizeToFit");

              }
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v173, v186, 16);
        }
        while (v12);
      }

    }
    v172 = 0;
    v171 = 0;
    v170 = 0;
    v169 = 0;
    -[_UIToolbarVisualProviderLegacyIOS _repositionedItemsFromItems:withBarButtonFrames:withHitRects:buttonIndexes:textButtonIndexes:](self, "_repositionedItemsFromItems:withBarButtonFrames:withHitRects:buttonIndexes:textButtonIndexes:", v9, &v172, &v171, &v170, &v169);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v172;
    v135 = v171;
    v128 = v170;
    v138 = v169;
    v20 = objc_msgSend(v138, "count");
    v21 = v20 != 0;
    obj = self;
    if (v20)
    {
      v22 = *((_DWORD *)&self->super._toolbar->super._viewFlags + 4);
      v23 = v19;
      v24 = v23;
      if ((v22 & 0x80000) != 0)
        objc_msgSend(v23, "reverseObjectEnumerator");
      else
        objc_msgSend(v23, "objectEnumerator");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "nextObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "CGRectValue");
      MinX = CGRectGetMinX(v189);

      v179 = 0u;
      v180 = 0u;
      v177 = 0u;
      v178 = 0u;
      v30 = v27;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v177, v187, 16);
      if (v31)
      {
        v32 = v31;
        y = *(double *)(MEMORY[0x1E0C9D648] + 8);
        width = *(double *)(MEMORY[0x1E0C9D648] + 16);
        height = *(double *)(MEMORY[0x1E0C9D648] + 24);
        x = MinX + -10.0;
        v37 = *(_QWORD *)v178;
        while (2)
        {
          v38 = 0;
          v39 = height;
          v40 = width;
          v41 = y;
          v42 = x;
          do
          {
            rect = v39;
            if (*(_QWORD *)v178 != v37)
              objc_enumerationMutation(v30);
            objc_msgSend(*(id *)(*((_QWORD *)&v177 + 1) + 8 * v38), "CGRectValue");
            x = v190.origin.x;
            y = v190.origin.y;
            width = v190.size.width;
            height = v190.size.height;
            v43 = CGRectGetMinX(v190) + -10.0;
            v191.origin.x = v42;
            v191.origin.y = v41;
            v191.size.width = v40;
            v191.size.height = rect;
            if (v43 < CGRectGetMaxX(v191))
            {

              self = obj;
              -[UIView bounds](obj->super._toolbar, "bounds");
              v26 = !CGRectIsEmpty(v192);
              goto LABEL_32;
            }
            ++v38;
            v39 = height;
            v40 = width;
            v41 = y;
            v42 = x;
          }
          while (v32 != v38);
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v177, v187, 16, height);
          if (v32)
            continue;
          break;
        }
      }

      LOBYTE(v26) = 0;
      self = obj;
    }
    else
    {
      LOBYTE(v26) = 0;
    }
LABEL_32:
    -[UIView bounds](self->super._toolbar, "bounds");
    v45 = v44;
    v129 = (void *)v18;
    if (v44 > 0.0)
    {
      v167 = 0u;
      v168 = 0u;
      v165 = 0u;
      v166 = 0u;
      v46 = v19;
      v47 = v19;
      v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v165, v185, 16);
      if (v48)
      {
        v49 = v48;
        v50 = 0;
        v51 = *(_QWORD *)v166;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v166 != v51)
              objc_enumerationMutation(v47);
            objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * j), "CGRectValue");
            MaxX = CGRectGetMaxX(v193);
            -[UIView bounds](obj->super._toolbar, "bounds");
            if (MaxX > v54 && objc_msgSend(v138, "containsIndex:", v50 + j))
              LOBYTE(v26) = 1;
          }
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v165, v185, 16);
          v50 += j;
        }
        while (v49);
      }

      v19 = v46;
      self = obj;
      v21 = v20 != 0;
    }
    if (v26)
    {
      objc_msgSend(v9, "objectsAtIndexes:", v138);
      v161 = 0u;
      v162 = 0u;
      v163 = 0u;
      v164 = 0u;
      v55 = (id)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v161, v184, 16);
      if (v56)
      {
        v57 = v56;
        v58 = *(_QWORD *)v162;
        v59 = *(_QWORD *)off_1E1678D90;
        v121 = v19;
        v125 = v21;
        while (2)
        {
          for (k = 0; k != v57; ++k)
          {
            if (*(_QWORD *)v162 != v58)
              objc_enumerationMutation(v55);
            v61 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * k);
            objc_msgSend(v61, "_appearanceStorage");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "view");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "_info");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "_appearanceStorage");
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v62, "textAttributeForKey:state:", v59, 0);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            if (v66)
            {

LABEL_60:
              v68 = 0;
              v19 = v121;
              self = obj;
              v21 = v125;
              goto LABEL_61;
            }
            objc_msgSend(v65, "textAttributeForKey:state:", v59, 0);
            v67 = (void *)objc_claimAutoreleasedReturnValue();

            if (v67)
              goto LABEL_60;

          }
          v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v161, v184, 16);
          v68 = 1;
          v19 = v121;
          self = obj;
          v21 = v125;
          if (v57)
            continue;
          break;
        }
      }
      else
      {
        v68 = 1;
      }
LABEL_61:

    }
    else
    {
      v68 = 0;
      v55 = 0;
      if (v20)
      {
        v69 = v131;
        if (v131)
        {
          objc_msgSend(v9, "objectsAtIndexes:", v138);
          v55 = (id)objc_claimAutoreleasedReturnValue();
          v68 = 0;
        }
LABEL_63:
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __125___UIToolbarVisualProviderLegacyIOS__positionToolbarButtons_ignoringItem_resetFontScaleAdjustment_actuallyRepositionButtons___block_invoke;
        aBlock[3] = &unk_1E16B70C0;
        v159 = v69;
        v160 = v21;
        recta = v55;
        v158 = recta;
        v70 = (void (**)(_QWORD))_Block_copy(aBlock);
        v126 = v70;
        v127 = v9;
        if (v68)
        {
          if ((*((_DWORD *)&self->super._toolbar->super._viewFlags + 4) & 0x80000) != 0)
          {
            objc_msgSend(v19, "lastObject");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "firstObject");
          }
          else
          {
            objc_msgSend(v19, "firstObject");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "lastObject");
          }
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v123, "CGRectValue");
          v73 = CGRectGetMaxX(v194);
          if (v73 <= v45)
            v74 = v73;
          else
            v74 = v45;
          v124 = v71;
          objc_msgSend(v71, "CGRectValue");
          v75 = CGRectGetMinX(v195);
          v76 = v19;
          v122 = objc_msgSend(v19, "count");
          v153 = 0u;
          v154 = 0u;
          v155 = 0u;
          v156 = 0u;
          v77 = v9;
          v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v153, v183, 16);
          if (v78)
          {
            v79 = v78;
            v80 = 0;
            v81 = 0;
            v82 = *(_QWORD *)v154;
            v83 = 0.0;
            v84 = 0.0;
            do
            {
              for (m = 0; m != v79; ++m)
              {
                if (*(_QWORD *)v154 != v82)
                  objc_enumerationMutation(v77);
                v86 = *(void **)(*((_QWORD *)&v153 + 1) + 8 * m);
                if (!objc_msgSend(v86, "isSystemItem")
                  || objc_msgSend(v86, "systemItem") != 5 && objc_msgSend(v86, "systemItem") != 6)
                {
                  objc_msgSend(v76, "objectAtIndexedSubscript:", v81);
                  v87 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v87, "CGRectValue");
                  v89 = v88;

                  if (objc_msgSend(v138, "containsIndex:", v80 + m))
                  {
                    objc_msgSend(v86, "view");
                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                    v91 = objc_msgSend(v90, "_isBorderedOtherThanAccessibility");

                    v92 = -0.0;
                    if (!v91)
                      v92 = v89;
                    v84 = v84 + v92;
                  }
                  v83 = v83 + v89;
                  ++v81;
                }
              }
              v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v153, v183, 16);
              v80 += m;
            }
            while (v79);
          }
          else
          {
            v83 = 0.0;
            v84 = 0.0;
          }

          v151 = 0u;
          v152 = 0u;
          v149 = 0u;
          v150 = 0u;
          v93 = recta;
          v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v149, v182, 16);
          if (v94)
          {
            v95 = v94;
            v96 = (v74 - v75 + (double)(unint64_t)(v122 - 1) * -10.0 - (v83 - v84)) / v84;
            v97 = *(_QWORD *)v150;
            do
            {
              for (n = 0; n != v95; ++n)
              {
                if (*(_QWORD *)v150 != v97)
                  objc_enumerationMutation(v93);
                v99 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * n);
                objc_msgSend(v99, "view");
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                if ((objc_msgSend(v100, "_isBorderedOtherThanAccessibility") & 1) == 0)
                {
                  objc_msgSend(v99, "view");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v101, "_info");
                  v102 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v102, "_fontScaleAdjustment");
                  v104 = v103;

                  v105 = v104 == 0.0 ? 1.0 : v104;
                  v106 = fmin(fmax(v96 * v105, 0.5), 1.0);
                  objc_msgSend(v100, "_info");
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v107, "_setFontScaleAdjustment:", v106);

                  if (objc_msgSend(v100, "_wantsAccessibilityButtonShapes"))
                  {
                    objc_msgSend(v100, "_info");
                    v108 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v108, "sizeToFit");

                  }
                }

              }
              v95 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v149, v182, 16);
            }
            while (v95);
          }

          v72 = v126;
          v126[2](v126);
          v147 = v135;
          v148 = v76;
          -[_UIToolbarVisualProviderLegacyIOS _repositionedItemsFromItems:withBarButtonFrames:withHitRects:buttonIndexes:textButtonIndexes:](obj, "_repositionedItemsFromItems:withBarButtonFrames:withHitRects:buttonIndexes:textButtonIndexes:", v77, &v148, &v147, 0, 0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v148;

          v109 = v147;
          v135 = v109;
          v9 = v127;
          if (!v131)
            goto LABEL_116;
        }
        else
        {
          v72 = v70;
          v25 = v129;
          if (!v69)
          {
LABEL_116:

            goto LABEL_117;
          }
        }
        v110 = v19;
        v130 = v25;
        v72[2](v72);
        objc_msgSend(v9, "objectsAtIndexes:", v128);
        v143 = 0u;
        v144 = 0u;
        v145 = 0u;
        v146 = 0u;
        obja = (id)objc_claimAutoreleasedReturnValue();
        v111 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v143, v181, 16);
        if (v111)
        {
          v112 = v111;
          v113 = 0;
          v114 = *(_QWORD *)v144;
          do
          {
            for (ii = 0; ii != v112; ++ii)
            {
              if (*(_QWORD *)v144 != v114)
                objc_enumerationMutation(obja);
              objc_msgSend(*(id *)(*((_QWORD *)&v143 + 1) + 8 * ii), "view");
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v116, "alpha");
              if (v117 == 0.0)
              {
                v139[0] = MEMORY[0x1E0C809B0];
                v139[1] = 3221225472;
                v139[2] = __125___UIToolbarVisualProviderLegacyIOS__positionToolbarButtons_ignoringItem_resetFontScaleAdjustment_actuallyRepositionButtons___block_invoke_2;
                v139[3] = &unk_1E16B1C28;
                v140 = v116;
                v141 = v110;
                v142 = v113 + ii;
                +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v139);

                v118 = v140;
              }
              else
              {
                objc_msgSend(v110, "objectAtIndexedSubscript:", v113 + ii);
                v118 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v118, "CGRectValue");
                objc_msgSend(v116, "setFrame:");
              }

              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v135, "objectAtIndexedSubscript:", v113 + ii);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v119, "CGRectValue");
                objc_msgSend(v116, "_setButtonBarHitRect:");

              }
            }
            v112 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v143, v181, 16);
            v113 += ii;
          }
          while (v112);
        }

        v72 = v126;
        v9 = v127;
        v25 = v130;
        v19 = v110;
        goto LABEL_116;
      }
    }
    v69 = v131;
    goto LABEL_63;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_117:

  return v25;
}

- (void)updateWithItems:(id)a3 fromOldItems:(id)a4 animate:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  UIToolbar *v29;
  UIToolbar *toolbar;
  uint64_t v31;
  id v32;
  id v33;
  void (**v34)(_QWORD);
  id v35;
  id v36;
  void (**v37)(void *, uint64_t);
  _BOOL4 v38;
  void *v39;
  void *v40;
  id v41;
  id obj;
  _UIToolbarVisualProviderLegacyIOS *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD aBlock[4];
  id v48;
  _UIToolbarVisualProviderLegacyIOS *v49;
  id v50;
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

  v38 = a5;
  v61 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[_UIToolbarVisualProviderLegacyIOS _createViewsForItems:](self, "_createViewsForItems:", v7);
  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  v43 = self;
  -[_UIToolbarVisualProviderLegacyIOS _positionToolbarButtons:ignoringItem:resetFontScaleAdjustment:actuallyRepositionButtons:](self, "_positionToolbarButtons:ignoringItem:resetFontScaleAdjustment:actuallyRepositionButtons:", 0, 0, 0, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v56;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v56 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v13);
        objc_msgSend(v14, "view");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          if (!v9 || objc_msgSend(v9, "indexOfObjectIdenticalTo:", v14) == 0x7FFFFFFFFFFFFFFFLL)
          {

LABEL_10:
            objc_msgSend(v14, "view");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAlpha:", 0.0);

            goto LABEL_11;
          }
          v18 = objc_msgSend(v39, "indexOfObjectIdenticalTo:", v14);

          if (v18 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_10;
        }
LABEL_11:
        ++v13;
      }
      while (v11 != v13);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      v11 = v19;
    }
    while (v19);
  }

  objc_msgSend(v9, "removeObjectsInArray:", obj);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v41 = v8;
  v20 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v52 != v22)
          objc_enumerationMutation(v41);
        v24 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v24, "view");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "superview");
        v26 = objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = (void *)v26;
          objc_msgSend(v24, "view");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "superview");
          v29 = (UIToolbar *)objc_claimAutoreleasedReturnValue();
          toolbar = v43->super._toolbar;

          if (v29 != toolbar)
            objc_msgSend(v40, "addObject:", v24);
        }
        else
        {

        }
      }
      v21 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v21);
  }

  objc_msgSend(v9, "removeObjectsInArray:", v40);
  v31 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __74___UIToolbarVisualProviderLegacyIOS_updateWithItems_fromOldItems_animate___block_invoke;
  aBlock[3] = &unk_1E16B47A8;
  v32 = v9;
  v48 = v32;
  v49 = v43;
  v33 = obj;
  v50 = v33;
  v34 = (void (**)(_QWORD))_Block_copy(aBlock);
  v44[0] = v31;
  v44[1] = 3221225472;
  v44[2] = __74___UIToolbarVisualProviderLegacyIOS_updateWithItems_fromOldItems_animate___block_invoke_2;
  v44[3] = &unk_1E16B2218;
  v35 = v32;
  v45 = v35;
  v36 = v33;
  v46 = v36;
  v37 = (void (**)(void *, uint64_t))_Block_copy(v44);
  if (v38)
  {
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v34, v37, 0.2);
  }
  else
  {
    v34[2](v34);
    v37[2](v37, 1);
  }

}

- (void)customViewChangedForButtonItem:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  UIToolbar *v9;
  UIToolbar *toolbar;
  unint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "customView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIToolbar items](self->super._toolbar, "items");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "indexOfObject:", v12);

    -[UIView subviews](self->super._toolbar, "subviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    if (v6 >= v8)
    {
      -[UIView addSubview:](self->super._toolbar, "addSubview:", v4);
    }
    else
    {
      -[UIView superview](self->_backgroundView, "superview");
      v9 = (UIToolbar *)objc_claimAutoreleasedReturnValue();
      toolbar = self->super._toolbar;

      if (v9 == toolbar)
        v11 = v6 + 1;
      else
        v11 = v6;
      -[UIView insertSubview:atIndex:](self->super._toolbar, "insertSubview:atIndex:", v4, v11);
    }
  }

}

- (void)setCustomBackgroundView:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_customBackgroundView, a3);
  v5 = a3;
  -[_UIBarBackground setCustomBackgroundView:](self->_backgroundView, "setCustomBackgroundView:", v5);

}

- (id)currentBackgroundView
{
  _UIBarBackground *customBackgroundView;

  customBackgroundView = (_UIBarBackground *)self->_customBackgroundView;
  if (!customBackgroundView)
    customBackgroundView = self->_backgroundView;
  return customBackgroundView;
}

- (CGRect)backgroundFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIView frame](self->_backgroundView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)updateBarBackgroundSize
{
  -[UIView bounds](self->super._toolbar, "bounds");
  -[UIView setBounds:](self->_backgroundView, "setBounds:");
}

- (void)updateBarForStyle:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[UIToolbar barTintColor](self->super._toolbar, "barTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[UIDevice currentDevice](UIDevice, "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[UIToolbar items](self->super._toolbar, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (v7 == 1
            || (objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "image"),
                (v14 = objc_claimAutoreleasedReturnValue()) != 0)
            && (v15 = (void *)v14, v16 = objc_msgSend(v13, "_imageHasEffects"), v15, (v16 & 1) == 0))
          {
            objc_msgSend(v13, "_updateView");
          }
          objc_msgSend(v13, "view");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "setBarStyle:", a3);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v5 = 0;
  }

}

- (void)updateBarBackground
{
  _BOOL4 v3;
  _UIBarBackground *backgroundView;
  _UIBarBackground *v5;
  _UIBarBackground *v6;
  _UIBarBackground *v7;
  _UIBarBackgroundLayoutLegacy *v8;
  _UIBarBackgroundLayoutLegacy *backgroundViewLayout;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int64_t v18;
  BOOL v19;
  unint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  UIBarStyle v29;
  _BOOL4 v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int v36;
  void *v37;
  BOOL v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  _UIBarBackgroundLayoutLegacy *v43;
  void *v44;
  double v45;
  _UIBarBackgroundLayoutLegacy *v46;
  void *v47;
  void *v48;
  _UIBarBackgroundLayoutLegacy *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  int v58;
  void *v59;
  _BOOL4 v60;
  char v61;
  CGRect v62;
  CGRect v63;

  v3 = -[UIView _canDrawContent](self->super._toolbar, "_canDrawContent");
  backgroundView = self->_backgroundView;
  if (v3)
  {
    -[UIView removeFromSuperview](self->_backgroundView, "removeFromSuperview");
    return;
  }
  if (!backgroundView)
  {
    v5 = [_UIBarBackground alloc];
    -[UIView bounds](self->super._toolbar, "bounds");
    v6 = -[_UIBarBackground initWithFrame:](v5, "initWithFrame:");
    v7 = self->_backgroundView;
    self->_backgroundView = v6;

    v8 = objc_alloc_init(_UIBarBackgroundLayoutLegacy);
    backgroundViewLayout = self->_backgroundViewLayout;
    self->_backgroundViewLayout = v8;

    -[_UIBarBackground setLayout:](self->_backgroundView, "setLayout:", self->_backgroundViewLayout);
    backgroundView = self->_backgroundView;
  }
  -[UIView insertSubview:atIndex:](self->super._toolbar, "insertSubview:atIndex:", backgroundView, 0);
  -[_UIBarBackground setCustomBackgroundView:](self->_backgroundView, "setCustomBackgroundView:", self->_customBackgroundView);
  -[_UIBarBackgroundLayout setDisableTinting:](self->_backgroundViewLayout, "setDisableTinting:", -[UIToolbar _disableBlurTinting](self->super._toolbar, "_disableBlurTinting"));
  -[UIView bounds](self->super._toolbar, "bounds");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = -[UIToolbar barPosition](self->super._toolbar, "barPosition");
  v19 = v18 == 3;
  v20 = v18 & 0xFFFFFFFFFFFFFFFELL;
  -[_UIBarBackground setTopAligned:](self->_backgroundView, "setTopAligned:", (v18 & 0xFFFFFFFFFFFFFFFELL) == 2);
  if (!self->_customBackgroundView)
  {
    -[UIView traitCollection](self->super._toolbar, "traitCollection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackgroundLayout setInterfaceIdiom:](self->_backgroundViewLayout, "setInterfaceIdiom:", objc_msgSend(v25, "userInterfaceIdiom"));

    -[UIView traitCollection](self->super._toolbar, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIBarBackgroundLayout setInterfaceStyle:](self->_backgroundViewLayout, "setInterfaceStyle:", objc_msgSend(v26, "userInterfaceStyle"));

    v27 = -[UIToolbar isTranslucent](self->super._toolbar, "isTranslucent");
    -[UIToolbar barTintColor](self->super._toolbar, "barTintColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = -[UIToolbar barStyle](self->super._toolbar, "barStyle");
    if (v29 == 4)
    {
      v30 = -[UIToolbar _hidesShadow](self->super._toolbar, "_hidesShadow");
LABEL_18:
      -[UIView _screen](self->super._toolbar, "_screen");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "_userInterfaceIdiom");

      if (v41 == 3)
      {
        -[_UIBarBackgroundLayoutLegacy configureAsTransparent](self->_backgroundViewLayout, "configureAsTransparent");
        v19 = 0;
      }
      else
      {
        if (-[UIToolbar _linkedBeforeWhitetailAndInitializedFromCoder](self->super._toolbar, "_linkedBeforeWhitetailAndInitializedFromCoder")&& !v28&& (-[UIView backgroundColor](self->super._toolbar, "backgroundColor"), v42 = (void *)objc_claimAutoreleasedReturnValue(), v42, v42))
        {
          -[_UIBarBackgroundLayoutLegacy configureAsTransparent](self->_backgroundViewLayout, "configureAsTransparent");
        }
        else
        {
          -[_UIBarBackgroundLayoutLegacy configureEffectForStyle:backgroundTintColor:forceOpaque:](self->_backgroundViewLayout, "configureEffectForStyle:backgroundTintColor:forceOpaque:", v29, v28, !v27);
        }
        -[_UIToolbarVisualProviderLegacyIOS updateBackgroundGroupName](self, "updateBackgroundGroupName");
      }
      v43 = self->_backgroundViewLayout;
      if (v30)
        -[_UIBarBackgroundLayoutLegacy configureWithoutShadow](v43, "configureWithoutShadow");
      else
        -[_UIBarBackgroundLayoutLegacy configureShadowForBarStyle:](v43, "configureShadowForBarStyle:", v29);
      v31 = 0;
      v44 = 0;
      v45 = 0.0;
LABEL_45:
      -[_UIBarBackgroundLayoutLegacy setTopInset:](self->_backgroundViewLayout, "setTopInset:", v45);

      if (v19)
        goto LABEL_7;
LABEL_46:
      -[_UIBarBackgroundLayoutLegacy topInset](self->_backgroundViewLayout, "topInset");
      v24 = v53;
      goto LABEL_47;
    }
    -[_UIToolbarVisualProviderLegacyIOS _currentCustomBackground](self, "_currentCustomBackground");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = -[UIToolbar _hidesShadow](self->super._toolbar, "_hidesShadow");
    if (!v31)
    {
      v30 = v60;
      goto LABEL_18;
    }
    v59 = v28;
    objc_msgSend(v31, "size");
    v33 = v32;
    objc_msgSend(v31, "capInsets");
    v36 = 0;
    if (v18 == 3 && v34 == 0.0 && v35 == 0.0)
    {
      -[UIView window](self->super._toolbar, "window");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      __UIStatusBarManagerForWindow(v37);
      v38 = v19;
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = objc_msgSend(v39, "isStatusBarHidden");

      v19 = v38;
      v36 = (v33 == v17) & ~v58;
    }
    v61 = 0;
    objc_msgSend(v31, "_isInvisibleAndGetIsTranslucent:", &v61);
    if (v27)
    {
      -[_UIBarBackgroundLayoutLegacy configureImage:forceTranslucent:](self->_backgroundViewLayout, "configureImage:forceTranslucent:", v31, v61 == 0);
    }
    else
    {
      v46 = self->_backgroundViewLayout;
      if (v59)
        -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:backgroundTintColor:](v46, "configureImage:forceOpaque:backgroundTintColor:", v31, v61 != 0);
      else
        -[_UIBarBackgroundLayoutLegacy configureImage:forceOpaque:barStyle:](v46, "configureImage:forceOpaque:barStyle:", v31, v61 != 0, v29);
    }
    if (v60)
    {
      -[_UIBarBackgroundLayoutLegacy configureWithoutShadow](self->_backgroundViewLayout, "configureWithoutShadow");
      v44 = 0;
    }
    else
    {
      -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47;
      if (v20 == 2)
        objc_msgSend(v47, "topShadowImage");
      else
        objc_msgSend(v47, "shadowImage");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      v49 = self->_backgroundViewLayout;
      if (v44)
      {
        -[_UIBarBackgroundLayoutLegacy configureShadowImage:](v49, "configureShadowImage:", v44);
        v45 = 0.0;
        if (!v36)
          goto LABEL_44;
        goto LABEL_43;
      }
      -[_UIBarBackgroundLayoutLegacy configureShadowForBarStyle:](v49, "configureShadowForBarStyle:", v29);
    }
    v45 = 0.0;
    if ((v36 & 1) == 0)
    {
LABEL_44:
      v28 = v59;
      goto LABEL_45;
    }
LABEL_43:
    -[UIView window](self->super._toolbar, "window");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    __UIStatusBarManagerForWindow(v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "defaultStatusBarHeightInOrientation:", 1);
    v45 = v52;

    goto LABEL_44;
  }
  -[_UIBarBackgroundLayoutLegacy configureWithoutShadow](self->_backgroundViewLayout, "configureWithoutShadow");
  -[_UIBarBackgroundLayoutLegacy setTopInset:](self->_backgroundViewLayout, "setTopInset:", 0.0);
  if (v18 != 3)
    goto LABEL_46;
LABEL_7:
  -[UIView window](self->super._toolbar, "window");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __UIStatusBarManagerForWindow(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "statusBarHeight");
  v24 = v23;

LABEL_47:
  -[UIView frame](self->_backgroundView, "frame");
  v63.origin.x = v54;
  v63.origin.y = v55;
  v63.size.width = v56;
  v63.size.height = v57;
  v62.origin.x = v11;
  v62.origin.y = v13 - v24;
  v62.size.width = v15;
  v62.size.height = v17 + v24;
  if (!CGRectEqualToRect(v62, v63))
    -[UIView setFrame:](self->_backgroundView, "setFrame:", v11, v13 - v24, v15, v17 + v24);
  -[_UIBarBackground transitionBackgroundViews](self->_backgroundView, "transitionBackgroundViews");
}

- (void)updateBackgroundGroupName
{
  void *v3;
  void *v4;
  id v5;

  -[UIView traitCollection](self->super._toolbar, "traitCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForTrait:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIBarBackground setGroupName:](self->_backgroundView, "setGroupName:", v4);

}

- (id)_currentCustomBackground
{
  int64_t v3;
  void *v4;
  id v5;
  void *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = -[UIToolbar _barPosition](self->super._toolbar, "_barPosition");
  -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundImageForBarPosition:barMetrics:", v3, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == 3 && v5 == 0)
    v3 = 2;
  if (!v5)
  {
    if (v3 == -[UIToolbar _barPosition](self->super._toolbar, "_barPosition"))
    {
      v5 = 0;
    }
    else
    {
      -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "backgroundImageForBarPosition:barMetrics:", v3, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  v8 = -[UIToolbar isMinibar](self->super._toolbar, "isMinibar");
  if (v5)
    v9 = !v8;
  else
    v9 = 1;
  if (!v9)
  {
    -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundImageForBarPosition:barMetrics:", -[UIToolbar _barPosition](self->super._toolbar, "_barPosition"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = v5;
      v5 = v11;
    }
    else
    {
      if (v3 == -[UIToolbar _barPosition](self->super._toolbar, "_barPosition"))
      {
LABEL_19:

        return v5;
      }
      -[UIToolbar __appearanceStorage](self->super._toolbar, "__appearanceStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v12, "backgroundImageForBarPosition:barMetrics:", v3, 1);
    }

    goto LABEL_19;
  }
  return v5;
}

- (void)drawBackgroundViewInRect:(CGRect)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  int64_t v15;
  void *v16;
  UIBarStyle v17;
  int64_t v18;
  int64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  const __CFString *v25;
  const __CFString *v26;
  __CFString *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  id v41;

  -[UIView bounds](self->super._toolbar, "bounds", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIView superview](self->super._toolbar, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safeAreaInsets");
  v14 = v11 + v13;

  v15 = -[UIToolbar _barPosition](self->super._toolbar, "_barPosition");
  if (-[UIToolbar barStyle](self->super._toolbar, "barStyle") == (UIBarStyleBlackTranslucent|UIBarStyleBlackOpaque))
  {
    +[UIColor clearColor](UIColor, "clearColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "set");

    UIRectFillUsingOperation(1, v5, v7, v9, v14);
    return;
  }
  v17 = -[UIToolbar barStyle](self->super._toolbar, "barStyle");
  -[UIToolbar barTintColor](self->super._toolbar, "barTintColor");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v18 = -[UIToolbar _barTranslucence](self->super._toolbar, "_barTranslucence");
  v19 = v18;
  if (!v41)
  {
    v40 = v7;
    if (v17 == UIBarStyleBlackTranslucent)
      goto LABEL_12;
    if (v17 != UIBarStyleBlack)
    {
      if (v15 == 1 || v15 == 4)
      {
        v23 = v5;
        v24 = v9;
        v25 = CFSTR("UIButtonBarMiniDefaultBackground.png");
      }
      else
      {
        v23 = v5;
        v24 = v9;
        v25 = CFSTR("UIButtonBarMiniDefaultBackgroundTop.png");
      }
      v26 = CFSTR("UIButtonBarDefaultBackground.png");
      goto LABEL_23;
    }
    if (v18 == 1)
    {
LABEL_12:
      if (v15 == 1 || v15 == 4)
      {
        v23 = v5;
        v24 = v9;
        v25 = CFSTR("UIButtonBarMiniBlackTranslucentBackground.png");
        v26 = CFSTR("UIButtonBarBlackTranslucentBackground.png");
      }
      else
      {
        v23 = v5;
        v24 = v9;
        v25 = CFSTR("UIButtonBarMiniBlackTranslucentBackgroundTop.png");
        v26 = CFSTR("UIButtonBarBlackTranslucentBackgroundTop.png");
      }
    }
    else
    {
      v23 = v5;
      v24 = v9;
      if (v15 == 1 || v15 == 4)
      {
        v25 = CFSTR("UIButtonBarMiniBlackOpaqueBackground.png");
        v26 = CFSTR("UIButtonBarBlackOpaqueBackground.png");
      }
      else
      {
        v25 = CFSTR("UIButtonBarMiniBlackOpaqueBackgroundTop.png");
        v26 = CFSTR("UIButtonBarBlackOpaqueBackgroundTop.png");
      }
    }
LABEL_23:
    if (v14 <= 32.0)
      v27 = (__CFString *)v25;
    else
      v27 = (__CFString *)v26;
    _UIImageWithName(v27);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "size");
    v29 = v28;
    if (v14 <= v28)
      v30 = v14;
    else
      v30 = v28;
    v38 = v30;
    v31 = *MEMORY[0x1E0C9D538];
    v32 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v21, "size");
    v35 = v34;
    if (v19 == 1)
      v36 = 0.909803922;
    else
      v36 = 1.0;
    v37 = v38;
    v39 = v33;
    objc_msgSend(v21, "compositeToRect:fromRect:operation:fraction:", 1, v23, v40, v24, v37, v31, v32, *(_QWORD *)&v36);
    if (v14 > v29)
      objc_msgSend(v21, "compositeToRect:fromRect:operation:fraction:", 1, v23, v40 + v29, v24, v14 - v29, v31, v32 + v35 + -1.0, v39, 1.0, *(_QWORD *)&v36);
    goto LABEL_34;
  }
  GetTintedToolbarBackgroundImage((int)v14, v41);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 == 1)
    v22 = 0.909803922;
  else
    v22 = 1.0;
  objc_msgSend(v20, "drawInRect:blendMode:alpha:", 0, v5, v7, v9, v14, v22);
LABEL_34:

}

- (CGSize)defaultSizeForOrientation:(int64_t)a3
{
  unint64_t v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a3 - 3;
  v5 = _UIUseMiniHeightInLandscape((unint64_t)(a3 - 3) < 2);
  -[UIView _screen](self->super._toolbar, "_screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  if (v4 >= 2)
    v9 = v7;
  else
    v9 = v8;
  if (v5)
    v10 = 32.0;
  else
    v10 = 44.0;

  v11 = v9;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (double)_edgeMarginForBorderedItem:(BOOL)a3 isText:(BOOL)a4
{
  UIToolbar *toolbar;
  double result;

  toolbar = self->super._toolbar;
  if (a4)
    -[UIView _textButtonMargin](toolbar, "_textButtonMargin", a3);
  else
    -[UIView _imageButtonMargin](toolbar, "_imageButtonMargin", a3);
  return result;
}

- (BOOL)toolbarIsSmall
{
  int v3;
  double v4;

  v3 = _UIUseMiniHeightInLandscape(1u);
  if (v3)
  {
    -[UIView bounds](self->super._toolbar, "bounds");
    LOBYTE(v3) = v4 < 44.0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundView, 0);
  objc_storeStrong((id *)&self->_backgroundViewLayout, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end
