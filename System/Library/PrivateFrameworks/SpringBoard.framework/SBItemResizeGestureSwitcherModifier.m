@implementation SBItemResizeGestureSwitcherModifier

- (SBItemResizeGestureSwitcherModifier)initWithGestureID:(id)a3
{
  SBItemResizeGestureSwitcherModifier *v3;
  SBDisplayItemLayoutGrid *v4;
  SBDisplayItemLayoutGrid *layoutGrid;
  SBContinuousExposeAutoLayoutController *v6;
  SBContinuousExposeAutoLayoutController *autoLayoutController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  v3 = -[SBGestureSwitcherModifier initWithGestureID:](&v9, sel_initWithGestureID_, a3);
  if (v3)
  {
    v4 = objc_alloc_init(SBDisplayItemLayoutGrid);
    layoutGrid = v3->_layoutGrid;
    v3->_layoutGrid = v4;

    v6 = objc_alloc_init(SBContinuousExposeAutoLayoutController);
    autoLayoutController = v3->_autoLayoutController;
    v3->_autoLayoutController = v6;

  }
  return v3;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  float64x2_t *p_location;
  CGFloat v8;
  CGFloat v9;
  uint64_t v10;
  void *v11;
  SBAppLayout *v12;
  SBAppLayout *currentAppLayout;
  SBAppLayout *v14;
  CGRect *p_initialFrameInScreenCoordinates;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  CGSize size;
  int64_t selectedLayoutRole;
  SBAppLayout *v23;
  void *v24;
  _BOOL4 selectedItemWasInitiallyInDefaultPosition;
  unint64_t v26;
  unint64_t selectedEdge;
  void *v28;
  double y;
  double x;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  objc_super v39;
  objc_super v40;

  v5 = a3;
  v40.receiver = self;
  v40.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v40, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  p_location = (float64x2_t *)&self->_location;
  objc_msgSend(v5, "locationInContainerView");
  self->_location.x = v8;
  self->_location.y = v9;
  if (objc_msgSend(v5, "phase") == 1)
  {
    v36 = v6;
    v10 = objc_opt_class();
    SBSafeCast(v10, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedAppLayout");
    v12 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBItemResizeGestureSwitcherModifier.m"), 81, CFSTR("Item resize got a nil selected app layout"));

    }
    currentAppLayout = self->_currentAppLayout;
    self->_currentAppLayout = v12;
    v14 = v12;

    self->_selectedLayoutRole = objc_msgSend(v11, "selectedLayoutRole");
    self->_selectedEdge = objc_msgSend(v11, "selectedEdge");
    p_initialFrameInScreenCoordinates = &self->_initialFrameInScreenCoordinates;
    -[SBItemResizeGestureSwitcherModifier _initialScaledFrameInScreenCoordinatesForSelectedDisplayItemInAppLayout:](self, "_initialScaledFrameInScreenCoordinatesForSelectedDisplayItemInAppLayout:", v14);
    self->_initialFrameInScreenCoordinates.origin.x = v16;
    self->_initialFrameInScreenCoordinates.origin.y = v17;
    self->_initialFrameInScreenCoordinates.size.width = v18;
    self->_initialFrameInScreenCoordinates.size.height = v19;
    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_currentAppLayout);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout itemForLayoutRole:](self->_currentAppLayout, "itemForLayoutRole:", self->_selectedLayoutRole);
    v35 = v20;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "autoLayoutItemForDisplayItem:");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    self->_selectedItemWasInitiallyInDefaultPosition = objc_msgSend(v37, "isInDefaultPosition");
    size = self->_initialFrameInScreenCoordinates.size;
    self->_currentFrameForDrawingInScreenCoordinates.origin = self->_initialFrameInScreenCoordinates.origin;
    self->_currentFrameForDrawingInScreenCoordinates.size = size;
    self->_currentSceneSize = self->_initialFrameInScreenCoordinates.size;
    selectedLayoutRole = self->_selectedLayoutRole;
    v23 = self->_currentAppLayout;
    v39.receiver = self;
    v39.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    self->_currentActiveResizeCorner = -[SBItemResizeGestureSwitcherModifier activeCornersForTouchResizeForLayoutRole:inAppLayout:](&v39, sel_activeCornersForTouchResizeForLayoutRole_inAppLayout_, selectedLayoutRole, v23);
    self->_resizeAnchor = 0;
    -[SBAppLayout allItems](self->_currentAppLayout, "allItems");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v24, "count") <= 1)
    {
      selectedItemWasInitiallyInDefaultPosition = self->_selectedItemWasInitiallyInDefaultPosition;

      if (selectedItemWasInitiallyInDefaultPosition)
        goto LABEL_10;
    }
    else
    {

    }
    v26 = self->_selectedEdge - 3;
    if (v26 <= 5)
      self->_resizeAnchor = qword_1D0E89D50[v26];
LABEL_10:
    self->_locationEdgeAdjustment = (CGPoint)*MEMORY[0x1E0C9D538];
    selectedEdge = self->_selectedEdge;
    if (selectedEdge > 8)
    {
      v28 = v35;
      v6 = v36;
    }
    else
    {
      v28 = v35;
      v6 = v36;
      if (((1 << selectedEdge) & 0x62) != 0)
      {
        y = self->_initialFrameInScreenCoordinates.origin.y;
      }
      else
      {
        if (((1 << selectedEdge) & 0x184) == 0)
          goto LABEL_16;
        y = self->_initialFrameInScreenCoordinates.origin.y + self->_initialFrameInScreenCoordinates.size.height;
      }
      self->_locationEdgeAdjustment.y = y - self->_location.y;
      selectedEdge = self->_selectedEdge;
    }
LABEL_16:
    if (selectedEdge <= 8)
    {
      if (((1 << selectedEdge) & 0xA8) != 0)
      {
        x = p_initialFrameInScreenCoordinates->origin.x;
        goto LABEL_21;
      }
      if (((1 << selectedEdge) & 0x150) != 0)
      {
        x = p_initialFrameInScreenCoordinates->origin.x + self->_initialFrameInScreenCoordinates.size.width;
LABEL_21:
        self->_locationEdgeAdjustment.x = x - p_location->f64[0];
      }
    }

  }
  *p_location = vaddq_f64(*p_location, (float64x2_t)self->_locationEdgeAdjustment);
  -[SBItemResizeGestureSwitcherModifier _responseForGestureUpdateAtGestureEnd:](self, "_responseForGestureUpdateAtGestureEnd:", objc_msgSend(v5, "phase") == 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v31, v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)_responseForGestureUpdateAtGestureEnd:(BOOL)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double width;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  SBContinuousExposeAutoLayoutConfiguration *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t resizeAnchor;
  unint64_t selectedEdge;
  double v44;
  double x;
  double v46;
  char v47;
  double y;
  void *v49;
  unint64_t v50;
  double v51;
  double v52;
  int v53;
  BOOL v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  unint64_t v59;
  double v60;
  double v61;
  double v62;
  SBDisplayItemLayoutGrid *layoutGrid;
  void *v64;
  uint64_t v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  double v72;
  id v73;
  void (**v74)(_QWORD, double, double);
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  _BOOL4 v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  unint64_t v113;
  double v114;
  double v115;
  unint64_t v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double v121;
  double v122;
  uint64_t k;
  void *v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  CGFloat v135;
  CGFloat v136;
  CGSize *p_currentSceneSize;
  __n128 v138;
  __n128 v139;
  double v140;
  _BOOL8 v141;
  double v142;
  void *v143;
  void *v144;
  SBUpdateLayoutSwitcherEventResponse *v145;
  void *v146;
  void *v147;
  SBUpdateContinuousExposeStripsPresentationResponse *v148;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  double v154;
  double v155;
  uint64_t i;
  void *v157;
  double v158;
  double v159;
  double v160;
  double v161;
  double v162;
  uint64_t v163;
  SBContinuousExposeAutoLayoutController *v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t m;
  double v170;
  double v171;
  double v172;
  double v173;
  BOOL v174;
  double v175;
  uint64_t v176;
  SBContinuousExposeAutoLayoutController *autoLayoutController;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t j;
  double v182;
  double v183;
  double v184;
  double v185;
  unint64_t v187;
  void *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  double v192;
  double v193;
  uint64_t jj;
  void *v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  double v205;
  uint64_t n;
  void *v207;
  double v208;
  double v209;
  double v210;
  double v211;
  double v212;
  void *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t kk;
  double v218;
  double v219;
  double v220;
  void *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t ii;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v233;
  double v234;
  double v235;
  double v236;
  uint64_t v237;
  double v238;
  BOOL v239;
  BOOL v240;
  id v241;
  id v242;
  uint64_t v243;
  uint64_t v244;
  _BOOL4 v245;
  void *v246;
  void *v247;
  double v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  uint64_t v256;
  double height;
  double v258;
  double v259;
  void *v260;
  double v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  _QWORD v294[5];
  id v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  double v303;
  uint64_t v304;
  double v305;
  uint64_t v306;
  double v307;
  BOOL v308;
  BOOL v309;
  BOOL v310;
  char v311;
  objc_super v312;
  _BYTE v313[128];
  _BYTE v314[128];
  _BYTE v315[128];
  _BYTE v316[128];
  _BYTE v317[128];
  _BYTE v318[128];
  _BYTE v319[128];
  _BYTE v320[128];
  uint64_t v321;

  v245 = a3;
  v321 = *MEMORY[0x1E0C80C00];
  v312.receiver = self;
  v312.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  -[SBItemResizeGestureSwitcherModifier containerViewBounds](&v312, sel_containerViewBounds);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBItemResizeGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "screenEdgePadding");
  v251 = v13;
  objc_msgSend(v12, "maximumWindowHeightWithDock");
  v249 = v14;
  objc_msgSend(v12, "stageInterItemSpacing");
  v16 = v15;
  objc_msgSend(v12, "stageOcclusionDodgingPeekLength");
  v236 = v17;
  objc_msgSend(v12, "gridWidths");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v234 = v20;

  objc_msgSend(v12, "gridHeights");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v235 = v23;

  width = self->_initialFrameInScreenCoordinates.size.width;
  height = self->_initialFrameInScreenCoordinates.size.height;
  UIRectGetCenter();
  v261 = v25;
  v27 = v26;
  -[SBAppLayout itemForLayoutRole:](self->_currentAppLayout, "itemForLayoutRole:", self->_selectedLayoutRole);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = [SBContinuousExposeAutoLayoutConfiguration alloc];
  -[SBItemResizeGestureSwitcherModifier screenScale](self, "screenScale");
  v31 = v30;
  -[SBItemResizeGestureSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
  v258 = v9;
  v259 = v11;
  v256 = -[SBContinuousExposeAutoLayoutConfiguration initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:](v29, "initWithContainerBounds:screenScale:dockHeightWithBottomEdgePadding:chamoisLayoutAttributes:", v12, v5, v7, v9, v11, v31, v32);
  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_currentAppLayout);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stageArea");
  v35 = v34;
  v254 = v36;
  v243 = v37;
  v248 = v38;
  objc_msgSend(v33, "autoLayoutItemForDisplayItem:", v28);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBItemResizeGestureSwitcherModifier layoutRestrictionInfoForItem:](self, "layoutRestrictionInfoForItem:", v28);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v246 = (void *)v28;
  -[SBAppLayout layoutAttributesForItem:](self->_currentAppLayout, "layoutAttributesForItem:", v28);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v237 = objc_msgSend(v40, "contentOrientation");

  -[SBItemResizeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "liveResizeGridRubberbandingRange");

  resizeAnchor = self->_resizeAnchor;
  selectedEdge = self->_selectedEdge;
  v239 = resizeAnchor == 2;
  v240 = resizeAnchor == 1;
  if (resizeAnchor == 2)
  {
    x = self->_location.x;
    v46 = width * 0.5 + v261;
LABEL_11:
    v44 = v46 - x;
    goto LABEL_12;
  }
  if (resizeAnchor == 1)
  {
    x = v261 + width * -0.5;
    v46 = self->_location.x;
    goto LABEL_11;
  }
  v44 = width;
  if (resizeAnchor)
    goto LABEL_12;
  v44 = width;
  if (selectedEdge > 8)
    goto LABEL_12;
  if (((1 << selectedEdge) & 0xA8) != 0)
  {
    x = self->_location.x;
    v46 = v261 + v261 - x;
    goto LABEL_11;
  }
  v44 = width;
  if (((1 << selectedEdge) & 0x150) != 0)
    v44 = self->_location.x - (v261 - (self->_location.x - v261));
LABEL_12:
  v247 = v12;
  v244 = v35;
  v253 = v27;
  v255 = width;
  v47 = 0;
  if (selectedEdge - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v54 = 0;
LABEL_20:
    v55 = height;
    v56 = height;
    goto LABEL_44;
  }
  if (selectedEdge > 8)
  {
LABEL_25:
    v54 = 0;
    goto LABEL_20;
  }
  if (((1 << selectedEdge) & 0x62) == 0)
  {
    if (((1 << selectedEdge) & 0x184) != 0)
    {
      y = self->_location.y;
      if (self->_selectedItemWasInitiallyInDefaultPosition
        && (objc_msgSend(v33, "items"),
            v49 = (void *)objc_claimAutoreleasedReturnValue(),
            v50 = objc_msgSend(v49, "count"),
            v49,
            v50 < 2))
      {
        v52 = v27 - (y - v27);
        if (v52 >= v254)
        {
          v53 = 0;
        }
        else
        {
          v53 = 1;
          v52 = v254;
        }
        v51 = height;
      }
      else
      {
        v51 = height;
        v52 = v27 + height * -0.5;
        v53 = 1;
      }
      v233 = y;
      v61 = y - v52;
      if (v51 >= v259 + v251 * -2.0
        && (-[SBItemResizeGestureSwitcherModifier prefersDockHidden](self, "prefersDockHidden") & 1) == 0
        && !self->_resizeAnchor)
      {
        if (v61 <= v249)
        {
          v62 = v233;
          if (self->_selectedItemWasInitiallyInDefaultPosition)
          {
            v27 = v249 * 0.5 + v254;
          }
          else
          {
            v53 = 1;
            v52 = v254;
          }
        }
        else
        {
          v53 = 1;
          v52 = v254;
          v62 = v233;
        }
        v253 = v27;
        v61 = v62 - v52;
      }
      v47 = 0;
      v54 = v53 != 0;
      v56 = v61;
      goto LABEL_43;
    }
    goto LABEL_25;
  }
  v57 = self->_location.y;
  if (self->_selectedItemWasInitiallyInDefaultPosition
    && (objc_msgSend(v33, "items"),
        v58 = (void *)objc_claimAutoreleasedReturnValue(),
        v59 = objc_msgSend(v58, "count"),
        v58,
        v59 < 2))
  {
    v60 = v27 + v27 - v57;
    if (v60 <= v254 + v248)
    {
      v47 = 0;
    }
    else
    {
      v47 = 1;
      v60 = v254 + v248;
    }
  }
  else
  {
    v60 = height * 0.5 + v27;
    v47 = 1;
  }
  v54 = 0;
  v56 = v60 - v57;
LABEL_43:
  v55 = height;
LABEL_44:
  layoutGrid = self->_layoutGrid;
  -[SBAppLayout allItems](self->_currentAppLayout, "allItems");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "count");
  -[SBItemResizeGestureSwitcherModifier screenScale](self, "screenScale");
  v67 = v66;
  -[SBItemResizeGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v250 = v44;
  v252 = v56;
  -[SBDisplayItemLayoutGrid nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:](layoutGrid, "nearestGridSizeForProposedSize:countOnStage:inBounds:contentOrientation:layoutRestrictionInfo:screenScale:chamoisLayoutAttributes:", v65, v237, v260, v68, v44, v56, v5, v7, v258, v259, v67);
  v70 = v69;
  v72 = v71;

  v294[0] = MEMORY[0x1E0C809B0];
  v294[1] = 3221225472;
  v294[2] = __77__SBItemResizeGestureSwitcherModifier__responseForGestureUpdateAtGestureEnd___block_invoke;
  v294[3] = &unk_1E8EB0EF8;
  v296 = v261;
  v297 = v253;
  v298 = v5;
  v299 = v7;
  v300 = v258;
  v301 = v259;
  v308 = v240;
  v302 = v255;
  v303 = v55;
  v309 = v239;
  v310 = v54;
  v294[4] = self;
  v73 = v33;
  v295 = v73;
  v304 = v244;
  v305 = v254;
  v306 = v243;
  v307 = v248;
  v311 = v47;
  v74 = (void (**)(_QWORD, double, double))MEMORY[0x1D17E5550](v294);
  if (objc_msgSend(v260, "layoutRestrictions"))
  {
LABEL_45:
    v75 = (void *)v256;
    goto LABEL_46;
  }
  v116 = self->_resizeAnchor;
  v75 = (void *)v256;
  if (!v116)
    goto LABEL_46;
  if (selectedEdge - 3 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v70 = v255;
    goto LABEL_143;
  }
  if (v116 == 2)
  {
    v284 = 0u;
    v285 = 0u;
    v282 = 0u;
    v283 = 0u;
    v241 = v73;
    objc_msgSend(v73, "items");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v282, v318, 16);
    if (v151)
    {
      v152 = v151;
      v153 = *(_QWORD *)v283;
      v154 = 0.0;
      v155 = 1.79769313e308;
      do
      {
        for (i = 0; i != v152; ++i)
        {
          if (*(_QWORD *)v283 != v153)
            objc_enumerationMutation(v150);
          v157 = *(void **)(*((_QWORD *)&v282 + 1) + 8 * i);
          if ((objc_msgSend(v157, "isEqual:", v39) & 1) == 0)
          {
            objc_msgSend(v157, "position");
            v159 = v158;
            objc_msgSend(v157, "size");
            v161 = v16 + v159 + v160 * 0.5;
            v162 = vabdd_f64(v161, self->_location.x);
            if (v162 < v155)
            {
              v154 = v161;
              v155 = v162;
            }
          }
        }
        v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v282, v318, 16);
      }
      while (v152);
    }
    else
    {
      v154 = 0.0;
      v155 = 1.79769313e308;
    }

    v176 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    autoLayoutController = self->_autoLayoutController;
    if (v176 == 1)
      -[SBContinuousExposeAutoLayoutController validTrailingStageAreaInsetsWithConfiguration:](autoLayoutController, "validTrailingStageAreaInsetsWithConfiguration:", v256);
    else
      -[SBContinuousExposeAutoLayoutController validLeadingStageAreaInsetsWithConfiguration:](autoLayoutController, "validLeadingStageAreaInsetsWithConfiguration:", v256);
    v280 = 0u;
    v281 = 0u;
    v278 = 0u;
    v279 = 0u;
    v165 = (id)objc_claimAutoreleasedReturnValue();
    v178 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v278, v317, 16);
    if (v178)
    {
      v179 = v178;
      v180 = *(_QWORD *)v279;
      do
      {
        for (j = 0; j != v179; ++j)
        {
          if (*(_QWORD *)v279 != v180)
            objc_enumerationMutation(v165);
          objc_msgSend(*(id *)(*((_QWORD *)&v278 + 1) + 8 * j), "doubleValue");
          v183 = v5 + v182;
          v184 = vabdd_f64(v183, self->_location.x);
          if (v184 < v155)
          {
            v154 = v183;
            v155 = v184;
          }
        }
        v179 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v278, v317, 16);
      }
      while (v179);
    }

    v185 = vabdd_f64(v70, v250);
    if (v155 >= v16 + v236 && v155 >= v185)
      goto LABEL_142;
    v175 = v255 * 0.5 + v261 - v154;
  }
  else
  {
    if (v116 != 1)
      goto LABEL_143;
    v292 = 0u;
    v293 = 0u;
    v290 = 0u;
    v291 = 0u;
    v241 = v73;
    objc_msgSend(v73, "items");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v290, v320, 16);
    if (v118)
    {
      v119 = v118;
      v120 = *(_QWORD *)v291;
      v121 = 0.0;
      v122 = 1.79769313e308;
      do
      {
        for (k = 0; k != v119; ++k)
        {
          if (*(_QWORD *)v291 != v120)
            objc_enumerationMutation(v117);
          v124 = *(void **)(*((_QWORD *)&v290 + 1) + 8 * k);
          if ((objc_msgSend(v124, "isEqual:", v39) & 1) == 0)
          {
            objc_msgSend(v124, "position");
            v126 = v125;
            objc_msgSend(v124, "size");
            v128 = v126 + v127 * -0.5 - v16;
            v129 = vabdd_f64(v128, self->_location.x);
            if (v129 < v122)
            {
              v121 = v128;
              v122 = v129;
            }
          }
        }
        v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v290, v320, 16);
      }
      while (v119);
    }
    else
    {
      v121 = 0.0;
      v122 = 1.79769313e308;
    }

    v163 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v164 = self->_autoLayoutController;
    if (v163 == 1)
      -[SBContinuousExposeAutoLayoutController validLeadingStageAreaInsetsWithConfiguration:](v164, "validLeadingStageAreaInsetsWithConfiguration:", v256);
    else
      -[SBContinuousExposeAutoLayoutController validTrailingStageAreaInsetsWithConfiguration:](v164, "validTrailingStageAreaInsetsWithConfiguration:", v256);
    v288 = 0u;
    v289 = 0u;
    v286 = 0u;
    v287 = 0u;
    v165 = (id)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v286, v319, 16);
    if (v166)
    {
      v167 = v166;
      v168 = *(_QWORD *)v287;
      do
      {
        for (m = 0; m != v167; ++m)
        {
          if (*(_QWORD *)v287 != v168)
            objc_enumerationMutation(v165);
          objc_msgSend(*(id *)(*((_QWORD *)&v286 + 1) + 8 * m), "doubleValue");
          v171 = v5 + v258 - v170;
          v172 = vabdd_f64(v171, self->_location.x);
          if (v172 < v122)
          {
            v121 = v171;
            v122 = v172;
          }
        }
        v167 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v286, v319, 16);
      }
      while (v167);
    }

    v173 = vabdd_f64(v70, v250);
    v174 = v122 < v16 + v236 || v122 < v173;
    if (!v174)
      goto LABEL_142;
    v175 = v121 - (v261 + v255 * -0.5);
  }
  if (v175 >= v234)
    v70 = v175;
  else
    v70 = v234;
LABEL_142:
  v55 = height;

  v73 = v241;
LABEL_143:
  if (selectedEdge - 5 > 0xFFFFFFFFFFFFFFFDLL)
  {
    v72 = v55;
  }
  else
  {
    v187 = self->_selectedEdge;
    if (v187 <= 8)
    {
      v242 = v73;
      if (((1 << v187) & 0x62) != 0)
      {
        v268 = 0u;
        v269 = 0u;
        v266 = 0u;
        v267 = 0u;
        objc_msgSend(v73, "items");
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        v202 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v266, v314, 16);
        if (v202)
        {
          v203 = v202;
          v204 = *(_QWORD *)v267;
          v205 = 0.0;
          v193 = 1.79769313e308;
          do
          {
            for (n = 0; n != v203; ++n)
            {
              if (*(_QWORD *)v267 != v204)
                objc_enumerationMutation(v201);
              v207 = *(void **)(*((_QWORD *)&v266 + 1) + 8 * n);
              if ((objc_msgSend(v207, "isEqual:", v39) & 1) == 0)
              {
                objc_msgSend(v207, "position");
                v209 = v208;
                objc_msgSend(v207, "size");
                v211 = v16 + v209 + v210 * 0.5;
                v212 = vabdd_f64(v211, self->_location.y);
                if (v212 < v193)
                {
                  v193 = v212;
                  v205 = v211;
                }
              }
            }
            v203 = objc_msgSend(v201, "countByEnumeratingWithState:objects:count:", &v266, v314, 16);
          }
          while (v203);
        }
        else
        {
          v205 = 0.0;
          v193 = 1.79769313e308;
        }

        v264 = 0u;
        v265 = 0u;
        v262 = 0u;
        v263 = 0u;
        -[SBContinuousExposeAutoLayoutController validTopStageAreaInsetsWithConfiguration:](self->_autoLayoutController, "validTopStageAreaInsetsWithConfiguration:", v256);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        v222 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v262, v313, 16);
        if (v222)
        {
          v223 = v222;
          v224 = *(_QWORD *)v263;
          v73 = v242;
          do
          {
            for (ii = 0; ii != v223; ++ii)
            {
              if (*(_QWORD *)v263 != v224)
                objc_enumerationMutation(v221);
              objc_msgSend(*(id *)(*((_QWORD *)&v262 + 1) + 8 * ii), "doubleValue");
              v227 = v7 + v226;
              v228 = vabdd_f64(v227, self->_location.y);
              if (v228 < v193)
              {
                v193 = v228;
                v205 = v227;
              }
            }
            v223 = objc_msgSend(v221, "countByEnumeratingWithState:objects:count:", &v262, v313, 16);
          }
          while (v223);
        }
        else
        {
          v73 = v242;
        }

        v229 = v16 + v236;
        v230 = height * 0.5 + v253 - v205;
        goto LABEL_196;
      }
      if (((1 << v187) & 0x184) != 0)
      {
        v276 = 0u;
        v277 = 0u;
        v274 = 0u;
        v275 = 0u;
        objc_msgSend(v73, "items");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        v189 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v274, v316, 16);
        if (v189)
        {
          v190 = v189;
          v191 = *(_QWORD *)v275;
          v192 = 0.0;
          v193 = 1.79769313e308;
          do
          {
            for (jj = 0; jj != v190; ++jj)
            {
              if (*(_QWORD *)v275 != v191)
                objc_enumerationMutation(v188);
              v195 = *(void **)(*((_QWORD *)&v274 + 1) + 8 * jj);
              if ((objc_msgSend(v195, "isEqual:", v39) & 1) == 0)
              {
                objc_msgSend(v195, "position");
                v197 = v196;
                objc_msgSend(v195, "size");
                v199 = v197 + v198 * -0.5 - v16;
                v200 = vabdd_f64(v199, self->_location.y);
                if (v200 < v193)
                {
                  v193 = v200;
                  v192 = v199;
                }
              }
            }
            v190 = objc_msgSend(v188, "countByEnumeratingWithState:objects:count:", &v274, v316, 16);
          }
          while (v190);
        }
        else
        {
          v192 = 0.0;
          v193 = 1.79769313e308;
        }

        v272 = 0u;
        v273 = 0u;
        v270 = 0u;
        v271 = 0u;
        -[SBContinuousExposeAutoLayoutController validBottomStageAreaInsetsWithConfiguration:](self->_autoLayoutController, "validBottomStageAreaInsetsWithConfiguration:", v256);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        v214 = objc_msgSend(v213, "countByEnumeratingWithState:objects:count:", &v270, v315, 16);
        if (v214)
        {
          v215 = v214;
          v216 = *(_QWORD *)v271;
          v73 = v242;
          do
          {
            for (kk = 0; kk != v215; ++kk)
            {
              if (*(_QWORD *)v271 != v216)
                objc_enumerationMutation(v213);
              objc_msgSend(*(id *)(*((_QWORD *)&v270 + 1) + 8 * kk), "doubleValue");
              v219 = v7 + v259 - v218;
              v220 = vabdd_f64(v219, self->_location.y);
              if (v220 < v193)
              {
                v193 = v220;
                v192 = v219;
              }
            }
            v215 = objc_msgSend(v213, "countByEnumeratingWithState:objects:count:", &v270, v315, 16);
          }
          while (v215);
        }
        else
        {
          v73 = v242;
        }

        v229 = v16 + v236;
        v230 = v192 - (v253 + height * -0.5);
LABEL_196:
        if (v230 < v235)
          v230 = v235;
        v174 = v193 < v229;
        v231 = vabdd_f64(v72, v252);
        if (v174 || v193 < v231)
          v72 = v230;
        goto LABEL_45;
      }
    }
  }
LABEL_46:
  objc_msgSend(v73, "items");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "count");

  if (v77 == 1)
  {
    v238 = v72;
    -[SBContinuousExposeAutoLayoutController validLeadingStageAreaInsetsWithConfiguration:](self->_autoLayoutController, "validLeadingStageAreaInsetsWithConfiguration:", v75);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "lastObject");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "doubleValue");

    -[SBContinuousExposeAutoLayoutController validTrailingStageAreaInsetsWithConfiguration:](self->_autoLayoutController, "validTrailingStageAreaInsetsWithConfiguration:", v75);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "lastObject");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "doubleValue");

    -[SBContinuousExposeAutoLayoutController validTopStageAreaInsetsWithConfiguration:](self->_autoLayoutController, "validTopStageAreaInsetsWithConfiguration:", v75);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "lastObject");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "doubleValue");

    -[SBContinuousExposeAutoLayoutController validBottomStageAreaInsetsWithConfiguration:](self->_autoLayoutController, "validBottomStageAreaInsetsWithConfiguration:", v75);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "lastObject");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "doubleValue");

    UIRectInset();
    v87 = v70;
    if (v70 < v88)
    {
      v90 = v245;
      v89 = v238;
    }
    else
    {
      v89 = v238;
      v90 = v245;
      if (v238 >= v86)
      {
        v89 = v259;
        v87 = v258;
      }
    }
  }
  else
  {
    SBRectWithSize();
    v91 = v72;
    v74[2](v74, v70, v72);
    UIRectCenteredAboutPoint();
    v93 = v92;
    v95 = v94;
    v97 = v96;
    v99 = v98;
    v100 = v73;
    v101 = (void *)objc_msgSend(v73, "mutableCopy");
    objc_msgSend(v39, "displayItem");
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "autoLayoutItemForDisplayItem:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v103, "setPosition:", v93 + v97 * 0.5, v95 + v99 * 0.5);
    objc_msgSend(v103, "setSize:", v97, v99);
    -[SBContinuousExposeAutoLayoutController spaceByPerformingAutoLayoutWithSpace:previousSpace:configuration:options:](self->_autoLayoutController, "spaceByPerformingAutoLayoutWithSpace:previousSpace:configuration:options:", v101, 0, v75, 0);
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "stageArea");
    v106 = v105;
    v108 = v107;
    objc_msgSend(v39, "displayItem");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v104, "autoLayoutItemForDisplayItem:", v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v110, "position");
    v112 = v111 - v70 * 0.5;
    v113 = self->_resizeAnchor;
    if (v113)
    {
      if (v113 == 2)
      {
        v115 = self->_initialFrameInScreenCoordinates.origin.x + self->_initialFrameInScreenCoordinates.size.width;
        v114 = v106;
      }
      else
      {
        v114 = 0.0;
        v115 = v258;
        if (v113 == 1)
        {
          v114 = self->_initialFrameInScreenCoordinates.origin.x;
          v115 = v106 + v108;
        }
      }
    }
    else
    {
      v115 = v106 + v108;
      v114 = v106;
    }
    if (v112 >= v114)
      v114 = v112;
    v130 = v70 + v112;
    if (v130 >= v115)
      v130 = v115;
    v87 = v130 - v114;

    v90 = v245;
    v73 = v100;
    v89 = v91;
  }
  BSUIConstrainValueToIntervalWithRubberBand();
  v132 = v131;
  BSUIConstrainValueToIntervalWithRubberBand();
  v134 = v133;
  SBRectWithSize();
  v74[2](v74, v132, v134);
  UIRectCenteredAboutPoint();
  *(_QWORD *)&self->_currentFrameForDrawingInScreenCoordinates.origin.x = v138.n128_u64[0];
  *(_QWORD *)&self->_currentFrameForDrawingInScreenCoordinates.origin.y = v139.n128_u64[0];
  self->_currentFrameForDrawingInScreenCoordinates.size.width = v135;
  self->_currentFrameForDrawingInScreenCoordinates.size.height = v136;
  p_currentSceneSize = &self->_currentSceneSize;
  v138.n128_u64[0] = *(_QWORD *)&self->_currentSceneSize.width;
  v139.n128_f64[0] = v89;
  if (vabdd_f64(v138.n128_f64[0], v87) <= 1.0 && vabdd_f64(self->_currentSceneSize.height, v89) <= 1.0)
  {
    v139.n128_u64[0] = *(_QWORD *)&self->_currentSceneSize.height;
    if (!v90)
    {
      v144 = 0;
      goto LABEL_87;
    }
  }
  else
  {
    v138.n128_f64[0] = v87;
    p_currentSceneSize->width = v87;
    self->_currentSceneSize.height = v89;
  }
  v140 = ((double (*)(void (**)(_QWORD, double, double), __n128, __n128))v74[2])(v74, v138, v139);
  v141 = !v90;
  -[SBItemResizeGestureSwitcherModifier _responseForSceneSizeUpdateToSize:center:sceneUpdatesOnly:](self, "_responseForSceneSizeUpdateToSize:center:sceneUpdatesOnly:", v141, p_currentSceneSize->width, self->_currentSceneSize.height, v140, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v143, 0);
  v144 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBItemResizeGestureSwitcherModifier newAppLayoutsGenCount](self, "newAppLayoutsGenCount");
  if (v141)
  {
LABEL_87:
    v147 = v247;
    goto LABEL_88;
  }
  v145 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
  SBAppendSwitcherModifierResponse(v145, v144);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBItemResizeGestureSwitcherModifier continuousExposeStripProgress](self, "continuousExposeStripProgress");
  v147 = v247;
  if (BSFloatGreaterThanFloat()
    && -[SBItemResizeGestureSwitcherModifier _isStripVisibleForCurrentAppLayout](self, "_isStripVisibleForCurrentAppLayout"))
  {
    v148 = -[SBUpdateContinuousExposeStripsPresentationResponse initWithPresentationOptions:dismissalOptions:]([SBUpdateContinuousExposeStripsPresentationResponse alloc], "initWithPresentationOptions:dismissalOptions:", 0, 1);
    SBAppendSwitcherModifierResponse(v148, v146);
    v144 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v144 = v146;
  }
LABEL_88:

  return v144;
}

double __77__SBItemResizeGestureSwitcherModifier__responseForGestureUpdateAtGestureEnd___block_invoke(uint64_t a1, double a2, double a3)
{
  double v3;
  void *v4;
  void *v5;
  double v6;

  if (a2 >= *(double *)(a1 + 80) && a3 >= *(double *)(a1 + 88))
  {
    UIRectGetCenter();
    return v6;
  }
  else
  {
    if (*(_BYTE *)(a1 + 144))
    {
      v3 = a2 * 0.5 + *(double *)(a1 + 48) - *(double *)(a1 + 96) * 0.5;
    }
    else
    {
      v3 = *(double *)(a1 + 48);
      if (*(_BYTE *)(a1 + 145))
        v3 = v3 + *(double *)(a1 + 96) * 0.5 - a2 * 0.5;
    }
    if (*(_BYTE *)(a1 + 146))
    {
      if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 184))
      {
        objc_msgSend(*(id *)(a1 + 40), "items");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "count");

      }
    }
    else if (*(_BYTE *)(a1 + 147) && *(_BYTE *)(*(_QWORD *)(a1 + 32) + 184))
    {
      objc_msgSend(*(id *)(a1 + 40), "items");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "count");

    }
  }
  return v3;
}

- (id)_responseForSceneSizeUpdateToSize:(CGSize)a3 center:(CGPoint)a4 sceneUpdatesOnly:(BOOL)a5
{
  _BOOL8 v5;
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unint64_t v29;
  __int128 *v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  double v37;
  CGFloat v38;
  void *v39;
  SBAppLayout *v40;
  SBAppLayout *currentAppLayout;
  SBAppLayout *v42;
  SBAppLayout *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  SBPerformTransitionSwitcherEventResponse *v48;
  void *v49;
  uint64_t v50;
  SBSetInterfaceOrientationFromUserResizingEventResponse *v51;
  SBSetInterfaceOrientationFromUserResizingEventResponse *v52;
  uint64_t v54;
  _BYTE v55[56];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  CGRect v64;

  v5 = a5;
  y = a4.y;
  x = a4.x;
  height = a3.height;
  width = a3.width;
  -[SBItemResizeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[SBAppLayout itemForLayoutRole:](self->_currentAppLayout, "itemForLayoutRole:", self->_selectedLayoutRole);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBAppLayout layoutAttributesForItem:](self->_currentAppLayout, "layoutAttributesForItem:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBItemResizeGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDisplayItemLayoutAttributes normalizedPointForPoint:inBounds:](SBDisplayItemLayoutAttributes, "normalizedPointForPoint:inBounds:", x, y, v12, v14, v16, v18);
  objc_msgSend(v20, "attributesByModifyingNormalizedCenter:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_selectedItemWasInitiallyInDefaultPosition)
  {
    if (self->_resizeAnchor)
    {
      -[SBAppLayout allItems](self->_currentAppLayout, "allItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (unint64_t)objc_msgSend(v23, "count") > 1;

    }
    else
    {
      v24 = 1;
    }
  }
  else
  {
    v24 = 0;
  }
  objc_msgSend(v22, "attributesByModifyingPositionIsSystemManaged:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = 0;
  v61 = 0u;
  v62 = 0u;
  v60 = 0u;
  objc_msgSend(v21, "defaultWindowSize");
  objc_msgSend(v21, "screenEdgePadding");
  v54 = v26;
  SBDisplayItemAttributedSizeInfer((uint64_t)&v60, width, height, v12, v14, v16, v18);
  v56 = v60;
  v57 = v61;
  v58 = v62;
  v59 = v63;
  objc_msgSend(v25, "attributesByModifyingAttributedSize:", &v56, v54);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppLayout allItems](self->_currentAppLayout, "allItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "count");

  if (v29 < 2)
  {
    SBDisplayItemAttributedSizeUnspecified((uint64_t)v55);
    v30 = (__int128 *)v55;
  }
  else
  {
    v56 = v60;
    v57 = v61;
    v58 = v62;
    v59 = v63;
    v30 = &v56;
  }
  objc_msgSend(v27, "attributesByModifyingAttributedUserSizeBeforeOverlapping:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = -[SBItemResizeGestureSwitcherModifier supportedSizingPoliciesForItem:inAppLayout:](self, "supportedSizingPoliciesForItem:inAppLayout:", v19, self->_currentAppLayout);
  v33 = SBDisplayItemSizingPolicyAllowingLargestSize(v32);
  v34 = SBDisplayItemSizingPolicyAllowingSmallestSize(v32);
  if (v33 == 1)
  {
    -[SBItemResizeGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "screenEdgePadding");
    v38 = v37;

    v64.origin.x = v12;
    v64.origin.y = v14;
    v64.size.width = v16;
    v64.size.height = v18;
    CGRectInset(v64, v38, v38);
    if ((BSFloatEqualToFloat() & 1) == 0 && !BSFloatEqualToFloat())
      goto LABEL_19;
LABEL_18:
    v34 = v33;
    goto LABEL_19;
  }
  if (v33 == 2 && v18 == height && v16 == width)
    goto LABEL_18;
LABEL_19:
  objc_msgSend(v31, "attributesByModifyingSizingPolicy:", v34);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBAppLayout appLayoutByModifyingLayoutAttributes:forItem:](self->_currentAppLayout, "appLayoutByModifyingLayoutAttributes:forItem:", v39, v19);
  v40 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  currentAppLayout = self->_currentAppLayout;
  self->_currentAppLayout = v40;

  -[SBItemResizeGestureSwitcherModifier appLayoutByBringingItemToFront:inAppLayout:](self, "appLayoutByBringingItemToFront:inAppLayout:", v19, self->_currentAppLayout);
  v42 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  v43 = self->_currentAppLayout;
  self->_currentAppLayout = v42;

  +[SBSwitcherTransitionRequest requestForActivatingAppLayout:](SBMutableSwitcherTransitionRequest, "requestForActivatingAppLayout:", self->_currentAppLayout);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setSceneUpdatesOnly:", v5);
  -[SBItemResizeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "liveResizeSendsAnimatedSceneSizeUpdates");

  if (v46)
  {
    -[SBItemResizeGestureSwitcherModifier _animationSettingsForLayout](self, "_animationSettingsForLayout");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setAnimationSettings:", v47);

  }
  v48 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v44, 1);
  -[SBItemResizeGestureSwitcherModifier layoutRestrictionInfoForItem:](self, "layoutRestrictionInfoForItem:", v19);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v49, "layoutRestrictions") & 0xA) == 2)
  {
    if (width <= height)
      v50 = 1;
    else
      v50 = 3;
    v51 = -[SBSetInterfaceOrientationFromUserResizingEventResponse initWithDisplayItem:desiredContentOrientation:]([SBSetInterfaceOrientationFromUserResizingEventResponse alloc], "initWithDisplayItem:desiredContentOrientation:", v19, v50);
    -[SBChainableModifierEventResponse addChildResponse:](v51, "addChildResponse:", v48);
  }
  else
  {
    v51 = v48;
  }
  v52 = v51;

  return v52;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *currentAppLayout;
  void *v7;
  SBAppLayout *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  SBUpdateLayoutSwitcherEventResponse *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v18, sel_handleSceneReadyEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentAppLayout = self->_currentAppLayout;
  objc_msgSend(v4, "appLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(currentAppLayout) = -[SBAppLayout isOrContainsAppLayout:](currentAppLayout, "isOrContainsAppLayout:", v7);

  if ((_DWORD)currentAppLayout)
  {
    v8 = self->_currentAppLayout;
    objc_msgSend(v4, "appLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "itemForLayoutRole:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBAppLayout layoutRoleForItem:](v8, "layoutRoleForItem:", v10);

    LODWORD(v9) = -[SBItemResizeGestureSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", v11, self->_currentAppLayout);
    v12 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 3);
    SBAppendSwitcherModifierResponse(v12, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v9)
    {
      UIRectGetCenter();
      -[SBItemResizeGestureSwitcherModifier _responseForSceneSizeUpdateToSize:center:sceneUpdatesOnly:](self, "_responseForSceneSizeUpdateToSize:center:sceneUpdatesOnly:", 1, self->_currentSceneSize.width, self->_currentSceneSize.height, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SBAppendSwitcherModifierResponse(v16, v13);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = v13;
    }
  }

  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v7, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isGestureInitiated") && (unint64_t)objc_msgSend(v4, "phase") >= 2)
    -[SBChainableModifier setState:](self, "setState:", 1);

  return v5;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
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
  objc_super v24;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  if (objc_msgSend(v11, "isEqual:", self->_currentAppLayout)
    && self->_selectedLayoutRole == a3
    && -[SBGestureSwitcherModifier gesturePhase](self, "gesturePhase") >= 2)
  {
    -[SBItemResizeGestureSwitcherModifier _convertToSpaceRectFromScreenRect:](self, "_convertToSpaceRectFromScreenRect:", self->_currentFrameForDrawingInScreenCoordinates.origin.x, self->_currentFrameForDrawingInScreenCoordinates.origin.y, self->_currentFrameForDrawingInScreenCoordinates.size.width, self->_currentFrameForDrawingInScreenCoordinates.size.height);
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    -[SBItemResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v24, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  }
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;

  v20 = v16;
  v21 = v17;
  v22 = v18;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
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
  objc_super v20;
  UIRectCornerRadii result;

  -[SBItemResizeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqual:", self->_currentAppLayout))
  {
    -[SBItemResizeGestureSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    -[SBItemResizeGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stageCornerRadii");

    if (-[SBSwitcherModifier appLayoutContainsFullScreenDisplayItem:](self, "appLayoutContainsFullScreenDisplayItem:", v6))
    {
      BSFloatIsZero();
    }
    -[SBItemResizeGestureSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    -[SBItemResizeGestureSwitcherModifier cornerRadiiForIndex:](&v20, sel_cornerRadiiForIndex_, a3);
  }
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = v11;

  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.topRight = v19;
  result.bottomRight = v18;
  result.bottomLeft = v17;
  result.topLeft = v16;
  return result;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (unint64_t)activeCornersForTouchResizeForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  unint64_t currentActiveResizeCorner;
  objc_super v9;

  v6 = a4;
  if (objc_msgSend(v6, "isOrContainsAppLayout:", self->_currentAppLayout)
    && self->_selectedLayoutRole == a3)
  {
    currentActiveResizeCorner = self->_currentActiveResizeCorner;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    currentActiveResizeCorner = -[SBItemResizeGestureSwitcherModifier activeCornersForTouchResizeForLayoutRole:inAppLayout:](&v9, sel_activeCornersForTouchResizeForLayoutRole_inAppLayout_, a3, v6);
  }

  return currentActiveResizeCorner;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (objc_msgSend(v4, "switcherLayoutElementType")
    || !objc_msgSend(v4, "isOrContainsAppLayout:", self->_currentAppLayout))
  {
    objc_msgSend(v6, "setUpdateMode:", 3);
  }
  else
  {
    objc_msgSend(v6, "setUpdateMode:", 5);
    objc_msgSend(v6, "setScaleUpdateMode:", 3);
    -[SBItemResizeGestureSwitcherModifier _animationSettingsForLayout](self, "_animationSettingsForLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v7);

  }
  return v6;
}

- (id)layoutRestrictionInfoForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  -[SBItemResizeGestureSwitcherModifier layoutRestrictionInfoForItem:](&v11, sel_layoutRestrictionInfoForItem_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutRestrictions");
  if ((v6 & 0xA) != 0)
  {
    v7 = v6;
    v8 = -[SBItemResizeGestureSwitcherModifier supportedContentInterfaceOrientationsForItem:](self, "supportedContentInterfaceOrientationsForItem:", v4);
    if ((v8 & 6) != 0 && (v8 & 0x18) != 0)
    {
      objc_msgSend(v5, "restrictedSize");
      +[SBDisplayItemGridLayoutRestrictionInfo layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:](SBDisplayItemGridLayoutRestrictionInfo, "layoutRestrictionInfoWithLayoutRestrictions:restrictedSize:", v7 & 0xFFFFFFFFFFFFFFF7);
      v9 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v9;
    }
  }

  return v5;
}

- (id)_animationSettingsForLayout
{
  void *v2;
  void *v3;
  void *v4;

  -[SBItemResizeGestureSwitcherModifier switcherSettings](self, "switcherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chamoisSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "liveResizeDuringDragLayoutAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isItemResizingAllowedForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  char v7;

  v6 = a4;
  if (objc_msgSend(v6, "isOrContainsAppLayout:", self->_currentAppLayout)
    && self->_selectedLayoutRole == a3)
  {
    v7 = -[SBItemResizeGestureSwitcherModifier appLayoutContainsOnlyResizableApps:](self, "appLayoutContainsOnlyResizableApps:", v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isOrContainsAppLayout:", self->_currentAppLayout) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    v5 = -[SBItemResizeGestureSwitcherModifier wantsSceneResizesHostedContextForAppLayout:](&v7, sel_wantsSceneResizesHostedContextForAppLayout_, v4);
  }

  return v5;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  v4 = a3;
  -[SBItemResizeGestureSwitcherModifier topMostLayoutRolesForAppLayout:](&v11, sel_topMostLayoutRolesForAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", self->_currentAppLayout, v11.receiver, v11.super_class);

  if (v6)
  {
    v7 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_selectedLayoutRole);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v8);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_selectedLayoutRole);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObject:atIndex:", v9, 0);

    v5 = v7;
  }
  return v5;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return 0;
}

- (CGRect)_initialScaledFrameInScreenCoordinatesForSelectedDisplayItemInAppLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int64_t selectedLayoutRole;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  objc_super v25;
  objc_super v26;
  CGRect result;

  v4 = a3;
  -[SBItemResizeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBItemResizeGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBItemResizeGestureSwitcherModifier;
    -[SBItemResizeGestureSwitcherModifier frameForIndex:](&v26, sel_frameForIndex_, v6);
  }
  selectedLayoutRole = self->_selectedLayoutRole;
  SBRectWithSize();
  v25.receiver = self;
  v25.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  -[SBItemResizeGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v25, sel_frameForLayoutRole_inAppLayout_withBounds_, selectedLayoutRole, v4);
  v9 = v8;
  v11 = v10;
  UIRectGetCenter();
  v13 = v12;
  v15 = v14;
  v16 = self->_selectedLayoutRole;
  v24.receiver = self;
  v24.super_class = (Class)SBItemResizeGestureSwitcherModifier;
  -[SBItemResizeGestureSwitcherModifier scaleForLayoutRole:inAppLayout:](&v24, sel_scaleForLayoutRole_inAppLayout_, v16, v4);
  v18 = v9 * v17;
  v19 = v11 * v17;

  v20 = v13 - v18 * 0.5;
  v21 = v15 - v19 * 0.5;
  v22 = v18;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)_convertToSpaceRectFromScreenRect:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[SBItemResizeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", self->_currentAppLayout);

  -[SBItemResizeGestureSwitcherModifier frameForIndex:](self, "frameForIndex:", v5);
  -[SBItemResizeGestureSwitcherModifier screenScale](self, "screenScale");
  UIRectIntegralWithScale();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)_convertToScreenRectFromSpaceRect:(CGRect)a3
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[SBItemResizeGestureSwitcherModifier appLayouts](self, "appLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", self->_currentAppLayout);

  -[SBItemResizeGestureSwitcherModifier frameForIndex:](self, "frameForIndex:", v5);
  -[SBItemResizeGestureSwitcherModifier screenScale](self, "screenScale");
  UIRectIntegralWithScale();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (BOOL)_isStripVisibleForCurrentAppLayout
{
  void *v2;
  char v3;

  -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", self->_currentAppLayout);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStripVisible") ^ 1;

  return v3;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_currentAppLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoLayoutController, 0);
  objc_storeStrong((id *)&self->_layoutGrid, 0);
  objc_storeStrong((id *)&self->_currentAppLayout, 0);
}

@end
