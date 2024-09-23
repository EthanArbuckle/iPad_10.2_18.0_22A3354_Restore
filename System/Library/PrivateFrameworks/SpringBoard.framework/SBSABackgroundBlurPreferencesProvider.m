@implementation SBSABackgroundBlurPreferencesProvider

- (id)preferencesFromContext:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  Class v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  objc_super v32;
  _QWORD v33[5];
  id v34;
  uint64_t *v35;
  SEL v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;

  v5 = a3;
  if (!v5)
    goto LABEL_9;
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
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSABackgroundBlurPreferencesProvider.m"), 39, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v9 = 0;
  }

  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__90;
  v41 = __Block_byref_object_dispose__90;
  objc_msgSend(v9, "preferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_opt_class();
  v16 = v14;
  if (v15)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }
  v18 = v17;

  v42 = v18;
  v19 = (void *)v38[5];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __64__SBSABackgroundBlurPreferencesProvider_preferencesFromContext___block_invoke;
  v33[3] = &unk_1E8EB2C20;
  v36 = a2;
  v33[4] = self;
  v20 = v9;
  v34 = v20;
  v35 = &v37;
  v21 = objc_msgSend(v19, "copyWithBlock:", v33);
  v22 = (void *)v38[5];
  v38[5] = v21;

  v23 = (void *)objc_msgSend(v20, "copyByUpdatingPreferences:", v38[5]);
  v32.receiver = self;
  v32.super_class = (Class)SBSABackgroundBlurPreferencesProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v32, sel_preferencesFromContext_, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_class();
  v26 = v24;
  if (v25)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;
  }
  else
  {
    v27 = 0;
  }
  v28 = v27;

  v29 = (void *)v38[5];
  v38[5] = (uint64_t)v28;

  v30 = (id)v38[5];
  _Block_object_dispose(&v37, 8);

  return v30;
}

void __64__SBSABackgroundBlurPreferencesProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  Class v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void *v22;
  int v23;
  uint64_t v24;
  int v28;
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
  SBSABackgroundBlurDescription *v42;
  SBSAInterfaceElementPropertyIdentity *v43;
  void *v44;
  SBSAInterfaceElementPropertyIdentity *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  int v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  uint64_t v63;
  const __CFString *v64;
  __CFString *v65;
  __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  void *v69;
  void *v70;
  SBSAInterfaceElementPropertyIdentity *v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  SBSAInterfaceElementPropertyIdentity *v76;
  SBSABackgroundBlurDescription *v77;
  void *v78;
  void *v79;
  SBSAInterfaceElementPropertyIdentity *obj;
  void *v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  __CFString *v87;
  __int16 v88;
  __CFString *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
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

  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = NSClassFromString(CFSTR("SBSAPreferencesMutator"));
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("SBSABackgroundBlurPreferencesProvider.m"), 43, CFSTR("Unexpected class – expected '%@', got '%@'"), v12, v14);

LABEL_9:
    v8 = 0;
  }
  v75 = v3;

  objc_msgSend(*(id *)(a1 + 40), "elementContexts");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "containerViewDescriptions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndex:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v16, "layoutMode");
  v78 = v16;
  v20 = objc_msgSend(v16, "systemApertureCustomLayout");
  v21 = objc_msgSend(*(id *)(a1 + 40), "isReduceTransparencyEnabled");
  objc_msgSend((id)objc_opt_class(), "settings");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "backgroundBlurEnabled");

  v81 = v18;
  objc_msgSend(v18, "bounds");
  v28 = 0;
  if (v19 == 3 && v20 != 2)
  {
    if (CGRectGetHeight(*(CGRect *)&v24) >= 74.0)
      v28 = v23 & ~v21;
    else
      v28 = 0;
  }
  v79 = v8;
  v29 = v18;
  objc_msgSend(v18, "center");
  SBUnintegralizedRectCenteredAboutPoint();
  objc_msgSend((id)objc_opt_class(), "frameForVariableBlurUnderContainerViewWithFrame:offscreen:context:", v28 ^ 1u, *(_QWORD *)(a1 + 40), v30, v31, v32, v33);
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = objc_alloc_init(SBSABackgroundBlurDescription);
  v43 = [SBSAInterfaceElementPropertyIdentity alloc];
  v77 = v42;
  -[SBSABackgroundBlurDescription interfaceElementIdentifier](v42, "interfaceElementIdentifier");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  obj = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v43, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v44, CFSTR("blurFrame"));

  v45 = [SBSAInterfaceElementPropertyIdentity alloc];
  objc_msgSend(v81, "interfaceElementIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = -[SBSAInterfaceElementPropertyIdentity initWithAssociatedInterfaceElementIdentifier:andProperty:](v45, "initWithAssociatedInterfaceElementIdentifier:andProperty:", v46, CFSTR("bounds"));

  v47 = *(_QWORD *)(a1 + 32);
  if (((v28 ^ 1) & 1) == 0)
  {
    v48 = *(void **)(v47 + 40);
    *(_QWORD *)(v47 + 40) = 0;

    v49 = 0;
    v50 = 2;
LABEL_17:
    v51 = v75;
    goto LABEL_37;
  }
  v50 = *(_QWORD *)(v47 + 32);
  if (v50 == 1)
  {
    if (!*(_QWORD *)(v47 + 40))
    {
      v49 = 0;
      v50 = 1;
      goto LABEL_17;
    }
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "animatedTransitionResults");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
    if (v53)
    {
      v54 = v53;
      v55 = *(_QWORD *)v83;
      v50 = 1;
      do
      {
        for (i = 0; i != v54; ++i)
        {
          if (*(_QWORD *)v83 != v55)
            objc_enumerationMutation(v52);
          v57 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          objc_msgSend(v57, "associatedInterfaceElementPropertyIdentity");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));

          if (v59 && objc_msgSend(v57, "finished"))
          {
            v60 = *(_QWORD *)(a1 + 32);
            v61 = *(void **)(v60 + 40);
            *(_QWORD *)(v60 + 40) = 0;

            v50 = 0;
          }
        }
        v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
      }
      while (v54);
    }
    else
    {
      v50 = 1;
    }

    v49 = 0;
    v51 = v75;
    v29 = v81;
  }
  else
  {
    v51 = v75;
    if (v50 == 2)
    {
      objc_storeStrong((id *)(v47 + 40), obj);
      v49 = 1;
      v50 = 1;
    }
    else
    {
      v49 = 0;
    }
  }
LABEL_37:
  if (v50 != *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32))
  {
    SBLogSystemApertureController();
    v62 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
    {
      v63 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
      if (v63 == 1)
        v64 = CFSTR("visible-pending-milestone");
      else
        v64 = CFSTR("hidden");
      if (v63 == 2)
        v65 = CFSTR("visible");
      else
        v65 = (__CFString *)v64;
      v66 = v65;
      if (v50 == 1)
        v67 = CFSTR("visible-pending-milestone");
      else
        v67 = CFSTR("hidden");
      if (v50 == 2)
        v67 = CFSTR("visible");
      v29 = v81;
      v68 = v67;
      *(_DWORD *)buf = 138543618;
      v87 = v66;
      v88 = 2114;
      v89 = v68;
      _os_log_impl(&dword_1D0540000, v62, OS_LOG_TYPE_DEFAULT, "Background Blur: Updating background blur visibility: (%{public}@) -> (%{public}@)", buf, 0x16u);

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = v50;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "effectiveAnimatedTransitionDescriptionForProperty:", v76);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (v69)
  {
    v70 = v79;
    v71 = obj;
    if (v49)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", 0x1E91CF8F8);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v72 = 0;
    }
    objc_msgSend(v79, "associateAnimatedTransitionDescriptionOfProperty:withProperty:withMilestones:", v76, obj, v72);
    goto LABEL_59;
  }
  v70 = v79;
  v71 = obj;
  if (v49)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SBSABackgroundBlurPreferencesProvider.m"), 102, CFSTR("Can't add milestone when there's no dismissal animation."));
LABEL_59:

  }
  v73 = -[SBSABackgroundBlurDescription copyBySettingBlurHidden:](v77, "copyBySettingBlurHidden:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) == 0);

  v74 = (void *)objc_msgSend(v73, "copyBySettingBlurFrame:", v35, v37, v39, v41);
  objc_msgSend(v70, "setBackgroundBlurDescription:", v74);

}

+ (CGRect)frameForVariableBlurUnderContainerViewWithFrame:(CGRect)a3 offscreen:(BOOL)a4 context:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect v19;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  if (a4)
  {
    v11 = -360.0;
  }
  else
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    v12 = CGRectGetMaxY(v18) + -40.0;
    if (v12 <= 180.0)
      v11 = v12 + -180.0;
    else
      v11 = 0.0;
  }
  objc_msgSend(v10, "systemContainerBounds");
  v13 = CGRectGetWidth(v19);

  v14 = 360.0;
  v15 = 0.0;
  v16 = v11;
  v17 = v13;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatingBlurFrameProperty, 0);
}

@end
