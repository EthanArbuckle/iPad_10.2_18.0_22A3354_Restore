@implementation SBSASequencedBehaviorProvider

- (SBSASequencedBehaviorProvider)initWithParticipantIdentifier:(id)a3
{
  id v4;
  SBSASequencedBehaviorProvider *v5;
  SBSAElementIdentification *v6;
  void *participatingInterfaceElementIdentifier;
  void *v8;
  uint64_t v9;
  SAElementIdentifying *participatingElementIdentification;
  uint64_t v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSASequencedBehaviorProvider;
  v5 = -[SBSABasePreferencesProvider initWithParentProvider:](&v13, sel_initWithParentProvider_, 0);
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = [SBSAElementIdentification alloc];
      objc_msgSend(v4, "clientIdentifier");
      participatingInterfaceElementIdentifier = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "elementIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v6, "initWithClientIdentifier:elementIdentifier:", participatingInterfaceElementIdentifier, v8);
      participatingElementIdentification = v5->_participatingElementIdentification;
      v5->_participatingElementIdentification = (SAElementIdentifying *)v9;

LABEL_7:
      goto LABEL_8;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend(v4, "copy");
      participatingInterfaceElementIdentifier = v5->_participatingInterfaceElementIdentifier;
      v5->_participatingInterfaceElementIdentifier = (NSUUID *)v11;
      goto LABEL_7;
    }
  }
LABEL_8:

  return v5;
}

- (id)preferencesFromContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  int v21;
  NSArray *elementContexts;
  BOOL v23;
  int64_t activePhase;
  _BOOL4 v25;
  int v26;
  int64_t v27;
  void *v28;
  int64_t v29;
  void *v30;
  NSObject *v31;
  char v32;
  void *v33;
  int v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  SBSAPreferencesDidChangeAction *v43;
  void *v44;
  SBSAPreferencesDidChangeAction *v45;
  void *v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  SBSAPreferencesDidChangeAction *v52;
  void *v53;
  SBSAPreferencesDidChangeAction *v54;
  void *v55;
  double v56;
  double v57;
  id v58;
  void *v59;
  SBSAPreferencesDidChangeAction *v60;
  void *v61;
  SBSAPreferencesDidChangeAction *v62;
  void *v63;
  double v64;
  double v65;
  _BOOL4 v66;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t j;
  void *v73;
  void *v74;
  char v75;
  void *v76;
  SBSAInterfaceElementPropertyIdentifying *pendingPhaseTransitionPropertyIdentity;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  Class v82;
  objc_class *v83;
  void *v84;
  void *v85;
  Class v86;
  objc_class *v87;
  void *v88;
  void *v89;
  Class v90;
  objc_class *v91;
  void *v92;
  void *v93;
  id v94;
  id v96;
  void *v97;
  int64_t v98;
  id v99;
  _QWORD v100[7];
  _QWORD v101[5];
  id v102;
  SEL v103;
  double v104;
  id v105;
  objc_super v106;
  _QWORD v107[5];
  _QWORD v108[5];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  char v117;
  const __CFString *v118;
  SBSAPreferencesDidChangeAction *v119;
  const __CFString *v120;
  SBSAPreferencesDidChangeAction *v121;
  const __CFString *v122;
  SBSAPreferencesDidChangeAction *v123;
  _BYTE v124[128];
  _BYTE buf[12];
  __int16 v126;
  void *v127;
  __int16 v128;
  void *v129;
  __int16 v130;
  void *v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = NSClassFromString(CFSTR("SBSAContext"));
      v83 = (objc_class *)objc_opt_class();
      NSStringFromClass(v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSASequencedBehaviorProvider.m"), 50, CFSTR("Unexpected class – expected '%@', got '%@'"), v82, v84);

    }
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v8, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
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

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = NSClassFromString(CFSTR("SBSAPreferences"));
      v87 = (objc_class *)objc_opt_class();
      NSStringFromClass(v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSASequencedBehaviorProvider.m"), 51, CFSTR("Unexpected class – expected '%@', got '%@'"), v86, v88);

    }
  }
  else
  {
    v13 = 0;
  }

  objc_msgSend(v8, "elementContexts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v117 = 0;
  v97 = v14;
  if (!self->_activePhase
    && !-[SBSASequencedBehaviorProvider canProceedWithContext:shouldRetry:](self, "canProceedWithContext:shouldRetry:", v8, &v117))
  {
LABEL_45:
    -[SBSASequencedBehaviorProvider _setActivePhase:context:reason:](self, "_setActivePhase:context:reason:", 0, v8, &__block_literal_global_33_3);
LABEL_46:
    v32 = 1;
    goto LABEL_56;
  }
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  objc_msgSend(v13, "gestureDescriptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
  v96 = v4;
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v114;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v114 != v18)
          objc_enumerationMutation(v15);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * i), "gestureRecognizerState") < 0)
        {
          v20 = v13;
          v21 = 1;
          goto LABEL_31;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
      if (v17)
        continue;
      break;
    }
  }
  v20 = v13;
  v21 = 0;
LABEL_31:

  elementContexts = self->_elementContexts;
  if (elementContexts)
  {
    v23 = SBSAAreElementLayoutsEqualToLayouts(elementContexts, v14);
    activePhase = self->_activePhase;
    v25 = activePhase == -[SBSASequencedBehaviorProvider finalPhase](self, "finalPhase");
    if (v23)
    {
      v26 = 0;
    }
    else
    {
      v28 = (void *)objc_msgSend(v14, "copy");
      v26 = !-[SBSASequencedBehaviorProvider canPersistAcrossLayoutStateChangesToNewElementContexts:](self, "canPersistAcrossLayoutStateChangesToNewElementContexts:", v28);

    }
  }
  else
  {
    v27 = self->_activePhase;
    v26 = 0;
    v25 = v27 == -[SBSASequencedBehaviorProvider finalPhase](self, "finalPhase");
  }
  if (((v21 | v26) & 1) != 0 || v25)
  {
    SBLogSystemAperturePreferencesStackSequencedBehaviors();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromBOOL();
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = self;
      v126 = 2112;
      v127 = v78;
      v128 = 2112;
      v129 = v79;
      v130 = 2112;
      v131 = v80;
      _os_log_debug_impl(&dword_1D0540000, v31, OS_LOG_TYPE_DEBUG, "Will remove behavior provider %@ (gestureActive:%@, layoutStateChange:%@, finalPhase:%@)", buf, 0x2Au);

    }
    v13 = v20;
    v4 = v96;
    if (v25)
      goto LABEL_46;
    goto LABEL_45;
  }
  if (!self->_elementContexts)
  {
    if (v14)
      v33 = v14;
    else
      v33 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&self->_elementContexts, v33);
    v34 = -[SBSASequencedBehaviorProvider finalPhase](self, "finalPhase");
    if (v34 >= 1)
      v35 = 1;
    else
      v35 = v34;
    -[SBSASequencedBehaviorProvider _setActivePhase:context:reason:](self, "_setActivePhase:context:reason:", v35, v8, &__block_literal_global_251);
    v13 = v20;
    v30 = v8;
LABEL_54:
    v4 = v96;
    goto LABEL_55;
  }
  v29 = self->_activePhase + 1;
  if (-[SBSASequencedBehaviorProvider phaseIsTimeDelayBased:](self, "phaseIsTimeDelayBased:", v29))
  {
    *(_QWORD *)buf = 0;
    v13 = v20;
    v30 = v8;
    if (-[SBSASequencedBehaviorProvider _isTimerExpired:duration:](self, "_isTimerExpired:duration:", v8, buf))
    {
      v107[0] = MEMORY[0x1E0C809B0];
      v107[1] = 3221225472;
      v107[2] = __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_3;
      v107[3] = &__block_descriptor_40_e15___NSString_8__0l;
      v107[4] = *(_QWORD *)buf;
      -[SBSASequencedBehaviorProvider _setActivePhase:context:reason:](self, "_setActivePhase:context:reason:", v29, v8, v107);
    }
    goto LABEL_54;
  }
  v13 = v20;
  v30 = v8;
  v4 = v96;
  if (self->_pendingPhaseTransitionPropertyIdentity)
  {
    -[SBSASequencedBehaviorProvider milestoneForPhase:](self, "milestoneForPhase:", v29);
    v65 = v64;
    objc_msgSend(&unk_1E91CF8F8, "bs_CGFloatValue");
    v66 = BSFloatEqualToFloat()
       && -[SBSASequencedBehaviorProvider milestoneForPhaseRequiresAnimationFinished:](self, "milestoneForPhaseRequiresAnimationFinished:", v29);
    if (v65 > 0.0)
    {
      v98 = v29;
      v99 = v8;
      v94 = v13;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      objc_msgSend(v8, "animatedTransitionResults");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
      if (!v69)
        goto LABEL_101;
      v70 = v69;
      v71 = *(_QWORD *)v110;
      while (1)
      {
        for (j = 0; j != v70; ++j)
        {
          if (*(_QWORD *)v110 != v71)
            objc_enumerationMutation(v68);
          v73 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
          objc_msgSend(v73, "associatedInterfaceElementPropertyIdentity");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          if (!BSEqualObjects()
            || (objc_msgSend(v73, "targetedMilestone"), !BSFloatApproximatelyEqualToFloat()))
          {

            continue;
          }
          if (!v66)
          {

LABEL_98:
            v108[0] = MEMORY[0x1E0C809B0];
            v108[1] = 3221225472;
            v108[2] = __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_2;
            v108[3] = &unk_1E8EA89D0;
            v108[4] = v73;
            v76 = (void *)MEMORY[0x1D17E5550](v108);
            -[SBSASequencedBehaviorProvider _setActivePhase:context:reason:](self, "_setActivePhase:context:reason:", v98, v99, v76);
            pendingPhaseTransitionPropertyIdentity = self->_pendingPhaseTransitionPropertyIdentity;
            self->_pendingPhaseTransitionPropertyIdentity = 0;

            continue;
          }
          v75 = objc_msgSend(v73, "finished");

          if ((v75 & 1) != 0)
            goto LABEL_98;
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
        if (!v70)
        {
LABEL_101:

          v4 = v96;
          v13 = v94;
          v30 = v99;
          break;
        }
      }
    }
  }
LABEL_55:
  -[SBSASequencedBehaviorProvider updatedContextFromContext:](self, "updatedContextFromContext:", v30);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v32 = 0;
LABEL_56:
  v36 = (void *)objc_msgSend(v8, "copyByUpdatingPreferences:", v13);

  v106.receiver = self;
  v106.super_class = (Class)SBSASequencedBehaviorProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v106, sel_preferencesFromContext_, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    objc_opt_self();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v37;
    if (v38)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v40 = v39;
      else
        v40 = 0;
    }
    else
    {
      v40 = 0;
    }
    v41 = v40;

    if (!v41)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = NSClassFromString(CFSTR("SBSAPreferences"));
      v91 = (objc_class *)objc_opt_class();
      NSStringFromClass(v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSASequencedBehaviorProvider.m"), 122, CFSTR("Unexpected class – expected '%@', got '%@'"), v90, v92);

    }
  }
  else
  {
    v41 = 0;
  }

  if ((v32 & 1) != 0)
  {
    -[SBSASequencedBehaviorProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "updatedPreferencesFromPreferences:context:relevantPropertyIdentity:", v41, v36, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v117)
    {
      v43 = [SBSAPreferencesDidChangeAction alloc];
      v118 = CFSTR("containerSequencedBehaviorProvider.retry");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v118, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[SBSAPreferencesDidChangeAction initWithReasons:](v43, "initWithReasons:", v44);
      v119 = v45;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v119, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v42, "copyByAddingActions:", v46);

      v42 = (void *)v47;
    }
    else
    {
      -[SBSABasePreferencesProvider removeFromParentProvider](self, "removeFromParentProvider");
    }
  }
  else
  {
    v48 = self->_activePhase + 1;
    if (-[SBSASequencedBehaviorProvider phaseIsTimeDelayBased:](self, "phaseIsTimeDelayBased:", v48))
    {
      -[SBSASequencedBehaviorProvider delayForPhase:](self, "delayForPhase:", v48);
      v50 = v49;
      -[SBSASequencedBehaviorProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "updatedPreferencesFromPreferences:context:relevantPropertyIdentity:", v41, v36, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (!self->_pendingTimerIdentifier)
      {
        v100[0] = MEMORY[0x1E0C809B0];
        v100[1] = 3221225472;
        v100[2] = __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_6;
        v100[3] = &unk_1E8EA2CC8;
        v100[4] = self;
        v100[5] = a2;
        v100[6] = v50;
        v51 = (void *)objc_msgSend(v42, "copyWithBlock:", v100);

        v52 = [SBSAPreferencesDidChangeAction alloc];
        v120 = CFSTR("containerSequencedBehaviorProvider.phaseChange");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v120, 1);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = -[SBSAPreferencesDidChangeAction initWithReasons:](v52, "initWithReasons:", v53);
        v121 = v54;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v121, 1);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = (void *)objc_msgSend(v51, "copyByAddingActions:", v55);

      }
    }
    else
    {
      -[SBSASequencedBehaviorProvider milestoneForPhase:](self, "milestoneForPhase:", v48);
      if (v56 <= 0.0)
      {
        v42 = v41;
      }
      else
      {
        v57 = v56;
        v105 = 0;
        -[SBSASequencedBehaviorProvider updatedPreferencesFromPreferences:context:relevantPropertyIdentity:](self, "updatedPreferencesFromPreferences:context:relevantPropertyIdentity:", v41, v36, &v105);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v105;

        if (!self->_pendingPhaseTransitionPropertyIdentity)
        {
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v101[2] = __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_5;
          v101[3] = &unk_1E8EB6370;
          v103 = a2;
          v101[4] = self;
          v104 = v57;
          v102 = v58;
          v59 = (void *)objc_msgSend(v42, "copyWithBlock:", v101);

          v60 = [SBSAPreferencesDidChangeAction alloc];
          v122 = CFSTR("containerSequencedBehaviorProvider.phaseChange");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v122, 1);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[SBSAPreferencesDidChangeAction initWithReasons:](v60, "initWithReasons:", v61);
          v123 = v62;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v123, 1);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v59, "copyByAddingActions:", v63);

        }
      }
    }
    if (self->_pendingTimerIdentifier && self->_pendingPhaseTransitionPropertyIdentity)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSASequencedBehaviorProvider.m"), 151, CFSTR("Waiting for both a timer and a milestone; something's gone wrong."));

    }
  }

  return v42;
}

const __CFString *__56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke()
{
  return CFSTR("Captured layout states");
}

id __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_2(uint64_t a1)
{
  int v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (objc_msgSend(*(id *)(a1 + 32), "isTransitionEndTargeted"))
  {
    v2 = objc_msgSend(*(id *)(a1 + 32), "finished");
    v3 = CFSTR("<end>");
    if (v2)
      v3 = CFSTR("<end, finished>");
    v4 = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 32), "targetedMilestone");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%f"), v6);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v4;
  objc_msgSend(*(id *)(a1 + 32), "associatedInterfaceElementPropertyIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "interfaceElementProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "associatedInterfaceElementPropertyIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "associatedInterfaceElementIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reached Milestone: (%@, %@, %@)"), v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Timer Expired: (%fs)"), *(_QWORD *)(a1 + 32));
}

const __CFString *__56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_4()
{
  return CFSTR("Removed without reaching final phase");
}

void __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
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
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  if (!v19)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v19;
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSASequencedBehaviorProvider.m"), 133, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  v13 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, 0);
  objc_msgSend(v6, "addMilestones:forPropertyIdentity:", v15, *(_QWORD *)(a1 + 40));

  v16 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 48);
  *(_QWORD *)(v17 + 48) = v16;

}

void __56__SBSASequencedBehaviorProvider_preferencesFromContext___block_invoke_6(uint64_t a1, void *a2)
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
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSASequencedBehaviorProvider.m"), 145, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "_startTimerIfNecessary:withInterval:", v6, *(double *)(a1 + 48));
}

- (void)_setActivePhase:(int64_t)a3 context:(id)a4 reason:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  SBSASequencedBehaviorProvider *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (self->_activePhase != a3)
  {
    SBLogSystemAperturePreferencesStackSequencedBehaviors();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

    if (v11)
    {
      -[SBSASequencedBehaviorProvider nameForPhase:](self, "nameForPhase:", self->_activePhase);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSASequencedBehaviorProvider nameForPhase:](self, "nameForPhase:", a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        v9[2](v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR(" - %@"), v15);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = &stru_1E8EC7EC0;
      }
      SBLogSystemAperturePreferencesStackSequencedBehaviors();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134350082;
        v19 = objc_msgSend(v8, "queryIteration");
        v20 = 2112;
        v21 = self;
        v22 = 2112;
        v23 = v12;
        v24 = 2112;
        v25 = v13;
        v26 = 2112;
        v27 = v16;
        _os_log_debug_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEBUG, "[%{public}lu] %@ Phase Transition: (%@ -> %@)%@", buf, 0x34u);
      }

    }
    self->_activePhase = a3;
  }

}

- (BOOL)_isTimerExpired:(id)a3 duration:(double *)a4
{
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSUUID *pendingTimerIdentifier;
  void *v11;
  uint64_t v12;
  _QWORD v14[5];

  objc_msgSend(a3, "elapsedTimerDescriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __58__SBSASequencedBehaviorProvider__isTimerExpired_duration___block_invoke;
    v14[3] = &unk_1E8EB6398;
    v14[4] = self;
    v7 = objc_msgSend(v6, "indexOfObjectPassingTest:", v14);
    v8 = v7 != 0x7FFFFFFFFFFFFFFFLL;
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = v7;
      pendingTimerIdentifier = self->_pendingTimerIdentifier;
      self->_pendingTimerIdentifier = 0;

      if (a4)
      {
        objc_msgSend(v6, "objectAtIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "timeInterval");
        *(_QWORD *)a4 = v12;

      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __58__SBSASequencedBehaviorProvider__isTimerExpired_duration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "timerDescriptionIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualObjects();

  return v3;
}

- (void)_startTimerIfNecessary:(id)a3 withInterval:(double)a4
{
  id v6;
  SBSATimerDescription *v7;
  NSUUID *v8;
  NSUUID *pendingTimerIdentifier;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v6 = a3;
  if (!self->_pendingTimerIdentifier)
  {
    v13 = v6;
    v7 = -[SBSATimerDescription initWithTimeInterval:]([SBSATimerDescription alloc], "initWithTimeInterval:", a4);
    -[SBSATimerDescription timerDescriptionIdentifier](v7, "timerDescriptionIdentifier");
    v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    pendingTimerIdentifier = self->_pendingTimerIdentifier;
    self->_pendingTimerIdentifier = v8;

    objc_msgSend(v13, "timerDescriptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v13, "timerDescriptions");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v11, "mutableCopy");

    }
    else
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }

    objc_msgSend(v12, "addObject:", v7);
    objc_msgSend(v13, "setTimerDescriptions:", v12);

    v6 = v13;
  }

}

- (NSUUID)participatingInterfaceElementIdentifier
{
  return self->_participatingInterfaceElementIdentifier;
}

- (SAElementIdentifying)participatingElementIdentification
{
  return self->_participatingElementIdentification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participatingElementIdentification, 0);
  objc_storeStrong((id *)&self->_participatingInterfaceElementIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingTimerIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingPhaseTransitionPropertyIdentity, 0);
  objc_storeStrong((id *)&self->_elementContexts, 0);
}

- (int64_t)activePhase
{
  return self->_activePhase;
}

- (int64_t)finalPhase
{
  return 0;
}

- (id)nameForPhase:(int64_t)a3
{
  if (!a3)
    return CFSTR("Idle");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)canProceedWithContext:(id)a3 shouldRetry:(BOOL *)a4
{
  return 0;
}

- (BOOL)canPersistAcrossLayoutStateChangesToNewElementContexts:(id)a3
{
  return 0;
}

- (id)updatedContextFromContext:(id)a3
{
  return a3;
}

- (id)updatedPreferencesFromPreferences:(id)a3 context:(id)a4 relevantPropertyIdentity:(id *)a5
{
  return a3;
}

- (BOOL)phaseIsTimeDelayBased:(int64_t)a3
{
  return 0;
}

- (double)milestoneForPhase:(int64_t)a3
{
  return 0.0;
}

- (BOOL)milestoneForPhaseRequiresAnimationFinished:(int64_t)a3
{
  return 0;
}

- (double)delayForPhase:(int64_t)a3
{
  return 0.0;
}

@end
