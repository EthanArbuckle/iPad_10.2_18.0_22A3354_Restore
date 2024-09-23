@implementation SBSAKeyLinePreferencesProvider

- (id)preferencesFromContext:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  unint64_t mitosisSuppressionState;
  int64_t v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  void *v35;
  SBSAInterfaceElementPropertyIdentity *v36;
  SBSAInterfaceElementPropertyIdentity *v37;
  uint64_t v38;
  void *pendingMitosisKeyLineSuppressionUnhidePropertyIdentity;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  int v46;
  double v47;
  SBSAInterfaceElementPropertyIdentity *v48;
  NSObject *v49;
  NSObject *v50;
  unint64_t v51;
  const __CFString *v52;
  const __CFString *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  unsigned int v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  BOOL v79;
  uint64_t v80;
  uint64_t v81;
  NSObject *v82;
  __CFString *v83;
  __CFString *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t m;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  unint64_t v96;
  uint64_t v97;
  void *v98;
  void *v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  id v106;
  uint64_t v107;
  id v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  id v118;
  void *v119;
  id v120;
  void *v122;
  Class v123;
  objc_class *v124;
  void *v125;
  void *v126;
  id v127;
  SEL v128;
  void *v129;
  id v130;
  uint64_t v131;
  SBSAKeyLinePreferencesProvider *v132;
  id v133;
  uint64_t v134;
  void *v135;
  id obj;
  void *v137;
  objc_super v138;
  _QWORD v139[5];
  id v140;
  SEL v141;
  _QWORD v142[7];
  _QWORD v143[5];
  id v144;
  SEL v145;
  _QWORD v146[5];
  id v147;
  id v148;
  id v149;
  SEL v150;
  _QWORD v151[4];
  id v152;
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
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _QWORD v169[6];
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[128];
  _BYTE v175[128];
  uint8_t v176[128];
  uint8_t buf[4];
  const __CFString *v178;
  __int16 v179;
  const __CFString *v180;
  _BYTE v181[128];
  _BYTE v182[128];
  uint64_t v183;

  v183 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
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
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = NSClassFromString(CFSTR("SBSAContext"));
      v124 = (objc_class *)objc_opt_class();
      NSStringFromClass(v124);
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAKeyLinePreferencesProvider.m"), 54, CFSTR("Unexpected class – expected '%@', got '%@'"), v123, v125);

    }
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v9, "preferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = v10;
  v127 = v5;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v130 = v13;

  objc_msgSend(v9, "elementContexts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v170 = 0u;
  v171 = 0u;
  v172 = 0u;
  v173 = 0u;
  obj = v14;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v170, v182, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v171;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v171 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * i);
        objc_msgSend(v20, "elementIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "keyColor");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v15, "setObject:forKey:", v22, v21);

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v170, v182, 16);
    }
    while (v17);
  }

  v23 = objc_msgSend(v130, "isBlobEnabled");
  v24 = objc_msgSend(v9, "containsAnyOfSignals:", 1);
  objc_msgSend(v9, "preferences");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "lastChangingElementLayoutTransition");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v126 = v26;
  if ((BSEqualObjects() & 1) != 0)
  {
    v27 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, v26);
    objc_msgSend(v26, "initialElementContexts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v28, "count") > 1)
    {
      v27 = 0;
    }
    else
    {
      objc_msgSend(v26, "targetElementContexts");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v29, "count") == 2;

    }
  }
  v135 = v9;
  mitosisSuppressionState = self->_mitosisSuppressionState;
  v132 = self;
  v128 = a2;
  v129 = v15;
  if (!v23)
  {
    if (mitosisSuppressionState == 2)
    {
      SBLogSystemApertureController();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v49, OS_LOG_TYPE_DEFAULT, "Key Line: Mitosis restoration milestone not hit! Falling back to visible.", buf, 2u);
      }

    }
    v31 = 0;
    pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity;
    self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = 0;
    goto LABEL_59;
  }
  if (mitosisSuppressionState <= 1)
    v31 = 1;
  else
    v31 = self->_mitosisSuppressionState;
  if ((v24 | v27) == 1)
  {
    v32 = !mitosisSuppressionState && v27;
    if (mitosisSuppressionState == 1 || v32)
    {
      objc_msgSend(v130, "containerViewDescriptions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "interfaceElementIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:]([SBSAInterfaceElementPropertyIdentity alloc], "initWithAssociatedInterfaceElementIdentifier:andProperty:", v35, CFSTR("bounds"));
      v37 = self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity;
      self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = v36;

      v169[0] = MEMORY[0x1E0C809B0];
      v169[1] = 3221225472;
      v169[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke;
      v169[3] = &unk_1E8E9E9D0;
      v169[5] = a2;
      v169[4] = self;
      v38 = objc_msgSend(v130, "copyWithBlock:", v169);

      mitosisSuppressionState = self->_mitosisSuppressionState;
      v31 = 2;
      v130 = (id)v38;
    }
  }
  if (mitosisSuppressionState == 2 && self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity)
  {
    v167 = 0u;
    v168 = 0u;
    v165 = 0u;
    v166 = 0u;
    objc_msgSend(v9, "animatedTransitionResults");
    pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(pendingMitosisKeyLineSuppressionUnhidePropertyIdentity, "countByEnumeratingWithState:objects:count:", &v165, v181, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v166;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v166 != v42)
            objc_enumerationMutation(pendingMitosisKeyLineSuppressionUnhidePropertyIdentity);
          v44 = *(void **)(*((_QWORD *)&v165 + 1) + 8 * j);
          objc_msgSend(v44, "associatedInterfaceElementPropertyIdentity");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqual:", v132->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity);

          if (v46)
          {
            objc_msgSend(v44, "targetedMilestone");
            if (v47 >= 0.7)
            {
              v48 = v132->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity;
              v132->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity = 0;

              v31 = 3;
            }
          }
        }
        v41 = objc_msgSend(pendingMitosisKeyLineSuppressionUnhidePropertyIdentity, "countByEnumeratingWithState:objects:count:", &v165, v181, 16);
      }
      while (v41);
      self = v132;
    }
LABEL_59:

  }
  if (v31 != self->_mitosisSuppressionState)
  {
    SBLogSystemApertureController();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      v51 = self->_mitosisSuppressionState - 1;
      if (v51 > 2)
        v52 = CFSTR("idle");
      else
        v52 = off_1E8EA4250[v51];
      if ((unint64_t)(v31 - 1) > 2)
        v53 = CFSTR("idle");
      else
        v53 = off_1E8EA4250[v31 - 1];
      *(_DWORD *)buf = 138543618;
      v178 = v52;
      v179 = 2114;
      v180 = v53;
      _os_log_impl(&dword_1D0540000, v50, OS_LOG_TYPE_DEFAULT, "Key Line: Updating mitosis suppression state: (%{public}@) -> (%{public}@)", buf, 0x16u);
    }

    self->_mitosisSuppressionState = v31;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = 0u;
  v162 = 0u;
  v163 = 0u;
  v164 = 0u;
  objc_msgSend(v130, "containerViewDescriptions");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v161, v176, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v162;
    do
    {
      for (k = 0; k != v56; ++k)
      {
        if (*(_QWORD *)v162 != v57)
          objc_enumerationMutation(v54);
        v59 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * k);
        objc_msgSend(v59, "associatedSystemApertureElementIdentity");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "elementIdentifier");
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        SBSAElementContextAssociatedWithContainerViewDescription(v59, obj, 0);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        if (v62)
        {
          v63 = self->_mitosisSuppressionState - 1;
          objc_msgSend(v59, "bounds");
          objc_msgSend(v59, "center");
          SBUnintegralizedRectCenteredAboutPoint();
          objc_msgSend(v135, "inertContainerFrame");
          v64 = SBSARectApproximatelyEqualToRect() ^ 1;
          if (v63 > 1)
            v65 = v64;
          else
            v65 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v65, 0x3F847AE147AE147BLL);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "setObject:forKey:", v66, v61);

        }
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v161, v176, 16);
    }
    while (v56);
  }

  v159 = 0u;
  v160 = 0u;
  v157 = 0u;
  v158 = 0u;
  objc_msgSend(v135, "containerViewDescriptions");
  v133 = (id)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v157, v175, 16);
  if (v67)
  {
    v68 = v67;
    v69 = 0;
    v70 = *(_QWORD *)v158;
    v134 = 2;
    do
    {
      v71 = 0;
      v131 = v69;
      v72 = -v69;
      do
      {
        if (*(_QWORD *)v158 != v70)
          objc_enumerationMutation(v133);
        v73 = *(void **)(*((_QWORD *)&v157 + 1) + 8 * v71);
        objc_msgSend(v73, "associatedSystemApertureElementIdentity");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "elementIdentifier");
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72 == v71)
          v76 = objc_msgSend(v135, "isKeyLineRequiredForTransition");
        else
          v76 = 0;
        objc_msgSend(v137, "objectForKey:", v75);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "isEqualToNumber:", &unk_1E91D03B0);

        if (v78)
          v79 = v76 == 0;
        else
          v79 = 0;
        if (!v79)
        {
          v80 = objc_msgSend(v73, "sampledBackgroundLuminanceLevel");
          v81 = v134;
          if (v80 == 1)
            v81 = 1;
          v134 = v81;
        }

        ++v71;
      }
      while (v68 != v71);
      v69 = v131 + v68;
      v68 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v157, v175, 16);
    }
    while (v68);
  }
  else
  {
    v134 = 2;
  }

  if (v132->_lastKnownConsensusBackgroundLuma != v134)
  {
    SBLogSystemApertureController();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      SBStringFromSystemApertureBackgroundLuminanceLevel(v132->_lastKnownConsensusBackgroundLuma);
      v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
      SBStringFromSystemApertureBackgroundLuminanceLevel(v134);
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v178 = v83;
      v179 = 2114;
      v180 = v84;
      _os_log_impl(&dword_1D0540000, v82, OS_LOG_TYPE_DEFAULT, "Key Line: Updating consensus background luma (%{public}@) -> (%{public}@)", buf, 0x16u);

    }
    v132->_lastKnownConsensusBackgroundLuma = v134;
  }
  if (v134 == 2)
  {
    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v85 = (void *)objc_msgSend(v137, "copy");
    v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v153, v174, 16);
    if (v86)
    {
      v87 = v86;
      v88 = *(_QWORD *)v154;
      do
      {
        for (m = 0; m != v87; ++m)
        {
          if (*(_QWORD *)v154 != v88)
            objc_enumerationMutation(v85);
          v90 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * m);
          objc_msgSend(v137, "objectForKey:", v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v91, "integerValue");

          if (v92 == 1)
            objc_msgSend(v137, "setObject:forKey:", &unk_1E91D03C8, v90);
        }
        v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v153, v174, 16);
      }
      while (v87);
    }

  }
  objc_msgSend(v130, "containerViewDescriptions");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)objc_msgSend(v93, "mutableCopy");

  v95 = obj;
  if (objc_msgSend(obj, "count"))
  {
    v96 = 0;
    v97 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v95, "objectAtIndex:", v96);
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v98, "elementIdentifier");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v151[0] = v97;
      v151[1] = 3221225472;
      v151[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_23;
      v151[3] = &unk_1E8EA41E0;
      v100 = v98;
      v152 = v100;
      v101 = objc_msgSend(v94, "indexOfObjectPassingTest:", v151);
      if (v101 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v102 = v101;
        objc_msgSend(v94, "objectAtIndexedSubscript:", v101);
        v103 = objc_claimAutoreleasedReturnValue();
        if (v103)
        {
          v104 = (void *)v103;
          v146[0] = v97;
          v146[1] = 3221225472;
          v146[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_2;
          v146[3] = &unk_1E8EA4208;
          v150 = v128;
          v146[4] = v132;
          v147 = v137;
          v148 = v99;
          v149 = v129;
          v105 = (void *)objc_msgSend(v104, "copyWithBlock:", v146);

          v143[0] = v97;
          v143[1] = 3221225472;
          v143[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_3;
          v143[3] = &unk_1E8EA4230;
          v144 = v105;
          v145 = v128;
          v143[4] = v132;
          v106 = v105;
          v107 = objc_msgSend(v130, "copyWithBlock:", v143);

          objc_msgSend(v94, "replaceObjectAtIndex:withObject:", v102, v106);
          v130 = (id)v107;
        }
      }

      ++v96;
      v95 = obj;
    }
    while (v96 < objc_msgSend(obj, "count"));
  }
  objc_msgSend(v94, "firstObject");
  v108 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v135, "isKeyLineRequiredForTransition") & 1) != 0)
  {
    v110 = v126;
    v109 = v127;
    if (!objc_msgSend(v108, "keyLineMode") && v108)
    {
      v111 = MEMORY[0x1E0C809B0];
      v142[0] = MEMORY[0x1E0C809B0];
      v142[1] = 3221225472;
      v142[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_4;
      v142[3] = &unk_1E8EA2CC8;
      v142[4] = v132;
      v142[5] = v128;
      v142[6] = v134;
      v112 = (void *)objc_msgSend(v108, "copyWithBlock:", v142);

      v139[0] = v111;
      v139[1] = 3221225472;
      v139[2] = __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_5;
      v139[3] = &unk_1E8EA4230;
      v141 = v128;
      v139[4] = v132;
      v108 = v112;
      v140 = v108;
      v113 = objc_msgSend(v130, "copyWithBlock:", v139);

      objc_msgSend(v94, "replaceObjectAtIndex:withObject:", 0, v108);
      v130 = (id)v113;
    }
  }
  else
  {
    v110 = v126;
    v109 = v127;
  }
  v114 = (void *)objc_msgSend(v130, "copyByUpdatingContainerViewDescriptions:", v94);

  v115 = (void *)objc_msgSend(v135, "copyByUpdatingPreferences:", v114);
  v138.receiver = v132;
  v138.super_class = (Class)SBSAKeyLinePreferencesProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v138, sel_preferencesFromContext_, v115);
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = objc_opt_class();
  v118 = v116;
  if (v117)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v119 = v118;
    else
      v119 = 0;
  }
  else
  {
    v119 = 0;
  }
  v120 = v119;

  return v120;
}

- (id)behaviorSettingsForProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    objc_msgSend((id)objc_opt_class(), "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyLineStyleTransition");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSAKeyLinePreferencesProvider;
    -[SBSABasePreferencesProvider behaviorSettingsForProperty:](&v8, sel_behaviorSettingsForProperty_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
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
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAKeyLinePreferencesProvider.m"), 106, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E91CF658);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addMilestones:forPropertyIdentity:", v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));

}

uint64_t __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_23(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "associatedSystemApertureElementIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
  id v16;

  v3 = a2;
  v16 = v3;
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v16;
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

    v3 = v16;
    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAKeyLinePreferencesProvider.m"), 200, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v16;
  }
  v7 = 0;
LABEL_10:

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", *(_QWORD *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyLineMode:", objc_msgSend(v14, "integerValue"));

  objc_msgSend(*(id *)(a1 + 56), "objectForKey:", *(_QWORD *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v7, "setKeyLineTintColor:", v15);

}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
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
  void *v13;
  SBSAInterfaceElementPropertyIdentity *v14;
  void *v15;
  SBSAInterfaceElementPropertyIdentity *v16;
  void *v17;
  SBSAInterfaceElementPropertyIdentity *v18;
  void *v19;
  SBSAInterfaceElementPropertyIdentity *v20;
  id v21;

  v21 = a2;
  if (!v21)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v21;
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
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAKeyLinePreferencesProvider.m"), 208, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  v13 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("keyLineMode"));
  v14 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v14, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v15, CFSTR("keyLineMode"));
  objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v13, v16, 0);

  v17 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("keyLineTintColor"));
  v18 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v18, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v19, CFSTR("keyLineTintColor"));
  objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v17, v20, 0);

}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_4(_QWORD *a1, void *a2)
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
  uint64_t v13;
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
    v9 = a1[4];
    v8 = a1[5];
    v10 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAKeyLinePreferencesProvider.m"), 222, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  if (a1[6] == 2)
    v13 = 2;
  else
    v13 = 1;
  objc_msgSend(v6, "setKeyLineMode:", v13);

}

void __57__SBSAKeyLinePreferencesProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
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
  void *v13;
  void *v14;
  void *v15;
  SBSAInterfaceElementPropertyIdentity *v16;
  void *v17;
  SBSAInterfaceElementPropertyIdentity *v18;
  void *v19;
  SBSAInterfaceElementPropertyIdentity *v20;
  void *v21;
  SBSAInterfaceElementPropertyIdentity *v22;
  id v23;

  v23 = a2;
  if (!v23)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v23;
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
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAKeyLinePreferencesProvider.m"), 228, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "keyLineAppearForSwoopTransition");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v14);
  v16 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v16, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v17, CFSTR("keyLineMode"));
  objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v15, v18, 0);

  v19 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v14);
  v20 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v20, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v21, CFSTR("keyLineTintColor"));
  objc_msgSend(v6, "setAnimatedTransitionDescription:forProperty:withMilestones:", v19, v22, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMitosisKeyLineSuppressionUnhidePropertyIdentity, 0);
  objc_storeStrong((id *)&self->_lastChangingElementLayoutTransition, 0);
}

@end
