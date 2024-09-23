@implementation SBSALayoutModeLayoutProvider

- (SBSALayoutModeLayoutProvider)initWithLayoutMode:(int64_t)a3
{
  SBSALayoutModeLayoutProvider *result;
  void *v7;
  void *v8;
  objc_super v9;

  if ((unint64_t)(a3 - 4) <= 0xFFFFFFFFFFFFFFFCLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SAUIStringFromElementViewLayoutMode();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSALayoutModeLayoutProvider.m"), 43, CFSTR("Unsupported layout mode: %@"), v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)SBSALayoutModeLayoutProvider;
  result = -[SBSABasePreferencesProvider init](&v9, sel_init);
  if (result)
    result->_supportedElementLayoutMode = a3;
  return result;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  SAUIStringFromElementViewLayoutMode();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; supportedElementLayoutMode: %@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
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
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  void *v37;
  SBSALayoutModeLayoutProvider *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  Class v65;
  objc_class *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  BOOL v71;
  void *v72;
  void *v73;
  CGFloat v74;
  void *v76;
  void *v77;
  objc_super v78;
  _QWORD v79[5];
  id v80;
  id v81;
  SEL v82;
  BOOL v83;
  _QWORD v84[5];
  id v85;
  id v86;
  _QWORD *v87;
  _QWORD *v88;
  uint64_t *v89;
  SEL v90;
  BOOL v91;
  BOOL v92;
  _QWORD v93[6];
  _QWORD v94[7];
  char v95;
  _QWORD v96[4];
  id v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  char v101;
  _QWORD v102[5];
  id v103;
  _QWORD v104[5];
  id v105;
  id v106;
  _QWORD *v107;
  SEL v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  CGFloat v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD v117[3];
  char v118;
  uint64_t v119;

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
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = NSClassFromString(CFSTR("SBSAContext"));
      v66 = (objc_class *)objc_opt_class();
      NSStringFromClass(v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSALayoutModeLayoutProvider.m"), 59, CFSTR("Unexpected class – expected '%@', got '%@'"), v65, v67);

    }
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v8, "elementContexts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "preferences");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = v10;
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
  v14 = v13;

  objc_msgSend(v14, "elementDescriptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = (void *)objc_msgSend(v15, "mutableCopy");

  v76 = v14;
  objc_msgSend(v14, "containerViewDescriptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v71 = !self->_performedInitialLayoutIfNecessary && self->_supportedElementLayoutMode == 3;
  v72 = v8;
  self->_performedInitialLayoutIfNecessary = 1;
  v68 = v4;
  if (objc_msgSend(v9, "count"))
  {
    v18 = 0;
    v69 = v17;
    v70 = v9;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndex:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = 0x7FFFFFFFFFFFFFFFLL;
      SBSAElementDescriptionAssociatedWithElementIdentity(v19, v73, &v119);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "layoutMode");
      if (v20 != -[SBSALayoutModeLayoutProvider supportedElementLayoutMode](self, "supportedElementLayoutMode"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSALayoutModeLayoutProvider supportedElementLayoutMode](self, "supportedElementLayoutMode");
        SAUIStringFromElementViewLayoutMode();
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSALayoutModeLayoutProvider.m"), 70, CFSTR("Layout mode of element context doesn't match supported layout mode ('%@'): %@"), v56, v19, v68);

      }
      if (objc_msgSend(v17, "count") <= v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSALayoutModeLayoutProvider.m"), 71, CFSTR("No container view description at index '%lu': %@"), v18, v17);

      }
      objc_msgSend(v17, "objectAtIndexedSubscript:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = SBSAFrameForElementInCollection(v18, v9, v72);
      v23 = v22;
      v25 = v24;
      v27 = v26;
      BSRectWithSize();
      v29 = v28;
      v31 = v30;
      v33 = v32;
      v35 = v34;
      v36 = objc_msgSend(v19, "systemApertureCustomLayoutCustomAnimationStyle") == 3;
      v117[0] = 0;
      v117[1] = v117;
      v117[2] = 0x2020000000;
      v118 = 0;
      v104[0] = MEMORY[0x1E0C809B0];
      v104[1] = 3221225472;
      v104[2] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke;
      v104[3] = &unk_1E8EB57E8;
      v108 = a2;
      v37 = v17;
      v38 = self;
      v104[4] = self;
      v39 = v19;
      v109 = v29;
      v110 = v31;
      v111 = v33;
      v112 = v35;
      v113 = v74;
      v114 = v23;
      v115 = v25;
      v116 = v27;
      v105 = v39;
      v107 = v117;
      v40 = v72;
      v106 = v40;
      v41 = (void *)objc_msgSend(v21, "copyWithBlock:", v104);

      v102[0] = 0;
      v102[1] = v102;
      v102[2] = 0x3032000000;
      v102[3] = __Block_byref_object_copy__82;
      v102[4] = __Block_byref_object_dispose__82;
      v103 = 0;
      v98 = 0;
      v99 = &v98;
      v100 = 0x2020000000;
      v101 = 0;
      objc_msgSend(v37, "replaceObjectAtIndex:withObject:", v18, v41);
      if (v119 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_33;
      objc_msgSend(v40, "elementSnapshotContexts");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = MEMORY[0x1E0C809B0];
      v96[1] = 3221225472;
      v96[2] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_24;
      v96[3] = &unk_1E8EA3770;
      v43 = v39;
      v97 = v43;
      objc_msgSend(v42, "bs_firstObjectPassingTest:", v96);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "snapshotReason");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "elementLayoutTransition");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v46, "isSingleElementExpansion");

      v48 = BSEqualStrings();
      v49 = v47 | v48;
      if ((v47 | v48) == 1)
      {
        v94[0] = MEMORY[0x1E0C809B0];
        v94[1] = 3221225472;
        v94[2] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_2;
        v94[3] = &unk_1E8EB5810;
        v95 = v48;
        v94[4] = v38;
        v94[5] = v102;
        v94[6] = a2;
        v50 = objc_msgSend(v77, "copyWithBlock:", v94);

        v77 = (void *)v50;
      }
      if ((objc_msgSend(v43, "systemApertureLayoutCustomizingOptions") & 1) != 0)
      {
        v93[0] = MEMORY[0x1E0C809B0];
        v93[1] = 3221225472;
        v93[2] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_3;
        v93[3] = &unk_1E8E9E9D0;
        v93[4] = v38;
        v93[5] = a2;
        v51 = objc_msgSend(v77, "copyWithBlock:", v93);

        *((_BYTE *)v99 + 24) = 1;
        v77 = (void *)v51;
      }
      else if (!v49)
      {
        goto LABEL_32;
      }
      objc_msgSend(v73, "replaceObjectAtIndex:withObject:", v119, v77);
LABEL_32:

LABEL_33:
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_4;
      v84[3] = &unk_1E8EB5838;
      v90 = a2;
      v91 = v36;
      v84[4] = v38;
      v87 = v117;
      v52 = v41;
      v85 = v52;
      v88 = v102;
      v92 = v71;
      v53 = v77;
      v86 = v53;
      v89 = &v98;
      v54 = (void *)objc_msgSend(v76, "copyWithBlock:", v84);

      _Block_object_dispose(&v98, 8);
      _Block_object_dispose(v102, 8);

      _Block_object_dispose(v117, 8);
      ++v18;
      v9 = v70;
      v76 = v54;
      self = v38;
      v17 = v69;
      if (v18 >= objc_msgSend(v70, "count"))
        goto LABEL_36;
    }
  }
  v54 = v14;
LABEL_36:
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_5;
  v79[3] = &unk_1E8EA6A38;
  v79[4] = self;
  v80 = v17;
  v81 = v73;
  v82 = a2;
  v83 = v71;
  v58 = v17;
  v59 = v73;
  v60 = (void *)objc_msgSend(v54, "copyWithBlock:", v79);

  v61 = (void *)objc_msgSend(v72, "copyByUpdatingPreferences:", v60);
  v78.receiver = self;
  v78.super_class = (Class)SBSALayoutModeLayoutProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v78, sel_preferencesFromContext_, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
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
  CGFloat v14;
  CGFloat v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  Class v24;
  objc_class *v25;
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
  void *v39;
  double v40;
  CGFloat v41;
  void *v42;
  double v43;
  CGAffineTransform v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  CGRect v47;

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
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSALayoutModeLayoutProvider.m"), 78, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "setAssociatedSystemApertureElementIdentity:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setBounds:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  UIRectGetCenter();
  objc_msgSend(v7, "setCenter:");
  memset(&v46, 0, sizeof(v46));
  objc_msgSend(v7, "contentScale");
  SBSAAffineTransformFromContentScale((uint64_t)&v46, v14, v15);
  v44 = v46;
  CGAffineTransformInvert(&v45, &v44);
  v47 = CGRectApplyAffineTransform(*(CGRect *)(a1 + 72), &v45);
  objc_msgSend(v7, "setContentBounds:", v47.origin.x, v47.origin.y, v47.size.width, v47.size.height);
  UIRectGetCenter();
  objc_msgSend(v7, "setContentCenter:");
  if ((objc_msgSend(*(id *)(a1 + 40), "systemApertureLayoutCustomizingOptions") & 1) != 0
    && objc_msgSend(*(id *)(a1 + 32), "supportedElementLayoutMode") == 2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v16 = v3;
    if (v3)
    {
      objc_opt_self();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v16;
      if (v17)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
      }
      else
      {
        v19 = 0;
      }
      v20 = v19;

      if (v20)
        goto LABEL_21;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 64);
      v23 = *(_QWORD *)(a1 + 32);
      v24 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v22, v23, CFSTR("SBSALayoutModeLayoutProvider.m"), 90, CFSTR("Unexpected class – expected '%@', got '%@'"), v24, v26);

    }
    v20 = 0;
LABEL_21:

    memset(&v44, 0, 32);
    objc_msgSend(v20, "bounds");
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    objc_msgSend(v20, "center");
    v36 = v35;
    v38 = v37;
    objc_msgSend((id)objc_opt_class(), "settings");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "prominentPillScale");
    v41 = v40;
    objc_msgSend((id)objc_opt_class(), "settings");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "prominentPillVerticalOffsetProportion");
    SBSAScaledAndClippedFrameByScalingLeadingTrailingViews(&v44.a, *(void **)(a1 + 48), v28, v30, v32, v34, v36, v38, v41, v43);

    BSRectWithSize();
    objc_msgSend(v20, "setBounds:");
    UIRectGetCenter();
    objc_msgSend(v20, "setCenter:");
    objc_msgSend(v20, "setContentBounds:", v44.a, v44.b, v44.c, v44.d);
    UIRectGetCenter();
    objc_msgSend(v20, "setContentCenter:");

  }
}

uint64_t __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_24()
{
  return SAElementIdentityEqualToIdentity();
}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a2;
  if (!v17)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v17;
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
    v10 = NSClassFromString(CFSTR("SBSAElementDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSALayoutModeLayoutProvider.m"), 115, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  if (*(_BYTE *)(a1 + 56))
    v13 = 1.0;
  else
    v13 = 0.0;
  objc_msgSend(v6, "setSnapshotViewBlurProgress:", v13);
  if (*(_BYTE *)(a1 + 56))
    v14 = 0.0;
  else
    v14 = 1.0;
  objc_msgSend(v6, "setSnapshotViewAlpha:", v14);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = CFSTR("layoutModeLayoutProvider.snapshotReason.transitionToCustom");

  objc_msgSend(v6, "setSnapshotReason:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_3(uint64_t a1, void *a2)
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
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSALayoutModeLayoutProvider.m"), 125, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend((id)objc_opt_class(), "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "prominentPillContentScale");
  v15 = v14;

  objc_msgSend(v6, "setLeadingViewScale:", v15, v15);
  objc_msgSend(v6, "setTrailingViewScale:", v15, v15);
  objc_msgSend(v6, "setMinimalViewScale:", v15, v15);

}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_4(uint64_t a1, void *a2)
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
  uint64_t v17;
  void *v18;
  void *v19;
  SBSAInterfaceElementPropertyIdentity *v20;
  void *v21;
  SBSAInterfaceElementPropertyIdentity *v22;
  id v23;
  SBSAInterfaceElementPropertyIdentity *v24;
  void *v25;
  SBSAInterfaceElementPropertyIdentity *v26;
  id v27;
  SBSAInterfaceElementPropertyIdentity *v28;
  void *v29;
  SBSAInterfaceElementPropertyIdentity *v30;
  SBSAInterfaceElementPropertyIdentity *v31;
  void *v32;
  SBSAInterfaceElementPropertyIdentity *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SBSAInterfaceElementPropertyIdentity *v38;
  void *v39;
  SBSAInterfaceElementPropertyIdentity *v40;
  void *v41;
  SBSAInterfaceElementPropertyIdentity *v42;
  void *v43;
  SBSAInterfaceElementPropertyIdentity *v44;
  void *v45;
  SBSAInterfaceElementPropertyIdentity *v46;
  void *v47;
  SBSAInterfaceElementPropertyIdentity *v48;
  SBSAInterfaceElementPropertyIdentity *v49;
  void *v50;
  SBSAInterfaceElementPropertyIdentity *v51;
  SBSAInterfaceElementPropertyIdentity *v52;
  void *v53;
  SBSAInterfaceElementPropertyIdentity *v54;
  void *v55;
  id v56;

  v3 = a2;
  v56 = v3;
  if (!v3)
    goto LABEL_9;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v56;
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

  v3 = v56;
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSALayoutModeLayoutProvider.m"), 139, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v56;
LABEL_9:
    v7 = 0;
  }

  if (*(_BYTE *)(a1 + 88))
  {
    objc_msgSend((id)objc_opt_class(), "settings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "jindoBoundsOval");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "jindoBoundsOval");
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v19 = (void *)v17;

    goto LABEL_15;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    objc_msgSend((id)objc_opt_class(), "settings");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "transitionToProminentPillSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "settings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "transitionToProminentPillSettings");
    v17 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "behaviorSettingsForProperty:", CFSTR("bounds"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "behaviorSettingsForProperty:", CFSTR("center"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v20 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v20, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v21, CFSTR("bounds"));

  v23 = +[SBSABasePreferencesProvider newAnimatedTransitionDescriptionWithBehaviorSettings:](SBSABasePreferencesProvider, "newAnimatedTransitionDescriptionWithBehaviorSettings:", v15);
  objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v23, v22, 0);

  v24 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v24, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v25, CFSTR("center"));

  v27 = +[SBSABasePreferencesProvider newAnimatedTransitionDescriptionWithBehaviorSettings:](SBSABasePreferencesProvider, "newAnimatedTransitionDescriptionWithBehaviorSettings:", v19);
  objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v27, v26, 0);

  v28 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v28, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v29, CFSTR("contentBounds"));
  objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v22, v30, 0);

  v31 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v31, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v32, CFSTR("contentCenter"));
  objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v26, v33, 0);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v55 = v19;
    v34 = v15;
    if (*(_BYTE *)(a1 + 89))
    {
      objc_msgSend(MEMORY[0x1E0DA9E08], "unanimatedBehaviorSettings");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "settings");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "elementContentTransitionSettings");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "snapshotBehaviorSettings");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v38 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 48), "interfaceElementIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v38, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v39, CFSTR("snapshotViewBlurProgress"));

    v41 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v35);
    objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v41, v40, 0);

    v42 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 48), "interfaceElementIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v42, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v43, CFSTR("snapshotViewAlpha"));

    v45 = (void *)objc_msgSend((id)objc_opt_class(), "newAnimatedTransitionDescriptionWithBehaviorSettings:", v35);
    objc_msgSend(v7, "setAnimatedTransitionDescription:forProperty:withMilestones:", v45, v44, 0);

    v15 = v34;
    v19 = v55;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v46 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 48), "interfaceElementIdentifier");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v46, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v47, CFSTR("leadingViewScale"));

    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v22, v48, 0);
    v49 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 48), "interfaceElementIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v49, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v50, CFSTR("trailingViewScale"));

    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v22, v51, 0);
    v52 = [SBSAInterfaceElementPropertyIdentity alloc];
    objc_msgSend(*(id *)(a1 + 48), "interfaceElementIdentifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v52, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v53, CFSTR("minimalViewScale"));

    objc_msgSend(v7, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v22, v54, 0);
  }

}

void __55__SBSALayoutModeLayoutProvider_preferencesFromContext___block_invoke_5(uint64_t a1, void *a2)
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
  SBSAPreferencesDidChangeAction *v15;
  void *v16;
  SBSAPreferencesDidChangeAction *v17;
  uint64_t v18;
  void *v19;
  SBSAPreferencesDidChangeAction *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
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
    v11 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSALayoutModeLayoutProvider.m"), 178, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  objc_msgSend(v7, "setContainerViewDescriptions:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "setElementDescriptions:", *(_QWORD *)(a1 + 48));
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v7, "actions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = [SBSAPreferencesDidChangeAction alloc];
    v21[0] = CFSTR("layoutModeLayoutProvider.updateReason.snapshotRequired");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SBSAPreferencesDidChangeAction initWithReasons:](v15, "initWithReasons:", v16);

    if (v14)
    {
      objc_msgSend(v14, "arrayByAddingObject:", v17);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v18;
    objc_msgSend(v7, "setActions:", v18);

  }
}

- (id)defaultTransitionSettings
{
  int64_t supportedElementLayoutMode;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  supportedElementLayoutMode = self->_supportedElementLayoutMode;
  switch(supportedElementLayoutMode)
  {
    case 3:
      objc_msgSend((id)objc_opt_class(), "settings");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "customInterfaceElementTransitionSettings");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend((id)objc_opt_class(), "settings");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "compactInterfaceElementTransitionSettings");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend((id)objc_opt_class(), "settings");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "minimalInterfaceElementTransitionSettings");
      v4 = objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_8:
      objc_msgSend((id)objc_opt_class(), "settings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "defaultInterfaceElementTransitionSettings");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      return v5;
  }
  v5 = (void *)v4;

  if (!v5)
    goto LABEL_8;
  return v5;
}

- (int64_t)supportedElementLayoutMode
{
  return self->_supportedElementLayoutMode;
}

@end
