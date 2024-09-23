@implementation SBSALayoutTransitionProvider

- (NSString)description
{
  _BOOL4 v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = -[SBSALayoutTransitionProvider isInitialized](self, "isInitialized");
  v4 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v5 = objc_opt_class();
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("<%@: %p; initialized: %@"), v5, self, v6);

  if (v3)
  {
    -[SBSALayoutTransitionProvider previousElementLayoutMode](self, "previousElementLayoutMode");
    SAUIStringFromElementViewLayoutMode();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSALayoutTransitionProvider targetElementLayoutMode](self, "targetElementLayoutMode");
    SAUIStringFromElementViewLayoutMode();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("; previousElementLayoutMode: %@; targetElementLayoutMode: %@"), v8, v9);

  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return (NSString *)v7;
}

- (void)removeFromParentProvider
{
  objc_super v3;

  -[SBSALayoutTransitionProvider _removeChildMitosisAndRecombinationProviders](self, "_removeChildMitosisAndRecombinationProviders");
  v3.receiver = self;
  v3.super_class = (Class)SBSALayoutTransitionProvider;
  -[SBSABasePreferencesProvider removeFromParentProvider](&v3, sel_removeFromParentProvider);
}

- (id)preferencesFromContext:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  SBSAElementContentProvider *v10;
  int *v11;
  SBSAElementLayoutModeSupporting **p_targetLayoutProvider;
  SBSAElementLayoutModeSupporting *targetLayoutProvider;
  char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  SBSAElementLayoutModeSupporting *v18;
  NSObject *v19;
  SBSAElementLayoutModeSupporting *v20;
  SBSAElementLayoutModeSupporting *previousLayoutProvider;
  SBSAElementLayoutModeSupporting *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  BOOL awaitingCollision;
  void *v34;
  void *v35;
  int v36;
  int v37;
  NSObject *v38;
  void *childMitosisProvider;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  SBSAPopTransitionProvider *v44;
  SBSAPopTransitionProvider *childPopProvider;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  int v49;
  int64_t v50;
  int64_t v51;
  SBSARecombinationTransitionProvider *v52;
  SBSARecombinationTransitionProvider *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  SBSAMitosisTransitionProvider *v59;
  void *v60;
  SBSAMitosisTransitionProvider *v61;
  SBSAMitosisTransitionProvider *v62;
  SBSAElementContentProvider *v63;
  NSObject *v64;
  int v65;
  SBSARecombinationTransitionProvider *childRecombinationProvider;
  SBSARecombinationTransitionProvider *v67;
  SBSAMitosisTransitionProvider *v68;
  void *v69;
  SBSAMitosisTransitionProvider *v70;
  SBSAMitosisTransitionProvider *v71;
  void *v72;
  uint64_t v73;
  id v74;
  void *v75;
  id v76;
  NSObject *v77;
  uint64_t v79;
  SBSAElementContentProvider *v80;
  SBSAElementContentProvider *v81;
  SBSAElementLayoutModeSupporting *v82;
  uint64_t v83;
  SBSAElementLayoutModeSupporting *v84;
  void *v85;
  unint64_t v86;
  SBSAElementLayoutModeSupporting *v87;
  void *v88;
  id v89;
  void *v90;
  uint64_t v91;
  int v92;
  void *v93;
  objc_super v94;
  uint8_t buf[4];
  uint64_t v96;
  __int16 v97;
  SBSAElementContentProvider *v98;
  __int16 v99;
  SBSAElementContentProvider *v100;
  __int16 v101;
  SBSAElementLayoutModeSupporting *v102;
  __int16 v103;
  uint64_t v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
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

  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v9);
  v10 = (SBSAElementContentProvider *)objc_claimAutoreleasedReturnValue();

  v11 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
  if (!v8)
  {
LABEL_66:
    v65 = 0;
    goto LABEL_67;
  }
  p_targetLayoutProvider = &self->_targetLayoutProvider;
  targetLayoutProvider = self->_targetLayoutProvider;
  if (!targetLayoutProvider)
  {
    SBLogSystemAperturePreferencesStackElements();
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEBUG))
      -[SBSALayoutTransitionProvider preferencesFromContext:].cold.7(v8, v14);

    -[SBSABasePreferencesProvider removeFromParentProvider](v10, "removeFromParentProvider");
    objc_msgSend(v8, "elementContexts");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bs_firstObjectPassingTest:", &__block_literal_global_157);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSALayoutTransitionProvider _layoutProviderForLayoutMode:](self, "_layoutProviderForLayoutMode:", objc_msgSend(v16, "layoutMode"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *p_targetLayoutProvider;
    *p_targetLayoutProvider = (SBSAElementLayoutModeSupporting *)v17;

    SBLogSystemAperturePreferencesStackElements();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      -[SBSALayoutTransitionProvider preferencesFromContext:].cold.6();

    -[SBSALayoutTransitionProvider _elementLayoutModeSupportingChildProvider](self, "_elementLayoutModeSupportingChildProvider");
    v20 = (SBSAElementLayoutModeSupporting *)objc_claimAutoreleasedReturnValue();
    previousLayoutProvider = self->_previousLayoutProvider;
    self->_previousLayoutProvider = v20;
    v22 = v20;

    objc_msgSend(v8, "preferences");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    self->_awaitingCollision = objc_msgSend(v23, "isCollisionImminent");

    SBLogSystemAperturePreferencesStackElements();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[SBSALayoutTransitionProvider preferencesFromContext:].cold.5();

    -[SBSAElementLayoutModeSupporting removeFromParentProvider](v22, "removeFromParentProvider");
    objc_msgSend(v8, "preferences");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastChangingElementLayoutTransition");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSAElementContentProvider disappearanceTransitionElementContentProviderWithParentProvider:staticLayoutTransition:](SBSAElementContentProvider, "disappearanceTransitionElementContentProviderWithParentProvider:staticLayoutTransition:", self, v26);
    v27 = objc_claimAutoreleasedReturnValue();

    targetLayoutProvider = *p_targetLayoutProvider;
    v10 = (SBSAElementContentProvider *)v27;
    v11 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
  }
  -[SBSAElementLayoutModeSupporting parentProvider](targetLayoutProvider, "parentProvider");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 != 0;

  if (v28)
  {
    if (objc_msgSend(v8, "containsAnyOfSignals:", 2))
    {
      SBLogSystemAperturePreferencesStackElements();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[SBSALayoutTransitionProvider preferencesFromContext:].cold.2();
      v31 = (uint64_t)v10;
LABEL_20:

      v10 = (SBSAElementContentProvider *)v31;
      goto LABEL_46;
    }
    v29 = 0;
  }
  else
  {
    SBLogSystemAperturePreferencesStackElements();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      -[SBSALayoutTransitionProvider preferencesFromContext:].cold.4();

    awaitingCollision = self->_awaitingCollision;
    if (awaitingCollision)
      awaitingCollision = (objc_msgSend(v8, "signals") & 1) == 0;
    self->_awaitingCollision = awaitingCollision;
    objc_msgSend(v8, "preferences");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "elementLayoutTransition");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isSingleElementExpansion");

    if (!self->_awaitingCollision)
    {
      v92 = v36;
      v37 = self->_initialized ? 1 : v36;
      if (v37 == 1)
      {
        SBLogSystemAperturePreferencesStackElements();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v91 = objc_msgSend(v8, "queryIteration");
          NSStringFromBOOL();
          v80 = (SBSAElementContentProvider *)objc_claimAutoreleasedReturnValue();
          NSStringFromBOOL();
          v81 = (SBSAElementContentProvider *)objc_claimAutoreleasedReturnValue();
          NSStringFromBOOL();
          v82 = (SBSAElementLayoutModeSupporting *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134349826;
          v96 = v91;
          v97 = 2112;
          v98 = v80;
          v99 = 2112;
          v100 = v81;
          v101 = 2112;
          v102 = v82;
          _os_log_debug_impl(&dword_1D0540000, v38, OS_LOG_TYPE_DEBUG, "[%{public}lu] awaitingCollision: %@; initialized: %@; isSingleElementExpansion: %@",
            buf,
            0x2Au);

        }
        -[SBSABasePreferencesProvider removeFromParentProvider](v10, "removeFromParentProvider");
        -[SBSALayoutTransitionProvider _elementLayoutModeSupportingChildProvider](self, "_elementLayoutModeSupportingChildProvider");
        v30 = objc_claimAutoreleasedReturnValue();
        -[NSObject removeFromParentProvider](v30, "removeFromParentProvider");
        childMitosisProvider = self->_childMitosisProvider;
        if (!childMitosisProvider)
        {
          childMitosisProvider = self->_childRecombinationProvider;
          if (!childMitosisProvider)
            childMitosisProvider = self;
        }
        v89 = childMitosisProvider;
        objc_msgSend(v89, "setChildProvider:", *p_targetLayoutProvider);
        v87 = *p_targetLayoutProvider;
        objc_msgSend(v8, "preferences");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "lastChangingElementLayoutTransition");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        +[SBSAElementContentProvider appearanceTransitionElementContentProviderWithParentProvider:staticLayoutTransition:](SBSAElementContentProvider, "appearanceTransitionElementContentProviderWithParentProvider:staticLayoutTransition:", v87, v41);
        v31 = objc_claimAutoreleasedReturnValue();

        if (v92)
        {
          if (-[SBSAElementLayoutModeSupporting supportedElementLayoutMode](*p_targetLayoutProvider, "supportedElementLayoutMode") == 3)
          {
            objc_msgSend(v8, "elementInteractionResults");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v42, "bs_containsObjectPassingTest:", &__block_literal_global_10_1);

            if (v43)
            {
              v44 = -[SBSABasePreferencesProvider initWithParentProvider:]([SBSAPopTransitionProvider alloc], "initWithParentProvider:", self);
              childPopProvider = self->_childPopProvider;
              self->_childPopProvider = v44;

              SBLogSystemAperturePreferencesStackElements();
              v46 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                -[SBSALayoutTransitionProvider preferencesFromContext:].cold.3();

            }
          }
        }
        SBLogSystemAperturePreferencesStackElements();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        {
          v83 = objc_msgSend(v8, "queryIteration");
          v84 = *p_targetLayoutProvider;
          *(_DWORD *)buf = 134350082;
          v96 = v83;
          v97 = 2112;
          v98 = (SBSAElementContentProvider *)v31;
          v99 = 2112;
          v100 = (SBSAElementContentProvider *)v30;
          v101 = 2112;
          v102 = v84;
          v103 = 2112;
          v104 = v31;
          _os_log_debug_impl(&dword_1D0540000, v47, OS_LOG_TYPE_DEBUG, "[%{public}lu] Removed content provider '%@', removed layout provider '%@', inserted layout provider '%@', added content provider '%@'", buf, 0x34u);
        }

        v11 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
        goto LABEL_20;
      }
    }
    v29 = 0;
    v11 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
  }
LABEL_46:
  if (self->_transitionKind)
    goto LABEL_57;
  objc_msgSend(v8, "preferences");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "isCollisionImminent");

  v50 = -[SBSALayoutTransitionProvider targetElementLayoutMode](self, "targetElementLayoutMode");
  if (!v49)
  {
    if (v50 == 1)
    {
      objc_msgSend(v8, "preferences");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "elementLayoutTransition");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "targetElementContexts");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v56, "count") >= 2)
      {

        v11 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
LABEL_56:
        self->_transitionKind = 2;
        v59 = [SBSAMitosisTransitionProvider alloc];
        -[SBSALayoutTransitionProvider _adjunctElementIdentificationInContext:](self, "_adjunctElementIdentificationInContext:", v8);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = -[SBSASequencedBehaviorProvider initWithParticipantIdentifier:](v59, "initWithParticipantIdentifier:", v60);
        v62 = self->_childMitosisProvider;
        self->_childMitosisProvider = v61;

        -[SBSABasePreferencesProvider setChildProvider:](self, "setChildProvider:", self->_childMitosisProvider);
LABEL_57:
        if (v29)
          goto LABEL_58;
LABEL_62:
        if (self->_transitionKind == 4 && !self->_awaitingCollision)
        {
          childRecombinationProvider = self->_childRecombinationProvider;
          if (childRecombinationProvider)
          {
            -[SBSABasePreferencesProvider removeFromParentProvider](childRecombinationProvider, "removeFromParentProvider");
            v67 = self->_childRecombinationProvider;
            self->_childRecombinationProvider = 0;

            v68 = [SBSAMitosisTransitionProvider alloc];
            -[SBSALayoutTransitionProvider _adjunctElementIdentificationInContext:](self, "_adjunctElementIdentificationInContext:", v8);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v70 = -[SBSASequencedBehaviorProvider initWithParticipantIdentifier:](v68, "initWithParticipantIdentifier:", v69);
            v71 = self->_childMitosisProvider;
            self->_childMitosisProvider = v70;

            -[SBSABasePreferencesProvider setChildProvider:](self, "setChildProvider:", self->_childMitosisProvider);
          }
        }
        goto LABEL_66;
      }
      objc_msgSend(v8, "preferences");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "elementLayoutTransition");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "targetElementContexts");
      v93 = v55;
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "firstObject");
      v90 = v54;
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v58, "interfaceOrientation") - 3;

      v11 = &OBJC_IVAR___SBWorkspaceTransitionContext__finalizeBlocks;
      if (v86 < 2)
        goto LABEL_56;
    }
    self->_transitionKind = 1;
    if (v29)
      goto LABEL_58;
    goto LABEL_62;
  }
  v51 = 3;
  if (v50 == 1)
    v51 = 4;
  self->_transitionKind = v51;
  v52 = -[SBSABasePreferencesProvider initWithParentProvider:]([SBSARecombinationTransitionProvider alloc], "initWithParentProvider:", self);
  v53 = self->_childRecombinationProvider;
  self->_childRecombinationProvider = v52;

  if (!v29)
    goto LABEL_62;
LABEL_58:
  -[SBSALayoutTransitionProvider _removeChildMitosisAndRecombinationProviders](self, "_removeChildMitosisAndRecombinationProviders");
  v63 = v10;
  -[SBSABasePreferencesProvider removeFromParentProvider](v63, "removeFromParentProvider");
  v10 = -[SBSAElementContentProvider initWithParentProvider:]([SBSAElementContentProvider alloc], "initWithParentProvider:", *p_targetLayoutProvider);

  SBLogSystemAperturePreferencesStackElements();
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
  {
    v79 = objc_msgSend(v8, "queryIteration");
    *(_DWORD *)buf = 134349570;
    v96 = v79;
    v97 = 2112;
    v98 = v63;
    v99 = 2112;
    v100 = v10;
    _os_log_debug_impl(&dword_1D0540000, v64, OS_LOG_TYPE_DEBUG, "[%{public}lu] Transition complete – removed appearance content provider '%@', added steady state content provider '%@'", buf, 0x20u);
  }

  v65 = 1;
LABEL_67:
  *((_BYTE *)&self->super.super.isa + v11[561]) = 1;
  v94.receiver = self;
  v94.super_class = (Class)SBSALayoutTransitionProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v94, sel_preferencesFromContext_, v8);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_opt_class();
  v74 = v72;
  if (v73)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v75 = v74;
    else
      v75 = 0;
  }
  else
  {
    v75 = 0;
  }
  v76 = v75;

  if (v65)
  {
    SBLogSystemAperturePreferencesStackElements();
    v77 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      -[SBSALayoutTransitionProvider preferencesFromContext:].cold.1();

    -[SBSALayoutTransitionProvider removeFromParentProvider](self, "removeFromParentProvider");
  }

  return v76;
}

BOOL __55__SBSALayoutTransitionProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "layoutMode") > 0;
}

BOOL __55__SBSALayoutTransitionProvider_preferencesFromContext___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "interactionSource") == 2 && objc_msgSend(v2, "viewInteractionResult") == 1;

  return v3;
}

- (int64_t)previousElementLayoutMode
{
  return -[SBSAElementLayoutModeSupporting supportedElementLayoutMode](self->_previousLayoutProvider, "supportedElementLayoutMode");
}

- (int64_t)targetElementLayoutMode
{
  return -[SBSAElementLayoutModeSupporting supportedElementLayoutMode](self->_targetLayoutProvider, "supportedElementLayoutMode");
}

- (void)_removeChildMitosisAndRecombinationProviders
{
  SBSAMitosisTransitionProvider *childMitosisProvider;
  SBSARecombinationTransitionProvider *childRecombinationProvider;
  SBSAPopTransitionProvider *childPopProvider;

  -[SBSABasePreferencesProvider removeFromParentProvider](self->_childMitosisProvider, "removeFromParentProvider");
  childMitosisProvider = self->_childMitosisProvider;
  self->_childMitosisProvider = 0;

  -[SBSABasePreferencesProvider removeFromParentProvider](self->_childRecombinationProvider, "removeFromParentProvider");
  childRecombinationProvider = self->_childRecombinationProvider;
  self->_childRecombinationProvider = 0;

  -[SBSABasePreferencesProvider removeFromParentProvider](self->_childPopProvider, "removeFromParentProvider");
  childPopProvider = self->_childPopProvider;
  self->_childPopProvider = 0;

}

- (id)_layoutProviderForLayoutMode:(int64_t)a3
{
  if (a3 < 1)
    return 0;
  else
    return -[SBSALayoutModeLayoutProvider initWithLayoutMode:]([SBSALayoutModeLayoutProvider alloc], "initWithLayoutMode:", a3);
}

- (id)_elementLayoutModeSupportingChildProvider
{
  void *v3;
  void *v4;

  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSABasePreferencesProvider firstChildPreferenceProviderOfClass:](self, "firstChildPreferenceProviderOfClass:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_adjunctElementIdentificationInContext:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a3, "elementContexts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    while (SBSAIsElementInCollectionSensorAttached(v4, v3))
    {
      if (++v4 >= (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_5;
    }
    objc_msgSend(v3, "objectAtIndex:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v5 = 0;
  }

  return v5;
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childPopProvider, 0);
  objc_storeStrong((id *)&self->_childMitosisProvider, 0);
  objc_storeStrong((id *)&self->_childRecombinationProvider, 0);
  objc_storeStrong((id *)&self->_targetLayoutProvider, 0);
  objc_storeStrong((id *)&self->_previousLayoutProvider, 0);
}

- (void)preferencesFromContext:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_3_0(v0, v1);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[%{public}lu] Removing layout transition provider '%@'", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)preferencesFromContext:.cold.2()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_3_0(v0, v1);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[%{public}lu] Steady state reached – safe to remove layout transition provider '%@'", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)preferencesFromContext:.cold.3()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_3_0(v0, v1);
  OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[%{public}lu] Adding pop transition provider for long press expansion animation: '%@'", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)preferencesFromContext:.cold.4()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_3_0(v0, v1);
  OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[%{public}lu] No parent for target layout provider '%@'", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)preferencesFromContext:.cold.5()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_3_0(v0, v1);
  NSStringFromBOOL();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[%{public}lu] awaitingCollision: %@", v4, v5, v6, v7, 2u);

}

- (void)preferencesFromContext:.cold.6()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_3_0(v0, v1);
  OUTLINED_FUNCTION_2_10();
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[%{public}lu] Instantiated new target layout provider '%@'", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)preferencesFromContext:(void *)a1 .cold.7(void *a1, char *a2)
{
  int v3;
  uint64_t v4;

  v3 = 134349056;
  v4 = OUTLINED_FUNCTION_3_0(a1, a2);
  _os_log_debug_impl(&dword_1D0540000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "[%{public}lu] No target layout provider", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2_2();
}

@end
