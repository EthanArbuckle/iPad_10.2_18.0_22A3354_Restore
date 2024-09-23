@implementation SBSAContainerDynamicsInflateAnimationProvider

- (id)preferencesFromContext:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSMutableSet *elementIdentitiesWaitingToExpandBeforeInflation;
  NSMutableSet *v19;
  NSMutableSet *v20;
  NSMutableSet *elementIdentitiesThatFinishedWaitingToExpandBeforeInflation;
  NSMutableSet *v22;
  NSMutableSet *v23;
  NSMapTable *pendingMilestonePropertyIdentitiesToElementIdentities;
  NSMapTable *v25;
  NSMapTable *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  void *v36;
  int v37;
  void *v38;
  unint64_t j;
  void *v40;
  SBSAElementIdentification *v41;
  void *v42;
  SBSAElementIdentification *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t k;
  uint64_t v60;
  void *v61;
  char v62;
  id v63;
  void *v64;
  unint64_t m;
  id v66;
  SBSAElementIdentification *v67;
  void *v68;
  SBSAElementIdentification *v69;
  void *v70;
  void *v71;
  int v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  void *v81;
  id v82;
  uint64_t v83;
  NSObject *v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t n;
  SBSAElementIdentification *v94;
  NSObject *v95;
  uint64_t v96;
  NSSet *v97;
  NSSet *elementIdentitiesWithInflateApplied;
  id v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  uint64_t v104;
  id v105;
  void *v106;
  id v107;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  id obj;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  void *v125;
  objc_super v126;
  _QWORD v127[5];
  id v128;
  id v129;
  SEL v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  _QWORD v135[5];
  id v136;
  id v137;
  SEL v138;
  char v139;
  _QWORD v140[6];
  _QWORD v141[5];
  id v142;
  id v143;
  SEL v144;
  _QWORD v145[5];
  id v146;
  SEL v147;
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
  _BYTE v160[128];
  _BYTE buf[12];
  __int16 v162;
  SBSAElementIdentification *v163;
  _BYTE v164[128];
  _BYTE v165[128];
  _BYTE v166[128];
  uint64_t v167;

  v167 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v115 = v8;
  objc_msgSend(v8, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  objc_msgSend(v13, "containerViewDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "mutableCopy");

  v109 = v13;
  objc_msgSend(v13, "elementDescriptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = (void *)objc_msgSend(v16, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  elementIdentitiesWaitingToExpandBeforeInflation = self->_elementIdentitiesWaitingToExpandBeforeInflation;
  if (elementIdentitiesWaitingToExpandBeforeInflation)
  {
    v19 = elementIdentitiesWaitingToExpandBeforeInflation;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  }
  v20 = self->_elementIdentitiesWaitingToExpandBeforeInflation;
  self->_elementIdentitiesWaitingToExpandBeforeInflation = v19;

  elementIdentitiesThatFinishedWaitingToExpandBeforeInflation = self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation;
  if (elementIdentitiesThatFinishedWaitingToExpandBeforeInflation)
  {
    v22 = elementIdentitiesThatFinishedWaitingToExpandBeforeInflation;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  }
  v23 = self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation;
  self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation = v22;

  pendingMilestonePropertyIdentitiesToElementIdentities = self->_pendingMilestonePropertyIdentitiesToElementIdentities;
  v110 = v6;
  v111 = (void *)v17;
  v117 = (void *)v15;
  if (pendingMilestonePropertyIdentitiesToElementIdentities)
  {
    v25 = pendingMilestonePropertyIdentitiesToElementIdentities;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v25 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  }
  v26 = self->_pendingMilestonePropertyIdentitiesToElementIdentities;
  self->_pendingMilestonePropertyIdentitiesToElementIdentities = v25;

  -[SBSAContainerDynamicsInflateAnimationProvider _identitiesWithMilestoneReached:](self, "_identitiesWithMilestoneReached:", v115);
  v156 = 0u;
  v157 = 0u;
  v158 = 0u;
  v159 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v166, 16);
  if (v122)
  {
    v119 = *(_QWORD *)v157;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v157 != v119)
          objc_enumerationMutation(obj);
        v124 = v27;
        v28 = *(_QWORD *)(*((_QWORD *)&v156 + 1) + 8 * v27);
        v152 = 0u;
        v153 = 0u;
        v154 = 0u;
        v155 = 0u;
        -[NSMapTable keyEnumerator](self->_pendingMilestonePropertyIdentitiesToElementIdentities, "keyEnumerator");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "allObjects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v152, v165, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v153;
          do
          {
            for (i = 0; i != v32; ++i)
            {
              if (*(_QWORD *)v153 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v152 + 1) + 8 * i);
              -[NSMapTable objectForKey:](self->_pendingMilestonePropertyIdentitiesToElementIdentities, "objectForKey:", v35);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = SAElementIdentityEqualToIdentity();

              if (v37)
                -[NSMapTable removeObjectForKey:](self->_pendingMilestonePropertyIdentitiesToElementIdentities, "removeObjectForKey:", v35);
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v152, v165, 16);
          }
          while (v32);
        }

        -[NSMutableSet removeObject:](self->_elementIdentitiesWaitingToExpandBeforeInflation, "removeObject:", v28);
        -[NSMutableSet addObject:](self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation, "addObject:", v28);
        v27 = v124 + 1;
      }
      while (v124 + 1 != v122);
      v122 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v166, 16);
    }
    while (v122);
  }
  v38 = v117;
  if (objc_msgSend(v117, "count"))
  {
    for (j = 0; j < objc_msgSend(v117, "count"); ++j)
    {
      objc_msgSend(v38, "objectAtIndexedSubscript:", j);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = [SBSAElementIdentification alloc];
      objc_msgSend(v40, "associatedSystemApertureElementIdentity");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SBSAElementIdentification initWithElementIdentification:](v41, "initWithElementIdentification:", v42);

      objc_msgSend(v115, "elementContexts");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      SBSAElementContextAssociatedWithContainerViewDescription(v40, v44, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      v46 = objc_msgSend(v45, "activeDynamicAnimation");
      if (v46 == 2)
      {
        objc_msgSend(v111, "addObject:", v43);
        if (j)
          goto LABEL_57;
      }
      else
      {
        if (-[NSSet containsObject:](self->_elementIdentitiesWithInflateApplied, "containsObject:", v43))
          v47 = j == 0;
        else
          v47 = 0;
        if (!v47)
          goto LABEL_57;
      }
      objc_msgSend(v115, "preferences");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "lastChangingElementLayoutTransition");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "targetElementContexts");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "firstObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v49, "isTransitionToSingleCompact")
        || !SAElementIdentityEqualToIdentity())
      {

LABEL_53:
        if (v46 == 2)
          v52 = v116;
        else
          v52 = v114;
        objc_msgSend(v52, "addObject:", v43);
        goto LABEL_57;
      }
      if ((-[NSMutableSet containsObject:](self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation, "containsObject:", v43) & 1) == 0)-[NSMutableSet addObject:](self->_elementIdentitiesWaitingToExpandBeforeInflation, "addObject:", v43);
      if (-[NSMutableSet containsObject:](self->_elementIdentitiesWaitingToExpandBeforeInflation, "containsObject:", v43))
      {

      }
      else
      {
        v53 = -[NSMutableSet containsObject:](self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation, "containsObject:", v43);

        if (v53)
          goto LABEL_53;
      }
LABEL_57:

      v38 = v117;
    }
  }
  -[NSMutableSet intersectSet:](self->_elementIdentitiesWaitingToExpandBeforeInflation, "intersectSet:", v111);
  -[NSMutableSet intersectSet:](self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation, "intersectSet:", v111);
  v150 = 0u;
  v151 = 0u;
  v148 = 0u;
  v149 = 0u;
  -[NSMapTable keyEnumerator](self->_pendingMilestonePropertyIdentitiesToElementIdentities, "keyEnumerator");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "allObjects");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v148, v164, 16);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v149;
    do
    {
      for (k = 0; k != v57; ++k)
      {
        if (*(_QWORD *)v149 != v58)
          objc_enumerationMutation(v55);
        v60 = *(_QWORD *)(*((_QWORD *)&v148 + 1) + 8 * k);
        -[NSMapTable objectForKey:](self->_pendingMilestonePropertyIdentitiesToElementIdentities, "objectForKey:", v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v111, "containsObject:", v61);

        if ((v62 & 1) == 0)
          -[NSMapTable removeObjectForKey:](self->_pendingMilestonePropertyIdentitiesToElementIdentities, "removeObjectForKey:", v60);
      }
      v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v148, v164, 16);
    }
    while (v57);
  }

  v145[0] = MEMORY[0x1E0C809B0];
  v145[1] = 3221225472;
  v145[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke;
  v145[3] = &unk_1E8EA4230;
  v147 = a2;
  v145[4] = self;
  v63 = v115;
  v146 = v63;
  v121 = (void *)objc_msgSend(v109, "copyWithBlock:", v145);

  v64 = v117;
  v125 = v63;
  if (objc_msgSend(v117, "count"))
  {
    for (m = 0; m < objc_msgSend(v64, "count"); ++m)
    {
      objc_msgSend(v64, "objectAtIndexedSubscript:", m);
      v66 = (id)objc_claimAutoreleasedReturnValue();
      v67 = [SBSAElementIdentification alloc];
      objc_msgSend(v66, "associatedSystemApertureElementIdentity");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = -[SBSAElementIdentification initWithElementIdentification:](v67, "initWithElementIdentification:", v68);

      objc_msgSend(v63, "elementContexts");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      SBSAElementContextAssociatedWithContainerViewDescription(v66, v70, 0);
      v71 = (void *)objc_claimAutoreleasedReturnValue();

      v72 = objc_msgSend(v116, "containsObject:", v69);
      if (objc_msgSend(v114, "containsObject:", v69))
      {
        v73 = (objc_msgSend(v71, "systemApertureLayoutCustomizingOptions") & 1) == 0;
        if ((v72 & 1) != 0)
          goto LABEL_77;
      }
      else
      {
        v73 = 0;
        if ((v72 & 1) != 0)
          goto LABEL_77;
      }
      if (v73)
      {
LABEL_77:
        v123 = v71;
        objc_msgSend(v63, "elementContexts");
        v74 = v63;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        SBSAElementContextAssociatedWithContainerViewDescription(v66, v75, 0);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        *(_QWORD *)buf = 0x7FFFFFFFFFFFFFFFLL;
        SBSAElementDescriptionAssociatedWithElementIdentity(v76, v112, buf);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        if (v72)
        {
          v120 = v76;
          objc_msgSend(v116, "addObject:", v69);
          v78 = MEMORY[0x1E0C809B0];
          v141[0] = MEMORY[0x1E0C809B0];
          v141[1] = 3221225472;
          v141[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_2;
          v141[3] = &unk_1E8EA3798;
          v144 = a2;
          v141[4] = self;
          v142 = v66;
          v79 = v74;
          v80 = v78;
          v143 = v79;
          v66 = (id)objc_msgSend(v66, "copyWithBlock:", v141);
          objc_msgSend(v117, "replaceObjectAtIndex:withObject:", m, v66);
          if (v77)
          {
            v140[0] = v78;
            v140[1] = 3221225472;
            v140[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_3;
            v140[3] = &unk_1E8E9E9D0;
            v140[4] = self;
            v140[5] = a2;
            v81 = (void *)objc_msgSend(v77, "copyWithBlock:", v140);
            objc_msgSend(v112, "replaceObjectAtIndex:withObject:", *(_QWORD *)buf, v81);

          }
          v76 = v120;
        }
        else
        {
          v80 = MEMORY[0x1E0C809B0];
        }
        v135[0] = v80;
        v135[1] = 3221225472;
        v135[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_4;
        v135[3] = &unk_1E8EA6A38;
        v138 = a2;
        v135[4] = self;
        v139 = v72;
        v66 = v66;
        v136 = v66;
        v137 = v77;
        v82 = v77;
        v83 = objc_msgSend(v121, "copyWithBlock:", v135);

        v121 = (void *)v83;
        v64 = v117;
        v63 = v125;
        v71 = v123;
      }
      if (v73)
      {
        SBLogSystemAperturePreferencesStackDynamicsAnimations();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
        {
          v85 = objc_msgSend(v63, "queryIteration");
          *(_DWORD *)buf = 134349314;
          *(_QWORD *)&buf[4] = v85;
          v162 = 2112;
          v163 = v69;
          _os_log_debug_impl(&dword_1D0540000, v84, OS_LOG_TYPE_DEBUG, "[%{public}lu] [Inflate] Applying deflate to element:'%@'", buf, 0x16u);
        }

      }
    }
  }
  v86 = (void *)objc_msgSend(v116, "mutableCopy");
  v87 = v86;
  if (self->_elementIdentitiesWithInflateApplied)
  {
    objc_msgSend(v86, "minusSet:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "minusSet:", v88);

  }
  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v89 = v87;
  v90 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v131, v160, 16);
  if (v90)
  {
    v91 = v90;
    v92 = *(_QWORD *)v132;
    do
    {
      for (n = 0; n != v91; ++n)
      {
        if (*(_QWORD *)v132 != v92)
          objc_enumerationMutation(v89);
        v94 = *(SBSAElementIdentification **)(*((_QWORD *)&v131 + 1) + 8 * n);
        SBLogSystemAperturePreferencesStackDynamicsAnimations();
        v95 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
        {
          v96 = objc_msgSend(v125, "queryIteration");
          *(_DWORD *)buf = 134349314;
          *(_QWORD *)&buf[4] = v96;
          v162 = 2112;
          v163 = v94;
          _os_log_debug_impl(&dword_1D0540000, v95, OS_LOG_TYPE_DEBUG, "[%{public}lu] [Inflate] Applying inflate to element:'%@'", buf, 0x16u);
        }

      }
      v91 = objc_msgSend(v89, "countByEnumeratingWithState:objects:count:", &v131, v160, 16);
    }
    while (v91);
  }

  v97 = (NSSet *)objc_msgSend(v116, "copy");
  elementIdentitiesWithInflateApplied = self->_elementIdentitiesWithInflateApplied;
  self->_elementIdentitiesWithInflateApplied = v97;

  v127[0] = MEMORY[0x1E0C809B0];
  v127[1] = 3221225472;
  v127[2] = __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_34;
  v127[3] = &unk_1E8EA3798;
  v130 = a2;
  v127[4] = self;
  v99 = v117;
  v128 = v99;
  v100 = v112;
  v129 = v100;
  v101 = (void *)objc_msgSend(v121, "copyWithBlock:", v127);

  v102 = (void *)objc_msgSend(v125, "copyByUpdatingPreferences:", v101);
  v126.receiver = self;
  v126.super_class = (Class)SBSAContainerDynamicsInflateAnimationProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v126, sel_preferencesFromContext_, v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  v104 = objc_opt_class();
  v105 = v103;
  if (v104)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v106 = v105;
    else
      v106 = 0;
  }
  else
  {
    v106 = 0;
  }
  v107 = v106;

  if (!objc_msgSend(v111, "count"))
    -[SBSABasePreferencesProvider removeFromParentProvider](self, "removeFromParentProvider");

  return v107;
}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke(uint64_t *a1, void *a2)
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
    v8 = a1[6];
    v9 = a1[4];
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAContainerDynamicsInflateAnimationProvider.m"), 113, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend((id)a1[4], "_addMilestonesIfNecessaryForUntrackedBoundsExpansionsForElementIdentities:preferencesMutator:context:", *(_QWORD *)(a1[4] + 48), v6, a1[5]);
}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
  void *v26;
  double v27;
  CGFloat v28;
  void *v29;
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
  __int128 v43;
  __int128 v44;

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
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerDynamicsInflateAnimationProvider.m"), 130, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  v43 = 0u;
  v44 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(*(id *)(a1 + 40), "center");
  v23 = v22;
  v25 = v24;
  objc_msgSend((id)objc_opt_class(), "settings");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "inflateAnimationScale");
  v28 = v27;
  objc_msgSend((id)objc_opt_class(), "settings");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "inflateVerticalOffsetProportion");
  SBSAScaledAndClippedFrameByScalingLeadingTrailingViews((CGFloat *)&v43, *(void **)(a1 + 48), v15, v17, v19, v21, v23, v25, v28, v30);

  BSRectWithSize();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  UIRectGetCenter();
  v40 = v39;
  v42 = v41;
  objc_msgSend(v7, "setBounds:", v32, v34, v36, v38);
  objc_msgSend(v7, "setCenter:", v40, v42);
  objc_msgSend(v7, "setContentBounds:", v43, v44);
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");

}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
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
  double v14;
  double v15;
  id v16;

  v16 = a2;
  if (!v16)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;
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
    v10 = NSClassFromString(CFSTR("SBSAElementDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAContainerDynamicsInflateAnimationProvider.m"), 143, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inflateAnimationContentScale");
  v15 = v14;

  objc_msgSend(v6, "setLeadingViewScale:", v15, v15);
  objc_msgSend(v6, "setTrailingViewScale:", v15, v15);
  objc_msgSend(v6, "setMinimalViewScale:", v15, v15);

}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_4(uint64_t a1, void *a2)
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
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SBSAInterfaceElementPropertyIdentity *v19;
  void *v20;
  SBSAInterfaceElementPropertyIdentity *v21;
  void *v22;
  SBSAInterfaceElementPropertyIdentity *v23;
  void *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  SBSAInterfaceElementPropertyIdentity *v26;
  void *v27;
  SBSAInterfaceElementPropertyIdentity *v28;
  SBSAInterfaceElementPropertyIdentity *v29;
  void *v30;
  SBSAInterfaceElementPropertyIdentity *v31;
  SBSAInterfaceElementPropertyIdentity *v32;
  void *v33;
  SBSAInterfaceElementPropertyIdentity *v34;
  SBSAInterfaceElementPropertyIdentity *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SBSAInterfaceElementPropertyIdentity *v40;
  SBSAInterfaceElementPropertyIdentity *v41;
  void *v42;
  SBSAInterfaceElementPropertyIdentity *v43;
  id v44;

  v3 = a2;
  v44 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v44;
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

  v3 = v44;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerDynamicsInflateAnimationProvider.m"), 153, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v44;
LABEL_9:
    v7 = 0;
  }

  v14 = *(unsigned __int8 *)(a1 + 64);
  objc_msgSend((id)objc_opt_class(), "settings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
    objc_msgSend(v15, "inflateAnimationScaleUpSettings");
  else
    objc_msgSend(v15, "inflateAnimationScaleDownSettings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v17);
  v19 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v19, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v20, CFSTR("bounds"));

  objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v18, v21, 0);
  v22 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v17);
  v23 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v23, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v24, CFSTR("center"));

  objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v22, v25, 0);
  v26 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v26, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v27, CFSTR("contentBounds"));
  objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v21, v28, 0);

  v29 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v29, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v30, CFSTR("contentCenter"));
  objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v25, v31, 0);

  if (*(_QWORD *)(a1 + 48))
  {
    v32 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 48), "interfaceElementIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v32, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v33, CFSTR("leadingViewScale"));

    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v21, v34, 0);
    v35 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 48), "interfaceElementIdentifier");
    v36 = v22;
    v37 = v17;
    v38 = v18;
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v35, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v39, CFSTR("trailingViewScale"));

    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v21, v40, 0);
    v41 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 48), "interfaceElementIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v41, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v42, CFSTR("minimalViewScale"));

    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v21, v43, 0);
    v18 = v38;
    v17 = v37;
    v22 = v36;

  }
}

void __72__SBSAContainerDynamicsInflateAnimationProvider_preferencesFromContext___block_invoke_34(_QWORD *a1, void *a2)
{
  void *v3;
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
  id v14;

  v14 = a2;
  if (!v14)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
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
    v9 = a1[7];
    v10 = a1[4];
    v11 = NSClassFromString(CFSTR("[SBSAPreferencesMutator self]"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerDynamicsInflateAnimationProvider.m"), 187, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "setContainerViewDescriptions:", a1[5]);
  objc_msgSend(v7, "setElementDescriptions:", a1[6]);

}

- (id)_identitiesWithMilestoneReached:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSObject *v17;
  char v18;
  uint64_t v19;
  id obj;
  uint64_t v22;
  SBSAContainerDynamicsInflateAnimationProvider *v23;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expansionToCompactBeginInflationProgress");

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v23 = self;
  -[NSMapTable keyEnumerator](self->_pendingMilestonePropertyIdentitiesToElementIdentities, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v24 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v24)
  {
    v22 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v31 != v22)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v23->_pendingMilestonePropertyIdentitiesToElementIdentities, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v25, "animatedTransitionResults");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          if (!v12)
            goto LABEL_21;
          v13 = v12;
          v14 = *(_QWORD *)v27;
          while (1)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v27 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
              objc_msgSend(v16, "associatedInterfaceElementPropertyIdentity");
              v17 = objc_claimAutoreleasedReturnValue();
              if (BSEqualObjects())
              {
                objc_msgSend(v16, "targetedMilestone");
                if ((BSFloatApproximatelyEqualToFloat() & 1) != 0)
                {

                }
                else
                {
                  v18 = objc_msgSend(v16, "finished");

                  if ((v18 & 1) == 0)
                    continue;
                }
                objc_msgSend(v4, "addObject:", v10);
                SBLogSystemAperturePreferencesStackDynamicsAnimations();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                {
                  v19 = objc_msgSend(v25, "queryIteration");
                  *(_DWORD *)buf = 134349314;
                  v35 = v19;
                  v36 = 2112;
                  v37 = v9;
                  _os_log_debug_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEBUG, "[%{public}lu] [Inflate] Reached milestone for expansion'%@'", buf, 0x16u);
                }
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
            if (!v13)
            {
LABEL_21:

              break;
            }
          }
        }

      }
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v24);
  }

  return v4;
}

- (void)_addMilestonesIfNecessaryForUntrackedBoundsExpansionsForElementIdentities:(id)a3 preferencesMutator:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  SBSAInterfaceElementPropertyIdentity *v22;
  void *v23;
  SBSAInterfaceElementPropertyIdentity *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id obj;
  id v36;
  id v37;
  _QWORD v38[5];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  SBSAInterfaceElementPropertyIdentity *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = a4;
  v37 = a5;
  v9 = (void *)MEMORY[0x1E0C99E60];
  -[NSMapTable objectEnumerator](self->_pendingMilestonePropertyIdentitiesToElementIdentities, "objectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v34 = v8;
  v13 = (void *)objc_msgSend(v8, "mutableCopy");
  v33 = (void *)v12;
  objc_msgSend(v13, "minusSet:", v12);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v17);
        objc_msgSend(v37, "preferences");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "containerViewDescriptions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = MEMORY[0x1E0C809B0];
        v38[1] = 3221225472;
        v38[2] = __150__SBSAContainerDynamicsInflateAnimationProvider__addMilestonesIfNecessaryForUntrackedBoundsExpansionsForElementIdentities_preferencesMutator_context___block_invoke;
        v38[3] = &unk_1E8EA6A60;
        v38[4] = v18;
        objc_msgSend(v20, "bs_firstObjectPassingTest:", v38);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = [SBSAInterfaceElementPropertyIdentity alloc];
        objc_msgSend(v21, "interfaceElementIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v22, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v23, CFSTR("bounds"));

        objc_msgSend((id)objc_opt_class(), "settings");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "expansionToCompactBeginInflationProgress");
        v27 = v26;

        v28 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setWithObject:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addMilestones:forPropertyIdentity:", v30, v24);

        -[NSMapTable setObject:forKey:](self->_pendingMilestonePropertyIdentitiesToElementIdentities, "setObject:forKey:", v18, v24);
        SBLogSystemAperturePreferencesStackDynamicsAnimations();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v32 = objc_msgSend(v37, "queryIteration");
          *(_DWORD *)buf = 134349314;
          v44 = v32;
          v45 = 2112;
          v46 = v24;
          _os_log_debug_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEBUG, "[%{public}lu] [Inflate] Adding milestone for expansion'%@'", buf, 0x16u);
        }

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v15);
  }

}

uint64_t __150__SBSAContainerDynamicsInflateAnimationProvider__addMilestonesIfNecessaryForUntrackedBoundsExpansionsForElementIdentities_preferencesMutator_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "associatedSystemApertureElementIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentitiesThatFinishedWaitingToExpandBeforeInflation, 0);
  objc_storeStrong((id *)&self->_elementIdentitiesWaitingToExpandBeforeInflation, 0);
  objc_storeStrong((id *)&self->_pendingMilestonePropertyIdentitiesToElementIdentities, 0);
  objc_storeStrong((id *)&self->_elementIdentitiesWithInflateApplied, 0);
}

@end
