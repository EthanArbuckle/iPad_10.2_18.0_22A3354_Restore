@implementation SBDisplayItemLayoutAttributesCalculator

- (CGRect)_frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 isChamoisWindowingUIEnabled:(BOOL)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12 skipAutoLayout:(BOOL)a13
{
  _BOOL8 v13;
  _BOOL4 v14;
  double height;
  double width;
  double y;
  double x;
  id v25;
  id v26;
  double v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id *v36;
  uint64_t v37;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  _BOOL4 v67;
  _BOOL4 v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  CGFloat v73;
  double v74;
  double v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  void *v94;
  double v95;
  double v96;
  void *v97;
  void *v98;
  SBContinuousExposeAutoLayoutConfiguration *v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  double v105;
  void *v106;
  void *v107;
  double v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  double v113;
  void *v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  void *v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  unint64_t v133;
  unint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  double v138;
  double v139;
  void *v140;
  double v141;
  double v142;
  void *v143;
  double v144;
  double v145;
  _BOOL4 v146;
  BOOL v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  char v158;
  double v159;
  double v160;
  uint64_t v161;
  void *v162;
  void *v163;
  void *v164;
  unint64_t v165;
  uint64_t v166;
  void *v167;
  uint64_t v168;
  double v169;
  double v170;
  void *v171;
  uint64_t v172;
  void *v173;
  double v174;
  double v175;
  void *v176;
  double v177;
  double v178;
  double v179;
  double v180;
  void *v181;
  double v182;
  double v183;
  double v184;
  double v185;
  void *v186;
  double v187;
  double v188;
  CGRect v189;
  CGRect v190;
  CGRect result;

  v13 = a11;
  v14 = a10;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v25 = a4;
  v26 = a7;
  if (a12)
    v27 = 0.0;
  else
    v27 = a8;
  if (!v14 || a13)
  {
    v28 = v25;
  }
  else
  {
    LOBYTE(v168) = a12;
    -[SBDisplayItemLayoutAttributesCalculator _appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:](self, "_appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", v25, 0, 0, a6, v26, v13, v27, a9, x, y, width, height, v168, 0);
    v28 = (id)objc_claimAutoreleasedReturnValue();
  }
  v29 = v28;
  if (a3 != 4 && objc_msgSend(v28, "environment") != 3)
  {
    if (a3 == 3 || objc_msgSend(v29, "environment") == 2)
    {
      -[SBDisplayItemLayoutAttributesCalculator frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:bounds:](self, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:bounds:", a6, 2, x, y, width, height);
      goto LABEL_111;
    }
    v180 = *MEMORY[0x1E0C9D820];
    v177 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    UIRectGetCenter();
    if (!v14)
    {
      SBLayoutDefaultSideLayoutElementWidth();
      SBLayoutDefaultSideLayoutElementWidth();
      v36 = (id *)MEMORY[0x1E0CEB258];
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v37 = objc_msgSend(v29, "configuration");
      if (v37 != 3 || (unint64_t)(a6 - 1) >= 2)
        v39 = v37;
      else
        v39 = 4;
      v40 = objc_msgSend(*v36, "userInterfaceLayoutDirection") == 1;
      if (v40 && v39 == 2)
        v41 = 4;
      else
        v41 = v39;
      v148 = !v40 || v39 != 4;
      v42 = 2;
      if (v148)
        v42 = v41;
      switch(v42)
      {
        case 0:
        case 1:
          UIRectGetCenter();
          break;
        default:
          goto LABEL_110;
      }
      goto LABEL_110;
    }
    if (objc_msgSend(v26, "prefersDockHidden"))
    {
      UIRectGetCenter();
      v187 = v34;
      v174 = v35;
    }
    else
    {
      v187 = x + width * 0.5;
      v174 = (height - a8) * 0.5;
    }
    objc_msgSend(v29, "cachedLastAutoLayoutSpace");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "itemForLayoutRole:", a3);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v43;
    objc_msgSend(v43, "autoLayoutItemForDisplayItemIfExists:", v44);
    v176 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "layoutAttributesForItemInRole:", a3);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "itemForLayoutRole:", a3);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDisplayItemLayoutAttributesCalculator layoutRestrictionInfoForItem:](self, "layoutRestrictionInfoForItem:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v173 = v47;
    v172 = objc_msgSend(v47, "layoutRestrictions");
    if (a13)
    {
      objc_msgSend(v26, "defaultWindowSize");
      v49 = v48;
      v183 = v50;
      objc_msgSend(v26, "screenEdgePadding");
      objc_msgSend(v45, "sizeInBounds:defaultSize:screenEdgePadding:", x, y, width, height, v49, v183, v51);
      v53 = v52;
      v184 = v54;
      v55 = v45;
      v56 = v173;
    }
    else
    {
      v55 = v45;
      v57 = v177;
      v53 = v180;
      if (v176)
      {
        objc_msgSend(v176, "size");
        v53 = v58;
      }
      v184 = v57;
      v56 = v173;
      if ((BSFloatLessThanOrEqualToFloat() & 1) != 0 || BSFloatLessThanOrEqualToFloat())
      {
        objc_msgSend(v26, "defaultWindowSize");
        v60 = v59;
        v185 = v61;
        objc_msgSend(v26, "screenEdgePadding");
        objc_msgSend(v55, "sizeInBounds:defaultSize:screenEdgePadding:", x, y, width, height, v60, v185, v62);
        v53 = v63;
        v184 = v64;
      }
      if (v176)
      {
        v179 = v53;
        objc_msgSend(v176, "position");
        goto LABEL_42;
      }
    }
    v179 = v53;
    objc_msgSend(v55, "centerInBounds:", x, y, width, height);
LABEL_42:
    v67 = v65 == 0.0;
    v68 = v66 == 0.0;
    if (v67 && v68)
      v69 = v174;
    else
      v69 = v66;
    if (v67 && v68)
      v65 = v187;
    v175 = v65;
    if (objc_msgSend(v55, "sizingPolicy") == 1)
    {
      objc_msgSend(v29, "itemForLayoutRole:", a3);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDisplayItemLayoutAttributesCalculator layoutRestrictionInfoForItem:](self, "layoutRestrictionInfoForItem:", v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "screenEdgePadding");
      v73 = v72;
      v189.origin.x = x;
      v189.origin.y = y;
      v189.size.width = width;
      v189.size.height = height;
      v190 = CGRectInset(v189, v73, v73);
      v74 = CGRectGetHeight(v190);
      if (v184 <= v74)
        v75 = v184;
      else
        v75 = v74;
      -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](self, "_chamoisLayoutGridCache");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "allItems");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v77, "count"), objc_msgSend(v55, "contentOrientation"), v71, v26, v179, v75, x, y, width, height, a9);
      v79 = v78;
      v81 = v80;

      goto LABEL_81;
    }
    if (objc_msgSend(v26, "requiresFullScreen"))
    {
      if (objc_msgSend(v55, "sizingPolicy") == 2)
      {
        UIRectGetCenter();
        v184 = height;
        v179 = width;
      }
      else
      {
        objc_msgSend(v26, "defaultWindowSize");
        v179 = v86;
        v184 = v87;
      }
      goto LABEL_65;
    }
    if (v179 != v180 || v184 != v177)
    {
LABEL_65:
      -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](self, "_chamoisLayoutGridCache");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "minGridSizeForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v55, "contentOrientation"), v56, v26, x, y, width, height, a9);
      v178 = v95;
      v182 = v96;

      objc_msgSend(v29, "allItems");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v97, "count") > 1 || (BSFloatLessThanFloat() & 1) != 0)
      {

      }
      else
      {
        v158 = BSFloatLessThanFloat();

        v117 = width;
        v118 = height;
        if ((v158 & 1) == 0)
        {
LABEL_71:
          v119 = v179;
          if (v178 >= v179)
            v119 = v178;
          if (v117 <= v119)
            v79 = v117;
          else
            v79 = v119;
          v120 = v184;
          if (v182 >= v184)
            v120 = v182;
          if (v118 <= v120)
            v81 = v118;
          else
            v81 = v120;
LABEL_81:
          if (v172)
          {
            -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](self, "_chamoisLayoutGridCache");
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "allItems");
            v122 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v122, "count"), objc_msgSend(v55, "contentOrientation"), v56, v26, v79, v81, x, y, width, height, a9);
            v124 = v123;
            v126 = v125;

            objc_msgSend(v29, "allItems");
            v127 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v127, "count") < 2)
            {
              v128 = v176;
              v129 = v171;
            }
            else
            {

              if (v124 < width && v126 < height)
              {
                v128 = v176;
LABEL_87:
                v129 = v171;
LABEL_109:

LABEL_110:
                SBRectWithSize();
                UIRectCenteredAboutPointScale();
                goto LABEL_111;
              }
              -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](self, "_chamoisLayoutGridCache");
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v130, "allGridWidthsForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v55, "contentOrientation"), v56, v26, x, y, width, height, a9);
              v127 = (void *)objc_claimAutoreleasedReturnValue();

              -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](self, "_chamoisLayoutGridCache");
              v131 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v131, "allGridHeightsForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v55, "contentOrientation"), v56, v26, x, y, width, height, a9);
              v132 = (void *)objc_claimAutoreleasedReturnValue();

              v133 = objc_msgSend(v127, "count");
              v134 = objc_msgSend(v132, "count");
              if (v133 >= v134)
                v135 = v134;
              else
                v135 = v133;
              if (v135 >= 2)
              {
                v136 = 0;
                v137 = v135 - 1;
                v138 = 1.79769313e308;
                v139 = v124 / v126;
                do
                {
                  objc_msgSend(v127, "objectAtIndex:", v136);
                  v140 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v140, "doubleValue");
                  v142 = v141;

                  objc_msgSend(v132, "objectAtIndex:", v136);
                  v143 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v143, "doubleValue");
                  v145 = v144;

                  v146 = v142 / v145 < 1.0 && v139 < 1.0;
                  v148 = (v142 / v145 < 1.0 || v139 < 1.0) && !v146;
                  if (!v148)
                  {
                    v149 = vabdd_f64(v142, v124) + vabdd_f64(v145, v126);
                    if (v149 < v138)
                    {
                      v124 = v142;
                      v126 = v145;
                      v138 = v149;
                    }
                  }
                  ++v136;
                }
                while (v137 != v136);
              }

              v129 = v171;
              v128 = v176;
              v56 = v173;
            }

            goto LABEL_109;
          }
          v128 = v176;
          goto LABEL_87;
        }
      }
      -[SBDisplayItemLayoutAttributesCalculator _autoLayoutController](self, "_autoLayoutController");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = -[SBContinuousExposeAutoLayoutConfiguration initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:]([SBContinuousExposeAutoLayoutConfiguration alloc], "initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:", v26, x, y, width, height, a9, a8);
      objc_msgSend(v98, "validTopStageAreaInsetsWithConfiguration:", v99);
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "lastObject");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "doubleValue");
      v170 = v102;

      objc_msgSend(v98, "validBottomStageAreaInsetsWithConfiguration:", v99);
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v103, "lastObject");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v104, "doubleValue");
      v169 = v105;

      objc_msgSend(v98, "validLeadingStageAreaInsetsWithConfiguration:", v99);
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "lastObject");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v107, "doubleValue");
      v109 = v108;

      objc_msgSend(v98, "validTrailingStageAreaInsetsWithConfiguration:", v99);
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "lastObject");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "doubleValue");
      v113 = v112;

      objc_msgSend(v29, "allItems");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v115 = 0.0;
      if ((unint64_t)objc_msgSend(v114, "count") >= 2)
      {
        objc_msgSend(v26, "stageOcclusionDodgingPeekLength");
        v115 = v116;
      }

      v117 = width - (v109 + v113 + v115);
      v118 = height - (v170 + v169);

      goto LABEL_71;
    }
    objc_msgSend(v29, "itemForLayoutRole:", a3, v177, v184);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDisplayItemLayoutAttributesCalculator _deviceApplicationSceneHandleForDisplayItem:](self, "_deviceApplicationSceneHandleForDisplayItem:", v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v181 = v83;
    if (!v83 || !objc_msgSend(v83, "supportsCenterWindow") || objc_msgSend(v55, "sizingPolicy"))
    {
      if (objc_msgSend(v55, "sizingPolicy") == 2)
      {
        UIRectGetCenter();
        v84 = height;
        v85 = width;
      }
      else
      {
        objc_msgSend(v26, "defaultWindowSize");
        v85 = v88;
        v84 = v89;
      }
      goto LABEL_64;
    }
    v188 = v69;
    objc_msgSend(v26, "screenEdgePadding");
    SBRectWithSize();
    -[SBDisplayItemLayoutAttributesCalculator frameForCenterItemWithConfiguration:interfaceOrientation:bounds:](self, "frameForCenterItemWithConfiguration:interfaceOrientation:bounds:", 1, a6);
    v85 = v159;
    v84 = v160;
    if (v175 != *MEMORY[0x1E0C9D538] || v188 != *(double *)(MEMORY[0x1E0C9D538] + 8))
      goto LABEL_64;
    objc_msgSend(v29, "zOrderedItems");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v186, "firstObject");
    v161 = objc_claimAutoreleasedReturnValue();
    if (v161)
    {
      v162 = (void *)v161;
      objc_msgSend(v29, "itemForLayoutRole:", a3);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v163, "isEqual:", v162) & 1) != 0)
      {
        v164 = v186;
        v165 = objc_msgSend(v186, "count");

        if (v165 >= 2)
        {
          objc_msgSend(v186, "objectAtIndex:", 1);
          v166 = objc_claimAutoreleasedReturnValue();

          v162 = (void *)v166;
          if (!v166)
            goto LABEL_124;
        }
      }
      else
      {

        v164 = v186;
      }
      objc_msgSend(v29, "layoutAttributesForItem:", v162);
      v167 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v167, "centerInBounds:", x, y, width, height);

    }
    else
    {
      v164 = v186;
    }
LABEL_124:

LABEL_64:
    -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](self, "_chamoisLayoutGridCache");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allItems");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v91, "count"), objc_msgSend(v55, "contentOrientation"), v56, v26, v85, v84, x, y, width, height, a9);
    v179 = v92;
    v184 = v93;

    goto LABEL_65;
  }
  -[SBDisplayItemLayoutAttributesCalculator frameForCenterItemWithConfiguration:interfaceOrientation:bounds:](self, "frameForCenterItemWithConfiguration:interfaceOrientation:bounds:", SBMainDisplayLayoutStateCenterConfigurationFromAppLayoutCenterConfiguration(objc_msgSend(v29, "centerConfiguration")), a6, x, y, width, height);
LABEL_111:
  v150 = v30;
  v151 = v31;
  v152 = v32;
  v153 = v33;

  v154 = v150;
  v155 = v151;
  v156 = v152;
  v157 = v153;
  result.size.height = v157;
  result.size.width = v156;
  result.origin.y = v155;
  result.origin.x = v154;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 containerBounds:(CGRect)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 isChamoisWindowingUIEnabled:(BOOL)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12
{
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CGRect result;

  LOWORD(v16) = a12;
  -[SBDisplayItemLayoutAttributesCalculator _frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:](self, "_frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:", a3, a4, a6, a7, a10, a11, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a8, a9, v16);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 containerOrientation:(int64_t)a5 windowScene:(id)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  uint64_t v50;
  int64_t v51;
  void *v52;
  CGRect result;

  v10 = a4;
  v11 = a6;
  -[SBDisplayItemLayoutAttributesCalculator _containerBoundsForWindowScene:containerOrientation:](self, "_containerBoundsForWindowScene:containerOrientation:", v11, a5);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v51 = a3;
  v52 = v10;
  if (SBLayoutRoleIsValidForSplitView(a3))
    v20 = -[SBDisplayItemLayoutAttributesCalculator _appLayoutContainsOnlyResizableApps:](self, "_appLayoutContainsOnlyResizableApps:", v10) ^ 1;
  else
    v20 = 0;
  -[SBDisplayItemLayoutAttributesCalculator _chamoisSettingsCache](self, "_chamoisSettingsCache");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatingDockController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatingDockHeightForFrame:", v13, v15, v17, v19);
  v24 = v23;

  objc_msgSend(v21, "layoutAttributesForWindowScene:interfaceOrientation:requiresFullScreen:floatingDockHeight:", v11, a5, v20, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "switcherController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_opt_class();
  v29 = v27;
  if (v28)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;
  }
  else
  {
    v30 = 0;
  }
  v31 = v30;

  objc_msgSend(v11, "screen");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "scale");
  v34 = v33;

  v35 = objc_msgSend(v26, "isChamoisWindowingUIEnabled");
  v36 = objc_msgSend(v31, "prefersStripHidden");
  v37 = objc_msgSend(v31, "prefersDockHidden");

  LOBYTE(v50) = v37;
  -[SBDisplayItemLayoutAttributesCalculator frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:](self, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", v51, v52, a5, v25, v35, v36, v13, v15, v17, v19, v24, v34, v50);
  v39 = v38;
  v41 = v40;
  v43 = v42;
  v45 = v44;

  v46 = v39;
  v47 = v41;
  v48 = v43;
  v49 = v45;
  result.size.height = v49;
  result.size.width = v48;
  result.origin.y = v47;
  result.origin.x = v46;
  return result;
}

- (CGRect)_containerBoundsForWindowScene:(id)a3 containerOrientation:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  v5 = a3;
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;

  v12 = *MEMORY[0x1E0C9D648];
  v13 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  objc_msgSend(v5, "traitsPipelineManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "supportsLiveDeviceRotation"))
  {

    if ((unint64_t)(a4 - 3) <= 1)
    {
      BSSizeSwap();
      v9 = v15;
      v11 = v16;
    }
  }
  else
  {

  }
  v17 = v12;
  v18 = v13;
  v19 = v9;
  v20 = v11;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)_chamoisSettingsCache
{
  SBSwitcherChamoisSettings *chamoisSettingsCache;
  void *v4;
  SBSwitcherChamoisSettings *v5;
  SBSwitcherChamoisSettings *v6;

  chamoisSettingsCache = self->_chamoisSettingsCache;
  if (!chamoisSettingsCache)
  {
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "chamoisSettings");
    v5 = (SBSwitcherChamoisSettings *)objc_claimAutoreleasedReturnValue();
    v6 = self->_chamoisSettingsCache;
    self->_chamoisSettingsCache = v5;

    chamoisSettingsCache = self->_chamoisSettingsCache;
  }
  return chamoisSettingsCache;
}

- (BOOL)_appLayoutContainsOnlyResizableApps:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_appLayoutContainsOnlyResizableApps:", v3);

  return v5;
}

- (int64_t)sizingPolicyForDisplayItem:(id)a3 contentOrientation:(int64_t)a4 containerOrientation:(int64_t)a5 proposedSizingPolicy:(int64_t)a6 windowScene:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v12 = a7;
  -[SBDisplayItemLayoutAttributesCalculator _applicationForDisplayItem:](self, "_applicationForDisplayItem:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "switcherController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "windowManagementStyle");
    objc_msgSend(v14, "displayIdentity");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (((1 << a6) & (unint64_t)~objc_msgSend(v13, "supportedSizingPoliciesForSwitcherWindowManagementStyle:displayIdentity:contentOrientation:containerOrientation:", v15, v16, a4, a5)) != 0)a6 = objc_msgSend(v13, "preferredSizingPolicyForSwitcherWindowManagementStyle:displayIdentity:contentOrientation:containerOrientation:", v15, v16, a4, a5);

  }
  return a6;
}

- (id)_applicationForDisplayItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "applicationForDisplayItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4 windowScene:(id)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  objc_msgSend(a5, "_fbsDisplayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  _UIWindowConvertRectFromOrientationToOrientation();
  -[SBDisplayItemLayoutAttributesCalculator frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:bounds:](self, "frameForFloatingAppLayoutInInterfaceOrientation:floatingConfiguration:bounds:", a3, a4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)frameForFloatingAppLayoutInInterfaceOrientation:(int64_t)a3 floatingConfiguration:(int64_t)a4 bounds:(CGRect)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  SBLayoutDefaultSideLayoutElementWidth();
  v11 = v10;
  if (frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds__onceToken != -1)
    dispatch_once(&frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds__onceToken, &__block_literal_global_123);
  switch(a4)
  {
    case 0:
    case 4:
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      {
        v12 = -v11;
      }
      else
      {
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v12 = CGRectGetWidth(v24);
      }
      break;
    case 1:
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1)
        goto LABEL_10;
      goto LABEL_8;
    case 2:
      if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1)
      {
LABEL_10:
        v12 = *(double *)&frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin;
      }
      else
      {
LABEL_8:
        v23.origin.x = x;
        v23.origin.y = y;
        v23.size.width = width;
        v23.size.height = height;
        v12 = CGRectGetWidth(v23)
            - (v11
             + *(double *)&frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin);
      }
      break;
    case 3:
      v13 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
      v14 = x;
      v15 = y;
      v16 = width;
      v17 = height;
      if (v13 == 1)
        v12 = v11 + CGRectGetMaxX(*(CGRect *)&v14);
      else
        v12 = CGRectGetMinX(*(CGRect *)&v14) - v11;
      break;
    default:
      v12 = 0.0;
      break;
  }
  v18 = frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v19 = CGRectGetHeight(v25)
      + *(double *)&frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin * -2.0;
  v20 = v12;
  v21 = *(double *)&v18;
  v22 = v11;
  result.size.height = v19;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

uint64_t __120__SBDisplayItemLayoutAttributesCalculator_frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds___block_invoke()
{
  uint64_t result;
  uint64_t v1;

  result = objc_msgSend(MEMORY[0x1E0CEA9E8], "heightForStyle:orientation:", 0, 1);
  frameForFloatingAppLayoutInInterfaceOrientation_floatingConfiguration_bounds____viewMargin = v1;
  return result;
}

- (CGRect)frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4 windowScene:(id)a5
{
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  objc_msgSend(a5, "_fbsDisplayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  _UIWindowConvertRectFromOrientationToOrientation();
  -[SBDisplayItemLayoutAttributesCalculator frameForCenterItemWithConfiguration:interfaceOrientation:bounds:](self, "frameForCenterItemWithConfiguration:interfaceOrientation:bounds:", a3, a4);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CGRect)frameForCenterItemWithConfiguration:(int64_t)a3 interfaceOrientation:(int64_t)a4 bounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  double v12;
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
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  -[SBDisplayItemLayoutAttributesCalculator _centerWindowSheetMetricsCache](self, "_centerWindowSheetMetricsCache");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "pageSheetFrameForBounds:interfaceOrientation:configuration:", a4, a3 == 2, x, y, width, height);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (id)autoLayoutSpaceForAppLayout:(id)a3 containerOrientation:(int64_t)a4 chamoisLayoutAttributes:(id)a5 floatingDockHeight:(double)a6 screenScale:(double)a7 bounds:(CGRect)a8 prefersStripHidden:(BOOL)a9 prefersDockHidden:(BOOL)a10
{
  void *v10;
  void *v11;
  uint64_t v13;

  LOBYTE(v13) = a10;
  -[SBDisplayItemLayoutAttributesCalculator _appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:](self, "_appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", a3, 0, 0, a4, a5, a9, a6, a7, a8.origin.x, a8.origin.y, a8.size.width, a8.size.height, v13, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cachedLastAutoLayoutSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)appLayoutByPerformingAutoLayoutForAppLayout:(id)a3 previousAppLayout:(id)a4 options:(unint64_t)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 bounds:(CGRect)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12 source:(int64_t)a13
{
  return -[SBDisplayItemLayoutAttributesCalculator _appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:](self, "_appLayoutByPerformingAutoLayoutIfNeededInAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", a3, a4, a5, a6, a7, a11, a8, a9, a10.origin.x, a10.origin.y, a10.size.width, a10.size.height);
}

- (id)appLayoutByPerformingAutoLayoutForAppLayout:(id)a3 previousAppLayout:(id)a4 options:(unint64_t)a5 containerOrientation:(int64_t)a6 windowScene:(id)a7 source:(int64_t)a8
{
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  double v35;
  double v36;
  uint64_t v37;
  char v38;
  void *v39;
  uint64_t v41;
  id v43;

  v12 = a7;
  v43 = a4;
  v13 = a3;
  v14 = -[SBDisplayItemLayoutAttributesCalculator _appLayoutContainsOnlyResizableApps:](self, "_appLayoutContainsOnlyResizableApps:", v13) ^ 1;
  -[SBDisplayItemLayoutAttributesCalculator _containerBoundsForWindowScene:containerOrientation:](self, "_containerBoundsForWindowScene:containerOrientation:", v12, a6);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[SBDisplayItemLayoutAttributesCalculator _chamoisSettingsCache](self, "_chamoisSettingsCache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatingDockController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "floatingDockHeightForFrame:", v16, v18, v20, v22);
  v26 = v25;

  objc_msgSend(v23, "layoutAttributesForWindowScene:interfaceOrientation:requiresFullScreen:floatingDockHeight:", v12, a6, v14, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "switcherController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "contentViewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_opt_class();
  v31 = v29;
  if (v30)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v31;
    else
      v32 = 0;
  }
  else
  {
    v32 = 0;
  }
  v33 = v32;

  objc_msgSend(v12, "screen");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "scale");
  v36 = v35;

  v37 = objc_msgSend(v33, "prefersStripHidden");
  v38 = objc_msgSend(v33, "prefersDockHidden");

  LOBYTE(v41) = v38;
  -[SBDisplayItemLayoutAttributesCalculator appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:](self, "appLayoutByPerformingAutoLayoutForAppLayout:previousAppLayout:options:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:source:", v13, v43, a5, a6, v27, v37, v26, v36, v16, v18, v20, v22, v41, a8);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (id)layoutRestrictionInfoForItem:(id)a3
{
  void *v3;
  int v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;

  -[SBDisplayItemLayoutAttributesCalculator _applicationForDisplayItem:](self, "_applicationForDisplayItem:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsChamoisSceneResizing");
  if (!v3 || v4)
  {
    v7 = 0;
    v5 = -1.0;
    v6 = -1.0;
  }
  else if (objc_msgSend(v3, "alwaysMaximizedInChamois"))
  {
    v5 = -1.0;
    v6 = -1.0;
    v7 = 12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultLaunchingSizeForDisplayConfiguration:", v9);
    v5 = v10;
    v6 = v11;

    v7 = 10;
  }
  +[SBDisplayItemGridLayoutRestrictionInfo layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:](SBDisplayItemGridLayoutRestrictionInfo, "layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:", v7, v5, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_appLayoutByPerformingAutoLayoutIfNeededInAppLayout:(id)a3 previousAppLayout:(id)a4 options:(unint64_t)a5 containerOrientation:(int64_t)a6 chamoisLayoutAttributes:(id)a7 floatingDockHeight:(double)a8 screenScale:(double)a9 bounds:(CGRect)a10 prefersStripHidden:(BOOL)a11 prefersDockHidden:(BOOL)a12 source:(int64_t)a13
{
  _BOOL8 v13;
  double height;
  double width;
  double y;
  double x;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  uint64_t v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  unint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  double v64;
  double v65;
  SBDisplayItemLayoutAttributesCalculator *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  double v71;
  double v72;
  void *v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  double v100;
  double v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  uint64_t v111;
  id v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t i;
  uint64_t v119;
  double v120;
  double v121;
  double v122;
  double v123;
  void *v124;
  SBMutableContinuousExposeAutoLayoutItem *v125;
  SBContinuousExposeAutoLayoutSpace *v126;
  SBContinuousExposeAutoLayoutConfiguration *v127;
  SBDisplayItemLayoutAttributesCalculator *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  id v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t j;
  void *v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  uint64_t v149;
  void *v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  void *v159;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  _BOOL4 IsUnspecified;
  _BOOL4 v166;
  void *v167;
  _BOOL4 IsEmpty;
  int v169;
  uint64_t v170;
  void *v172;
  uint64_t v173;
  SEL v174;
  void *v175;
  SBContinuousExposeAutoLayoutConfiguration *v176;
  void *v177;
  void *v178;
  void *v180;
  double v181;
  id v182;
  void *v183;
  id v184;
  id v185;
  id obj;
  id obja;
  double v188;
  uint64_t v189;
  double v190;
  id v191;
  _BOOL4 v192;
  double v193;
  void *v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  int64_t v201;
  SBDisplayItemLayoutAttributesCalculator *v202;
  double v203;
  uint64_t v204;
  double v205;
  double v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  _QWORD v216[4];
  id v217;
  _QWORD v218[4];
  id v219;
  _BYTE v220[56];
  _OWORD v221[3];
  uint64_t v222;
  _OWORD v223[3];
  uint64_t v224;
  __int128 v225;
  CGRect rect;
  uint64_t v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  _QWORD v232[4];
  id v233;
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  uint64_t v237;

  v13 = a11;
  height = a10.size.height;
  width = a10.size.width;
  y = a10.origin.y;
  x = a10.origin.x;
  v237 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v25 = a4;
  v26 = a7;
  objc_msgSend(v24, "cachedLastOverlappingModelKey");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = a6;
  v193 = a8;
  v192 = v13;
  +[SBAppLayoutAutoLayoutSpaceCacheKey cacheKeyForSnapshotOfAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:](SBAppLayoutAutoLayoutSpaceCacheKey, "cacheKeyForSnapshotOfAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:", v24, v26, a6, v13, a12, x, y, width, height, a8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27 && objc_msgSend(v27, "isEqual:", v28))
  {
    v24 = v24;
    v29 = v24;
    goto LABEL_105;
  }
  v177 = v28;
  v178 = v27;
  v174 = a2;
  v202 = self;
  if ((unint64_t)a13 > 0x37 || ((1 << a13) & 0x80000800002000) == 0 || v25 == 0)
    goto LABEL_18;
  objc_msgSend(v24, "allItems");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");
  objc_msgSend(v25, "allItems");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count") + 1;

  if (v33 != v35)
    goto LABEL_18;
  objc_msgSend(v24, "allItems");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v232[0] = MEMORY[0x1E0C809B0];
  v232[1] = 3221225472;
  v232[2] = __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke;
  v232[3] = &unk_1E8E9DF50;
  v233 = v25;
  objc_msgSend(v36, "bs_firstObjectPassingTest:", v232);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v37)
    goto LABEL_17;
  -[SBDisplayItemLayoutAttributesCalculator _deviceApplicationSceneHandleForDisplayItem:](v202, "_deviceApplicationSceneHandleForDisplayItem:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {

LABEL_17:
    goto LABEL_18;
  }
  v39 = v38;
  v40 = objc_msgSend(v38, "supportsCenterWindow");

  if (v40)
  {
    -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](v202, "_chamoisLayoutGridCache");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBDisplayItemGridLayoutRestrictionInfo layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:](SBDisplayItemGridLayoutRestrictionInfo, "layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:", 0, -1.0, -1.0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "maxGridSizeForBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", v201, v42, v26, x, y, width, height, a9);
    v44 = v43;
    v190 = v45;

    objc_msgSend(v26, "stageOcclusionDodgingPeekLength");
    v188 = v44 - v46;
    goto LABEL_19;
  }
LABEL_18:
  -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](v202, "_chamoisLayoutGridCache");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "maximumWindowWidthForOverlapping");
  v49 = v48;
  objc_msgSend(v24, "allItems");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "count");
  +[SBDisplayItemGridLayoutRestrictionInfo layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:](SBDisplayItemGridLayoutRestrictionInfo, "layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:", 0, -1.0, -1.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", v51, v201, v52, v26, v49, height, x, y, width, height, a9);
  v188 = v53;
  v190 = v54;

LABEL_19:
  objc_msgSend(v26, "defaultWindowSize");
  v198 = v56;
  v199 = v55;
  objc_msgSend(v26, "screenEdgePadding");
  v197 = v57;
  objc_msgSend(v24, "allItems");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "count");

  v194 = v25;
  v183 = v26;
  v203 = y;
  v195 = width;
  v196 = x;
  v200 = height;
  if (v59 < 2)
  {
    objc_msgSend(v24, "allItems");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "count");

    if (v105 != 1)
      goto LABEL_62;
    objc_msgSend(v24, "itemForLayoutRole:", 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutAttributesForItem:", v60);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v106, "userSizeBeforeOverlappingInBounds:defaultSize:screenEdgePadding:", x, y, width, height, v199, v198, v197);
    if (v107 != *MEMORY[0x1E0C9D820] || v108 != *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      v227 = 0;
      memset(&rect, 0, sizeof(rect));
      v225 = 0u;
      SBDisplayItemAttributedSizeInfer((uint64_t)&v225, v107, v108, x, y, width, height);
      v223[0] = v225;
      *(CGRect *)&v223[1] = rect;
      v224 = v227;
      objc_msgSend(v106, "attributesByModifyingAttributedSize:", v223, *(_QWORD *)&v197);
      v109 = v60;
      v110 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v110, "attributesByModifyingAttributedUserSizeBeforeOverlapping:", v220, SBDisplayItemAttributedSizeUnspecified((uint64_t)v220).n128_f64[0]);
      v106 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "appLayoutByModifyingLayoutAttributes:forItem:", v106, v109);
      v111 = objc_claimAutoreleasedReturnValue();

      v24 = (id)v111;
      v60 = v109;
    }

  }
  else
  {
    v230 = 0u;
    v231 = 0u;
    v228 = 0u;
    v229 = 0u;
    objc_msgSend(v24, "allItems");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v228, v236, 16);
    if (v61)
    {
      v62 = v61;
      v63 = *(_QWORD *)v229;
      v64 = *MEMORY[0x1E0C9D820];
      v65 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v66 = v202;
      obj = v60;
      v184 = *(id *)MEMORY[0x1E0C9D820];
      v181 = v65;
      do
      {
        v67 = 0;
        v204 = v62;
        do
        {
          if (*(_QWORD *)v229 != v63)
            objc_enumerationMutation(v60);
          v68 = *(_QWORD *)(*((_QWORD *)&v228 + 1) + 8 * v67);
          v69 = objc_msgSend(v24, "layoutRoleForItem:", v68);
          if (SBLayoutRoleIsValidForSplitView(v69))
          {
            objc_msgSend(v24, "layoutAttributesForItem:", v68);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "userSizeBeforeOverlappingInBounds:defaultSize:screenEdgePadding:", x, y, width, v200, v199, v198, v197);
            if (v72 == v64 && v71 == v65)
            {
              -[SBDisplayItemLayoutAttributesCalculator layoutRestrictionInfoForItem:](v66, "layoutRestrictionInfoForItem:", v68);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = x;
              v77 = v188;
              v76 = v190;
              if (objc_msgSend(v74, "layoutRestrictions"))
              {
                -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](v66, "_chamoisLayoutGridCache");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "allItems");
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v79, "count"), v201, v74, v183, v188, v190, v75, y, width, v200, a9);
                v77 = v80;
                v76 = v81;

                v25 = v194;
                if (v77 >= width || v76 >= v200)
                {
                  -[SBDisplayItemLayoutAttributesCalculator _chamoisLayoutGridCache](v66, "_chamoisLayoutGridCache");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v183, "maximumWindowWidthForOverlapping");
                  v85 = v84;
                  objc_msgSend(v24, "allItems");
                  v86 = (void *)objc_claimAutoreleasedReturnValue();
                  v66 = v202;
                  objc_msgSend(v83, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", objc_msgSend(v86, "count"), v201, v74, v183, v85, v200, v75, y, width, v200, a9);
                  v77 = v87;
                  v76 = v88;

                  v25 = v194;
                }
              }
              objc_msgSend(v70, "sizeInBounds:defaultSize:screenEdgePadding:", v75, y, width, v200, v199, v198, v197);
              if (v89 <= 0.0 || (v91 = v90, v90 <= 0.0))
              {
                BYTE1(v173) = 1;
                LOBYTE(v173) = a12;
                v94 = v195;
                v95 = v196;
                v93 = v203;
                v96 = v200;
                v26 = v183;
                -[SBDisplayItemLayoutAttributesCalculator _frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:](v66, "_frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:", v69, v24, v201, v183, 1, v192, v196, v203, v195, v200, v193, a9, v173);
                v92 = v97;
                v91 = v98;
              }
              else
              {
                v92 = v89;
                v26 = v183;
                v93 = v203;
                v94 = v195;
                v95 = v196;
                v96 = v200;
              }
              v227 = 0;
              memset(&rect, 0, sizeof(rect));
              v225 = 0u;
              SBDisplayItemAttributedSizeInfer((uint64_t)&v225, v92, v91, v95, v93, v94, v96);
              v223[0] = v225;
              *(CGRect *)&v223[1] = rect;
              v224 = v227;
              objc_msgSend(v70, "attributesByModifyingAttributedUserSizeBeforeOverlapping:", v223, *(_QWORD *)&v197);
              v99 = (void *)objc_claimAutoreleasedReturnValue();

              width = v94;
              if ((BSFloatGreaterThanFloat() & 1) != 0 || BSFloatGreaterThanFloat())
              {
                if (v77 >= v92)
                  v100 = v92;
                else
                  v100 = v77;
                v224 = 0;
                memset(&v223[1], 0, 32);
                if (v76 >= v91)
                  v101 = v91;
                else
                  v101 = v76;
                v223[0] = 0uLL;
                x = v196;
                y = v203;
                SBDisplayItemAttributedSizeInfer((uint64_t)v223, v100, v101, v196, v203, v94, v200);
                v221[0] = v223[0];
                v221[1] = v223[1];
                v221[2] = v223[2];
                v222 = v224;
                objc_msgSend(v99, "attributesByModifyingAttributedSize:", v221, *(_QWORD *)&v197);
                v102 = objc_claimAutoreleasedReturnValue();

                v99 = (void *)v102;
              }
              else
              {
                y = v203;
                x = v196;
              }
              v64 = *(double *)&v184;
              v65 = v181;
              objc_msgSend(v24, "appLayoutByModifyingLayoutAttributes:forItem:", v99, v68);
              v103 = objc_claimAutoreleasedReturnValue();

              v70 = v99;
              v24 = (id)v103;
              v60 = obj;
            }

            v62 = v204;
          }
          ++v67;
        }
        while (v62 != v67);
        v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v228, v236, 16);
      }
      while (v62);
      height = v200;
    }
  }

LABEL_62:
  v112 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v113 = MEMORY[0x1E0C809B0];
  v218[0] = MEMORY[0x1E0C809B0];
  v218[1] = 3221225472;
  v218[2] = __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke_2;
  v218[3] = &unk_1E8EA43C0;
  v114 = v112;
  v219 = v114;
  objc_msgSend(v24, "enumerate:", v218);
  objc_msgSend(v24, "zOrderedItems");
  v216[0] = v113;
  v216[1] = 3221225472;
  v216[2] = __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke_3;
  v216[3] = &unk_1E8EABAF8;
  v182 = (id)objc_claimAutoreleasedReturnValue();
  v217 = v182;
  objc_msgSend(v114, "sortUsingComparator:", v216);
  v191 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v212 = 0u;
  v213 = 0u;
  v214 = 0u;
  v215 = 0u;
  obja = v114;
  v115 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v212, v235, 16);
  if (v115)
  {
    v116 = v115;
    v117 = *(_QWORD *)v213;
    do
    {
      for (i = 0; i != v116; ++i)
      {
        if (*(_QWORD *)v213 != v117)
          objc_enumerationMutation(obja);
        v119 = *(_QWORD *)(*((_QWORD *)&v212 + 1) + 8 * i);
        BYTE1(v173) = 1;
        LOBYTE(v173) = a12;
        -[SBDisplayItemLayoutAttributesCalculator _frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:](v202, "_frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:skipAutoLayout:", objc_msgSend(v24, "layoutRoleForItem:", v119), v24, v201, v26, 1, v192, x, y, width, height, v193, a9, v173);
        v121 = v120;
        v123 = v122;
        objc_msgSend(v24, "layoutAttributesForItem:", v119);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = -[SBContinuousExposeAutoLayoutItem initWithDisplayItem:]([SBMutableContinuousExposeAutoLayoutItem alloc], "initWithDisplayItem:", v119);
        -[SBContinuousExposeAutoLayoutItem setSize:](v125, "setSize:", v121, v123);
        UIRectGetCenter();
        -[SBContinuousExposeAutoLayoutItem setPosition:](v125, "setPosition:");
        -[SBContinuousExposeAutoLayoutItem setInDefaultPosition:](v125, "setInDefaultPosition:", objc_msgSend(v124, "isPositionSystemManaged"));
        objc_msgSend(v191, "addObject:", v125);

      }
      v116 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v212, v235, 16);
    }
    while (v116);
  }

  v126 = -[SBContinuousExposeAutoLayoutSpace initWithItems:]([SBContinuousExposeAutoLayoutSpace alloc], "initWithItems:", v191);
  v127 = -[SBContinuousExposeAutoLayoutConfiguration initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:]([SBContinuousExposeAutoLayoutConfiguration alloc], "initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:", v26, x, y, width, height, a9, v193);
  if (v25)
  {
    v128 = v202;
    if ((objc_msgSend(v25, "isEqual:", v24) & 1) != 0)
    {
      v129 = 0;
    }
    else
    {
      -[SBDisplayItemLayoutAttributesCalculator autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:](v202, "autoLayoutSpaceForAppLayout:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:bounds:prefersStripHidden:prefersDockHidden:", v25, v201, v26, v192, a12, v193, a9, x, y, width, height);
      v129 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v129 = 0;
    v128 = v202;
  }
  -[SBDisplayItemLayoutAttributesCalculator _autoLayoutController](v128, "_autoLayoutController");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = (void *)v129;
  v176 = v127;
  objc_msgSend(v130, "spaceByPerformingAutoLayoutWithSpace:previousSpace:configuration:options:", v126, v129, v127, a5);
  v131 = (void *)objc_claimAutoreleasedReturnValue();

  v132 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  v211 = 0u;
  v180 = v131;
  objc_msgSend(v131, "items");
  v185 = (id)objc_claimAutoreleasedReturnValue();
  v133 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v208, v234, 16);
  if (v133)
  {
    v134 = v133;
    v189 = *(_QWORD *)v209;
    width = v195;
    height = v200;
    do
    {
      for (j = 0; j != v134; ++j)
      {
        if (*(_QWORD *)v209 != v189)
          objc_enumerationMutation(v185);
        v136 = v132;
        v137 = *(void **)(*((_QWORD *)&v208 + 1) + 8 * j);
        objc_msgSend(v137, "displayItem");
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "position");
        v140 = v139;
        v142 = v141;
        objc_msgSend(v137, "size");
        v205 = v144;
        v207 = v143;
        objc_msgSend(v137, "unoccludedPeekingPosition");
        v146 = v145;
        v148 = v147;
        if ((objc_msgSend(v137, "isFullyOccluded") & 1) != 0)
        {
          v149 = 3;
        }
        else if (objc_msgSend(v137, "isOverlapped"))
        {
          v149 = 2;
        }
        else
        {
          v149 = 1;
        }
        objc_msgSend(v24, "layoutAttributesForItem:", v138);
        v150 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v140, v142, x, v203, v195, v200);
        v152 = v151;
        v154 = v153;
        +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", v146, v148, x, v203, v195, v200);
        v156 = v155;
        v158 = v157;
        -[SBDisplayItemLayoutAttributesCalculator _deviceApplicationSceneHandleForDisplayItem:](v202, "_deviceApplicationSceneHandleForDisplayItem:", v138);
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = objc_msgSend(v150, "sizingPolicy");
        if (v159)
          v160 = SBPreferredDisplayItemSizingPolicy(objc_msgSend(v150, "sizingPolicy"), objc_msgSend(v159, "_supportedSizingPoliciesForContentOrientation:containerOrientation:", objc_msgSend(v150, "contentOrientation"), v201), v207, v205, x, v203, v195, v200);
        objc_msgSend(v150, "attributesByModifyingSizingPolicy:", v160);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v161, "attributesByModifyingOcclusionState:", v149);
        v162 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v162, "attributesByModifyingUnoccludedPeekingCenter:", v156, v158);
        v163 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v163, "attributesByModifyingPositionIsSystemManaged:", objc_msgSend(v137, "isInDefaultPosition"));
        v164 = (void *)objc_claimAutoreleasedReturnValue();

        v227 = 0;
        memset(&rect, 0, sizeof(rect));
        v225 = 0u;
        if (v164)
          objc_msgSend(v164, "attributedSize");
        v223[0] = v225;
        *(CGRect *)&v223[1] = rect;
        v224 = v227;
        IsUnspecified = SBDisplayItemAttributedSizeIsUnspecified((uint64_t)v223);
        v166 = SBDisplayItemCenterIsUnspecified(v152, v154);
        x = v196;
        if (CGRectIsNull(rect) || (IsEmpty = CGRectIsEmpty(rect), IsUnspecified || v166) || IsEmpty)
        {
          y = v203;
          SBDisplayItemAttributedSizeInfer((uint64_t)v223, v207, v205, v196, v203, v195, v200);
          v227 = v224;
          rect = *(CGRect *)&v223[1];
          v225 = v223[0];
          objc_msgSend(v164, "attributesByModifyingAttributedSize:", v223, *(_QWORD *)&v197);
          v167 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v167, "attributesByModifyingNormalizedCenter:", v152, v154);
          v164 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          y = v203;
        }
        v25 = v194;
        if (v194)
        {
          if (!objc_msgSend(v194, "containsAllItemsFromAppLayout:", v24))
            goto LABEL_99;
          v169 = objc_msgSend(v24, "containsAllItemsFromAppLayout:", v194) ^ 1;
        }
        else
        {
          v169 = 0;
        }
        if (a13 == 27 || v169)
        {
LABEL_99:
          objc_msgSend(v164, "attributesByModifyingNormalizedCenter:", v152, v154);
          v170 = objc_claimAutoreleasedReturnValue();

          v164 = (void *)v170;
        }
        v132 = v136;
        objc_msgSend(v136, "setObject:forKey:", v164, v138);

      }
      v134 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v208, v234, 16);
    }
    while (v134);
  }

  objc_msgSend(v24, "appLayoutByModifyingLayoutAttributesForItems:", v132);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setCachedLastAutoLayoutSpace:", v180);
  v26 = v183;
  +[SBAppLayoutAutoLayoutSpaceCacheKey cacheKeyForSnapshotOfAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:](SBAppLayoutAutoLayoutSpaceCacheKey, "cacheKeyForSnapshotOfAppLayout:chamoisLayoutAttributes:containerBounds:containerOrientation:floatingDockHeight:hideStrips:hideDock:", v24, v183, v201, v192, a12, x, y, width, height, v193);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "setCachedLastOverlappingModelKey:", v28);
  if (v24 != v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "handleFailureInMethod:object:file:lineNumber:description:", v174, v202, CFSTR("SBDisplayItemLayoutAttributesCalculator.m"), 573, CFSTR("Expected appLayout and newAppLayout to be equal"));

  }
  v27 = v178;
LABEL_105:

  return v29;
}

uint64_t __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsItem:", a2) ^ 1;
}

void __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (SBLayoutRoleIsValidForSplitView(a2))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

uint64_t __248__SBDisplayItemLayoutAttributesCalculator__appLayoutByPerformingAutoLayoutIfNeededInAppLayout_previousAppLayout_options_containerOrientation_chamoisLayoutAttributes_floatingDockHeight_screenScale_bounds_prefersStripHidden_prefersDockHidden_source___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = objc_msgSend(*(id *)(a1 + 32), "indexOfObject:", v7);

  objc_msgSend(v9, "numberWithUnsignedInteger:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "compare:", v11);

  return v12;
}

- (id)_deviceApplicationSceneHandleForDisplayItem:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__42;
  v15 = __Block_byref_object_dispose__42;
  v16 = 0;
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__SBDisplayItemLayoutAttributesCalculator__deviceApplicationSceneHandleForDisplayItem___block_invoke;
  v8[3] = &unk_1E8EA7360;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateSwitcherControllersWithBlock:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __87__SBDisplayItemLayoutAttributesCalculator__deviceApplicationSceneHandleForDisplayItem___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;

  v5 = (void *)MEMORY[0x1E0D231F0];
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identityForIdentifier:", v8);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sceneManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "existingSceneHandleForSceneIdentity:", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (id)_centerWindowSheetMetricsCache
{
  SBFluidSwitcherSheetMetricsCache *centerWindowSheetMetricsCache;
  SBFluidSwitcherSheetMetricsCache *v4;
  SBFluidSwitcherSheetMetricsCache *v5;

  centerWindowSheetMetricsCache = self->_centerWindowSheetMetricsCache;
  if (!centerWindowSheetMetricsCache)
  {
    v4 = objc_alloc_init(SBFluidSwitcherSheetMetricsCache);
    v5 = self->_centerWindowSheetMetricsCache;
    self->_centerWindowSheetMetricsCache = v4;

    centerWindowSheetMetricsCache = self->_centerWindowSheetMetricsCache;
  }
  return centerWindowSheetMetricsCache;
}

- (id)_autoLayoutController
{
  SBContinuousExposeAutoLayoutController *cached_autoLayoutController;
  SBContinuousExposeAutoLayoutController *v4;
  SBContinuousExposeAutoLayoutController *v5;

  cached_autoLayoutController = self->_cached_autoLayoutController;
  if (!cached_autoLayoutController)
  {
    v4 = objc_alloc_init(SBContinuousExposeAutoLayoutController);
    v5 = self->_cached_autoLayoutController;
    self->_cached_autoLayoutController = v4;

    cached_autoLayoutController = self->_cached_autoLayoutController;
  }
  return cached_autoLayoutController;
}

- (id)_chamoisLayoutGridCache
{
  SBDisplayItemLayoutGrid *chamoisLayoutGridCache;
  SBDisplayItemLayoutGrid *v4;
  SBDisplayItemLayoutGrid *v5;

  chamoisLayoutGridCache = self->_chamoisLayoutGridCache;
  if (!chamoisLayoutGridCache)
  {
    v4 = objc_alloc_init(SBDisplayItemLayoutGrid);
    v5 = self->_chamoisLayoutGridCache;
    self->_chamoisLayoutGridCache = v4;

    chamoisLayoutGridCache = self->_chamoisLayoutGridCache;
  }
  return chamoisLayoutGridCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chamoisLayoutGridCache, 0);
  objc_storeStrong((id *)&self->_cached_autoLayoutController, 0);
  objc_storeStrong((id *)&self->_chamoisSettingsCache, 0);
  objc_storeStrong((id *)&self->_centerWindowSheetMetricsCache, 0);
}

@end
