@implementation SBSASettlingBehaviorProvider

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SBSAInterfaceElementPropertyIdentity *v20;
  void *v21;
  SBSAInterfaceElementPropertyIdentity *v22;
  uint64_t v23;
  SBSAInterfaceElementPropertyIdentity *v24;
  void *v25;
  SBSAInterfaceElementPropertyIdentity *v26;
  uint64_t v27;
  SBSAInterfaceElementPropertyIdentity *v28;
  void *v29;
  SBSAInterfaceElementPropertyIdentity *v30;
  _QWORD *v31;
  double v32;
  void *v33;
  void *v34;
  NSObject *v35;

  v3 = a2;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 80);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSASettlingBehaviorProvider.m"), 282, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  if (*(_BYTE *)(a1 + 88))
  {
    v14 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "elementContexts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SBSAElementContextAssociatedWithContainerViewDescription(v14, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_fluidBehaviorSettingsForTransitionPhase:forElementContext:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v17);
    objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v18, *(_QWORD *)(a1 + 56), 0);
    v19 = *(_QWORD *)(a1 + 56);
    v20 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v20, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v21, CFSTR("center"));
    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v19, v22, 0);

    v23 = *(_QWORD *)(a1 + 56);
    v24 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v24, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v25, CFSTR("contentBounds"));
    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v23, v26, 0);

    v27 = *(_QWORD *)(a1 + 56);
    v28 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v28, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v29, CFSTR("contentCenter"));
    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v27, v30, 0);

  }
  v31 = *(_QWORD **)(a1 + 32);
  if (!v31[7])
  {
    objc_msgSend(v31, "_progressMilestoneForTransitionPhase:", v31[5]);
    if (v32 > 0.0)
    {
      v33 = *(void **)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v34);

      objc_msgSend(*(id *)(a1 + 72), "addObject:", *(_QWORD *)(a1 + 56));
      SBLogSystemAperturePreferencesStackSettling();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_44_cold_1(a1, a1 + 56, v35);

    }
  }

}

- (id)preferencesFromContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  Class v11;
  objc_class *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char *v17;
  NSDictionary *containerIDsToOvershootOutsets;
  NSSet *pendingPhaseTransitionPropertyIdentities;
  void *v20;
  void *v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  NSSet *v29;
  void *v30;
  _BOOL4 v31;
  int v32;
  int v33;
  NSSet *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  NSSet *pendingCollisionPropertyIdentities;
  void *v39;
  _BOOL4 v40;
  void *v41;
  int v42;
  int v43;
  NSSet *v44;
  NSObject *v45;
  NSSet *pendingSteadyPropertyIdentities;
  NSObject *v47;
  int v48;
  NSSet *v49;
  void *v50;
  uint64_t v51;
  const __CFString *v52;
  uint64_t v53;
  const __CFString *v54;
  uint64_t v55;
  NSSet *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  char *v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  NSDictionary *stackContainerInterfaceElementIdentifiersToBounds;
  NSDictionary *v81;
  NSSet *v82;
  NSDictionary *v83;
  NSDictionary *v84;
  int v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t j;
  void *v93;
  void *v94;
  double v95;
  CGFloat v96;
  double v97;
  CGFloat v98;
  double v99;
  CGFloat v100;
  double v101;
  CGFloat v102;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v107;
  NSObject *v108;
  void *v109;
  __CFString *v110;
  NSDictionary *v111;
  void *v112;
  NSDictionary *v113;
  int64_t activePhase;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t k;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  void *v134;
  void *v135;
  NSObject *v136;
  __CFString *v137;
  SBSAInterfaceElementPropertyIdentity *v138;
  NSUInteger v139;
  id *v140;
  int64_t v141;
  BOOL v142;
  uint64_t v143;
  const __CFString *v144;
  void *v145;
  SBSAInterfaceElementPropertyIdentity *v146;
  void *v147;
  NSDictionary *v148;
  void *v149;
  void *v150;
  id v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  double v159;
  void *v160;
  void *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  void *v168;
  uint64_t v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  NSObject *v174;
  void *v175;
  int v176;
  int64_t v177;
  BOOL v178;
  int v179;
  NSObject *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  id v188;
  const __CFString *v190;
  id v191;
  void *v192;
  void *v193;
  id v194;
  int v195;
  id v196;
  BOOL v197;
  id v198;
  void *v199;
  int v200;
  void *v201;
  void *v203;
  uint64_t v204;
  void *v205;
  id *location;
  id *locationb;
  id *locationa;
  void *v209;
  double v210;
  id v211;
  id v212;
  id v213;
  void *v214;
  SBSAInterfaceElementPropertyIdentity *v215;
  id obj;
  id obja;
  _QWORD v218[5];
  id v219;
  SBSAInterfaceElementPropertyIdentity *v220;
  SEL v221;
  _QWORD v222[5];
  id v223;
  id v224;
  SBSAInterfaceElementPropertyIdentity *v225;
  id v226;
  id v227;
  SEL v228;
  BOOL v229;
  _QWORD v230[5];
  id v231;
  SEL v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  _QWORD v237[4];
  _QWORD v238[5];
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  _QWORD v243[5];
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  objc_super v252;
  _QWORD v253[6];
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  uint8_t buf[4];
  uint64_t v259;
  __int16 v260;
  const __CFString *v261;
  __int16 v262;
  SBSAInterfaceElementPropertyIdentity *v263;
  _BYTE v264[128];
  _BYTE v265[128];
  _BYTE v266[128];
  char v267[16];
  char v268[24];
  _BYTE v269[128];
  uint64_t v270;
  CGRect v271;
  CGRect v272;
  CGRect v273;
  CGRect v274;
  CGRect v275;
  UIEdgeInsets v276;
  CGRect v277;

  v270 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v193 = v4;
  if (!v4)
    goto LABEL_9;
  v5 = v4;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v6)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = NSClassFromString(CFSTR("SBSAContext"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSASettlingBehaviorProvider.m"), 94, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v9 = 0;
  }
  v14 = v9;

  objc_msgSend(v14, "preferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastChangingElementLayoutTransition");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v200 = BSEqualObjects();
  if ((v200 & 1) == 0)
  {
    SBLogSystemAperturePreferencesStackSettling();
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEBUG))
      -[SBSASettlingBehaviorProvider preferencesFromContext:].cold.5(v14, v17);

    objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, v16);
    -[SBSASettlingBehaviorProvider _setActivePhase:context:logReason:](self, "_setActivePhase:context:logReason:", 0, v14, CFSTR("Element Layout Changed"));
    containerIDsToOvershootOutsets = self->_containerIDsToOvershootOutsets;
    self->_containerIDsToOvershootOutsets = 0;

    pendingPhaseTransitionPropertyIdentities = self->_pendingPhaseTransitionPropertyIdentities;
    self->_pendingPhaseTransitionPropertyIdentities = 0;

  }
  v191 = v16;
  objc_msgSend(v14, "requests");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bs_firstObjectOfClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    self->_collisionImminent = 1;
  }
  else if ((v200 & 1) == 0)
  {
    self->_collisionImminent = -[SBSAElementLayoutTransition isCollisionRequired](self->_lastChangingElementLayoutTransition, "isCollisionRequired");
  }
  -[SBSASettlingBehaviorProvider _progressMilestoneForTransitionPhase:](self, "_progressMilestoneForTransitionPhase:", self->_activePhase);
  v23 = v22;
  v254 = 0u;
  v255 = 0u;
  v256 = 0u;
  v257 = 0u;
  objc_msgSend(v14, "animatedTransitionResults");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v254, v269, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v255;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v255 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v254 + 1) + 8 * v27);
        if (v23 <= 0.0)
          goto LABEL_33;
        v29 = self->_pendingPhaseTransitionPropertyIdentities;
        objc_msgSend(*(id *)(*((_QWORD *)&v254 + 1) + 8 * v27), "associatedInterfaceElementPropertyIdentity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = -[NSSet containsObject:](v29, "containsObject:", v30);

        objc_msgSend(v28, "targetedMilestone");
        v32 = BSFloatApproximatelyEqualToFloat();
        v33 = objc_msgSend(v28, "isTransitionEndTargeted");
        if (v33)
          v33 = objc_msgSend(v28, "finished");
        if ((v31 & (v32 | v33)) != 1)
          goto LABEL_33;
        v34 = self->_pendingPhaseTransitionPropertyIdentities;
        self->_pendingPhaseTransitionPropertyIdentities = 0;

        SBLogSystemAperturePreferencesStackSettling();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v53 = objc_msgSend(v14, "queryIteration");
          *(_DWORD *)buf = 134349314;
          v54 = CFSTR("skipped");
          if (v32)
            v54 = CFSTR("hit");
          v259 = v53;
          v260 = 2112;
          v261 = v54;
          _os_log_debug_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEBUG, "[%{public}lu] Pending phase transition property identity %@.", buf, 0x16u);
        }

        if (self->_collisionImminent && self->_activePhase == -3)
        {
          v36 = (void *)objc_msgSend(v14, "copyByAddingSignals:debugRequestingProvider:", 1, self);

          SBLogSystemAperturePreferencesStackSettling();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            -[SBSASettlingBehaviorProvider preferencesFromContext:].cold.4((uint64_t)v268, v36);

          self->_collisionImminent = 0;
        }
        else
        {
LABEL_33:
          v36 = v14;
        }
        pendingCollisionPropertyIdentities = self->_pendingCollisionPropertyIdentities;
        objc_msgSend(v28, "associatedInterfaceElementPropertyIdentity");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = -[NSSet containsObject:](pendingCollisionPropertyIdentities, "containsObject:", v39);

        objc_msgSend(v28, "targetedMilestone");
        objc_msgSend((id)objc_opt_class(), "settings");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "boundsCollisionProgress");
        v42 = BSFloatApproximatelyEqualToFloat();

        v43 = objc_msgSend(v28, "isTransitionEndTargeted");
        if (v43)
          v43 = objc_msgSend(v28, "finished");
        if ((v40 & (v42 | v43)) == 1)
        {
          v44 = self->_pendingCollisionPropertyIdentities;
          self->_pendingCollisionPropertyIdentities = 0;

          v14 = (id)objc_msgSend(v36, "copyByAddingSignals:debugRequestingProvider:", 1, self);
          SBLogSystemAperturePreferencesStackSettling();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            v51 = objc_msgSend(v14, "queryIteration");
            *(_DWORD *)buf = 134349314;
            v52 = CFSTR("skipped");
            if (v42)
              v52 = CFSTR("reached");
            v259 = v51;
            v260 = 2112;
            v261 = v52;
            _os_log_debug_impl(&dword_1D0540000, v45, OS_LOG_TYPE_DEBUG, "[%{public}lu] Collision threshold %@ (explicit)", buf, 0x16u);
          }

          self->_collisionImminent = 0;
          if (self->_collisionIsNotOvershooting)
          {
            self->_collisionIsNotOvershooting = 0;
            -[SBSASettlingBehaviorProvider _setActivePhase:context:logReason:](self, "_setActivePhase:context:logReason:", 0, v14, CFSTR("Reset due to handling collision with no overshooting"));
          }
        }
        else
        {
          v14 = v36;
        }
        pendingSteadyPropertyIdentities = self->_pendingSteadyPropertyIdentities;
        objc_msgSend(v28, "associatedInterfaceElementPropertyIdentity");
        v47 = objc_claimAutoreleasedReturnValue();
        if (-[NSSet containsObject:](pendingSteadyPropertyIdentities, "containsObject:", v47)
          && objc_msgSend(v28, "isTransitionEndTargeted"))
        {
          v48 = objc_msgSend(v28, "finished");

          if (!v48)
            goto LABEL_48;
          v49 = self->_pendingSteadyPropertyIdentities;
          self->_pendingSteadyPropertyIdentities = 0;

          v50 = (void *)objc_msgSend(v14, "copyByAddingSignals:debugRequestingProvider:", 2, self);
          SBLogSystemAperturePreferencesStackSettling();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            -[SBSASettlingBehaviorProvider preferencesFromContext:].cold.3((uint64_t)v267, v50);
        }
        else
        {
          v50 = v14;
        }

        v14 = v50;
LABEL_48:
        ++v27;
      }
      while (v25 != v27);
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v254, v269, 16);
      v25 = v55;
    }
    while (v55);
  }

  if ((v200 & 1) == 0)
  {
    v56 = self->_pendingCollisionPropertyIdentities;
    self->_pendingCollisionPropertyIdentities = 0;

  }
  v57 = MEMORY[0x1E0C809B0];
  if (self->_collisionImminent)
  {
    objc_msgSend(v14, "preferences");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v253[0] = v57;
    v253[1] = 3221225472;
    v253[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke;
    v253[3] = &unk_1E8E9E9D0;
    v253[5] = a2;
    v253[4] = self;
    v59 = (void *)objc_msgSend(v58, "copyWithBlock:", v253);
    v60 = (void *)objc_msgSend(v14, "copyByUpdatingPreferences:", v59);

    SBLogSystemAperturePreferencesStackSettling();
    v61 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v61, OS_LOG_TYPE_DEBUG))
      -[SBSASettlingBehaviorProvider preferencesFromContext:].cold.2(v60, v61);

  }
  else
  {
    v60 = v14;
  }
  v209 = v60;
  v252.receiver = self;
  v252.super_class = (Class)SBSASettlingBehaviorProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v252, sel_preferencesFromContext_, v60);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_opt_class();
  v64 = v62;
  if (v63)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v65 = v64;
    else
      v65 = 0;
  }
  else
  {
    v65 = 0;
  }
  v66 = v65;

  v205 = v66;
  objc_msgSend(v66, "containerViewDescriptions");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v248 = 0u;
  v249 = 0u;
  v250 = 0u;
  v251 = 0u;
  v69 = v67;
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v248, v266, 16);
  if (v70)
  {
    v71 = v70;
    v72 = *(_QWORD *)v249;
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v249 != v72)
          objc_enumerationMutation(v69);
        v74 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * i);
        v75 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v74, "bounds");
        objc_msgSend(v75, "valueWithCGRect:");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "interfaceElementIdentifier");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v68, "setObject:forKey:", v76, v77);

      }
      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v248, v266, 16);
    }
    while (v71);
  }

  -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", objc_opt_class());
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = v209;
  if (self->_activePhase)
  {
    if (v78)
    {
      stackContainerInterfaceElementIdentifiersToBounds = self->_stackContainerInterfaceElementIdentifiersToBounds;
      if (stackContainerInterfaceElementIdentifiersToBounds)
      {
        if ((-[NSDictionary isEqual:](stackContainerInterfaceElementIdentifiersToBounds, "isEqual:", v68) & 1) == 0)
        {
          objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, v191);
          -[SBSASettlingBehaviorProvider _setActivePhase:context:logReason:](self, "_setActivePhase:context:logReason:", 0, v209, CFSTR("Reset due to container frames changing during dynamic animation"));
          v81 = self->_containerIDsToOvershootOutsets;
          self->_containerIDsToOvershootOutsets = 0;

          v82 = self->_pendingPhaseTransitionPropertyIdentities;
          self->_pendingPhaseTransitionPropertyIdentities = 0;

        }
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v68);
  v83 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v84 = self->_stackContainerInterfaceElementIdentifiersToBounds;
  self->_stackContainerInterfaceElementIdentifiersToBounds = v83;

  v85 = objc_msgSend(v209, "containsAnyOfSignals:", 1);
  v86 = MEMORY[0x1E0C809B0];
  obja = v69;
  v192 = v68;
  if (v85)
  {
    if (!self->_activePhase)
      goto LABEL_107;
    v87 = (void *)-[NSDictionary mutableCopy](self->_containerIDsToOvershootOutsets, "mutableCopy");
    v244 = 0u;
    v245 = 0u;
    v246 = 0u;
    v247 = 0u;
    objc_msgSend(v209, "containerViewDescriptions");
    location = (id *)objc_claimAutoreleasedReturnValue();
    v88 = objc_msgSend(location, "countByEnumeratingWithState:objects:count:", &v244, v265, 16);
    if (v88)
    {
      v89 = v88;
      v203 = v87;
      v90 = 0;
      v91 = *(_QWORD *)v245;
      do
      {
        for (j = 0; j != v89; ++j)
        {
          if (*(_QWORD *)v245 != v91)
            objc_enumerationMutation(location);
          v93 = *(void **)(*((_QWORD *)&v244 + 1) + 8 * j);
          v243[0] = v86;
          v243[1] = 3221225472;
          v243[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_28;
          v243[3] = &unk_1E8EA6A60;
          v243[4] = v93;
          objc_msgSend(v69, "bs_firstObjectPassingTest:", v243);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "bounds");
          v96 = v95;
          v98 = v97;
          v100 = v99;
          v102 = v101;
          objc_msgSend(v94, "bounds");
          x = v271.origin.x;
          y = v271.origin.y;
          width = v271.size.width;
          height = v271.size.height;
          v277.origin.x = v96;
          v277.origin.y = v98;
          v277.size.width = v100;
          v277.size.height = v102;
          if (CGRectContainsRect(v271, v277))
          {
            v272.origin.x = x;
            v272.origin.y = y;
            v272.size.width = width;
            v272.size.height = height;
            v210 = CGRectGetHeight(v272);
            v273.origin.x = v96;
            v273.origin.y = v98;
            v273.size.width = v100;
            v273.size.height = v102;
            if (v210 > CGRectGetHeight(v273))
            {
              v274.origin.x = x;
              v274.origin.y = y;
              v274.size.width = width;
              v274.size.height = height;
              v107 = CGRectGetWidth(v274);
              v275.origin.x = v96;
              v275.origin.y = v98;
              v275.size.width = v100;
              v275.size.height = v102;
              if (v107 > CGRectGetWidth(v275))
              {
                SBLogSystemAperturePreferencesStackSettling();
                v108 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
                {
                  v211 = (id)objc_msgSend(v209, "queryIteration");
                  objc_msgSend(v93, "interfaceElementIdentifier");
                  v110 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134349314;
                  v259 = (uint64_t)v211;
                  v260 = 2112;
                  v261 = v110;
                  _os_log_debug_impl(&dword_1D0540000, v108, OS_LOG_TYPE_DEBUG, "[%{public}lu] Container is now Expanding, dropping overshoot offsets for: (%@)", buf, 0x16u);

                }
                objc_msgSend(v93, "interfaceElementIdentifier");
                v109 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v203, "removeObjectForKey:", v109);

                v90 = 1;
                v86 = MEMORY[0x1E0C809B0];
              }
            }
          }

          v69 = obja;
        }
        v89 = objc_msgSend(location, "countByEnumeratingWithState:objects:count:", &v244, v265, 16);
      }
      while (v89);

      v79 = v209;
      v87 = v203;
      if ((v90 & 1) == 0)
        goto LABEL_102;
      if (objc_msgSend(v203, "count"))
      {
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v203);
        v111 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        v112 = self->_containerIDsToOvershootOutsets;
        self->_containerIDsToOvershootOutsets = v111;
      }
      else
      {
        -[SBSASettlingBehaviorProvider _setActivePhase:context:logReason:](self, "_setActivePhase:context:logReason:", 0, v209, CFSTR("Reset due to No container overshoot offsets left after something started expanding"));
        v113 = self->_containerIDsToOvershootOutsets;
        self->_containerIDsToOvershootOutsets = 0;

        v112 = self->_pendingPhaseTransitionPropertyIdentities;
        self->_pendingPhaseTransitionPropertyIdentities = 0;
      }
    }
    else
    {
      v112 = location;
    }

LABEL_102:
  }
  activePhase = self->_activePhase;
  if (activePhase)
  {
    if (activePhase >= -1)
      activePhase = -1;
    v115 = activePhase + 1;
    goto LABEL_126;
  }
LABEL_107:
  SBLogSystemAperturePreferencesStackSettling();
  v116 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v116, OS_LOG_TYPE_DEBUG))
    -[SBSASettlingBehaviorProvider preferencesFromContext:].cold.1(v79, v116);

  v212 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v239 = 0u;
  v240 = 0u;
  v241 = 0u;
  v242 = 0u;
  objc_msgSend(v79, "containerViewDescriptions");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v239, v264, 16);
  if (v117)
  {
    v118 = v117;
    v119 = *(_QWORD *)v240;
    do
    {
      for (k = 0; k != v118; ++k)
      {
        if (*(_QWORD *)v240 != v119)
          objc_enumerationMutation(v214);
        v121 = *(void **)(*((_QWORD *)&v239 + 1) + 8 * k);
        v238[0] = MEMORY[0x1E0C809B0];
        v238[1] = 3221225472;
        v238[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_32;
        v238[3] = &unk_1E8EA6A60;
        v238[4] = v121;
        objc_msgSend(v69, "bs_firstObjectPassingTest:", v238);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        if (v122)
        {
          objc_msgSend(v79, "elementContexts");
          v123 = (void *)objc_claimAutoreleasedReturnValue();
          SBSAElementContextAssociatedWithContainerViewDescription(v122, v123, 0);
          v124 = (void *)objc_claimAutoreleasedReturnValue();

          -[SBSASettlingBehaviorProvider _fluidBehaviorSettingsForTransitionPhase:forElementContext:](self, "_fluidBehaviorSettingsForTransitionPhase:forElementContext:", -3, v124);
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSASettlingBehaviorProvider _overshootOutsetsTargetingContainerDescription:initialContainerDescription:settings:context:](self, "_overshootOutsetsTargetingContainerDescription:initialContainerDescription:settings:context:", v122, v121, v125, v79);
          v130 = v126;
          v131 = v127;
          v132 = v128;
          v133 = v129;
          if (v126 != 0.0 || v128 != 0.0 || v127 != 0.0 || v129 != 0.0)
          {
            *(double *)v237 = v126;
            *(double *)&v237[1] = v127;
            *(double *)&v237[2] = v128;
            *(double *)&v237[3] = v129;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v237, "{UIEdgeInsets=dddd}");
            v134 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "interfaceElementIdentifier");
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v212, "setObject:forKey:", v134, v135);

            SBLogSystemAperturePreferencesStackSettling();
            v136 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
            {
              locationb = (id *)objc_msgSend(v209, "queryIteration");
              objc_msgSend(v121, "interfaceElementIdentifier");
              v137 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              v276.top = v130;
              v276.left = v131;
              v276.bottom = v132;
              v276.right = v133;
              NSStringFromUIEdgeInsets(v276);
              v138 = (SBSAInterfaceElementPropertyIdentity *)(id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134349570;
              v259 = (uint64_t)locationb;
              v260 = 2112;
              v261 = v137;
              v262 = 2112;
              v263 = v138;
              _os_log_debug_impl(&dword_1D0540000, v136, OS_LOG_TYPE_DEBUG, "[%{public}lu] Updated overshoot outsets for container description '%@': %@", buf, 0x20u);

            }
            v79 = v209;
          }

          v69 = obja;
        }

      }
      v118 = objc_msgSend(v214, "countByEnumeratingWithState:objects:count:", &v239, v264, 16);
    }
    while (v118);
  }

  objc_storeStrong((id *)&self->_containerIDsToOvershootOutsets, v212);
  v115 = -3;
  v68 = v192;
LABEL_126:
  v139 = -[NSDictionary count](self->_containerIDsToOvershootOutsets, "count");
  v140 = (id *)v139;
  v197 = v139 != 0;
  if (self->_collisionImminent)
  {
    v141 = self->_activePhase;
    v142 = v141 == 0;
    if (!v139)
    {
      if (v141)
        goto LABEL_135;
      self->_collisionIsNotOvershooting = 1;
      goto LABEL_134;
    }
  }
  else
  {
    if (!v139)
      goto LABEL_135;
    v142 = 0;
  }
  if (!self->_pendingPhaseTransitionPropertyIdentities || v142)
LABEL_134:
    -[SBSASettlingBehaviorProvider _setActivePhase:context:logReason:](self, "_setActivePhase:context:logReason:", v115, v79, CFSTR("Incremented Phase"));
LABEL_135:
  v199 = (void *)objc_msgSend(v69, "mutableCopy");
  v204 = objc_msgSend(v69, "count");
  if (v204)
  {
    v194 = objc_alloc_init(MEMORY[0x1E0C99E20]);

    v198 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v196 = objc_alloc_init(MEMORY[0x1E0C99E20]);

    v143 = 0;
    v195 = v200 ^ 1;
    if (v140)
      v144 = CFSTR("Will Overshoot");
    else
      v144 = CFSTR("Will Not Overshoot");
    v190 = v144;
    locationa = v140;
    do
    {
      objc_msgSend(obja, "objectAtIndex:", v143);
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v145, "interfaceElementIdentifier");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v215 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v146, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v147, CFSTR("bounds"));

      v148 = self->_containerIDsToOvershootOutsets;
      objc_msgSend(v145, "interfaceElementIdentifier");
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKey:](v148, "objectForKey:", v149);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

      v151 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v213 = v150;
      if (v140 && v150)
      {
        objc_msgSend(v150, "UIEdgeInsetsValue");
        v153 = v152;
        v155 = v154;
        v157 = v156;
        v159 = v158;
        objc_msgSend(v79, "elementContexts");
        v160 = v79;
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        SBSAElementContextAssociatedWithContainerViewDescription(v145, v161, 0);
        v201 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBSASettlingBehaviorProvider _overshootOutsetsForTransitionPhase:baseOutsets:elementContext:](self, "_overshootOutsetsForTransitionPhase:baseOutsets:elementContext:", self->_activePhase, v201, v153, v155, v157, v159);
        v162 = MEMORY[0x1E0C809B0];
        v230[0] = MEMORY[0x1E0C809B0];
        v230[1] = 3221225472;
        v230[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_40;
        v230[3] = &unk_1E8EB0310;
        v232 = a2;
        v230[4] = self;
        v233 = v163;
        v234 = v164;
        v235 = v165;
        v236 = v166;
        v167 = v160;
        v231 = v167;
        v168 = (void *)objc_msgSend(v145, "copyWithBlock:", v230);
        objc_msgSend(v199, "replaceObjectAtIndex:withObject:", v143, v168);

        v222[0] = v162;
        v222[1] = 3221225472;
        v222[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_44;
        v222[3] = &unk_1E8EBC040;
        v228 = a2;
        v222[4] = self;
        v229 = v197;
        v223 = v145;
        v224 = v167;
        v225 = v215;
        v226 = v151;
        v227 = v198;
        v169 = objc_msgSend(v205, "copyWithBlock:", v222);

        v170 = (void *)v169;
      }
      else
      {
        v170 = v205;
      }
      if (self->_collisionImminent && self->_activePhase == -3)
      {
        if (!v213 || (objc_msgSend(v213, "UIEdgeInsetsValue"), BSFloatIsZero()))
        {
          v171 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend((id)objc_opt_class(), "settings");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v172, "boundsCollisionProgress");
          objc_msgSend(v171, "numberWithDouble:");
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v151, "addObject:", v173);

          objc_msgSend(v194, "addObject:", v215);
          SBLogSystemAperturePreferencesStackSettling();
          v174 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v174, OS_LOG_TYPE_DEBUG))
          {
            v183 = objc_msgSend(v209, "queryIteration");
            *(_DWORD *)buf = 134349314;
            v259 = v183;
            v260 = 2112;
            v261 = (const __CFString *)v215;
            _os_log_debug_impl(&dword_1D0540000, v174, OS_LOG_TYPE_DEBUG, "[%{public}lu] Added pending collision property ID: %@", buf, 0x16u);
          }

        }
      }
      objc_msgSend(v170, "elementLayoutTransition");
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v176 = objc_msgSend(v175, "isLayoutChange");

      v177 = self->_activePhase;
      v140 = locationa;
      if (locationa)
      {
        v178 = v177 == -1;
      }
      else
      {
        v178 = v177 == 0;
        v179 = v195;
        if (!v178)
          v179 = 1;
        v178 = (v179 | v176) == 1;
      }
      v79 = v209;
      if (v178)
      {
        objc_msgSend(v151, "addObject:", 0x1E91CF8F8);
        objc_msgSend(v196, "addObject:", v215);
        SBLogSystemAperturePreferencesStackSettling();
        v180 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v180, OS_LOG_TYPE_DEBUG))
        {
          v182 = objc_msgSend(v209, "queryIteration");
          *(_DWORD *)buf = 134349570;
          v259 = v182;
          v260 = 2112;
          v261 = v190;
          v262 = 2112;
          v263 = v215;
          _os_log_debug_impl(&dword_1D0540000, v180, OS_LOG_TYPE_DEBUG, "[%{public}lu] Added pending steady state (%@) property ID: %@", buf, 0x20u);
        }

      }
      if (objc_msgSend(v151, "count"))
      {
        v218[0] = MEMORY[0x1E0C809B0];
        v218[1] = 3221225472;
        v218[2] = __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_56;
        v218[3] = &unk_1E8EA3798;
        v221 = a2;
        v218[4] = self;
        v219 = v151;
        v220 = v215;
        v181 = objc_msgSend(v170, "copyWithBlock:", v218);

        v205 = (void *)v181;
        v140 = locationa;
      }
      else
      {
        v205 = v170;
      }

      ++v143;
    }
    while (v204 != v143);
    v68 = v192;
    v184 = v194;
    v185 = v198;
    v186 = v196;
  }
  else
  {
    v185 = 0;
    v184 = 0;
    v186 = 0;
  }
  if (objc_msgSend(v184, "count"))
    objc_storeStrong((id *)&self->_pendingCollisionPropertyIdentities, v184);
  if (objc_msgSend(v185, "count"))
    objc_storeStrong((id *)&self->_pendingPhaseTransitionPropertyIdentities, v185);
  if (objc_msgSend(v186, "count"))
    objc_storeStrong((id *)&self->_pendingSteadyPropertyIdentities, v186);
  v187 = (void *)objc_msgSend(v205, "copyByUpdatingContainerViewDescriptions:", v199);

  v188 = v187;
  return v188;
}

- (double)_progressMilestoneForTransitionPhase:(int64_t)a3
{
  double v3;
  void *v4;
  double v5;

  if (a3 == -2)
  {
    objc_msgSend((id)objc_opt_class(), "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundsCompensatingPhaseChangeProgress");
    goto LABEL_5;
  }
  v3 = 0.0;
  if (a3 == -3)
  {
    objc_msgSend((id)objc_opt_class(), "settings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "boundsCollapsingPhaseChangeProgress");
LABEL_5:
    v3 = v5;

  }
  return v3;
}

- (UIEdgeInsets)_overshootOutsetsTargetingContainerDescription:(id)a3 initialContainerDescription:(id)a4 settings:(id)a5 context:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  NSObject *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  void *v53;
  void *v54;
  unint64_t v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  uint64_t v65;
  void *v66;
  double v67;
  CGFloat aRect;
  CGFloat width;
  CGFloat y;
  CGFloat height;
  CGFloat x;
  double v73;
  double v74;
  double v75;
  uint8_t buf[4];
  uint64_t v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  void *v83;
  __int16 v84;
  void *v85;
  uint64_t v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  NSRect v97;
  NSRect v98;
  UIEdgeInsets result;
  CGRect v100;
  CGRect v101;

  v86 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v75 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v73 = *MEMORY[0x1E0CEB4B0];
  v74 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  objc_msgSend(v11, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v10, "bounds");
  height = v87.size.height;
  x = v87.origin.x;
  width = v87.size.width;
  y = v87.origin.y;
  v100.origin.x = v16;
  v100.origin.y = v18;
  aRect = v20;
  v100.size.width = v20;
  v100.size.height = v22;
  if (CGRectContainsRect(v87, v100))
    goto LABEL_5;
  v67 = v14;
  SBLogSystemAperturePreferencesStackSettling();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v65 = objc_msgSend(v13, "queryIteration");
    v97.origin.x = v16;
    v97.origin.y = v18;
    v97.size.width = v20;
    v97.size.height = v22;
    NSStringFromRect(v97);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v98.size.height = height;
    v98.origin.x = x;
    v98.size.width = width;
    v98.origin.y = y;
    NSStringFromRect(v98);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "associatedSystemApertureElementIdentity");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "elementIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "interfaceElementIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134350082;
    v77 = v65;
    v78 = 2112;
    v79 = v58;
    v80 = 2112;
    v81 = v59;
    v82 = 2112;
    v83 = v60;
    v84 = 2112;
    v85 = v61;
    _os_log_debug_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEBUG, "[%{public}lu] initial:(%@) target:(%@) '%@' -> %@", buf, 0x34u);

  }
  objc_msgSend(v12, "dampingRatio");
  -[SBSASettlingBehaviorProvider _overshootFractionForDampingRatio:](self, "_overshootFractionForDampingRatio:");
  if ((BSFloatIsZero() & 1) != 0)
  {
LABEL_5:
    v24 = v73;
  }
  else
  {
    objc_msgSend(v10, "boundsVelocity");
    v30 = v29;
    v63 = v31;
    v64 = v29;
    v32 = v31;
    v34 = v33;
    v62 = v33;
    v36 = v35;
    v88.origin.x = v16;
    v88.origin.y = v18;
    v88.size.height = v22;
    v88.size.width = aRect;
    CGRectGetMaxX(v88);
    v89.size.width = width;
    v89.origin.y = y;
    v89.size.height = height;
    v89.origin.x = x;
    CGRectGetMaxX(v89);
    v90.origin.x = v30;
    v90.origin.y = v32;
    v90.size.width = v34;
    v90.size.height = v36;
    CGRectGetWidth(v90);
    v91.origin.y = v18;
    v91.origin.x = v16;
    v91.size.width = aRect;
    v91.size.height = v22;
    CGRectGetMaxY(v91);
    v92.origin.x = x;
    v92.origin.y = y;
    v92.size.width = width;
    v92.size.height = height;
    CGRectGetMaxY(v92);
    v93.origin.y = v63;
    v93.origin.x = v64;
    v93.size.width = v62;
    v93.size.height = v36;
    CGRectGetHeight(v93);
    objc_msgSend(v13, "displayScale", *(_QWORD *)&v18);
    BSFloatRoundForScale();
    v38 = v37;
    BSFloatRoundForScale();
    v40 = v39;
    v94.origin.x = x;
    v94.origin.y = y;
    v94.size.width = width;
    v94.size.height = height;
    CGRectGetWidth(v94);
    v95.origin.x = x;
    v95.origin.y = y;
    v95.size.width = width;
    v95.size.height = height;
    CGRectGetHeight(v95);
    BSRectWithSize();
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v48 = v47;
    objc_msgSend(v13, "inertContainerFrame");
    BSRectWithSize();
    v101.origin.x = v49;
    v101.origin.y = v50;
    v101.size.width = v51;
    v101.size.height = v52;
    v96.origin.x = v42;
    v96.origin.y = v44;
    v96.size.width = v46;
    v96.size.height = v48;
    v14 = v67;
    v24 = v73;
    if (!CGRectContainsRect(v96, v101))
    {
      objc_msgSend(v13, "elementContexts");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      SBSAElementContextAssociatedWithContainerViewDescription(v11, v53, 0);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      v55 = objc_msgSend(v54, "interfaceOrientation");
      v56 = v38 * -2.0;
      if (v55 == 3)
        v57 = v38 * -2.0;
      else
        v57 = -v38;
      if (v55 == 4)
        v57 = -v38;
      else
        v56 = -v38;
      if (v55 < 3)
        v57 = -v38;
      v74 = v57;
      v75 = -v40;
      if (v55 >= 3)
        v14 = v56;
      else
        v14 = -v38;
      if (v55 >= 3)
        v24 = -v40;
      else
        v24 = v40 * -2.0;

    }
  }

  v25 = v24;
  v26 = v14;
  v28 = v74;
  v27 = v75;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (id)_fluidBehaviorSettingsForTransitionPhase:(int64_t)a3 forElementContext:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = objc_msgSend(a4, "systemApertureCustomLayoutCustomAnimationStyle");
  objc_msgSend((id)objc_opt_class(), "settings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 == 3)
  {
    objc_msgSend(v6, "jindoBoundsOval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "inertInterfaceElementTransitionSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "boundsBehaviorSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a3 == -2)
  {
    objc_msgSend((id)objc_opt_class(), "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inertCompensatingInterfaceElementTransitionSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a3 == -3 && v5 != 3)
  {
    objc_msgSend((id)objc_opt_class(), "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "inertCollapsingInterfaceElementTransitionSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    v12 = v11;
    objc_msgSend(v11, "boundsBehaviorSettings");
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }
  return v8;
}

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  id v14;

  v14 = a2;
  if (!v14)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1 + 32;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(v10 + 8);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v9, v8, CFSTR("SBSASettlingBehaviorProvider.m"), 152, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setCollisionImminent:", 1);
}

uint64_t __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_28(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "interfaceElementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "interfaceElementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  return v5;
}

uint64_t __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_32(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "interfaceElementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "interfaceElementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = BSEqualObjects();

  return v5;
}

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  Class v11;
  objc_class *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  CGFloat v28;
  CGFloat v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform buf;
  uint64_t v39;
  CGPoint v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSASettlingBehaviorProvider.m"), 266, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18 - (*(double *)(a1 + 64) + *(double *)(a1 + 80));
  v21 = v20 - (*(double *)(a1 + 56) + *(double *)(a1 + 72));
  objc_msgSend(v7, "setBounds:", v14, v16, v19, v21);
  SBLogSystemAperturePreferencesStackSettling();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v30 = objc_msgSend(*(id *)(a1 + 40), "queryIteration");
    objc_msgSend(v7, "interfaceElementIdentifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v43.origin.x = v15;
    v43.origin.y = v17;
    v43.size.width = v19;
    v43.size.height = v21;
    NSStringFromCGRect(v43);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.a) = 134349570;
    *(_QWORD *)((char *)&buf.a + 4) = v30;
    WORD2(buf.b) = 2112;
    *(_QWORD *)((char *)&buf.b + 6) = v31;
    HIWORD(buf.c) = 2112;
    *(_QWORD *)&buf.d = v32;
    _os_log_debug_impl(&dword_1D0540000, v22, OS_LOG_TYPE_DEBUG, "[%{public}lu] Updated bounds for container description '%@': %@", (uint8_t *)&buf, 0x20u);

  }
  objc_msgSend(v7, "center");
  v24 = v23 + (*(double *)(a1 + 64) - *(double *)(a1 + 80)) * 0.5;
  v26 = v25 + (*(double *)(a1 + 56) - *(double *)(a1 + 72)) * 0.5;
  objc_msgSend(v7, "setCenter:", v24, v26);
  SBLogSystemAperturePreferencesStackSettling();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v33 = objc_msgSend(*(id *)(a1 + 40), "queryIteration");
    objc_msgSend(v7, "interfaceElementIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40.x = v24;
    v40.y = v26;
    NSStringFromCGPoint(v40);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.a) = 134349570;
    *(_QWORD *)((char *)&buf.a + 4) = v33;
    WORD2(buf.b) = 2112;
    *(_QWORD *)((char *)&buf.b + 6) = v34;
    HIWORD(buf.c) = 2112;
    *(_QWORD *)&buf.d = v35;
    _os_log_debug_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEBUG, "[%{public}lu] Updated center for container description '%@': %@", (uint8_t *)&buf, 0x20u);

  }
  memset(&buf, 0, sizeof(buf));
  objc_msgSend(v7, "contentScale");
  SBSAAffineTransformFromContentScale((uint64_t)&buf, v28, v29);
  v36 = buf;
  CGAffineTransformInvert(&v37, &v36);
  v41.origin.x = v15;
  v41.origin.y = v17;
  v41.size.width = v19;
  v41.size.height = v21;
  v42 = CGRectApplyAffineTransform(v41, &v37);
  objc_msgSend(v7, "setContentBounds:", v42.origin.x, v42.origin.y, v42.size.width, v42.size.height);
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");

}

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_56(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  Class v10;
  objc_class *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (!v13)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[7];
    v9 = a1[4];
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSASettlingBehaviorProvider.m"), 319, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "addMilestones:forPropertyIdentity:", a1[5], a1[6]);
}

- (void)_setActivePhase:(int64_t)a3 context:(id)a4 logReason:(id)a5
{
  id v8;
  __CFString *v9;
  int64_t activePhase;
  NSObject *v11;
  _BOOL4 v12;
  uint64_t v13;
  int64_t v14;
  const __CFString *v15;
  uint64_t v16;
  int64_t v17;
  const __CFString *v18;
  const char *v19;
  NSObject *v20;
  uint32_t v21;
  const __CFString *v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (__CFString *)a5;
  activePhase = self->_activePhase;
  SBLogSystemAperturePreferencesStackSettling();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (activePhase == a3)
  {
    if (v12)
    {
      v13 = objc_msgSend(v8, "queryIteration");
      v14 = self->_activePhase + 3;
      if (v14 != 3 && self->_activePhase < 0xFFFFFFFFFFFFFFFDLL)
        v15 = CFSTR("[invalid]");
      else
        v15 = off_1E8EBC060[v14];
      v23 = 134349570;
      v24 = v13;
      v25 = 2112;
      v26 = v15;
      v27 = 2112;
      v28 = v9;
      v19 = "[%{public}lu] (%@) Active Phase Not updated: %@";
      v20 = v11;
      v21 = 32;
LABEL_16:
      _os_log_debug_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEBUG, v19, (uint8_t *)&v23, v21);
    }
  }
  else if (v12)
  {
    v16 = objc_msgSend(v8, "queryIteration");
    v17 = self->_activePhase + 3;
    if (v17 != 3 && self->_activePhase < 0xFFFFFFFFFFFFFFFDLL)
      v18 = CFSTR("[invalid]");
    else
      v18 = off_1E8EBC060[v17];
    if (a3 != 0 && (unint64_t)a3 < 0xFFFFFFFFFFFFFFFDLL)
      v22 = CFSTR("[invalid]");
    else
      v22 = off_1E8EBC060[a3 + 3];
    v23 = 134349826;
    v24 = v16;
    v25 = 2112;
    v26 = v18;
    v27 = 2112;
    v28 = v22;
    v29 = 2112;
    v30 = v9;
    v19 = "[%{public}lu] (%@) -> (%@) Active Phase Updated: %@";
    v20 = v11;
    v21 = 42;
    goto LABEL_16;
  }

  self->_activePhase = a3;
}

- (double)_overshootFractionForDampingRatio:(double)a3
{
  if (BSFloatLessThanFloat())
    return exp(a3 * -3.14159265 / sqrt(1.0 - a3 * a3));
  else
    return 0.0;
}

- (UIEdgeInsets)_overshootOutsetsForTransitionPhase:(int64_t)a3 baseOutsets:(UIEdgeInsets)a4 elementContext:(id)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;
  void *v11;
  unint64_t v12;
  double v13;
  double v14;
  unint64_t v15;
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
  double v26;
  UIEdgeInsets result;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = a5;
  v11 = v10;
  if ((unint64_t)(a3 + 1) < 2)
  {
    top = *MEMORY[0x1E0CEB4B0];
    left = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    bottom = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    right = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  }
  else if (a3 == -2)
  {
    v15 = objc_msgSend(v10, "interfaceOrientation");
    v16 = top + top;
    v17 = bottom + bottom;
    v18 = right + left;
    v19 = left + right;
    if (v15 == 3)
      v20 = 0.0;
    else
      v20 = right;
    if (v15 == 3)
      v21 = bottom + bottom;
    else
      v21 = bottom;
    if (v15 == 3)
    {
      v22 = top + top;
    }
    else
    {
      v19 = left;
      v22 = top;
    }
    if (v15 == 4)
    {
      v19 = 0.0;
    }
    else
    {
      v18 = v20;
      v17 = v21;
      v16 = v22;
    }
    if (v15 >= 3)
      right = v18;
    else
      right = right + right;
    if (v15 >= 3)
      bottom = v17;
    else
      bottom = bottom + top;
    if (v15 >= 3)
      left = v19;
    else
      left = left + left;
    if (v15 >= 3)
      top = v16;
    else
      top = 0.0;
  }
  else if (a3 == -3)
  {
    v12 = objc_msgSend(v10, "interfaceOrientation");
    v13 = right * 0.5;
    v14 = left * 0.5;
    if (v12 != 3)
      v14 = left;
    if (v12 == 4)
      v14 = left;
    else
      v13 = right;
    if (v12 < 3)
      bottom = 0.0;
    else
      right = v13;
    if (v12 >= 3)
      left = v14;
  }

  v23 = top;
  v24 = left;
  v25 = bottom;
  v26 = right;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackContainerInterfaceElementIdentifiersToBounds, 0);
  objc_storeStrong((id *)&self->_pendingSteadyPropertyIdentities, 0);
  objc_storeStrong((id *)&self->_pendingCollisionPropertyIdentities, 0);
  objc_storeStrong((id *)&self->_pendingPhaseTransitionPropertyIdentities, 0);
  objc_storeStrong((id *)&self->_containerIDsToOvershootOutsets, 0);
  objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, 0);
}

- (void)preferencesFromContext:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] Steady state – recalculating overshoot outsets", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)preferencesFromContext:(void *)a1 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] Collision imminent", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)preferencesFromContext:(uint64_t)a1 .cold.3(uint64_t a1, void *a2)
{
  uint64_t *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_2_21(a1, a2);
  *v3 = 134349056;
  *v2 = v4;
  OUTLINED_FUNCTION_3_16(&dword_1D0540000, v5, v6, "[%{public}lu] Steady state reached");
  OUTLINED_FUNCTION_3_6();
}

- (void)preferencesFromContext:(uint64_t)a1 .cold.4(uint64_t a1, void *a2)
{
  uint64_t *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_2_21(a1, a2);
  *v3 = 134349056;
  *v2 = v4;
  OUTLINED_FUNCTION_3_16(&dword_1D0540000, v5, v6, "[%{public}lu] Collision threshold reached (collapsing)");
  OUTLINED_FUNCTION_3_6();
}

- (void)preferencesFromContext:(void *)a1 .cold.5(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_0(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] New transition", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

void __55__SBSASettlingBehaviorProvider_preferencesFromContext___block_invoke_44_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "queryIteration");
  OUTLINED_FUNCTION_3();
  v6 = 2112;
  v7 = v4;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "[%{public}lu] Added pending phase transition property ID: %@", v5, 0x16u);
  OUTLINED_FUNCTION_2_2();
}

@end
