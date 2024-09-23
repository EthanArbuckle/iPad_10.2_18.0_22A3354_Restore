@implementation SBSAContainerResizeBehaviorProvider

- (id)preferencesFromContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  SBSAContainerPanGestureDescription *activeGestureDescription;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  CGRect *p_initialFrameOfContainerViewForActiveGesture;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  int *v37;
  SBSAContainerResizeAction *v38;
  int64_t resizeGestureResult;
  void *v40;
  void *v41;
  SBSAContainerResizeAction *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  SBSAContainerPanGestureDescription *v46;
  NSArray *elementContexts;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  CGSize size;
  SBSAContainerPanGestureDescription *v53;
  double x;
  double y;
  double width;
  double height;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  CGRect *p_minimumFrameOfContainerViewForActiveGesture;
  double MaxX;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  _BOOL4 v88;
  int64_t v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  void *v97;
  int v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  void *v109;
  int v110;
  uint64_t v111;
  void *v112;
  uint64_t v113;
  void *v114;
  NSObject *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  uint64_t v120;
  id v121;
  void *v122;
  id v123;
  void *v124;
  int v125;
  SBSAContainerPanGestureDescription *v126;
  void *v128;
  Class v129;
  objc_class *v130;
  void *v131;
  id v132;
  id v133;
  void *v134;
  void *v135;
  CGRect *v136;
  CGRect *v137;
  void *v138;
  double v139;
  double v140;
  double v141;
  uint64_t v142;
  double v143;
  double v144;
  SBSAContainerResizeBehaviorProvider *v145;
  void *v146;
  void *v148;
  id obj;
  _BOOL4 v150;
  id v151;
  objc_super v152;
  _QWORD v153[5];
  id v154;
  SEL v155;
  _QWORD v156[7];
  char v157;
  _QWORD v158[10];
  char v159;
  unint64_t v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  _QWORD v165[6];
  unint64_t v166;
  _QWORD v167[4];
  id v168;
  const __CFString *v169;
  SBSAContainerResizeAction *v170;
  _BYTE v171[128];
  uint64_t v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;

  v172 = *MEMORY[0x1E0C80C00];
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
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      v129 = NSClassFromString(CFSTR("SBSAContext"));
      v130 = (objc_class *)objc_opt_class();
      NSStringFromClass(v130);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAContainerResizeBehaviorProvider.m"), 89, CFSTR("Unexpected class – expected '%@', got '%@'"), v129, v131);

    }
  }
  else
  {
    v8 = 0;
  }

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

  v14 = v8;
  objc_msgSend(v8, "gestureDescriptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bs_firstObjectPassingTest:", &__block_literal_global_231);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_storeStrong((id *)&self->_activeGestureDescription, v16);
  activeGestureDescription = self->_activeGestureDescription;
  if (activeGestureDescription)
  {
    v18 = -[SBSAGestureDescription gestureRecognizerState](activeGestureDescription, "gestureRecognizerState");
    if (self->_resizeGestureResult)
    {
      v19 = objc_msgSend(v14, "copyByAddingFlags:debugRequestingProvider:", 2, self);

      v14 = (void *)v19;
    }
    -[SBSAGestureDescription associatedInterfaceElementIdentifier](self->_activeGestureDescription, "associatedInterfaceElementIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "preferences");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "containerViewDescriptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v167[0] = MEMORY[0x1E0C809B0];
    v167[1] = 3221225472;
    v167[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_2;
    v167[3] = &unk_1E8EA6A60;
    v23 = v20;
    v168 = v23;
    v135 = v22;
    objc_msgSend(v22, "bs_firstObjectPassingTest:", v167);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v133 = v23;
      v166 = 0;
      v138 = v14;
      objc_msgSend(v14, "elementContexts");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      SBSAElementContextAssociatedWithContainerViewDescription(v24, v148, &v166);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = v25;
      if (v25)
        v26 = objc_msgSend(v25, "interfaceOrientation");
      else
        v26 = 1;
      v150 = (v166 == 0x7FFFFFFFFFFFFFFFLL || !v166) && (unint64_t)(v26 - 5) < 0xFFFFFFFFFFFFFFFELL;
      v134 = v16;
      switch(v18)
      {
        case 1:
          if (v148)
            v28 = v148;
          else
            v28 = (void *)MEMORY[0x1E0C9AA60];
          objc_storeStrong((id *)&self->_elementContexts, v28);
          p_initialFrameOfContainerViewForActiveGesture = &self->_initialFrameOfContainerViewForActiveGesture;
          if (v146)
          {
            v30 = SBSAFrameForElementInCollection(v166, v148, v14);
            p_initialFrameOfContainerViewForActiveGesture->origin.x = v30;
            self->_initialFrameOfContainerViewForActiveGesture.origin.y = v31;
            self->_initialFrameOfContainerViewForActiveGesture.size.width = v32;
            self->_initialFrameOfContainerViewForActiveGesture.size.height = v33;
            self->_minimumFrameOfContainerViewForActiveGesture.origin.x = _SBSAMinimumFrameForElementAtIndex(v166, v14, v30, v31, v32, v33);
            self->_minimumFrameOfContainerViewForActiveGesture.origin.y = v34;
            self->_minimumFrameOfContainerViewForActiveGesture.size.width = v35;
            self->_minimumFrameOfContainerViewForActiveGesture.size.height = v36;
          }
          else
          {
            objc_msgSend(v14, "inertContainerFrame");
            p_initialFrameOfContainerViewForActiveGesture->origin.x = v48;
            self->_initialFrameOfContainerViewForActiveGesture.origin.y = v49;
            self->_initialFrameOfContainerViewForActiveGesture.size.width = v50;
            self->_initialFrameOfContainerViewForActiveGesture.size.height = v51;
            size = self->_initialFrameOfContainerViewForActiveGesture.size;
            self->_minimumFrameOfContainerViewForActiveGesture.origin = p_initialFrameOfContainerViewForActiveGesture->origin;
            self->_minimumFrameOfContainerViewForActiveGesture.size = size;
          }
          goto LABEL_40;
        case 2:
LABEL_40:
          v53 = self->_activeGestureDescription;
          x = self->_initialFrameOfContainerViewForActiveGesture.origin.x;
          y = self->_initialFrameOfContainerViewForActiveGesture.origin.y;
          width = self->_initialFrameOfContainerViewForActiveGesture.size.width;
          height = self->_initialFrameOfContainerViewForActiveGesture.size.height;
          v137 = &self->_initialFrameOfContainerViewForActiveGesture;
          if (v150)
          {
            -[SBSAContainerResizeBehaviorProvider _frameForContainerViewDescription:resizedWithGestureDescription:initialContainerViewFrame:context:](self, "_frameForContainerViewDescription:resizedWithGestureDescription:initialContainerViewFrame:context:", v24, v53, v14, x, y, width, height);
            v59 = v58;
            v61 = v60;
            v63 = v62;
            v65 = v64;
          }
          else
          {
            -[SBSAContainerResizeBehaviorProvider _frameForAdjunctContainerViewDescription:resizedWithGestureDescription:initialContainerViewFrame:context:](self, "_frameForAdjunctContainerViewDescription:resizedWithGestureDescription:initialContainerViewFrame:context:", v24, v53, v14, x, y, width, height);
            v59 = v66;
            v61 = v67;
            v63 = v68;
            v65 = v69;
            v165[0] = MEMORY[0x1E0C809B0];
            v165[1] = 3221225472;
            v165[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_3;
            v165[3] = &unk_1E8E9E9D0;
            v165[5] = a2;
            v165[4] = self;
            v70 = objc_msgSend(v13, "copyWithBlock:", v165);

            v13 = (id)v70;
          }
          p_minimumFrameOfContainerViewForActiveGesture = &self->_minimumFrameOfContainerViewForActiveGesture;
          MaxX = CGRectGetMaxX(self->_minimumFrameOfContainerViewForActiveGesture);
          v173.origin.x = v59;
          v173.origin.y = v61;
          v173.size.width = v63;
          v173.size.height = v65;
          v73 = CGRectGetMaxX(v173);
          if (MaxX < v73)
            MaxX = v73;
          v174.origin.x = v59;
          v174.origin.y = v61;
          v174.size.width = v63;
          v174.size.height = v65;
          v74 = MaxX - CGRectGetMinX(v174);
          v175.origin.x = p_minimumFrameOfContainerViewForActiveGesture->origin.x;
          v175.origin.y = self->_minimumFrameOfContainerViewForActiveGesture.origin.y;
          v175.size.width = self->_minimumFrameOfContainerViewForActiveGesture.size.width;
          v175.size.height = self->_minimumFrameOfContainerViewForActiveGesture.size.height;
          v75 = CGRectGetHeight(v175);
          v176.origin.x = v59;
          v176.origin.y = v61;
          v176.size.width = v74;
          v176.size.height = v65;
          v76 = CGRectGetHeight(v176);
          if (v75 >= v76)
            v77 = v75;
          else
            v77 = v76;
          v179.origin.x = p_minimumFrameOfContainerViewForActiveGesture->origin.x;
          v179.origin.y = self->_minimumFrameOfContainerViewForActiveGesture.origin.y;
          v179.size.width = self->_minimumFrameOfContainerViewForActiveGesture.size.width;
          v179.size.height = self->_minimumFrameOfContainerViewForActiveGesture.size.height;
          v136 = &self->_minimumFrameOfContainerViewForActiveGesture;
          v78 = v59;
          v79 = v61;
          v80 = v74;
          v177 = CGRectUnion(*(CGRect *)(&v77 - 3), v179);
          v81 = v177.origin.x;
          v82 = v177.origin.y;
          v83 = v177.size.width;
          v84 = v177.size.height;
          -[SBSAContainerPanGestureDescription translation](self->_activeGestureDescription, "translation");
          v87 = -v85;
          if (v85 >= 0.0)
            v87 = v85;
          if (v87 > 10.0)
            goto LABEL_54;
          if (v86 < 0.0)
            v86 = -v86;
          if (v86 <= 10.0)
          {
            v91 = v13;
            v90 = v148;
          }
          else
          {
LABEL_54:
            v88 = -[SBSAContainerResizeBehaviorProvider _didContainerViewForActiveGestureCollapseWithFrame:initialContainerViewFrame:isPrimaryContainer:activeInterfaceOrientation:](self, "_didContainerViewForActiveGestureCollapseWithFrame:initialContainerViewFrame:isPrimaryContainer:activeInterfaceOrientation:", v150, v26, v81, v82, v83, v84, self->_initialFrameOfContainerViewForActiveGesture.origin.x, self->_initialFrameOfContainerViewForActiveGesture.origin.y, self->_initialFrameOfContainerViewForActiveGesture.size.width, self->_initialFrameOfContainerViewForActiveGesture.size.height);
            v89 = -1;
            if (!v88)
              v89 = 1;
            v90 = v148;
            if (v89 == self->_resizeGestureResult)
            {
              v91 = v13;
            }
            else
            {
              self->_resizeGestureResult = v89;
              v91 = (void *)objc_msgSend(v13, "copyWithCancellationOfGestureOfClass:context:", objc_opt_class(), v14);

            }
          }
          v145 = self;
          v132 = v4;
          v151 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v161 = 0u;
          v162 = 0u;
          v163 = 0u;
          v164 = 0u;
          obj = v135;
          v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v171, 16);
          if (v92)
          {
            v93 = v92;
            v94 = *(_QWORD *)v162;
            v143 = *MEMORY[0x1E0C9D648];
            v144 = v84;
            v140 = *(double *)(MEMORY[0x1E0C9D648] + 16);
            v141 = *(double *)(MEMORY[0x1E0C9D648] + 8);
            v139 = *(double *)(MEMORY[0x1E0C9D648] + 24);
            v142 = *(_QWORD *)v162;
            v95 = MEMORY[0x1E0C809B0];
            do
            {
              for (i = 0; i != v93; ++i)
              {
                if (*(_QWORD *)v162 != v94)
                  objc_enumerationMutation(obj);
                v97 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * i);
                v98 = BSEqualObjects();
                v99 = v81;
                v100 = v82;
                v101 = v83;
                v102 = v84;
                if ((v98 & 1) == 0)
                {
                  v160 = 0x7FFFFFFFFFFFFFFFLL;
                  SBSAElementContextAssociatedWithContainerViewDescription(v97, v90, &v160);
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  v99 = v143;
                  v101 = v140;
                  v100 = v141;
                  v102 = v139;
                  if (v103)
                  {
                    if (v150)
                      v104 = SBSAAdjunctFrameForElementInCollection(v160, v90, v138, v81, v82, v83, v84);
                    else
                      v104 = SBSAFrameForElementInCollection(v160, v90, v138);
                    v99 = v104;
                    v100 = v105;
                    v101 = v106;
                    v102 = v107;
                  }

                }
                v178.origin.x = v99;
                v178.origin.y = v100;
                v178.size.width = v101;
                v178.size.height = v102;
                if (CGRectIsEmpty(v178))
                {
                  objc_msgSend(v151, "addObject:", v97);
                }
                else
                {
                  v158[0] = v95;
                  v158[1] = 3221225472;
                  v158[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_4;
                  v158[3] = &unk_1E8EB5078;
                  v108 = v91;
                  v158[4] = v145;
                  v158[5] = a2;
                  *(double *)&v158[6] = v99;
                  *(double *)&v158[7] = v100;
                  *(double *)&v158[8] = v101;
                  *(double *)&v158[9] = v102;
                  v159 = v98;
                  v109 = (void *)objc_msgSend(v97, "copyWithBlock:", v158);
                  objc_msgSend(v151, "addObject:", v109);

                  v156[0] = v95;
                  v156[1] = 3221225472;
                  v156[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_5;
                  v156[3] = &unk_1E8EAFB30;
                  v156[5] = v97;
                  v156[6] = a2;
                  v156[4] = v145;
                  v157 = v98;
                  v91 = (void *)objc_msgSend(v91, "copyWithBlock:", v156);

                  if (v146)
                    v110 = v98;
                  else
                    v110 = 0;
                  if ((v110 & v150) == 1 && v145->_resizeGestureResult == -1)
                  {
                    -[SBSAContainerResizeBehaviorProvider _preferencesUpdatedWithCollapseOfElement:activeFrame:initialFrame:minimumFrame:preferences:](v145, "_preferencesUpdatedWithCollapseOfElement:activeFrame:initialFrame:minimumFrame:preferences:", v99, v100, v101, v102, v137->origin.x, v137->origin.y, v137->size.width, v137->size.height, *(_QWORD *)&v136->origin.x, *(_QWORD *)&v136->origin.y, *(_QWORD *)&v136->size.width, *(_QWORD *)&v136->size.height);
                    v111 = objc_claimAutoreleasedReturnValue();

                    v91 = (void *)v111;
                  }
                  v90 = v148;
                  v94 = v142;
                  v84 = v144;
                }
              }
              v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v161, v171, 16);
            }
            while (v93);
          }

          v153[0] = MEMORY[0x1E0C809B0];
          v153[1] = 3221225472;
          v153[2] = __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_6;
          v153[3] = &unk_1E8EA4230;
          self = v145;
          v153[4] = v145;
          v154 = v151;
          v155 = a2;
          v112 = v91;
          elementContexts = (NSArray *)v151;
          v13 = (id)objc_msgSend(v112, "copyWithBlock:", v153);

          v4 = v132;
          v37 = &OBJC_IVAR___SBModalAlertPresenter__modalAlertPresentationCoordinator;
          goto LABEL_84;
        case 3:
          v38 = [SBSAContainerResizeAction alloc];
          resizeGestureResult = self->_resizeGestureResult;
          -[SBSAGestureDescription associatedInterfaceElementIdentifier](self->_activeGestureDescription, "associatedInterfaceElementIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = CFSTR("containerResizeBehaviorProvider.resize");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v169, 1);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = -[SBSAContainerResizeAction initWithResult:associatedInterfaceElementIdentifier:reasons:](v38, "initWithResult:associatedInterfaceElementIdentifier:reasons:", resizeGestureResult, v40, v41);
          v170 = v42;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v170, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v24;
          v45 = objc_msgSend(v13, "copyByAddingActions:", v43);

          v13 = (id)v45;
          v24 = v44;
          goto LABEL_38;
        case 4:
        case 5:
LABEL_38:
          self->_resizeGestureResult = 0;
          v46 = self->_activeGestureDescription;
          self->_activeGestureDescription = 0;

          v37 = &OBJC_IVAR___SBModalAlertPresenter__modalAlertPresentationCoordinator;
          elementContexts = self->_elementContexts;
          self->_elementContexts = 0;
LABEL_84:

          v14 = v138;
          v23 = v133;
          break;
        default:
          v37 = &OBJC_IVAR___SBModalAlertPresenter__modalAlertPresentationCoordinator;
          break;
      }
      v113 = v37[780];
      v114 = *(Class *)((char *)&self->super.super.isa + v113);
      v27 = (uint64_t)v13;
      if (v114 && !SBSAAreElementLayoutsEqualToLayouts(v114, v148))
      {
        SBLogSystemAperturePreferencesStackGestures();
        v115 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
          -[SBSAContainerResizeBehaviorProvider preferencesFromContext:].cold.1(v14, v115);

        v27 = objc_msgSend(v13, "copyWithCancellationOfGestureOfClass:context:", objc_opt_class(), v14);
        v116 = *(Class *)((char *)&self->super.super.isa + v113);
        *(Class *)((char *)&self->super.super.isa + v113) = 0;

      }
      v16 = v134;
    }
    else
    {
      v27 = (uint64_t)v13;
    }

  }
  else
  {
    v27 = (uint64_t)v13;
  }
  v117 = (void *)v27;
  v118 = (void *)objc_msgSend(v14, "copyByUpdatingPreferences:", v27);

  v152.receiver = self;
  v152.super_class = (Class)SBSAContainerResizeBehaviorProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v152, sel_preferencesFromContext_, v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_opt_class();
  v121 = v119;
  if (v120)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v122 = v121;
    else
      v122 = 0;
  }
  else
  {
    v122 = 0;
  }
  v123 = v122;

  objc_msgSend(v123, "actions");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "bs_containsObjectPassingTest:", &__block_literal_global_36_2);

  if (v125)
  {
    self->_resizeGestureResult = 0;
    v126 = self->_activeGestureDescription;
    self->_activeGestureDescription = 0;

  }
  return v123;
}

uint64_t __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "interfaceElementIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = BSEqualObjects();

  return v3;
}

void __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v9, v8, CFSTR("SBSAContainerResizeBehaviorProvider.m"), 134, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setBlobEnabled:", 1);
}

void __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_4(uint64_t a1, void *a2)
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
  double Width;
  double v15;
  double Height;
  id v17;

  v3 = a2;
  v17 = v3;
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v17;
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

    v3 = v17;
    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerResizeBehaviorProvider.m"), 169, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v17;
  }
  v7 = 0;
LABEL_10:

  BSRectWithSize();
  objc_msgSend(v7, "setBounds:");
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  if (*(_BYTE *)(a1 + 80))
  {
    Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
    v15 = Width / CGRectGetWidth(*(CGRect *)(*(_QWORD *)(a1 + 32) + 48));
    Height = CGRectGetHeight(*(CGRect *)(a1 + 48));
    objc_msgSend(v7, "setContentScale:", v15, Height / CGRectGetHeight(*(CGRect *)(*(_QWORD *)(a1 + 32) + 48)));
    BSRectWithSize();
    objc_msgSend(v7, "setContentBounds:");
    BSRectWithSize();
    UIRectGetCenter();
    objc_msgSend(v7, "setContentCenter:");
  }

}

void __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
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
  SBSAInterfaceElementPropertyIdentity *v14;
  void *v15;
  SBSAInterfaceElementPropertyIdentity *v16;
  void *v17;
  SBSAInterfaceElementPropertyIdentity *v18;
  void *v19;
  SBSAInterfaceElementPropertyIdentity *v20;
  void *v21;
  SBSAInterfaceElementPropertyIdentity *v22;
  void *v23;
  SBSAInterfaceElementPropertyIdentity *v24;
  SBSAInterfaceElementPropertyIdentity *v25;
  void *v26;
  SBSAInterfaceElementPropertyIdentity *v27;
  SBSAInterfaceElementPropertyIdentity *v28;
  void *v29;
  SBSAInterfaceElementPropertyIdentity *v30;
  id v31;

  v3 = a2;
  v31 = v3;
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v31;
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

    v3 = v31;
    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerResizeBehaviorProvider.m"), 182, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v31;
  }
  v7 = 0;
LABEL_10:

  v14 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v14, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v15, CFSTR("bounds"));

  v17 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("bounds"));
  objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v17, v16, 0);

  v18 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v18, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v19, CFSTR("center"));

  v21 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("center"));
  objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v21, v20, 0);

  if (*(_BYTE *)(a1 + 56))
  {
    v22 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v22, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v23, CFSTR("contentScale"));
    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v16, v24, 0);

    v25 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v25, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v26, CFSTR("contentBounds"));
    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v16, v27, 0);

    v28 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v28, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v29, CFSTR("contentCenter"));
    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v20, v30, 0);

  }
}

void __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_6(_QWORD *a1, void *a2)
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAContainerResizeBehaviorProvider.m"), 201, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setContainerViewDescriptions:", a1[5]);
}

uint64_t __62__SBSAContainerResizeBehaviorProvider_preferencesFromContext___block_invoke_34(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_contentResizeBehaviorSettings
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInteractionBeginBehaviorSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)_frameForContainerViewDescription:(id)a3 resizedWithGestureDescription:(id)a4 initialContainerViewFrame:(CGRect)a5 context:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a6;
  v12 = a4;
  objc_msgSend((id)objc_opt_class(), "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "initialLocation");
  objc_msgSend(v12, "translation");

  objc_msgSend(v11, "systemContainerBounds");
  v34 = CGRectGetWidth(v35);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  CGRectGetHeight(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  CGRectGetWidth(v37);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  CGRectGetMidX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  CGRectGetMidY(v39);
  objc_msgSend(v11, "inertContainerFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v40.origin.x = v15;
  v40.origin.y = v17;
  v40.size.width = v19;
  v40.size.height = v21;
  CGRectGetWidth(v40);
  objc_msgSend(v13, "resizeGestureXRubberbanding");
  if (BSFloatGreaterThanOrEqualToFloat())
    objc_msgSend(v13, "resizeGestureMinEdgePadding");
  else
    objc_msgSend(v13, "resizeGestureSensorXSafetyMargin");
  BSUIConstrainValueToIntervalWithRubberBand();
  objc_msgSend(v13, "resizeGestureYRubberbandingStretch");
  if (BSFloatGreaterThanOrEqualToFloat())
    objc_msgSend(v13, "resizeGestureYRubberbandingStretch");
  else
    objc_msgSend(v13, "resizeGestureYRubberbandingCompress");
  objc_msgSend(v13, "resizeGestureYRangeBeginTracking", *(_QWORD *)&v34);
  objc_msgSend(v13, "resizeGestureYRangeEndTracking");
  BSUIConstrainValueToIntervalWithRubberBand();
  if (BSFloatLessThanOrEqualToFloat())
    objc_msgSend(v13, "resizeGestureUpOffsetFactor", 0.0);
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)_frameForAdjunctContainerViewDescription:(id)a3 resizedWithGestureDescription:(id)a4 initialContainerViewFrame:(CGRect)a5 context:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
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
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4;
  objc_msgSend((id)objc_opt_class(), "settings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "translation");
  v13 = v12;

  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  CGRectGetHeight(v28);
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  CGRectGetWidth(v29);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  CGRectGetMidX(v30);
  v31.origin.x = x;
  v31.origin.y = y;
  v31.size.width = width;
  v31.size.height = height;
  CGRectGetMidY(v31);
  if (BSFloatGreaterThanOrEqualToFloat())
    objc_msgSend(v11, "recombineGestureXScaleFactorStretch");
  else
    objc_msgSend(v11, "recombineGestureXScaleFactorCompress");
  if (BSFloatGreaterThanOrEqualToFloat())
    objc_msgSend(v11, "recombineGestureXRubberbandingStretch");
  else
    objc_msgSend(v11, "recombineGestureXRubberbandingCompress");
  v26 = 0u;
  v27 = 0u;
  BYTE8(v26) = 1;
  BYTE8(v27) = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  if (v13 <= 0.0)
    objc_msgSend(v11, "recombineGestureTranslateFactorCompress", v26, v27);
  else
    objc_msgSend(v11, "recombineGestureTranslateFactorStretch", v26, v27);
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)_didContainerViewForActiveGestureCollapseWithFrame:(CGRect)a3 initialContainerViewFrame:(CGRect)a4 isPrimaryContainer:(BOOL)a5 activeInterfaceOrientation:(int64_t)a6
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  uint64_t v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  double MinX;
  double MaxX;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat rect;
  CGFloat height;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3.size.height;
  v10 = a3.size.width;
  v11 = a3.origin.y;
  v12 = a3.origin.x;
  if (a5)
  {
    v32 = a4.size.width;
    rect = a3.size.height;
    v13 = CGRectGetWidth(a3);
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    v14 = v13 - CGRectGetWidth(v35);
    v36.origin.x = v12;
    v36.origin.y = v11;
    v36.size.width = v10;
    v36.size.height = rect;
    v15 = CGRectGetHeight(v36);
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = v32;
    v37.size.height = height;
    v16 = v15 - CGRectGetHeight(v37);
    v17 = -v14;
    if (v14 >= 0.0)
      v17 = v14;
    v18 = v16 < 0.0;
    if (v16 < 0.0)
      v16 = -v16;
    if (v17 <= v16)
      return v18;
    else
      return v14 < 0.0;
  }
  else
  {
    v21 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
    v22 = v12;
    v23 = v11;
    v24 = v10;
    v25 = v9;
    if (v21 == 1)
    {
      if (a6 == 4)
      {
        MinX = CGRectGetMinX(*(CGRect *)&v22);
        v38.origin.x = x;
        v38.origin.y = y;
        v38.size.width = width;
        v38.size.height = height;
        MaxX = CGRectGetMinX(v38);
      }
      else
      {
        MinX = CGRectGetMaxX(*(CGRect *)&v22);
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        MaxX = CGRectGetMaxX(v40);
      }
      return MinX > MaxX;
    }
    else
    {
      v28 = CGRectGetMinX(*(CGRect *)&v22);
      v29 = x;
      v30 = v28;
      v39.origin.x = v29;
      v39.origin.y = y;
      v39.size.width = width;
      v39.size.height = height;
      v31 = CGRectGetMinX(v39);
      if (a6 == 4)
        return v30 > v31;
      else
        return v30 < v31;
    }
  }
}

- (id)_preferencesUpdatedWithCollapseOfElement:(void *)a3 activeFrame:(void *)a4 initialFrame:(double)a5 minimumFrame:(double)a6 preferences:(double)a7
{
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v40;
  _BYTE v41[32];
  _QWORD v42[5];
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  double v47;
  _QWORD v48[4];
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  *(double *)&v41[16] = a7;
  *(double *)&v41[24] = a8;
  *(double *)v41 = a5;
  *(double *)&v41[8] = a6;
  v27 = a3;
  v28 = a4;
  if ((unint64_t)(objc_msgSend(v27, "interfaceOrientation") - 3) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSAContainerResizeBehaviorProvider.m"), 347, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!UIInterfaceOrientationIsLandscape([associatedElementContext interfaceOrientation])"));

    if (!v27)
      goto LABEL_7;
  }
  else if (!v27)
  {
    goto LABEL_7;
  }
  if (v28)
  {
    v50.origin.x = a9;
    v50.origin.y = a10;
    v50.size.width = a11;
    v50.size.height = a12;
    CGRectGetMinX(v50);
    v51.origin.x = a9;
    v51.origin.y = a10;
    v51.size.width = a11;
    v51.size.height = a12;
    CGRectGetMidY(v51);
    v52.origin.x = a13;
    v52.origin.y = a14;
    v52.size.width = a15;
    v52.size.height = a16;
    CGRectGetMinX(v52);
    v53.origin.x = a13;
    v53.origin.y = a14;
    v53.size.width = a15;
    v53.size.height = a16;
    CGRectGetMidY(v53);
    CGRectGetMinX(*(CGRect *)v41);
    CGRectGetMidY(*(CGRect *)v41);
    UIDistanceBetweenPoints();
    v30 = v29;
    UIDistanceBetweenPoints();
    v32 = v31;
    objc_msgSend(v28, "elementDescriptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __130__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences___block_invoke;
    v48[3] = &unk_1E8EA3810;
    v35 = v27;
    v49 = v35;
    objc_msgSend(v33, "bs_firstObjectPassingTest:", v48);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      v42[0] = v34;
      v42[1] = 3221225472;
      v42[2] = __130__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences___block_invoke_2;
      v42[3] = &unk_1E8EA39D8;
      v46 = a2;
      v42[4] = a1;
      v43 = v36;
      v44 = v35;
      v47 = 1.0 - v30 / v32;
      v45 = v33;
      v38 = objc_msgSend(v28, "copyWithBlock:", v42);

      v28 = (id)v38;
    }

  }
LABEL_7:

  return v28;
}

uint64_t __130__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "associatedSystemApertureElementIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

void __130__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences___block_invoke_2(uint64_t a1, void *a2)
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
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

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
    v8 = *(_QWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSAContainerResizeBehaviorProvider.m"), 360, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  v13 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __130__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences___block_invoke_3;
  v22[3] = &unk_1E8EA9600;
  v25 = *(_QWORD *)(a1 + 64);
  v14 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v6;
  v24 = *(id *)(a1 + 48);
  v26 = *(_QWORD *)(a1 + 72);
  v15 = v6;
  v16 = (void *)objc_msgSend(v14, "copyWithBlock:", v22);
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __130__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences___block_invoke_4;
  v20[3] = &unk_1E8EB50E0;
  v17 = *(void **)(a1 + 56);
  v21 = *(id *)(a1 + 48);
  objc_msgSend(v17, "sbsa_arrayByAddingOrReplacingObject:passingTest:", v16, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setElementDescriptions:", v18);

}

void __130__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences___block_invoke_3(uint64_t a1, void *a2)
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
  SBSAInterfaceElementPropertyIdentity *v16;
  void *v17;
  SBSAInterfaceElementPropertyIdentity *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  SBSAInterfaceElementPropertyIdentity *v22;
  void *v23;
  SBSAInterfaceElementPropertyIdentity *v24;
  void *v25;
  void *v26;
  SBSAInterfaceElementPropertyIdentity *v27;
  void *v28;
  SBSAInterfaceElementPropertyIdentity *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  double v33;
  void *v34;
  void *v35;
  SBSAInterfaceElementPropertyIdentity *v36;
  void *v37;
  SBSAInterfaceElementPropertyIdentity *v38;
  void *v39;
  void *v40;
  SBSAInterfaceElementPropertyIdentity *v41;
  void *v42;
  SBSAInterfaceElementPropertyIdentity *v43;
  void *v44;
  void *v45;
  SBSAInterfaceElementPropertyIdentity *v46;
  void *v47;
  SBSAInterfaceElementPropertyIdentity *v48;
  void *v49;
  void *v50;
  SBSAInterfaceElementPropertyIdentity *v51;
  void *v52;
  SBSAInterfaceElementPropertyIdentity *v53;
  void *v54;
  void *v55;
  SBSAInterfaceElementPropertyIdentity *v56;
  void *v57;
  SBSAInterfaceElementPropertyIdentity *v58;
  void *v59;
  void *v60;
  SBSAInterfaceElementPropertyIdentity *v61;
  void *v62;
  SBSAInterfaceElementPropertyIdentity *v63;
  void *v64;
  SBSAInterfaceElementPropertyIdentity *v65;
  void *v66;
  SBSAInterfaceElementPropertyIdentity *v67;
  id v68;

  v3 = a2;
  v68 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v68;
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

  v3 = v68;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAElementDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSAContainerResizeBehaviorProvider.m"), 362, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v68;
LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "setSensorObscuringShadowProgress:", 1.0);
  v14 = *(void **)(a1 + 40);
  v15 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("sensorObscuringShadowProgress"));
  v16 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(v7, "interfaceElementIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v16, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v17, CFSTR("sensorObscuringShadowProgress"));
  objc_msgSend(v14, "setAnimatedTransitionDescription:forProperty:withMilestones:", v15, v18, 0);

  v19 = objc_msgSend(*(id *)(a1 + 48), "layoutMode");
  switch(v19)
  {
    case 3:
      if (*(double *)(a1 + 64) * 4.0 <= 1.0)
        v33 = *(double *)(a1 + 64) * 4.0;
      else
        v33 = 1.0;
      objc_msgSend(v7, "setCustomContentAlpha:", 1.0 - v33);
      v34 = *(void **)(a1 + 40);
      v35 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("customContentAlpha"));
      v36 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v7, "interfaceElementIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v36, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v37, CFSTR("customContentAlpha"));
      objc_msgSend(v34, "setAnimatedTransitionDescription:forProperty:withMilestones:", v35, v38, 0);

      objc_msgSend(v7, "setCustomContentBlurProgress:", v33);
      v30 = *(void **)(a1 + 32);
      v31 = *(void **)(a1 + 40);
      v32 = CFSTR("customContentBlurProgress");
      goto LABEL_19;
    case 2:
      objc_msgSend(v7, "setLeadingViewAlpha:", 1.0 - *(double *)(a1 + 64));
      v39 = *(void **)(a1 + 40);
      v40 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("leadingViewAlpha"));
      v41 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v7, "interfaceElementIdentifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v41, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v42, CFSTR("leadingViewAlpha"));
      objc_msgSend(v39, "setAnimatedTransitionDescription:forProperty:withMilestones:", v40, v43, 0);

      objc_msgSend(v7, "setLeadingViewBlurProgress:", *(double *)(a1 + 64));
      v44 = *(void **)(a1 + 40);
      v45 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("leadingViewBlurProgress"));
      v46 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v7, "interfaceElementIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v46, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v47, CFSTR("leadingViewBlurProgress"));
      objc_msgSend(v44, "setAnimatedTransitionDescription:forProperty:withMilestones:", v45, v48, 0);

      objc_msgSend(v7, "setLeadingViewSquishProgress:", *(double *)(a1 + 64));
      v49 = *(void **)(a1 + 40);
      v50 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("leadingViewSquishProgress"));
      v51 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v7, "interfaceElementIdentifier");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v51, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v52, CFSTR("leadingViewSquishProgress"));
      objc_msgSend(v49, "setAnimatedTransitionDescription:forProperty:withMilestones:", v50, v53, 0);

      objc_msgSend(v7, "setTrailingViewAlpha:", 1.0 - *(double *)(a1 + 64));
      v54 = *(void **)(a1 + 40);
      v55 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("trailingViewAlpha"));
      v56 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v7, "interfaceElementIdentifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v56, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v57, CFSTR("trailingViewAlpha"));
      objc_msgSend(v54, "setAnimatedTransitionDescription:forProperty:withMilestones:", v55, v58, 0);

      objc_msgSend(v7, "setTrailingViewBlurProgress:", *(double *)(a1 + 64));
      v59 = *(void **)(a1 + 40);
      v60 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("trailingViewBlurProgress"));
      v61 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v7, "interfaceElementIdentifier");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v61, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v62, CFSTR("trailingViewBlurProgress"));
      objc_msgSend(v59, "setAnimatedTransitionDescription:forProperty:withMilestones:", v60, v63, 0);

      objc_msgSend(v7, "setTrailingViewSquishProgress:", *(double *)(a1 + 64));
      v30 = *(void **)(a1 + 32);
      v31 = *(void **)(a1 + 40);
      v32 = CFSTR("trailingViewSquishProgress");
      goto LABEL_19;
    case 1:
      objc_msgSend(v7, "setMinimalViewAlpha:", 1.0 - *(double *)(a1 + 64));
      v20 = *(void **)(a1 + 40);
      v21 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("minimalViewAlpha"));
      v22 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v7, "interfaceElementIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v22, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v23, CFSTR("minimalViewAlpha"));
      objc_msgSend(v20, "setAnimatedTransitionDescription:forProperty:withMilestones:", v21, v24, 0);

      objc_msgSend(v7, "setMinimalViewBlurProgress:", *(double *)(a1 + 64));
      v25 = *(void **)(a1 + 40);
      v26 = (void *)objc_msgSend(*(id *)(a1 + 32), "newAnimatedTransitionDescriptionForProperty:", CFSTR("minimalViewBlurProgress"));
      v27 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v7, "interfaceElementIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v27, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v28, CFSTR("minimalViewBlurProgress"));
      objc_msgSend(v25, "setAnimatedTransitionDescription:forProperty:withMilestones:", v26, v29, 0);

      objc_msgSend(v7, "setMinimalViewSquishProgress:", *(double *)(a1 + 64));
      v30 = *(void **)(a1 + 32);
      v31 = *(void **)(a1 + 40);
      v32 = CFSTR("minimalViewSquishProgress");
LABEL_19:
      v64 = (void *)objc_msgSend(v30, "newAnimatedTransitionDescriptionForProperty:", v32);
      v65 = [SBSAInterfaceElementPropertyIdentity alloc];
      objc_msgSend(v7, "interfaceElementIdentifier");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v65, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v66, v32);
      objc_msgSend(v31, "setAnimatedTransitionDescription:forProperty:withMilestones:", v64, v67, 0);

      break;
  }

}

uint64_t __130__SBSAContainerResizeBehaviorProvider__preferencesUpdatedWithCollapseOfElement_activeFrame_initialFrame_minimumFrame_preferences___block_invoke_4(uint64_t a1, void *a2)
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
  objc_storeStrong((id *)&self->_activeGestureDescription, 0);
  objc_storeStrong((id *)&self->_elementContexts, 0);
}

- (void)preferencesFromContext:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134349056;
  v4 = objc_msgSend(a1, "queryIteration");
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "[%{public}lu] Canceling resize gesture due to active element change", (uint8_t *)&v3, 0xCu);
}

@end
