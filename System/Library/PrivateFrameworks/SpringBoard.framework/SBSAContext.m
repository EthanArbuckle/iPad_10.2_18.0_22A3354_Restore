@implementation SBSAContext

- (id)_initWithContext:(id)a3
{
  id v4;
  SBSAContext *v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  uint64_t v16;
  SBSAPlatformMetricsContext *platformMetrics;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  uint64_t v23;
  SBSAViewDescription *containerParentViewDescription;
  void *v25;
  uint64_t v26;
  NSArray *requests;
  void *v28;
  uint64_t v29;
  NSArray *elementContexts;
  void *v31;
  uint64_t v32;
  NSArray *elementInteractionResults;
  void *v34;
  uint64_t v35;
  NSArray *elementSnapshotContexts;
  void *v37;
  uint64_t v38;
  SBSADefaultsContext *defaultsContext;
  void *v40;
  uint64_t v41;
  NSArray *gestureDescriptions;
  void *v43;
  uint64_t v44;
  NSArray *animatedTransitionResults;
  void *v46;
  uint64_t v47;
  NSArray *elapsedTimerDescriptions;
  void *v49;
  uint64_t v50;
  NSArray *containerViewDescriptions;
  void *v52;
  uint64_t v53;
  SBSAPreferences *preferences;

  v4 = a3;
  v5 = -[SBSAContext initWithQueryIteration:](self, "initWithQueryIteration:", objc_msgSend(v4, "queryIteration"));
  if (v5)
  {
    objc_msgSend(v4, "displayScale");
    v5->_displayScale = v6;
    v5->_minimumNumberOfContainers = objc_msgSend(v4, "minimumNumberOfContainers");
    v5->_maximumNumberOfElements = objc_msgSend(v4, "maximumNumberOfElements");
    objc_msgSend(v4, "inertContainerFrame");
    v5->_inertContainerFrame.origin.x = v7;
    v5->_inertContainerFrame.origin.y = v8;
    v5->_inertContainerFrame.size.width = v9;
    v5->_inertContainerFrame.size.height = v10;
    objc_msgSend(v4, "systemContainerBounds");
    v5->_systemContainerBounds.origin.x = v11;
    v5->_systemContainerBounds.origin.y = v12;
    v5->_systemContainerBounds.size.width = v13;
    v5->_systemContainerBounds.size.height = v14;
    objc_msgSend(v4, "platformMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    platformMetrics = v5->_platformMetrics;
    v5->_platformMetrics = (SBSAPlatformMetricsContext *)v16;

    v5->_layoutDirection = objc_msgSend(v4, "layoutDirection");
    objc_msgSend(v4, "landscapeScreenEdgeInsets");
    v5->_landscapeScreenEdgeInsets.top = v18;
    v5->_landscapeScreenEdgeInsets.left = v19;
    v5->_landscapeScreenEdgeInsets.bottom = v20;
    v5->_landscapeScreenEdgeInsets.right = v21;
    v5->_overrideRenderingStyle = objc_msgSend(v4, "overrideRenderingStyle");
    v5->_cloningStyle = objc_msgSend(v4, "cloningStyle");
    v5->_activeDisplay = objc_msgSend(v4, "activeDisplay");
    v5->_indicatorVisible = objc_msgSend(v4, "isIndicatorVisible");
    v5->_heavyShadowRequiredForTransition = objc_msgSend(v4, "isHeavyShadowRequiredForTransition");
    v5->_keyLineRequiredForTransition = objc_msgSend(v4, "isKeyLineRequiredForTransition");
    v5->_accessibilityZoomActiveAndEnabled = objc_msgSend(v4, "isAccessibilityZoomActiveAndEnabled");
    v5->_reduceTransparencyEnabled = objc_msgSend(v4, "isReduceTransparencyEnabled");
    v5->_animatedTransitionInProgress = objc_msgSend(v4, "isAnimatedTransitionInProgress");
    v5->_targetPlatformSimulator = objc_msgSend(v4, "isTargetPlatformSimulator");
    v5->_reachabilityActive = objc_msgSend(v4, "isReachabilityActive");
    objc_msgSend(v4, "containerParentViewDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    containerParentViewDescription = v5->_containerParentViewDescription;
    v5->_containerParentViewDescription = (SBSAViewDescription *)v23;

    objc_msgSend(v4, "requests");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "copy");
    requests = v5->_requests;
    v5->_requests = (NSArray *)v26;

    objc_msgSend(v4, "elementContexts");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    elementContexts = v5->_elementContexts;
    v5->_elementContexts = (NSArray *)v29;

    objc_msgSend(v4, "elementInteractionResults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "copy");
    elementInteractionResults = v5->_elementInteractionResults;
    v5->_elementInteractionResults = (NSArray *)v32;

    objc_msgSend(v4, "elementSnapshotContexts");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "copy");
    elementSnapshotContexts = v5->_elementSnapshotContexts;
    v5->_elementSnapshotContexts = (NSArray *)v35;

    objc_msgSend(v4, "defaultsContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "copy");
    defaultsContext = v5->_defaultsContext;
    v5->_defaultsContext = (SBSADefaultsContext *)v38;

    objc_msgSend(v4, "gestureDescriptions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "copy");
    gestureDescriptions = v5->_gestureDescriptions;
    v5->_gestureDescriptions = (NSArray *)v41;

    objc_msgSend(v4, "animatedTransitionResults");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "copy");
    animatedTransitionResults = v5->_animatedTransitionResults;
    v5->_animatedTransitionResults = (NSArray *)v44;

    objc_msgSend(v4, "elapsedTimerDescriptions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "copy");
    elapsedTimerDescriptions = v5->_elapsedTimerDescriptions;
    v5->_elapsedTimerDescriptions = (NSArray *)v47;

    objc_msgSend(v4, "containerViewDescriptions");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "copy");
    containerViewDescriptions = v5->_containerViewDescriptions;
    v5->_containerViewDescriptions = (NSArray *)v50;

    objc_msgSend(v4, "preferences");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "copy");
    preferences = v5->_preferences;
    v5->_preferences = (SBSAPreferences *)v53;

    v5->_signals = objc_msgSend(v4, "signals");
    v5->_flags = objc_msgSend(v4, "flags");
  }

  return v5;
}

- (NSArray)elementContexts
{
  return self->_elementContexts;
}

- (SBSAPreferences)preferences
{
  return self->_preferences;
}

- (unint64_t)signals
{
  return self->_signals;
}

- (BOOL)isKeyLineRequiredForTransition
{
  return self->_keyLineRequiredForTransition;
}

- (unint64_t)queryIteration
{
  return self->_queryIteration;
}

- (CGRect)systemContainerBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_systemContainerBounds.origin.x;
  y = self->_systemContainerBounds.origin.y;
  width = self->_systemContainerBounds.size.width;
  height = self->_systemContainerBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (BOOL)isIndicatorVisible
{
  return self->_indicatorVisible;
}

- (double)displayScale
{
  return self->_displayScale;
}

- (SBSADefaultsContext)defaultsContext
{
  return self->_defaultsContext;
}

- (NSArray)containerViewDescriptions
{
  return self->_containerViewDescriptions;
}

- (NSArray)requests
{
  return self->_requests;
}

- (BOOL)isAnimatedTransitionInProgress
{
  return self->_animatedTransitionInProgress;
}

- (NSArray)gestureDescriptions
{
  return self->_gestureDescriptions;
}

- (NSArray)animatedTransitionResults
{
  return self->_animatedTransitionResults;
}

- (SBSAPlatformMetricsContext)platformMetrics
{
  return self->_platformMetrics;
}

- (int64_t)overrideRenderingStyle
{
  return self->_overrideRenderingStyle;
}

- (unint64_t)minimumNumberOfContainers
{
  return self->_minimumNumberOfContainers;
}

- (unint64_t)maximumNumberOfElements
{
  return self->_maximumNumberOfElements;
}

- (BOOL)isReduceTransparencyEnabled
{
  return self->_reduceTransparencyEnabled;
}

- (BOOL)isHeavyShadowRequiredForTransition
{
  return self->_heavyShadowRequiredForTransition;
}

- (BOOL)isAccessibilityZoomActiveAndEnabled
{
  return self->_accessibilityZoomActiveAndEnabled;
}

- (SBSAContext)initWithQueryIteration:(unint64_t)a3
{
  SBSAContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBSAContext;
  result = -[SBSAContext init](&v5, sel_init);
  if (result)
    result->_queryIteration = a3;
  return result;
}

- (CGRect)inertContainerFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inertContainerFrame.origin.x;
  y = self->_inertContainerFrame.origin.y;
  width = self->_inertContainerFrame.size.width;
  height = self->_inertContainerFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (int64_t)cloningStyle
{
  return self->_cloningStyle;
}

- (NSArray)elementInteractionResults
{
  return self->_elementInteractionResults;
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (UIEdgeInsets)landscapeScreenEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_landscapeScreenEdgeInsets.top;
  left = self->_landscapeScreenEdgeInsets.left;
  bottom = self->_landscapeScreenEdgeInsets.bottom;
  right = self->_landscapeScreenEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (NSArray)elementSnapshotContexts
{
  return self->_elementSnapshotContexts;
}

- (NSArray)elapsedTimerDescriptions
{
  return self->_elapsedTimerDescriptions;
}

- (SBSAViewDescription)containerParentViewDescription
{
  return self->_containerParentViewDescription;
}

uint64_t __23__SBSAContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "queryIteration");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t queryIteration;
  uint64_t v6;
  id v7;
  unint64_t maximumNumberOfElements;
  id v9;
  unint64_t minimumNumberOfContainers;
  id v11;
  id v12;
  id v13;
  SBSAPlatformMetricsContext *platformMetrics;
  id v15;
  int64_t layoutDirection;
  id v17;
  int64_t overrideRenderingStyle;
  id v19;
  int64_t cloningStyle;
  id v21;
  unint64_t activeDisplay;
  id v23;
  _BOOL8 indicatorVisible;
  id v25;
  _BOOL8 heavyShadowRequiredForTransition;
  id v27;
  _BOOL8 keyLineRequiredForTransition;
  id v29;
  _BOOL8 accessibilityZoomActiveAndEnabled;
  id v31;
  _BOOL8 reduceTransparencyEnabled;
  id v33;
  _BOOL8 animatedTransitionInProgress;
  id v35;
  _BOOL8 targetPlatformSimulator;
  id v37;
  _BOOL8 reachabilityActive;
  id v39;
  SBSAViewDescription *containerParentViewDescription;
  id v41;
  SBSADefaultsContext *defaultsContext;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  SBSAPreferences *preferences;
  id v57;
  void *v58;
  unint64_t signals;
  id v60;
  void *v61;
  unint64_t flags;
  id v63;
  void *v64;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  _QWORD v92[4];
  id v93;
  _QWORD v94[4];
  id v95;
  _QWORD v96[4];
  id v97;
  _QWORD v98[4];
  id v99;
  SBSAContext *v100;
  _QWORD v101[4];
  id v102;
  SBSAContext *v103;
  _QWORD v104[4];
  id v105;
  SBSAContext *v106;
  _QWORD v107[4];
  id v108;
  SBSAContext *v109;
  _QWORD v110[4];
  id v111;
  SBSAContext *v112;
  _QWORD v113[4];
  id v114;
  SBSAContext *v115;
  _QWORD v116[4];
  id v117;
  SBSAContext *v118;
  _QWORD v119[4];
  id v120;
  SBSAContext *v121;
  _QWORD v122[5];
  id v123;
  _QWORD v124[4];
  id v125;
  _QWORD v126[4];
  id v127;
  _QWORD v128[4];
  id v129;
  _QWORD v130[4];
  id v131;
  _QWORD v132[4];
  id v133;
  _QWORD v134[4];
  id v135;
  _QWORD v136[4];
  id v137;
  _QWORD v138[4];
  id v139;
  _QWORD v140[4];
  id v141;
  _QWORD v142[4];
  id v143;
  _QWORD v144[4];
  id v145;
  _QWORD v146[4];
  id v147;
  _QWORD v148[4];
  id v149;
  _QWORD v150[4];
  id v151;
  _QWORD v152[4];
  id v153;
  _QWORD v154[4];
  id v155;
  _QWORD v156[4];
  id v157;
  _QWORD v158[4];
  id v159;
  _QWORD v160[4];
  id v161;
  _QWORD v162[4];
  id v163;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  queryIteration = self->_queryIteration;
  v6 = MEMORY[0x1E0C809B0];
  v162[0] = MEMORY[0x1E0C809B0];
  v162[1] = 3221225472;
  v162[2] = __23__SBSAContext_isEqual___block_invoke;
  v162[3] = &unk_1E8E9EAA0;
  v7 = v4;
  v163 = v7;
  objc_msgSend(v88, "appendUnsignedInteger:counterpart:", queryIteration, v162);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  maximumNumberOfElements = self->_maximumNumberOfElements;
  v160[0] = v6;
  v160[1] = 3221225472;
  v160[2] = __23__SBSAContext_isEqual___block_invoke_2;
  v160[3] = &unk_1E8E9EAA0;
  v9 = v7;
  v161 = v9;
  objc_msgSend(v87, "appendUnsignedInteger:counterpart:", maximumNumberOfElements, v160);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  minimumNumberOfContainers = self->_minimumNumberOfContainers;
  v158[0] = v6;
  v158[1] = 3221225472;
  v158[2] = __23__SBSAContext_isEqual___block_invoke_3;
  v158[3] = &unk_1E8E9EAA0;
  v11 = v9;
  v159 = v11;
  objc_msgSend(v86, "appendUnsignedInteger:counterpart:", minimumNumberOfContainers, v158);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v156[0] = v6;
  v156[1] = 3221225472;
  v156[2] = __23__SBSAContext_isEqual___block_invoke_4;
  v156[3] = &unk_1E8EA6AD8;
  v12 = v11;
  v157 = v12;
  objc_msgSend(v85, "appendCGRect:counterpart:", v156, self->_inertContainerFrame.origin.x, self->_inertContainerFrame.origin.y, self->_inertContainerFrame.size.width, self->_inertContainerFrame.size.height);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v6;
  v154[1] = 3221225472;
  v154[2] = __23__SBSAContext_isEqual___block_invoke_5;
  v154[3] = &unk_1E8EA6AD8;
  v13 = v12;
  v155 = v13;
  objc_msgSend(v84, "appendCGRect:counterpart:", v154, self->_systemContainerBounds.origin.x, self->_systemContainerBounds.origin.y, self->_systemContainerBounds.size.width, self->_systemContainerBounds.size.height);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  platformMetrics = self->_platformMetrics;
  v152[0] = v6;
  v152[1] = 3221225472;
  v152[2] = __23__SBSAContext_isEqual___block_invoke_6;
  v152[3] = &unk_1E8EA4320;
  v15 = v13;
  v153 = v15;
  objc_msgSend(v83, "appendObject:counterpart:", platformMetrics, v152);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  layoutDirection = self->_layoutDirection;
  v150[0] = v6;
  v150[1] = 3221225472;
  v150[2] = __23__SBSAContext_isEqual___block_invoke_7;
  v150[3] = &unk_1E8EA3AB0;
  v17 = v15;
  v151 = v17;
  objc_msgSend(v82, "appendInteger:counterpart:", layoutDirection, v150);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  overrideRenderingStyle = self->_overrideRenderingStyle;
  v148[0] = v6;
  v148[1] = 3221225472;
  v148[2] = __23__SBSAContext_isEqual___block_invoke_8;
  v148[3] = &unk_1E8EA3AB0;
  v19 = v17;
  v149 = v19;
  objc_msgSend(v81, "appendInteger:counterpart:", overrideRenderingStyle, v148);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  cloningStyle = self->_cloningStyle;
  v146[0] = v6;
  v146[1] = 3221225472;
  v146[2] = __23__SBSAContext_isEqual___block_invoke_9;
  v146[3] = &unk_1E8EA3AB0;
  v21 = v19;
  v147 = v21;
  objc_msgSend(v80, "appendInteger:counterpart:", cloningStyle, v146);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  activeDisplay = self->_activeDisplay;
  v144[0] = v6;
  v144[1] = 3221225472;
  v144[2] = __23__SBSAContext_isEqual___block_invoke_10;
  v144[3] = &unk_1E8EA3AB0;
  v23 = v21;
  v145 = v23;
  objc_msgSend(v79, "appendInteger:counterpart:", activeDisplay, v144);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  indicatorVisible = self->_indicatorVisible;
  v142[0] = v6;
  v142[1] = 3221225472;
  v142[2] = __23__SBSAContext_isEqual___block_invoke_11;
  v142[3] = &unk_1E8EA3E78;
  v25 = v23;
  v143 = v25;
  objc_msgSend(v78, "appendBool:counterpart:", indicatorVisible, v142);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  heavyShadowRequiredForTransition = self->_heavyShadowRequiredForTransition;
  v140[0] = v6;
  v140[1] = 3221225472;
  v140[2] = __23__SBSAContext_isEqual___block_invoke_12;
  v140[3] = &unk_1E8EA3E78;
  v27 = v25;
  v141 = v27;
  objc_msgSend(v77, "appendBool:counterpart:", heavyShadowRequiredForTransition, v140);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  keyLineRequiredForTransition = self->_keyLineRequiredForTransition;
  v138[0] = v6;
  v138[1] = 3221225472;
  v138[2] = __23__SBSAContext_isEqual___block_invoke_13;
  v138[3] = &unk_1E8EA3E78;
  v29 = v27;
  v139 = v29;
  objc_msgSend(v76, "appendBool:counterpart:", keyLineRequiredForTransition, v138);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityZoomActiveAndEnabled = self->_accessibilityZoomActiveAndEnabled;
  v136[0] = v6;
  v136[1] = 3221225472;
  v136[2] = __23__SBSAContext_isEqual___block_invoke_14;
  v136[3] = &unk_1E8EA3E78;
  v31 = v29;
  v137 = v31;
  objc_msgSend(v75, "appendBool:counterpart:", accessibilityZoomActiveAndEnabled, v136);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  reduceTransparencyEnabled = self->_reduceTransparencyEnabled;
  v134[0] = v6;
  v134[1] = 3221225472;
  v134[2] = __23__SBSAContext_isEqual___block_invoke_15;
  v134[3] = &unk_1E8EA3E78;
  v33 = v31;
  v135 = v33;
  objc_msgSend(v74, "appendBool:counterpart:", reduceTransparencyEnabled, v134);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  animatedTransitionInProgress = self->_animatedTransitionInProgress;
  v132[0] = v6;
  v132[1] = 3221225472;
  v132[2] = __23__SBSAContext_isEqual___block_invoke_16;
  v132[3] = &unk_1E8EA3E78;
  v35 = v33;
  v133 = v35;
  objc_msgSend(v73, "appendBool:counterpart:", animatedTransitionInProgress, v132);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  targetPlatformSimulator = self->_targetPlatformSimulator;
  v130[0] = v6;
  v130[1] = 3221225472;
  v130[2] = __23__SBSAContext_isEqual___block_invoke_17;
  v130[3] = &unk_1E8EA3E78;
  v37 = v35;
  v131 = v37;
  objc_msgSend(v72, "appendBool:counterpart:", targetPlatformSimulator, v130);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  reachabilityActive = self->_reachabilityActive;
  v128[0] = v6;
  v128[1] = 3221225472;
  v128[2] = __23__SBSAContext_isEqual___block_invoke_18;
  v128[3] = &unk_1E8EA3E78;
  v39 = v37;
  v129 = v39;
  objc_msgSend(v71, "appendBool:counterpart:", reachabilityActive, v128);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  containerParentViewDescription = self->_containerParentViewDescription;
  v126[0] = v6;
  v126[1] = 3221225472;
  v126[2] = __23__SBSAContext_isEqual___block_invoke_19;
  v126[3] = &unk_1E8EA4320;
  v41 = v39;
  v127 = v41;
  objc_msgSend(v70, "appendObject:counterpart:", containerParentViewDescription, v126);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  defaultsContext = self->_defaultsContext;
  v124[0] = v6;
  v124[1] = 3221225472;
  v124[2] = __23__SBSAContext_isEqual___block_invoke_20;
  v124[3] = &unk_1E8EA4320;
  v43 = v41;
  v125 = v43;
  objc_msgSend(v69, "appendObject:counterpart:", defaultsContext, v124);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v122[0] = v6;
  v122[1] = 3221225472;
  v122[2] = __23__SBSAContext_isEqual___block_invoke_21;
  v122[3] = &unk_1E8E9EA50;
  v122[4] = self;
  v123 = v43;
  v119[0] = v6;
  v119[1] = 3221225472;
  v119[2] = __23__SBSAContext_isEqual___block_invoke_22;
  v119[3] = &unk_1E8E9EA50;
  v44 = v123;
  v120 = v44;
  v121 = self;
  v90 = (void *)MEMORY[0x1D17E5550](v119);
  v116[0] = v6;
  v116[1] = 3221225472;
  v116[2] = __23__SBSAContext_isEqual___block_invoke_23;
  v116[3] = &unk_1E8E9EA50;
  v45 = v44;
  v117 = v45;
  v118 = self;
  v89 = (void *)MEMORY[0x1D17E5550](v116);
  v113[0] = v6;
  v113[1] = 3221225472;
  v113[2] = __23__SBSAContext_isEqual___block_invoke_24;
  v113[3] = &unk_1E8E9EA50;
  v46 = v45;
  v114 = v46;
  v115 = self;
  v68 = (void *)MEMORY[0x1D17E5550](v113);
  v110[0] = v6;
  v110[1] = 3221225472;
  v110[2] = __23__SBSAContext_isEqual___block_invoke_25;
  v110[3] = &unk_1E8E9EA50;
  v47 = v46;
  v111 = v47;
  v112 = self;
  v48 = (void *)MEMORY[0x1D17E5550](v110);
  v107[0] = v6;
  v107[1] = 3221225472;
  v107[2] = __23__SBSAContext_isEqual___block_invoke_26;
  v107[3] = &unk_1E8E9EA50;
  v49 = v47;
  v108 = v49;
  v109 = self;
  v50 = (void *)MEMORY[0x1D17E5550](v107);
  v104[0] = v6;
  v104[1] = 3221225472;
  v104[2] = __23__SBSAContext_isEqual___block_invoke_27;
  v104[3] = &unk_1E8E9EA50;
  v51 = v49;
  v105 = v51;
  v106 = self;
  v67 = (void *)MEMORY[0x1D17E5550](v104);
  v101[0] = v6;
  v101[1] = 3221225472;
  v101[2] = __23__SBSAContext_isEqual___block_invoke_28;
  v101[3] = &unk_1E8E9EA50;
  v52 = v51;
  v102 = v52;
  v103 = self;
  v66 = (void *)MEMORY[0x1D17E5550](v101);
  v98[0] = v6;
  v98[1] = 3221225472;
  v98[2] = __23__SBSAContext_isEqual___block_invoke_29;
  v98[3] = &unk_1E8E9EA50;
  v53 = v52;
  v99 = v53;
  v100 = self;
  v54 = (void *)MEMORY[0x1D17E5550](v98);
  objc_msgSend(v91, "appendEqualsBlocks:", v122, v90, v89, v68, v48, v50, v67, v66, v54, 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  preferences = self->_preferences;
  v96[0] = v6;
  v96[1] = 3221225472;
  v96[2] = __23__SBSAContext_isEqual___block_invoke_30;
  v96[3] = &unk_1E8EA4320;
  v57 = v53;
  v97 = v57;
  objc_msgSend(v55, "appendObject:counterpart:", preferences, v96);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  signals = self->_signals;
  v94[0] = v6;
  v94[1] = 3221225472;
  v94[2] = __23__SBSAContext_isEqual___block_invoke_31;
  v94[3] = &unk_1E8E9EAA0;
  v60 = v57;
  v95 = v60;
  objc_msgSend(v58, "appendUnsignedInteger:counterpart:", signals, v94);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  flags = self->_flags;
  v92[0] = v6;
  v92[1] = 3221225472;
  v92[2] = __23__SBSAContext_isEqual___block_invoke_32;
  v92[3] = &unk_1E8E9EAA0;
  v93 = v60;
  v63 = v60;
  objc_msgSend(v61, "appendUnsignedInteger:counterpart:", flags, v92);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(flags) = objc_msgSend(v64, "isEqual");

  return flags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_elapsedTimerDescriptions, 0);
  objc_storeStrong((id *)&self->_animatedTransitionResults, 0);
  objc_storeStrong((id *)&self->_gestureDescriptions, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_containerViewDescriptions, 0);
  objc_storeStrong((id *)&self->_defaultsContext, 0);
  objc_storeStrong((id *)&self->_elementSnapshotContexts, 0);
  objc_storeStrong((id *)&self->_elementInteractionResults, 0);
  objc_storeStrong((id *)&self->_elementContexts, 0);
  objc_storeStrong((id *)&self->_containerParentViewDescription, 0);
  objc_storeStrong((id *)&self->_platformMetrics, 0);
}

- (id)copyByUpdatingPreferences:(id)a3
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  SEL v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__SBSAContext_Private__copyByUpdatingPreferences___block_invoke;
  v9[3] = &unk_1E8EA4230;
  v10 = v5;
  v11 = a2;
  v9[4] = self;
  v6 = v5;
  v7 = -[SBSAContext copyWithBlock:](self, "copyWithBlock:", v9);

  return v7;
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAContext copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithContext:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithContext:", self);
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

void __50__SBSAContext_Private__copyByUpdatingPreferences___block_invoke(_QWORD *a1, void *a2)
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
    v10 = NSClassFromString(CFSTR("SBSAContextMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAContext.m"), 413, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setPreferences:", a1[5]);
}

- (void)_setPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)_setSystemContainerBounds:(CGRect)a3
{
  self->_systemContainerBounds = a3;
}

- (void)_setRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)_setReduceTransparencyEnabled:(BOOL)a3
{
  self->_reduceTransparencyEnabled = a3;
}

- (void)_setPlatformMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)_setOverrideRenderingStyle:(int64_t)a3
{
  self->_overrideRenderingStyle = a3;
}

- (void)_setMinimumNumberOfContainers:(unint64_t)a3
{
  self->_minimumNumberOfContainers = a3;
}

- (void)_setMaximumNumberOfElements:(unint64_t)a3
{
  self->_maximumNumberOfElements = a3;
}

- (void)_setLayoutDirection:(int64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)_setLandscapeScreenEdgeInsets:(UIEdgeInsets)a3
{
  self->_landscapeScreenEdgeInsets = a3;
}

- (void)_setKeyLineRequiredForTransition:(BOOL)a3
{
  self->_keyLineRequiredForTransition = a3;
}

- (void)_setInertContainerFrame:(CGRect)a3
{
  self->_inertContainerFrame = a3;
}

- (void)_setIndicatorVisible:(BOOL)a3
{
  self->_indicatorVisible = a3;
}

- (void)_setHeavyShadowRequiredForTransition:(BOOL)a3
{
  self->_heavyShadowRequiredForTransition = a3;
}

- (void)_setGestureDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (void)_setElementSnapshotContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)_setElementInteractionResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)_setElementContexts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)_setElapsedTimerDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)_setDisplayScale:(double)a3
{
  self->_displayScale = a3;
}

- (void)_setDefaultsContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void)_setContainerViewDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void)_setContainerParentViewDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)_setCloningStyle:(int64_t)a3
{
  self->_cloningStyle = a3;
}

- (void)_setAnimatedTransitionResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (void)_setAnimatedTransitionInProgress:(BOOL)a3
{
  self->_animatedTransitionInProgress = a3;
}

- (void)_setAccessibilityZoomActiveAndEnabled:(BOOL)a3
{
  self->_accessibilityZoomActiveAndEnabled = a3;
}

+ (id)instanceWithQueryIteration:(unint64_t)a3 block:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithQueryIteration:", a3);
  v7 = (void *)objc_msgSend(v6, "copyWithBlock:", v5);

  return v7;
}

- (BOOL)containsAnyOfSignals:(unint64_t)a3
{
  return (-[SBSAContext signals](self, "signals") & a3) != 0;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "maximumNumberOfElements");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "minimumNumberOfContainers");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "inertContainerFrame");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "systemContainerBounds");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "platformMetrics");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutDirection");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "overrideRenderingStyle");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cloningStyle");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activeDisplay");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_11(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isIndicatorVisible");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_12(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isHeavyShadowRequiredForTransition");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isKeyLineRequiredForTransition");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_14(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isAccessibilityZoomActiveAndEnabled");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isReduceTransparencyEnabled");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isAnimatedTransitionInProgress");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_17(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isTargetPlatformSimulator");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isReachabilityActive");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_19(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "containerParentViewDescription");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_20(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "defaultsContext");
}

BOOL __23__SBSAContext_isEqual___block_invoke_21(uint64_t a1)
{
  double *v1;
  double v2;
  double v3;
  double v4;
  _BOOL4 v5;
  double v6;

  v1 = *(double **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "landscapeScreenEdgeInsets");
  v5 = v1[33] == v4;
  if (v1[32] != v6)
    v5 = 0;
  if (v1[35] != v3)
    v5 = 0;
  return v1[34] == v2 && v5;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_22(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "requests");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_23(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "elementContexts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_24(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "elementInteractionResults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_25(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "elementSnapshotContexts");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_26(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "gestureDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_27(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "animatedTransitionResults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_28(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "animatedTransitionResults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_29(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "containerViewDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = BSEqualArrays();

  return v2;
}

uint64_t __23__SBSAContext_isEqual___block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "preferences");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_31(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "signals");
}

uint64_t __23__SBSAContext_isEqual___block_invoke_32(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flags");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "appendUnsignedInteger:", self->_queryIteration);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "appendUnsignedInteger:", self->_minimumNumberOfContainers);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "appendUnsignedInteger:", self->_maximumNumberOfElements);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "appendCGRect:", self->_inertContainerFrame.origin.x, self->_inertContainerFrame.origin.y, self->_inertContainerFrame.size.width, self->_inertContainerFrame.size.height);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "appendCGRect:", self->_systemContainerBounds.origin.x, self->_systemContainerBounds.origin.y, self->_systemContainerBounds.size.width, self->_systemContainerBounds.size.height);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "appendInteger:", self->_layoutDirection);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "appendCGFloat:", self->_landscapeScreenEdgeInsets.top);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "appendCGFloat:", self->_landscapeScreenEdgeInsets.left);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "appendCGFloat:", self->_landscapeScreenEdgeInsets.bottom);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "appendCGFloat:", self->_landscapeScreenEdgeInsets.right);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "appendInteger:", self->_overrideRenderingStyle);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "appendInteger:", self->_cloningStyle);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "appendInteger:", self->_activeDisplay);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "appendBool:", self->_indicatorVisible);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "appendBool:", self->_heavyShadowRequiredForTransition);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "appendBool:", self->_keyLineRequiredForTransition);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "appendBool:", self->_accessibilityZoomActiveAndEnabled);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "appendBool:", self->_targetPlatformSimulator);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendBool:", self->_reachabilityActive);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "appendBool:", self->_reduceTransparencyEnabled);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "appendBool:", self->_animatedTransitionInProgress);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "appendObject:", self->_containerParentViewDescription);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appendObject:", self->_platformMetrics);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendObject:", self->_requests);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendObject:", self->_elementContexts);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendObject:", self->_elementInteractionResults);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_elementSnapshotContexts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_defaultsContext);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:", self->_gestureDescriptions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendObject:", self->_animatedTransitionResults);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendObject:", self->_elapsedTimerDescriptions);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendObject:", self->_containerViewDescriptions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendObject:", self->_preferences);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appendUnsignedInteger:", self->_signals);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendUnsignedInteger:", self->_flags);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "hash");

  return v17;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[SBSAContext dictionaryDescription](self, "dictionaryDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBSAStringFromDictionaryDescription(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BSOrderedDictionary)dictionaryDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  SBSAViewDescription *containerParentViewDescription;
  void *v29;
  void *v30;
  void *v31;
  SBSADefaultsContext *defaultsContext;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  SBSAPreferences *preferences;

  v3 = objc_alloc(MEMORY[0x1E0D017C8]);
  objc_msgSend(MEMORY[0x1E0D017F0], "sortByInsertionOrder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithKeyOrderingStrategy:", v4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v6, v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_queryIteration);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("queryIteration"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&self->_displayScale);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("displayScale"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_minimumNumberOfContainers);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("minimumNumberOfContainers"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), self->_maximumNumberOfElements);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("maximumNumberOfElements"));

  NSStringFromCGRect(self->_inertContainerFrame);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("inertContainerFrame"));

  NSStringFromCGRect(self->_systemContainerBounds);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v14, CFSTR("systemContainerBounds"));

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_platformMetrics);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v15, CFSTR("platformMetrics"));

  SBSAStringFromUITraitEnvironmentLayoutDirection(self->_layoutDirection);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v16, CFSTR("layoutDirection"));

  NSStringFromUIEdgeInsets(self->_landscapeScreenEdgeInsets);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v17, CFSTR("landscapeScreenEdgeInsets"));

  SBStringFromSystemApertureContainerRenderingStyle(self->_overrideRenderingStyle);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v18, CFSTR("overrideRenderingStyle"));

  SBStringFromSystemApertureContainerCloningStyle(self->_cloningStyle);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v19, CFSTR("cloningStyle"));

  NSStringFromBOOL();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v20, CFSTR("indicatorVisible"));

  NSStringFromBOOL();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v21, CFSTR("heavyShadowRequiredForTransition"));

  NSStringFromBOOL();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v22, CFSTR("keyLineRequiredForTransition"));

  NSStringFromBOOL();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v23, CFSTR("accessibilityZoomActiveAndEnabled"));

  NSStringFromBOOL();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v24, CFSTR("reduceTransparencyEnabled"));

  NSStringFromBOOL();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v25, CFSTR("animatedTransitionInProgress"));

  NSStringFromBOOL();
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v26, CFSTR("reachabilityActive"));

  NSStringFromBOOL();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v27, CFSTR("targetPlatformSimulator"));

  containerParentViewDescription = self->_containerParentViewDescription;
  if (containerParentViewDescription)
  {
    -[SBSAViewDescription description](containerParentViewDescription, "description");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v29, CFSTR("containerParentViewDescription"));

  }
  if (-[NSArray count](self->_requests, "count"))
  {
    -[NSArray description](self->_requests, "description");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v30, CFSTR("requests"));

  }
  if (-[NSArray count](self->_elementContexts, "count"))
    objc_msgSend(v5, "setObject:forKey:", self->_elementContexts, CFSTR("elementContexts"));
  if (-[NSArray count](self->_elementInteractionResults, "count"))
    objc_msgSend(v5, "setObject:forKey:", self->_elementInteractionResults, CFSTR("elementInteractionResults"));
  if (-[NSArray count](self->_elementSnapshotContexts, "count"))
  {
    -[NSArray description](self->_elementSnapshotContexts, "description");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v31, CFSTR("elementSnapshotContexts"));

  }
  defaultsContext = self->_defaultsContext;
  if (defaultsContext)
  {
    -[SBSADefaultsContext description](defaultsContext, "description");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v33, CFSTR("defaultsContext"));

  }
  if (-[NSArray count](self->_gestureDescriptions, "count"))
  {
    -[NSArray description](self->_gestureDescriptions, "description");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v34, CFSTR("gestureDescriptions"));

  }
  if (-[NSArray count](self->_animatedTransitionResults, "count"))
  {
    -[NSArray description](self->_animatedTransitionResults, "description");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v35, CFSTR("animatedTransitionResults"));

  }
  if (-[NSArray count](self->_elapsedTimerDescriptions, "count"))
  {
    -[NSArray description](self->_elapsedTimerDescriptions, "description");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v36, CFSTR("elapsedTimerDescriptions"));

  }
  if (-[NSArray count](self->_containerViewDescriptions, "count"))
    objc_msgSend(v5, "setObject:forKey:", self->_containerViewDescriptions, CFSTR("containerViewDescriptions"));
  _StringFromPreferencesStackSignals(self->_signals);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v37, CFSTR("signals"));

  _StringFromPreferencesStackFlags(self->_flags);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v38, CFSTR("flags"));

  SBStringFromSBSystemApertureActiveDisplay(self->_activeDisplay);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v39, CFSTR("activeDisplay"));

  preferences = self->_preferences;
  if (preferences)
    objc_msgSend(v5, "setObject:forKey:", preferences, CFSTR("preferences"));
  return (BSOrderedDictionary *)v5;
}

+ (id)instanceWithBlock:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (unint64_t)activeDisplay
{
  return self->_activeDisplay;
}

- (void)_setActiveDisplay:(unint64_t)a3
{
  self->_activeDisplay = a3;
}

- (BOOL)isReachabilityActive
{
  return self->_reachabilityActive;
}

- (void)_setReachabilityActive:(BOOL)a3
{
  self->_reachabilityActive = a3;
}

- (BOOL)isTargetPlatformSimulator
{
  return self->_targetPlatformSimulator;
}

- (void)_setTargetPlatformSimulator:(BOOL)a3
{
  self->_targetPlatformSimulator = a3;
}

- (void)_setSignals:(unint64_t)a3
{
  self->_signals = a3;
}

- (void)_setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (id)copyByAddingSignals:(unint64_t)a3 debugRequestingProvider:(id)a4
{
  id v7;
  SBSAContext *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[7];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = self;
  if (a3)
  {
    SBLogSystemAperturePreferencesStack();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = -[SBSAContext queryIteration](v8, "queryIteration");
      _StringFromPreferencesStackSignals(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "[%{public}lu] Signals added: <%@> by provider: %@", buf, 0x20u);

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__SBSAContext_Private__copyByAddingSignals_debugRequestingProvider___block_invoke;
    v15[3] = &unk_1E8EA2CC8;
    v15[4] = v8;
    v15[5] = a2;
    v15[6] = a3;
    v10 = -[SBSAContext copyWithBlock:](v8, "copyWithBlock:", v15);

    v8 = (SBSAContext *)v10;
  }

  return v8;
}

void __68__SBSAContext_Private__copyByAddingSignals_debugRequestingProvider___block_invoke(_QWORD *a1, void *a2)
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
    v9 = a1[4];
    v8 = a1[5];
    v10 = NSClassFromString(CFSTR("SBSAContextMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAContext.m"), 392, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setSignals:", a1[6] | objc_msgSend(v6, "signals"));
}

- (id)copyByAddingFlags:(unint64_t)a3 debugRequestingProvider:(id)a4
{
  id v7;
  SBSAContext *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[7];
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = self;
  if (a3)
  {
    SBLogSystemAperturePreferencesStack();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = -[SBSAContext queryIteration](v8, "queryIteration");
      _StringFromPreferencesStackFlags(a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134349570;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_debug_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEBUG, "[%{public}lu] Flags Added: <%@> by provider: %@", buf, 0x20u);

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__SBSAContext_Private__copyByAddingFlags_debugRequestingProvider___block_invoke;
    v15[3] = &unk_1E8EA2CC8;
    v15[4] = v8;
    v15[5] = a2;
    v15[6] = a3;
    v10 = -[SBSAContext copyWithBlock:](v8, "copyWithBlock:", v15);

    v8 = (SBSAContext *)v10;
  }

  return v8;
}

void __66__SBSAContext_Private__copyByAddingFlags_debugRequestingProvider___block_invoke(_QWORD *a1, void *a2)
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
    v9 = a1[4];
    v8 = a1[5];
    v10 = NSClassFromString(CFSTR("SBSAContextMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAContext.m"), 404, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setFlags:", a1[6] | objc_msgSend(v6, "flags"));
}

@end
