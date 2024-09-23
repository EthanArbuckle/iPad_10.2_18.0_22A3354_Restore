@implementation SBSystemApertureViewController

BOOL __99__SBSystemApertureViewController__containerViewWithInterfaceElementIdentifier_creatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "interfaceElementIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "interfaceElementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == 0;

  }
  return v4;
}

uint64_t __86__SBSystemApertureViewController__removeContainerViewsExceptingThoseWithDescriptions___block_invoke(uint64_t a1, void *a2)
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

- (BOOL)_shouldPerformTransitionOfProperty:(id)a3 ofObject:(id)a4 withDescription:(id)a5 fromPreferences:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  id v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = !-[SBSystemApertureViewController _isProperty:ofObject:equalToDescription:](self, "_isProperty:ofObject:equalToDescription:", v12, v13, a5);
  if ((v16 & 1) == 0)
  {
    v17 = objc_opt_class();
    v18 = v13;
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
    v21 = v19;

    if (!v21)
    {
      LOBYTE(v20) = 0;
LABEL_30:

      goto LABEL_31;
    }
    v22 = v15;
    objc_msgSend(v14, "effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:", v12);
    v23 = objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](self->_lastAppliedPropertyIdentitiesToTransitionDescriptions, "objectForKey:", v12);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "behaviorSettings");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v23;
    objc_msgSend((id)v23, "behaviorSettings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = BSEqualObjects();

    if ((v23 & 1) != 0)
    {
      v15 = v22;
      if (v16)
      {
LABEL_11:
        LOBYTE(v20) = 1;
        v26 = v38;
LABEL_29:

        goto LABEL_30;
      }
    }
    else
    {
      -[SBSystemApertureViewController _keyPathForProperty:](self, "_keyPathForProperty:", v12);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_opt_class();
      v29 = v12;
      if (v28)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v30 = v29;
        else
          v30 = 0;
      }
      else
      {
        v30 = 0;
      }
      v15 = v22;
      v31 = v30;

      v32 = objc_msgSend(v31, "isContentBoundsProperty");
      if (v32)
      {
        SBLogSystemAperturePreferencesStack();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349570;
          v44 = objc_msgSend(v22, "queryIteration");
          v45 = 2112;
          v46 = v27;
          v47 = 2112;
          v48 = v21;
          _os_log_debug_impl(&dword_1D0540000, v33, OS_LOG_TYPE_DEBUG, "[%{public}lu] [NOTE]: Performing transition due to updated behavior settings for UNSUPPORTED '%@' keypath of view '%@'", buf, 0x20u);
        }

      }
      if (objc_msgSend(v21, "sbsa_isPropertyActivelyC2AnimatingForKeyPath:", v27))
      {
        v34 = (void *)MEMORY[0x1E0CEABB0];
        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __118__SBSystemApertureViewController__shouldPerformTransitionOfProperty_ofObject_withDescription_fromPreferences_context___block_invoke;
        v39[3] = &unk_1E8E9E270;
        v40 = v21;
        v41 = v27;
        v42 = v22;
        objc_msgSend(v34, "performWithoutAnimation:", v39);

        v16 = 1;
      }

      if (v16)
        goto LABEL_11;
    }
    v26 = v38;
    objc_msgSend(v38, "milestones");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v35, "count");

    if (v20)
    {
      SBLogSystemAperturePreferencesStack();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        -[SBSystemApertureViewController _shouldPerformTransitionOfProperty:ofObject:withDescription:fromPreferences:context:].cold.1();

      LOBYTE(v20) = 1;
    }
    goto LABEL_29;
  }
  LOBYTE(v20) = 1;
LABEL_31:

  return (char)v20;
}

uint64_t __132__SBSystemApertureViewController__updateObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_class();
  v7 = v4;
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

  v10 = objc_msgSend(v9, "isContentBoundsProperty");
  if (v10
    && ((v11 = objc_opt_class(), v12 = v5, !v11)
      ? (v13 = 0)
      : (objc_opt_isKindOfClass() & 1) == 0
      ? (v13 = 0)
      : (v13 = v12),
        v14 = v13,
        v12,
        v15 = objc_msgSend(v14, "isContentBoundsProperty"),
        v14,
        !v15))
  {
    v21 = 1;
  }
  else
  {
    v16 = objc_opt_class();
    v17 = v7;
    if (v16)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    v20 = objc_msgSend(v19, "isContentBoundsProperty");
    if ((v20 & 1) != 0)
    {
      v21 = 0;
    }
    else
    {
      v22 = objc_opt_class();
      v23 = v5;
      if (v22)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v24 = v23;
        else
          v24 = 0;
      }
      else
      {
        v24 = 0;
      }
      v25 = v24;

      v26 = objc_msgSend(v25, "isContentBoundsProperty");
      v21 = v26 << 63 >> 63;
    }
  }

  return v21;
}

- (BOOL)_isProperty:(id)a3 ofObject:(id)a4 equalToDescription:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "interfaceElementProperty");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _keyPathForProperty:](self, "_keyPathForProperty:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _valueForProperty:ofDescription:](self, "_valueForProperty:ofDescription:", v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BSEqualStrings() & 1) != 0 || (BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    objc_msgSend(v8, "valueForKeyPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "CGRectValue");
    objc_msgSend(v13, "CGRectValue");
    v15 = SBSARectApproximatelyEqualToRect();
  }
  else if ((BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    objc_msgSend(v8, "valueForKeyPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "CGPointValue");
    objc_msgSend(v13, "CGPointValue");
    v15 = SBSAPointApproximatelyEqualToPoint();
  }
  else
  {
    objc_msgSend(v8, "valueForKeyPath:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BSEqualObjects();
  }
  v16 = v15;

  return v16;
}

- (id)_keyPathForProperty:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "interfaceElementProperty");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = v4;
    v4 = CFSTR("IDCornerRadius");
LABEL_18:

    goto LABEL_19;
  }
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = v4;
    v4 = CFSTR("transform");
    goto LABEL_18;
  }
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = v4;
    v4 = CFSTR("scalingContentView.transform");
    goto LABEL_18;
  }
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = v4;
    v4 = CFSTR("scalingContentView.center");
    goto LABEL_18;
  }
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = v4;
    v4 = CFSTR("scalingContentView.bounds");
    goto LABEL_18;
  }
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = v4;
    v4 = CFSTR("variableBlurView.hidden");
    goto LABEL_18;
  }
  if ((BSEqualStrings() & 1) != 0)
  {
    v5 = v4;
    v4 = CFSTR("variableBlurView.frame");
    goto LABEL_18;
  }
  objc_msgSend(v3, "associatedInterfaceElementIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!BSEqualObjects())
    goto LABEL_18;
  v6 = BSEqualStrings();

  if (v6)
  {
    v5 = v4;
    v4 = CFSTR("containerParentCenter");
    goto LABEL_18;
  }
LABEL_19:

  return v4;
}

- (id)_valueForProperty:(id)a3 ofDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  _OWORD v14[3];
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "interfaceElementProperty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "interfaceElementProperty");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BSEqualStrings() & 1) != 0 || BSEqualStrings())
  {
    objc_msgSend(v8, "CGSizeValue");
    v16 = 0u;
    v17 = 0u;
    v15 = 0u;
    SBSAAffineTransformFromContentScale((uint64_t)&v15, v10, v11);
    v14[0] = v15;
    v14[1] = v16;
    v14[2] = v17;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGAffineTransform:", v14);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }

  return v8;
}

- (void)_updateObject:(id)a3 withDescription:(id)a4 fromPreferences:(id)a5 conditionalAnimations:(id)a6 conditionalCompletion:(id)a7 context:(id)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  id v28;
  id v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v13 = a4;
  v14 = a5;
  v29 = a6;
  v28 = a7;
  v15 = a8;
  v30 = v14;
  objc_msgSend(v14, "propertiesWithAnimatedTransitionDescriptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingComparator:", &__block_literal_global_359);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = v17;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v23, "associatedInterfaceElementIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "interfaceElementIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = BSEqualObjects();

        if (v26)
          -[SBSystemApertureViewController _updateProperty:ofObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:](self, "_updateProperty:ofObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:", v23, v31, v13, v30, v29, v28, v15);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v20);
  }

}

- (void)_updateProperty:(id)a3 ofObject:(id)a4 withDescription:(id)a5 fromPreferences:(id)a6 conditionalAnimations:(id)a7 conditionalCompletion:(id)a8 context:(id)a9
{
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  int v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSMutableDictionary *lastAppliedPropertyIdentitiesToTransitionDescriptions;
  NSMutableDictionary *v33;
  NSMutableDictionary *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  SBSystemApertureFluidAnimator *v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  void *v94;
  _QWORD v95[4];
  id v96;
  id v97;
  id v98;
  _QWORD v99[4];
  id v100;
  _QWORD v101[4];
  id v102;
  _QWORD v103[4];
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  _QWORD v111[4];
  id v112;
  id v113;
  id v114;
  _QWORD v115[4];
  id v116;
  id v117;
  _QWORD v118[5];
  _QWORD v119[4];
  id v120;
  id v121;
  uint64_t v122;
  id v123;
  BOOL v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[4];
  id v130;
  id v131;
  id v132;
  id location;
  id v134;
  id v135;
  _BYTE v136[128];
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v90 = a4;
  v89 = a5;
  v88 = a6;
  v93 = a7;
  v85 = a8;
  v86 = a9;
  v94 = v14;
  if (v14
    && v90
    && v89
    && v88
    && -[SBSystemApertureViewController _shouldPerformTransitionOfProperty:ofObject:withDescription:fromPreferences:context:](self, "_shouldPerformTransitionOfProperty:ofObject:withDescription:fromPreferences:context:", v14, v90, v89, v88, v86))
  {
    objc_msgSend(v88, "effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:", v14);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84
      && ((v15 = objc_opt_class(), v16 = v14, !v15)
        ? (v17 = 0)
        : (objc_opt_isKindOfClass() & 1) == 0
        ? (v17 = 0)
        : (v17 = v16),
          v18 = v17,
          v16,
          v19 = objc_msgSend(v18, "isContentBoundsProperty"),
          v18,
          v19))
    {
      -[SBSystemApertureViewController _elementViewControllerForSizeTransitionWithDescription:fromPreferences:](self, "_elementViewControllerForSizeTransitionWithDescription:fromPreferences:", v89, v88);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
    v81 = (void *)v20;
    v135 = 0;
    v134 = 0;
    -[SBSystemApertureViewController _propertyUpdateBlockArrayForPropertyIdentity:ofObject:withDescription:withTransitionDescription:forceSingle:behaviorSettingsArray:updateDescriptionsArray:](self, "_propertyUpdateBlockArrayForPropertyIdentity:ofObject:withDescription:withTransitionDescription:forceSingle:behaviorSettingsArray:updateDescriptionsArray:", v14, v90, v89, &v134);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v135;
    v79 = v134;
    if (v84)
    {
      objc_msgSend(v84, "behaviorSettings");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isUnanimated");

      if ((v22 & 1) == 0)
      {
        lastAppliedPropertyIdentitiesToTransitionDescriptions = self->_lastAppliedPropertyIdentitiesToTransitionDescriptions;
        if (!lastAppliedPropertyIdentitiesToTransitionDescriptions)
        {
          v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v34 = self->_lastAppliedPropertyIdentitiesToTransitionDescriptions;
          self->_lastAppliedPropertyIdentitiesToTransitionDescriptions = v33;

          lastAppliedPropertyIdentitiesToTransitionDescriptions = self->_lastAppliedPropertyIdentitiesToTransitionDescriptions;
        }
        -[NSMutableDictionary setObject:forKey:](lastAppliedPropertyIdentitiesToTransitionDescriptions, "setObject:forKey:", v84, v14);
        objc_msgSend(v84, "milestones");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "containsObject:", 0x1E91CF8F8))
        {
          objc_initWeak(&location, self);
          v129[0] = MEMORY[0x1E0C809B0];
          v129[1] = 3221225472;
          v129[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke;
          v129[3] = &unk_1E8EB0190;
          objc_copyWeak(&v132, &location);
          v130 = v84;
          v131 = v14;
          v77 = (void *)MEMORY[0x1D17E5550](v129);
          v36 = (void *)objc_msgSend(v35, "mutableCopy");
          objc_msgSend(v36, "removeObject:", 0x1E91CF8F8);

          objc_destroyWeak(&v132);
          objc_destroyWeak(&location);
          v37 = v36;
        }
        else
        {
          v77 = 0;
          v37 = v35;
        }
        v82 = v37;
        -[SBSystemApertureViewController _addFloatAnimatablePropertyForTransitionDescriptionIfNecessary:propertyIdentity:milestones:](self, "_addFloatAnimatablePropertyForTransitionDescriptionIfNecessary:propertyIdentity:milestones:", v84, v14);
        objc_msgSend(v84, "animatedTransitionIdentifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureViewController _floatAnimatablePropertyForTransitionIdentifier:](self, "_floatAnimatablePropertyForTransitionIdentifier:", v38);
        v91 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "interfaceElementProperty");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "_independentlyAnimatableMemberKeyPathsForProperty:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (unint64_t)objc_msgSend(v40, "count") > 1;

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v127 = 0u;
        v128 = 0u;
        v125 = 0u;
        v126 = 0u;
        v43 = v83;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
        if (v44)
        {
          v45 = *(_QWORD *)v126;
          do
          {
            for (i = 0; i != v44; ++i)
            {
              if (*(_QWORD *)v126 != v45)
                objc_enumerationMutation(v43);
              v47 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * i);
              if (objc_msgSend(v42, "count"))
              {
                v118[0] = MEMORY[0x1E0C809B0];
                v118[1] = 3221225472;
                v118[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_4;
                v118[3] = &unk_1E8E9E8D0;
                v118[4] = v47;
                v48 = (void *)MEMORY[0x1D17E5550](v118);
                objc_msgSend(v42, "addObject:", v48);

              }
              else
              {
                v119[0] = MEMORY[0x1E0C809B0];
                v119[1] = 3221225472;
                v119[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_2;
                v119[3] = &unk_1E8EB01E0;
                v124 = v41;
                v120 = v91;
                v122 = v47;
                v123 = v93;
                v121 = v94;
                v49 = (void *)MEMORY[0x1D17E5550](v119);
                objc_msgSend(v42, "addObject:", v49);

              }
            }
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v125, v136, 16);
          }
          while (v44);
        }

        objc_initWeak(&location, self);
        v115[0] = MEMORY[0x1E0C809B0];
        v115[1] = 3221225472;
        v115[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_6;
        v115[3] = &unk_1E8E9F280;
        objc_copyWeak(&v117, &location);
        v76 = v91;
        v116 = v76;
        v50 = (void *)MEMORY[0x1D17E5550](v115);
        v111[0] = MEMORY[0x1E0C809B0];
        v111[1] = 3221225472;
        v111[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_7;
        v111[3] = &unk_1E8EA5EB0;
        objc_copyWeak(&v114, &location);
        v51 = v94;
        v112 = v51;
        v52 = v84;
        v113 = v52;
        v53 = (void *)MEMORY[0x1D17E5550](v111);
        v54 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v51, "associatedInterfaceElementIdentifier");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "UUIDString");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "interfaceElementProperty");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "stringWithFormat:", CFSTR("animated property update: %@ - %@"), v56, v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBSystemApertureViewController _beginRequiringBacklightAssertionForReason:](self, "_beginRequiringBacklightAssertionForReason:", v58);
        v103[0] = MEMORY[0x1E0C809B0];
        v103[1] = 3221225472;
        v103[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_8;
        v103[3] = &unk_1E8EB0208;
        v74 = v50;
        v106 = v74;
        v75 = v53;
        v107 = v75;
        v28 = v77;
        v108 = v28;
        v109 = v85;
        v59 = v51;
        v104 = v59;
        objc_copyWeak(&v110, &location);
        v78 = v58;
        v105 = v78;
        v92 = (void *)MEMORY[0x1D17E5550](v103);
        if (v81)
        {
          v60 = [SBSystemApertureFluidAnimator alloc];
          objc_msgSend(v52, "behaviorSettings");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = -[SBSystemApertureFluidAnimator initWithSettings:](v60, "initWithSettings:", v61);

          v63 = objc_alloc_init(MEMORY[0x1E0CEAF60]);
          objc_msgSend(v63, "_setIsAnimated:", 1);
          objc_msgSend(v63, "_setContainerView:", self->_containerParent);
          objc_msgSend(v63, "_setAnimator:", v62);
          objc_msgSend(v63, "_transitionCoordinator");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v88, "isCollisionImminent") && (objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v64, "setPerformingSystemApertureInertTransition:", 1);
          v65 = (void *)v62;
          v66 = MEMORY[0x1E0C809B0];
          v101[0] = MEMORY[0x1E0C809B0];
          v101[1] = 3221225472;
          v101[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_9;
          v101[3] = &unk_1E8E9EA28;
          v102 = v42;
          v99[0] = v66;
          v67 = v65;
          v99[1] = 3221225472;
          v99[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_10;
          v99[3] = &unk_1E8EB0230;
          v100 = v92;
          objc_msgSend(v64, "animateAlongsideTransition:completion:", v101, v99);
          -[SBSystemApertureViewController _valueForProperty:ofDescription:](self, "_valueForProperty:ofDescription:", v59, v89);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "CGRectValue");
          objc_msgSend(v81, "viewWillTransitionToSize:withTransitionCoordinator:", v64, v69, v70);

          objc_msgSend(v65, "animateTransition:", v63);
        }
        else if ((unint64_t)objc_msgSend(v42, "count") < 2)
        {
          v72 = (void *)MEMORY[0x1E0CEABB0];
          objc_msgSend(v80, "objectAtIndexedSubscript:", 0);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "sb_animateWithSettings:mode:animations:completion:", v67, 3, v73, v92);

        }
        else
        {
          v71 = (void *)MEMORY[0x1E0DA9D48];
          v95[0] = MEMORY[0x1E0C809B0];
          v95[1] = 3221225472;
          v95[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_11;
          v95[3] = &unk_1E8EB0258;
          v96 = v42;
          v97 = v80;
          v98 = v79;
          objc_msgSend(v71, "perform:finalCompletion:", v95, v92);

          v67 = v96;
        }

        objc_destroyWeak(&v110);
        objc_destroyWeak(&v114);

        objc_destroyWeak(&v117);
        objc_destroyWeak(&location);

        goto LABEL_47;
      }
      objc_msgSend(v84, "behaviorSettings");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isUnanimated");

      if (v24)
      {
        objc_msgSend(v84, "milestones");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "count");

        if (v26)
          -[SBSystemApertureViewController _animatedTransitionDidReachMilestone:description:propertyIdentity:finished:retargeted:](self, "_animatedTransitionDidReachMilestone:description:propertyIdentity:finished:retargeted:", v84, v14, 1, 0, 1.79769313e308);
      }
    }
    -[NSMutableDictionary objectForKey:](self->_lastAppliedPropertyIdentitiesToTransitionDescriptions, "objectForKey:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (v27)
    {
      objc_msgSend(v27, "animatedTransitionIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureViewController _floatAnimatablePropertyForTransitionIdentifier:](self, "_floatAnimatablePropertyForTransitionIdentifier:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBSystemApertureViewController _animatedTransitionDidReachMilestone:description:propertyIdentity:finished:retargeted:](self, "_animatedTransitionDidReachMilestone:description:propertyIdentity:finished:retargeted:", v28, v14, 1, 1, 1.79769313e308);
      -[SBSystemApertureViewController _invalidateAndRemoveFloatAnimatableProperty:forTransitionIdentifier:](self, "_invalidateAndRemoveFloatAnimatableProperty:forTransitionIdentifier:", v30, 0);
      -[NSMutableDictionary removeObjectForKey:](self->_lastAppliedPropertyIdentitiesToTransitionDescriptions, "removeObjectForKey:", v14);

    }
    v31 = (void *)MEMORY[0x1E0CEABB0];
    objc_msgSend(v83, "sbsa_onlyObjectOrNilAssert");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_performWithoutRetargetingAnimations:", v82);
LABEL_47:

  }
}

void __64__SBSystemApertureViewController__addRunLoopObserverIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updatePreferencesIfNecessary");

}

- (void)_updatePreferencesIfNecessary
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  SBSAStringFromPreferencesInvalidationReason(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "Updating preferences for reason(s): %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_2();
}

- (void)_updatePreferencesForReasonSystemApertureManager:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFFF7;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonCloningOrRenderingStyle:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFFEF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonOrientation:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFBFFF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (MTMaterialView)variableBlurView
{
  return self->_variableBlurView;
}

void __57__SBSystemApertureViewController__platformMetricsContext__block_invoke(uint64_t a1, void *a2)
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
  id v15;

  v15 = a2;
  if (!v15)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
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
    v10 = NSClassFromString(CFSTR("SBSAPlatformMetricsContextMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSystemApertureViewController.m"), 1647, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 32), "_layoutMetrics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "maximumContinuousCornerRadius");
  objc_msgSend(v6, "setMaximumCornerRadius:");

  objc_msgSend(v6, "setCustomLayoutSquareCornerRadius:", 39.0);
  objc_msgSend(*(id *)(a1 + 32), "_layoutMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "maximumContinuousCornerRadius");
  objc_msgSend(v6, "setCustomLayoutSquareLargeCornerRadius:");

  objc_msgSend(v6, "setCustomLayoutOvalCornerRadius:", 90.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "tallRectCornerRadius");
  objc_msgSend(v6, "setCustomLayoutTallRectCornerRadius:");
  objc_msgSend(v6, "setMinimumEdgePadding:", 4.0);

}

- (CGRect)_indicatorContainerViewFrameInBounds:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
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
  CGRect result;

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensorRegionSize");
  BSRectWithSize();

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumScreenEdgeInsets");

  -[SBSystemApertureViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  UIRectCenteredXInRectScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)minimumSensorRegionFrame
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGRect result;

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sensorRegionSize");

  SBRectWithSize();
  -[SBSystemApertureViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SBSystemApertureViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v20 = v6;
  UIRectCenteredXInRectScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minimumScreenEdgeInsets");
  v15 = v14;

  v16 = v8;
  v17 = v15;
  v18 = v10;
  v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_layoutMetrics
{
  return (id)objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
}

uint64_t __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containerViewDescription");
}

uint64_t __59__SBSystemApertureViewController__updateContainerViewRanks__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRank:");
}

- (void)systemApertureManagerRequestsHostNeedsLayout:(id)a3
{
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 8);
}

- (CGRect)interSensorRegionInContentView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
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
  CGRect result;

  v4 = a3;
  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "interSensorRegionInWindowSpace");
  objc_msgSend(v4, "convertRect:fromView:", 0);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

void __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke_2(uint64_t a1, void *a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = a2;
  v18 = v3;
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v18;
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

    v3 = v18;
    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = NSClassFromString(CFSTR("SBSAViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSystemApertureViewController.m"), 1687, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v18;
  }
  v7 = 0;
LABEL_10:

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1312);
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 1312);
    *(_QWORD *)(v16 + 1312) = v15;

    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1312);
  }
  objc_msgSend(v7, "setInterfaceElementIdentifier:", v14);
  objc_msgSend(*(id *)(a1 + 32), "containerParentCenter");
  objc_msgSend(v7, "setCenter:");

}

- (CGPoint)containerParentCenter
{
  double v2;
  double v3;
  CGPoint result;

  -[SBFTouchPassThroughView center](self->_containerParent, "center");
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)_containerViewForTouch:(id)a3 ofGestureRecognizer:(id)a4 initialLocation:(CGPoint *)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  id v27;
  CGPoint *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = self->_orderedContainerViews;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v29 = a5;
    v13 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (-[SBSystemApertureViewController _isSystemGesture:](self, "_isSystemGesture:", v9))
        {
          _UISystemGestureLocationForTouchInView();
          v17 = v16;
          v19 = v18;
          +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "effectiveReachabilityYOffset");
          v22 = v19 - v21;

        }
        else
        {
          objc_msgSend(v8, "locationInView:", v15);
          v17 = v23;
          v22 = v24;
        }
        if (objc_msgSend(v15, "pointInside:withEvent:", 0, v17, v22))
        {
          v25 = v15;
          if (v29)
          {
            v29->x = v17;
            v29->y = v22;
          }
          goto LABEL_15;
        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v12)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_15:

  if (objc_msgSend(v25, "_isInAWindow"))
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  return v27;
}

- (BOOL)_isSystemGesture:(id)a3
{
  UILongPressGestureRecognizer *v4;
  UILongPressGestureRecognizer *v5;
  char v6;
  id WeakRetained;
  void *v8;
  void *v9;

  v4 = (UILongPressGestureRecognizer *)a3;
  v5 = v4;
  if ((UILongPressGestureRecognizer *)self->_resizePanGesture == v4)
  {
    v6 = 1;
  }
  else if (self->_interactionLongPressGesture == v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
    objc_msgSend(WeakRetained, "associatedWindowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemGestureManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v9, "isSystemGestureRecognizer:", self->_interactionLongPressGesture);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke(uint64_t *a1, void *a2)
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
  id WeakRetained;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
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
  SBSACollisionRequest *v36;
  void *v37;
  id v38;
  _QWORD v39[6];

  v3 = a2;
  v38 = v3;
  if (v3)
  {
    objc_opt_self();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v38;
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

    v3 = v38;
    if (v7)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = a1[6];
    v10 = a1[4];
    v11 = NSClassFromString(CFSTR("SBSAContextMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSystemApertureViewController.m"), 1660, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

    v3 = v38;
  }
  v7 = 0;
LABEL_10:

  objc_msgSend((id)a1[4], "_defaultsContextForDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultsContext:", v14);

  objc_msgSend((id)a1[4], "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "displayScale");
  objc_msgSend(v7, "setDisplayScale:");

  objc_msgSend(v7, "setMinimumNumberOfContainers:", 1);
  objc_msgSend(v7, "setMaximumNumberOfElements:", objc_msgSend((id)a1[4], "_maximumNumberOfSimultaneouslyVisibleElements"));
  objc_msgSend((id)a1[4], "minimumSensorRegionFrame");
  objc_msgSend(v7, "setInertContainerFrame:");
  objc_msgSend(*(id *)(a1[4] + 1008), "bounds");
  objc_msgSend(v7, "setSystemContainerBounds:");
  objc_msgSend((id)a1[4], "_platformMetricsContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPlatformMetrics:", v16);

  objc_msgSend((id)a1[4], "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLayoutDirection:", objc_msgSend(v17, "layoutDirection"));

  objc_msgSend(v7, "setLandscapeScreenEdgeInsets:", 24.0, 21.0, 24.0, 21.0);
  objc_msgSend(v7, "setAccessibilityZoomActiveAndEnabled:", objc_msgSend((id)a1[4], "_axZoomActiveAndEnabled"));
  objc_msgSend(v7, "setReduceTransparencyEnabled:", SBReduceTransparency());
  objc_msgSend(v7, "setOverrideRenderingStyle:", objc_msgSend((id)a1[4], "_effectiveOverrideRenderingStyle"));
  objc_msgSend(v7, "setCloningStyle:", *(_QWORD *)(a1[4] + 1224));
  objc_msgSend(*(id *)(a1[4] + 1064), "indicatorElementViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIndicatorVisible:", v18 != 0);

  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 1448));
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setActiveDisplay:", objc_msgSend(v20, "isMainDisplayWindowScene") ^ 1);

  objc_msgSend(*(id *)(a1[4] + 1144), "anyObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnimatedTransitionInProgress:", v21 != 0);

  objc_msgSend(v7, "setHeavyShadowRequiredForTransition:", objc_msgSend(*(id *)(a1[4] + 1192), "count") != 0);
  objc_msgSend(v7, "setKeyLineRequiredForTransition:", objc_msgSend(*(id *)(a1[4] + 1200), "count") != 0);
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "reachabilityModeActive");

  objc_msgSend(v7, "setReachabilityActive:", v23);
  objc_msgSend(v7, "setTargetPlatformSimulator:", 0);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke_2;
  v39[3] = &unk_1E8E9E9D0;
  v24 = a1[6];
  v39[4] = a1[4];
  v39[5] = v24;
  +[SBSAViewDescription instanceWithBlock:](SBSAViewDescription, "instanceWithBlock:", v39);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContainerParentViewDescription:", v25);

  objc_msgSend((id)a1[4], "_elementContextsForOrderedElementViewControllers:", a1[5]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setElementContexts:", v26);

  objc_msgSend((id)a1[4], "_flushPendingInteractionResults");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setElementInteractionResults:", v27);

  objc_msgSend(*(id *)(a1[4] + 1408), "allObjects");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bs_mapNoNulls:", &__block_literal_global_406);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setElementSnapshotContexts:", v29);

  objc_msgSend((id)a1[4], "_flushPendingTransitionResults");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAnimatedTransitionResults:", v30);

  objc_msgSend((id)a1[4], "_flushElapsedTimerDescriptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setElapsedTimerDescriptions:", v31);

  objc_msgSend((id)a1[4], "_popActiveGestureDescriptions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGestureDescriptions:", v32);

  objc_msgSend(*(id *)(a1[4] + 1056), "bs_mapNoNulls:", &__block_literal_global_409);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setContainerViewDescriptions:", v33);

  objc_msgSend((id)a1[4], "_flushSignificantUpdateTransitionAssertions");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)a1[4];
    v36 = objc_alloc_init(SBSACollisionRequest);
    objc_msgSend(v35, "_addActiveRequest:", v36);

    objc_msgSend(v34, "invalidateWithReason:", CFSTR("Added to context"));
  }
  objc_msgSend((id)a1[4], "_flushActiveRequests");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRequests:", v37);

}

- (unint64_t)_maximumNumberOfSimultaneouslyVisibleElements
{
  if ((unint64_t)(self->_activeElementInterfaceOrientation - 3) < 2)
    return 1;
  else
    return 2;
}

- (id)_popActiveGestureDescriptions
{
  void *v3;
  NSMutableArray *resizeGestureUpdateQueue;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[NSMutableArray count](self->_longPressGestureUpdateQueue, "count")
    && !-[NSMutableArray count](self->_resizeGestureUpdateQueue, "count"))
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  resizeGestureUpdateQueue = self->_resizeGestureUpdateQueue;
  v19[0] = self->_longPressGestureUpdateQueue;
  v19[1] = resizeGestureUpdateQueue;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v3, "addObject:", v11);
          objc_msgSend(v10, "removeObjectAtIndex:", 0);
        }
        if (objc_msgSend(v10, "count"))
          -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 1024);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v7);
  }

  v12 = v3;
  SBLogSystemAperturePreferencesStackGestures();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[SBSystemApertureViewController _popActiveGestureDescriptions].cold.1();

  return v12;
}

- (id)_platformMetricsContext
{
  SBSAPlatformMetricsContext *v4;
  id v5;
  _QWORD v7[6];

  v4 = objc_alloc_init(SBSAPlatformMetricsContext);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SBSystemApertureViewController__platformMetricsContext__block_invoke;
  v7[3] = &unk_1E8E9E9D0;
  v7[4] = self;
  v7[5] = a2;
  v5 = -[SBSAPlatformMetricsContext copyWithBlock:](v4, "copyWithBlock:", v7);

  return v5;
}

- (id)_flushPendingTransitionResults
{
  SBSystemApertureViewController *v2;
  NSMutableArray *v3;
  NSMutableArray *pendingTransitionResults;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_pendingTransitionResults;
  pendingTransitionResults = v2->_pendingTransitionResults;
  v2->_pendingTransitionResults = 0;

  objc_sync_exit(v2);
  return v3;
}

- (id)_flushPendingInteractionResults
{
  SBSystemApertureViewController *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)-[NSMutableArray copy](v2->_pendingInteractionResults, "copy");
  -[NSMutableArray removeAllObjects](v2->_pendingInteractionResults, "removeAllObjects");
  v4 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v4 = v3;
  v5 = v4;

  objc_sync_exit(v2);
  return v5;
}

- (id)_flushElapsedTimerDescriptions
{
  SBSystemApertureViewController *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)-[NSMutableDictionary copy](v2->_timerIdentifiersToDescriptionRecords, "copy", 0);
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](v2->_timerIdentifiersToDescriptionRecords, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isTimerDescriptionElapsed"))
        {
          if (!v4)
            v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v9, "timerDescription");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v10);

          -[NSMutableDictionary removeObjectForKey:](v2->_timerIdentifiersToDescriptionRecords, "removeObjectForKey:", v8);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
  return v4;
}

- (id)_flushActiveRequests
{
  SBSystemApertureViewController *v2;
  NSMutableArray *v3;
  NSMutableArray *activeRequests;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_activeRequests;
  activeRequests = v2->_activeRequests;
  v2->_activeRequests = 0;

  objc_sync_exit(v2);
  return v3;
}

- (id)_elementContextsForOrderedElementViewControllers:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  SBSystemApertureViewController *v21;
  SEL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[SBSystemApertureViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__SBSystemApertureViewController__elementContextsForOrderedElementViewControllers___block_invoke;
    v19[3] = &unk_1E8EB0338;
    v16 = v15;
    v21 = self;
    v22 = a2;
    v20 = v16;
    v23 = v8;
    v24 = v10;
    v25 = v12;
    v26 = v14;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (int64_t)_effectiveOverrideRenderingStyle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int64_t v6;

  -[NSCountedSet allObjects](self->_overrideRenderingStyleRequests, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_compare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

  }
  else
  {
    v6 = -1;
  }

  return v6;
}

- (id)_defaultsContextForDefaults
{
  SBSADefaultsContext *v3;
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;

  v3 = objc_alloc_init(SBSADefaultsContext);
  v4 = -[SBSADefaultsContext copyBySettingSuppressDynamicIslandCompletely:](v3, "copyBySettingSuppressDynamicIslandCompletely:", -[SBSystemApertureDefaults suppressDynamicIslandCompletely](self->_systemApertureDefaults, "suppressDynamicIslandCompletely"));

  v5 = (-[SBSystemApertureDefaults alwaysShowSystemApertureInSnapshots](self->_systemApertureDefaults, "alwaysShowSystemApertureInSnapshots") & 1) != 0|| -[SBSystemApertureSettings suppressHidingInSnapshotsWhileEmpty](self->_settings, "suppressHidingInSnapshotsWhileEmpty");
  v6 = (void *)objc_msgSend(v4, "copyBySettingAlwaysShowSystemApertureInSnapshots:", v5);

  v7 = (void *)objc_msgSend(v6, "copyBySettingNeverRenderSystemApertureFillOnGPU:", -[SBSystemApertureDefaults neverRenderSystemApertureFillOnGPU](self->_systemApertureDefaults, "neverRenderSystemApertureFillOnGPU"));
  v8 = (void *)objc_msgSend(v7, "copyBySettingAlwaysRenderSystemApertureFillOnGPU:", -[SBSystemApertureDefaults alwaysRenderSystemApertureFillOnGPU](self->_systemApertureDefaults, "alwaysRenderSystemApertureFillOnGPU"));

  v9 = (-[SBSystemApertureDefaults alwaysShowSystemApertureOnClonedDisplays](self->_systemApertureDefaults, "alwaysShowSystemApertureOnClonedDisplays") & 1) != 0|| -[SBSystemApertureSettings suppressHidingOnClonedDisplayWhileEmpty](self->_settings, "suppressHidingOnClonedDisplayWhileEmpty");
  v10 = (void *)objc_msgSend(v8, "copyBySettingAlwaysShowSystemApertureOnClonedDisplays:", v9);

  return v10;
}

- (BOOL)_axZoomActiveAndEnabled
{
  uint64_t v3;

  if (_AXSZoomTouchEnabled()
    || (v3 = -[NSMutableArray count](self->_zoomAnimationAssertions, "count")) != 0)
  {
    LOBYTE(v3) = self->_zoomServicesReportedAXisZooming;
  }
  return v3;
}

- (void)_postLayoutDidChangeNotificationIfNecessary
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  CGFloat x;
  double v24;
  CGFloat y;
  double v26;
  CGFloat width;
  double v28;
  CGFloat height;
  void *v30;
  void *v31;
  double MaxY;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id WeakRetained;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD v46[4];
  _QWORD v47[4];
  CGAffineTransform v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  CGAffineTransform v53;
  _QWORD v54[4];
  _QWORD v55[4];
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;

  v57 = *MEMORY[0x1E0C80C00];
  -[SBSystemApertureViewController minimumSensorRegionFrame](self, "minimumSensorRegionFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  memset(&v53, 0, sizeof(v53));
  -[SBSystemApertureViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
    objc_msgSend(v12, "transform");
  else
    memset(&v53, 0, sizeof(v53));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v15 = self->_orderedContainerViews;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v50 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v20, "window");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bounds");
        objc_msgSend(v21, "convertRect:fromView:", v20);
        x = v22;
        y = v24;
        width = v26;
        height = v28;

        v58.origin.x = x;
        v58.origin.y = y;
        v58.size.width = width;
        v58.size.height = height;
        if (!CGRectIsEmpty(v58))
        {
          v48 = v53;
          if (!CGAffineTransformIsIdentity(&v48))
          {
            v48 = v53;
            v59.origin.x = x;
            v59.origin.y = y;
            v59.size.width = width;
            v59.size.height = height;
            v60 = CGRectApplyAffineTransform(v59, &v48);
            x = v60.origin.x;
            y = v60.origin.y;
            width = v60.size.width;
            height = v60.size.height;
          }
          *(CGFloat *)v47 = x;
          *(CGFloat *)&v47[1] = y;
          *(CGFloat *)&v47[2] = width;
          *(CGFloat *)&v47[3] = height;
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v47, "{CGRect={CGPoint=dd}{CGSize=dd}}");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v30);

          v61.origin.x = v4;
          v61.origin.y = v6;
          v61.size.width = v8;
          v61.size.height = v10;
          v65.origin.x = x;
          v65.origin.y = y;
          v65.size.width = width;
          v65.size.height = height;
          v62 = CGRectUnion(v61, v65);
          v4 = v62.origin.x;
          v6 = v62.origin.y;
          v8 = v62.size.width;
          v10 = v62.size.height;
        }
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    }
    while (v17);
  }

  if (!objc_msgSend(v14, "count"))
  {
    *(CGFloat *)v46 = v4;
    *(CGFloat *)&v46[1] = v6;
    *(CGFloat *)&v46[2] = v8;
    *(CGFloat *)&v46[3] = v10;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", v46, "{CGRect={CGPoint=dd}{CGSize=dd}}");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v31);

  }
  v63.origin.x = v4;
  v63.origin.y = v6;
  v63.size.width = v8;
  v63.size.height = v10;
  MaxY = 0.0;
  if (!CGRectIsNull(v63))
  {
    v64.origin.x = v4;
    v64.origin.y = v6;
    v64.size.width = v8;
    v64.size.height = v10;
    MaxY = CGRectGetMaxY(v64);
  }
  -[SAUISystemApertureManager orderedElementViewControllers](self->_systemApertureManager, "orderedElementViewControllers");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "bs_map:", &__block_literal_global_436_0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)MEMORY[0x1E0C99E08];
  v54[0] = CFSTR("SBSystemApertureEdgeInsets");
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", MaxY, 0.0, 0.0, 0.0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v36;
  v54[1] = CFSTR("SBSystemApertureFrames");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v14);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v37;
  v55[2] = v34;
  v54[2] = CFSTR("SBSystemApertureVisibleElementIdentifiers");
  v54[3] = CFSTR("SBSystemApertureCanRegisterRecordingIndicator");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v38;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "dictionaryWithDictionary:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "_sbDisplayConfiguration");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "identity");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    objc_msgSend(v40, "setObject:forKey:", v44, CFSTR("SBSystemApertureOriginatingDisplayIdentity"));
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cachedLayoutDidChangeUserInfo, v40);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "postNotificationName:object:userInfo:", CFSTR("SBSystemApertureLayoutDidChangeNotification"), self, self->_cachedLayoutDidChangeUserInfo);

  }
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (int64_t)behaviorOverridingRole
{
  return 3;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)_configureIndicatorContainerView
{
  _SBSystemApertureIndicatorContainerView *v3;
  _SBSystemApertureIndicatorContainerView *indicatorContainerView;
  _UIPortalView *indicatorContainerPortalView;
  _UIPortalView *v6;
  _UIPortalView *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v3 = objc_alloc_init(_SBSystemApertureIndicatorContainerView);
  indicatorContainerView = self->_indicatorContainerView;
  self->_indicatorContainerView = v3;

  -[SBFTouchPassThroughView insertSubview:atIndex:](self->_containerParent, "insertSubview:atIndex:", self->_indicatorContainerView, 0);
  indicatorContainerPortalView = self->_indicatorContainerPortalView;
  if (!indicatorContainerPortalView)
  {
    v6 = (_UIPortalView *)objc_alloc_init(MEMORY[0x1E0CEAE58]);
    v7 = self->_indicatorContainerPortalView;
    self->_indicatorContainerPortalView = v6;

    -[SBFTouchPassThroughView addSubview:](self->_containerParent, "addSubview:", self->_indicatorContainerPortalView);
    objc_initWeak(&location, self);
    v8 = (void *)SBApp;
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __66__SBSystemApertureViewController__configureIndicatorContainerView__block_invoke;
    v12 = &unk_1E8E9DF28;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v8, "sb_performBlockAfterCATransactionSynchronizedCommit:", &v9);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    indicatorContainerPortalView = self->_indicatorContainerPortalView;
  }
  -[_UIPortalView setSourceView:](indicatorContainerPortalView, "setSourceView:", self->_indicatorContainerView, v9, v10, v11, v12);
}

void __66__SBSystemApertureViewController__configureIndicatorContainerView__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[127], "setIndicatorSourceView:", WeakRetained[129]);
    v2 = v3;
  }

}

- (void)_cleanupIndicatorContainerIfNecessary
{
  void *v3;
  _UIPortalView *indicatorContainerPortalView;
  _SBSystemApertureIndicatorContainerView *indicatorContainerView;

  -[_SBSystemApertureIndicatorContainerView elementViewController](self->_indicatorContainerView, "elementViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SBSystemApertureCurtainViewHoster setIndicatorSourceView:](self->_curtainViewHoster, "setIndicatorSourceView:", 0);
    -[_UIPortalView setSourceView:](self->_indicatorContainerPortalView, "setSourceView:", 0);
    -[_UIPortalView removeFromSuperview](self->_indicatorContainerPortalView, "removeFromSuperview");
    indicatorContainerPortalView = self->_indicatorContainerPortalView;
    self->_indicatorContainerPortalView = 0;

    -[_SBSystemApertureIndicatorContainerView removeFromSuperview](self->_indicatorContainerView, "removeFromSuperview");
    indicatorContainerView = self->_indicatorContainerView;
    self->_indicatorContainerView = 0;

  }
}

uint64_t __63__SBSystemApertureViewController__updatePreferencesIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateAndLayoutIndicatorIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "_updateWithPreferencesFromStack");
  objc_msgSend(*(id *)(a1 + 32), "_removeIndicatorViewControllerIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "_postLayoutDidChangeNotificationIfNecessary");
}

- (void)_updateWithPreferencesFromStack
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
  OUTLINED_FUNCTION_0_6(&dword_1D0540000, v2, v3, "[%{public}lu] BEGIN QUERY ITERATION", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UIPanGestureRecognizer *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *activeContainerDefaultPressGestureDescription;
  id *v13;
  uint64_t *v14;
  BOOL v15;
  objc_class *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  SBSystemApertureViewController *v23;
  _QWORD v24[2];
  __int128 v25;
  _QWORD v26[5];
  _QWORD v27[2];
  __int128 v28;

  v7 = (UIPanGestureRecognizer *)a3;
  v8 = a4;
  if (self->_resizePanGesture == v7 || (UIPanGestureRecognizer *)self->_interactionLongPressGesture == v7)
  {
    v28 = *MEMORY[0x1E0C9D538];
    -[SBSystemApertureViewController _containerViewForTouch:ofGestureRecognizer:initialLocation:](self, "_containerViewForTouch:ofGestureRecognizer:initialLocation:", v8, v7, &v28);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      if ((UIPanGestureRecognizer *)self->_interactionLongPressGesture == v7)
      {
        v11 = 1376;
        activeContainerDefaultPressGestureDescription = self->_activeContainerDefaultPressGestureDescription;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveTouch___block_invoke;
        v26[3] = &unk_1E8EA4230;
        v27[1] = a2;
        v26[4] = self;
        v13 = (id *)v27;
        v27[0] = v9;
        v14 = v26;
      }
      else
      {
        if (self->_resizePanGesture != v7)
        {
LABEL_10:

          v15 = 1;
          goto LABEL_11;
        }
        v11 = 1384;
        activeContainerDefaultPressGestureDescription = self->_activeContainerResizeGestureDescription;
        v19 = MEMORY[0x1E0C809B0];
        v20 = 3221225472;
        v21 = __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveTouch___block_invoke_2;
        v22 = &unk_1E8EB05A8;
        v24[1] = a2;
        v23 = self;
        v13 = (id *)v24;
        v24[0] = v9;
        v25 = v28;
        v14 = &v19;
      }
      v16 = (objc_class *)objc_msgSend(activeContainerDefaultPressGestureDescription, "copyWithBlock:", v14, v19, v20, v21, v22, v23, v24[0]);
      v17 = *(Class *)((char *)&self->super.super.super.super.isa + v11);
      *(Class *)((char *)&self->super.super.super.super.isa + v11) = v16;

      goto LABEL_10;
    }
  }
  -[SBSystemApertureViewController _collapseExpandedElementIfPossible](self, "_collapseExpandedElementIfPossible");
  v15 = 0;
LABEL_11:

  return v15;
}

- (BOOL)_collapseExpandedElementIfPossible
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[SAUISystemApertureManager orderedElementViewControllers](self->_systemApertureManager, "orderedElementViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SAUILayoutSpecifyingOverriderForElementViewController();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "isRequestingMenuPresentation") & 1) == 0)
  {
    objc_msgSend(v4, "preferredLayoutModeAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "preferredLayoutMode") == 3
      && objc_msgSend(v6, "layoutModePreferenceMayBeImplicitlyInvalidated"))
    {
      objc_msgSend(v6, "invalidateWithReason:", CFSTR("dimming view user interaction"));
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateAndLayoutIndicatorIfNecessary
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  SBSystemApertureViewController *v18;
  _SBSystemApertureIndicatorContainerView *v19;
  void *v20;
  void *v21;
  _SBSystemApertureIndicatorContainerView *indicatorContainerView;
  _SBSystemApertureIndicatorContainerView *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  SBSystemApertureViewController *v32;
  _QWORD v33[9];
  uint64_t v34;

  -[SBSystemApertureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[SBSystemApertureViewController _indicatorContainerViewFrameInBounds:](self, "_indicatorContainerViewFrameInBounds:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SAUISystemApertureManager indicatorElementViewController](self->_systemApertureManager, "indicatorElementViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "elementViewProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "element");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  if (-[SBSystemApertureViewController _shouldSuppressElement:allowsSuppressionForSystemChromeSuppression:reason:](self, "_shouldSuppressElement:allowsSuppressionForSystemChromeSuppression:reason:", v14, 0, &v34))
  {

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v14, "suppressForReason:", v34);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v15 = 1;
      objc_msgSend(v14, "setSuppressed:", 1);
      v12 = 0;
      goto LABEL_14;
    }
    v12 = 0;
    goto LABEL_13;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v14, "setSuppressed:", 0);
  if (!v12)
  {
LABEL_13:
    v15 = 1;
    goto LABEL_14;
  }
  if (!self->_indicatorContainerView)
  {
    -[SBSystemApertureViewController _configureIndicatorContainerView](self, "_configureIndicatorContainerView");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __70__SBSystemApertureViewController__updateAndLayoutIndicatorIfNecessary__block_invoke;
    v33[3] = &unk_1E8EA25E0;
    v33[4] = self;
    *(double *)&v33[5] = v5;
    *(double *)&v33[6] = v7;
    *(double *)&v33[7] = v9;
    *(double *)&v33[8] = v11;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v33);
  }
  v15 = 0;
LABEL_14:
  -[_SBSystemApertureIndicatorContainerView elementViewController](self->_indicatorContainerView, "elementViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16 != v12)
  {
    objc_msgSend(v16, "bs_beginAppearanceTransition:animated:", 0, 1);
    -[_SBSystemApertureIndicatorContainerView setElementViewController:](self->_indicatorContainerView, "setElementViewController:", v12);
  }
  if ((v15 & 1) == 0)
  {
    objc_msgSend(v12, "parentViewController");
    v18 = (SBSystemApertureViewController *)objc_claimAutoreleasedReturnValue();

    if (v18 == self)
    {
      objc_msgSend(v12, "view");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      indicatorContainerView = self->_indicatorContainerView;
      objc_msgSend(v21, "superview");
      v23 = (_SBSystemApertureIndicatorContainerView *)objc_claimAutoreleasedReturnValue();

      if (indicatorContainerView == v23)
      {
LABEL_24:

        goto LABEL_25;
      }
      -[_SBSystemApertureIndicatorContainerView addSubview:](self->_indicatorContainerView, "addSubview:", v21);

    }
    else
    {
      -[SBSystemApertureViewController addChildViewController:](self, "addChildViewController:", v12);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v12, "addElementViewControllingObserver:", self);
      v19 = self->_indicatorContainerView;
      objc_msgSend(v12, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SBSystemApertureIndicatorContainerView addSubview:](v19, "addSubview:", v20);

      objc_msgSend(v12, "didMoveToParentViewController:", self);
    }
    v24 = (void *)MEMORY[0x1E0CEABB0];
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __70__SBSystemApertureViewController__updateAndLayoutIndicatorIfNecessary__block_invoke_2;
    v30 = &unk_1E8E9E820;
    v25 = v12;
    v31 = v25;
    v32 = self;
    objc_msgSend(v24, "performWithoutAnimation:", &v27);
    objc_msgSend(v25, "bs_beginAppearanceTransition:animated:", 1, 1, v27, v28, v29, v30);
    objc_msgSend(v25, "bs_endAppearanceTransition");
    v21 = v31;
    goto LABEL_24;
  }
LABEL_25:
  -[_SBSystemApertureIndicatorContainerView setFrame:](self->_indicatorContainerView, "setFrame:", v5, v7, v9, v11);
  -[_SBSystemApertureIndicatorContainerView layoutIfNeeded](self->_indicatorContainerView, "layoutIfNeeded");
  -[_UIPortalView setFrame:](self->_indicatorContainerPortalView, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v12, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBSystemApertureIndicatorContainerView bounds](self->_indicatorContainerView, "bounds");
  objc_msgSend(v26, "setFrame:");
  objc_msgSend(v26, "layoutIfNeeded");

}

- (BOOL)_shouldSuppressElement:(id)a3 allowsSuppressionForSystemChromeSuppression:(BOOL)a4 reason:(int64_t *)a5
{
  id v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t *v13;
  uint64_t i;
  NSSet *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t j;
  int64_t v21;
  int v22;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  id WeakRetained;
  void *v39;
  char v40;
  SBSystemApertureViewController *v41;
  int64_t *v42;
  BOOL v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v9 = self->_sceneIDsPreferringSuppression;
    v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v54;
      while (2)
      {
        v13 = a5;
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v54 != v12)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(v8, "shouldSuppressElementWhilePresentingSceneWithIdentifier:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i)) & 1) != 0)
          {

            v21 = 1;
            LOBYTE(v22) = 1;
LABEL_24:
            a5 = v13;
            goto LABEL_25;
          }
        }
        v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        a5 = v13;
        if (v11)
          continue;
        break;
      }
    }

  }
  v43 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v15 = self->_bundleIDsPreferringSuppression;
    v16 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
    if (v16)
    {
      v17 = v16;
      v13 = a5;
      v18 = 0;
      v19 = *(_QWORD *)v50;
      while (2)
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v50 != v19)
            objc_enumerationMutation(v15);
          if ((v18 & 1) != 0)
          {

            LOBYTE(v22) = 1;
            v21 = 2;
            goto LABEL_24;
          }
          v18 = objc_msgSend(v8, "shouldSuppressElementWhilePresentingAppWithBundleId:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j));
        }
        v17 = -[NSSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
        if (v17)
          continue;
        break;
      }

      a5 = v13;
      if ((v18 & 1) != 0)
      {
        v21 = 0;
        LOBYTE(v22) = 1;
        goto LABEL_25;
      }
    }
    else
    {

    }
  }
  if (-[NSSet count](self->_sceneIDsPreferringSuppression, "count")
    || -[NSSet count](self->_bundleIDsPreferringSuppression, "count")
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v8, "shouldSuppressElementWhilePresentingNoAppsOrScenes") & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v8, "shouldSuppressElementWhileOtherElementsPresent"))
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      -[SAUISystemApertureManager orderedElementViewControllers](self->_systemApertureManager, "orderedElementViewControllers");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (v25)
      {
        v26 = v25;
        obj = v24;
        v41 = self;
        v42 = a5;
        v27 = 0;
        v28 = *(_QWORD *)v46;
        do
        {
          for (k = 0; k != v26; ++k)
          {
            if (*(_QWORD *)v46 != v28)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
            objc_msgSend(v30, "elementViewProvider", v41, v42);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "element");
            v32 = objc_claimAutoreleasedReturnValue();
            if ((id)v32 == v8)
            {

            }
            else
            {
              v33 = (void *)v32;
              objc_msgSend(v30, "elementViewProvider");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "systemApertureLayoutSpecifyingOverrider");
              v35 = v8;
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "layoutMode");

              v8 = v35;
              if (v37 > 0)
                ++v27;
            }
          }
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        }
        while (v26);

        self = v41;
        a5 = v42;
        if (v27)
        {
          LOBYTE(v22) = 1;
          v21 = 4;
          goto LABEL_25;
        }
      }
      else
      {

      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v8, "shouldSuppressElementWhileOnCoversheet")
      && self->_prefersSuppressionOfElementsDueToCoversheetVisibility)
    {
      LOBYTE(v22) = 1;
      v21 = 5;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0
           && objc_msgSend(v8, "shouldSuppressElementWhileOverLiquidDetectionCriticalUI")
           && self->_prefersSuppressionOfElementsDueToLiquidDetectionVisibility)
    {
      LOBYTE(v22) = 1;
      v21 = 6;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0
           && objc_msgSend(v8, "shouldSuppressElementWhileProximityReaderPresent")
           && self->_prefersSuppressionOfElementsDueToProximityReaderVisibility)
    {
      LOBYTE(v22) = 1;
      v21 = 7;
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0
           && (objc_msgSend(v8, "shouldIgnoreSystemChromeSuppression") & 1) != 0
           || !self->_suppressForSystemChromeSuppressionAssertion
           || !v43)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
        objc_msgSend(WeakRetained, "associatedWindowScene");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v39, "isContinuityDisplayWindowScene") & 1) != 0)
        {
          v40 = objc_msgSend(v8, "shouldSuppressElementWhileOnContinuityDisplay");

          if ((v40 & 1) != 0)
          {
            LOBYTE(v22) = 1;
            v21 = 10;
            goto LABEL_25;
          }
        }
        else
        {

        }
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v22 = objc_msgSend(v8, "requiresSuppressionFromSystemAperture");
        v21 = 9;
        if (!v22)
          v21 = 0;
      }
      else
      {
        v21 = 0;
        LOBYTE(v22) = 0;
      }
    }
    else
    {
      LOBYTE(v22) = 1;
      v21 = 8;
    }
  }
  else
  {
    LOBYTE(v22) = 1;
    v21 = 3;
  }
LABEL_25:
  *a5 = v21;

  return v22;
}

- (void)_setBlobEnabled:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[SBSystemApertureViewController _isBlobEnabled](self, "_isBlobEnabled");
  if (v3)
  {
    if (!v5)
      -[SBSystemApertureViewController _addMitosisBlobEffects](self, "_addMitosisBlobEffects");
  }
  else if (v5)
  {
    -[SBSystemApertureViewController _removeMitosisBlobEffects](self, "_removeMitosisBlobEffects");
  }
}

- (void)_removeIndicatorViewControllerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[_SBSystemApertureIndicatorContainerView elementViewController](self->_indicatorContainerView, "elementViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[SBSystemApertureViewController childViewControllers](self, "childViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __75__SBSystemApertureViewController__removeIndicatorViewControllerIfNecessary__block_invoke;
    v6[3] = &unk_1E8EB02E8;
    v6[4] = self;
    objc_msgSend(v4, "bs_firstObjectPassingTest:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSystemApertureViewController _cleanupViewController:](self, "_cleanupViewController:", v5);
    -[SBSystemApertureViewController _cleanupIndicatorContainerIfNecessary](self, "_cleanupIndicatorContainerIfNecessary");

  }
}

- (BOOL)_isBlobEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  -[UIView layer](self->_containerBackgroundParent, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_handleTimerUpdatesFromPreferences:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "timerDescriptions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SBSystemApertureViewController _addTimerIfNecessaryForDescription:](self, "_addTimerIfNecessaryForDescription:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_handleTelemetryLoggingFromContext:(id)a3
{
  +[SBSystemApertureTelemetryEmitter logTelemetryForUpdatedContext:](SBSystemApertureTelemetryEmitter, "logTelemetryForUpdatedContext:", a3);
}

- (void)_handleMitosisBlobUpdatesFromPreferences:(id)a3
{
  -[SBSystemApertureViewController _setBlobEnabled:](self, "_setBlobEnabled:", objc_msgSend(a3, "isBlobEnabled"));
}

- (void)_handleHitTestingUpdatesWithContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  UILongPressGestureRecognizer *interactionLongPressGesture;
  id WeakRetained;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "elementContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutMode");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_orderedContainerViews;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v11), "layer", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setAllowsHitTesting:", v6 > 0);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  interactionLongPressGesture = self->_interactionLongPressGesture;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "systemGestureManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _promote:gestureRecognizer:toSystemGestureWithManager:type:](self, "_promote:gestureRecognizer:toSystemGestureWithManager:type:", v6 < 1, interactionLongPressGesture, v16, 133);

}

- (void)_promote:(BOOL)a3 gestureRecognizer:(id)a4 toSystemGestureWithManager:(id)a5 type:(unint64_t)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  uint64_t v20;

  v8 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    v13 = objc_msgSend(v11, "isSystemGestureRecognizer:", v10);
    if (v12 && a6 && v8 && (v13 & 1) == 0)
    {
      SBLogSystemApertureController();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        v19 = v10;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizer priority to system: gestureRecognizer: %{public}@", (uint8_t *)&v18, 0xCu);
      }

      objc_msgSend(v10, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeGestureRecognizer:", v10);

      objc_msgSend(v12, "addGestureRecognizer:withType:", v10, a6);
    }
    else if (!v8 && ((v13 ^ 1) & 1) == 0)
    {
      SBLogSystemApertureController();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 138543362;
        v19 = v10;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Updating gesture recognizer priority to default: gestureRecognizer: %{public}@", (uint8_t *)&v18, 0xCu);
      }

      objc_msgSend(v12, "removeGestureRecognizer:", v10);
      -[SBSystemApertureViewController view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addGestureRecognizer:", v10);

    }
  }

}

- (void)_handleGestureUpdatesFromPreferences:(id)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "gestureDescriptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v15;
    *(_QWORD *)&v6 = 138412290;
    v13 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v10, "gestureRecognizerState", v13) == 4)
        {
          -[SBSystemApertureViewController _gestureRecognizerForDescription:](self, "_gestureRecognizerForDescription:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "state") >= 1)
          {
            SBLogSystemAperturePreferencesStackGestures();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v13;
              v19 = v11;
              _os_log_debug_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEBUG, "Cancelling guesture from stack request: %@", buf, 0xCu);
            }

            objc_msgSend(v11, "sb_cancel");
          }

        }
      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

}

- (void)_handleCurtainUpdatesFromPreferences:(id)a3
{
  id v4;
  void *v5;
  SBSystemApertureGainMapBackedRendering *magiciansCurtainView;
  SBSystemApertureGainMapBackedRendering *highLevelMagiciansCurtainView;
  _QWORD v8[3];
  _QWORD v9[3];

  v4 = a3;
  v5 = v4;
  magiciansCurtainView = self->_magiciansCurtainView;
  if (v4)
  {
    objc_msgSend(v4, "curtainRenderingConfiguration");
    -[SBSystemApertureGainMapBackedRendering setRenderingConfiguration:](magiciansCurtainView, "setRenderingConfiguration:", v9);
    highLevelMagiciansCurtainView = self->_highLevelMagiciansCurtainView;
    objc_msgSend(v5, "highLevelCurtainRenderingConfiguration");
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    -[SBSystemApertureGainMapBackedRendering setRenderingConfiguration:](magiciansCurtainView, "setRenderingConfiguration:", v9);
    highLevelMagiciansCurtainView = self->_highLevelMagiciansCurtainView;
    memset(v8, 0, sizeof(v8));
  }
  -[SBSystemApertureGainMapBackedRendering setRenderingConfiguration:](highLevelMagiciansCurtainView, "setRenderingConfiguration:", v8);

}

- (void)_handleContainerParentUpdatesFromPreferences:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "containerParentViewDescription");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:](self, "_updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:", self, v8, v7, 0, 0, v6);

}

- (void)_handleContainerAndElementUpdatesFromPreferences:(id)a3 orderedElementViewControllers:(id)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  SBSystemApertureViewController *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  SBSystemApertureViewController *v32;
  void *v33;
  SBSystemApertureViewController *v34;
  void *v35;
  int v36;
  SBSystemApertureViewController *v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  int v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t i;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  id obj;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  void *v71;
  void *v72;
  SBSystemApertureViewController *v73;
  _QWORD v74[4];
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[4];
  id v85;
  _QWORD v86[4];
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v64 = a4;
  v70 = a5;
  objc_msgSend(v8, "elementDescriptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _removeElementViewControllersExceptingThoseWithDescriptions:](self, "_removeElementViewControllersExceptingThoseWithDescriptions:", v9);
  v65 = v9;
  v62 = (void *)objc_msgSend(v9, "mutableCopy");
  v71 = v8;
  v10 = v8;
  v11 = self;
  objc_msgSend(v10, "containerViewDescriptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _removeContainerViewsExceptingThoseWithDescriptions:](self, "_removeContainerViewsExceptingThoseWithDescriptions:", v12);
  -[SBSystemApertureViewController _updateContainerViewRanks](self, "_updateContainerViewRanks");
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = v12;
  v73 = self;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
  if (v67)
  {
    v66 = *(_QWORD *)v89;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v89 != v66)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v13);
        objc_msgSend(v14, "interfaceElementIdentifier", v61);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureViewController _containerViewWithInterfaceElementIdentifier:creatingIfNecessary:](v11, "_containerViewWithInterfaceElementIdentifier:creatingIfNecessary:", v15, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "associatedSystemApertureElementIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v68 = v17;
        v69 = v13;
        if (v17
          && (v86[0] = MEMORY[0x1E0C809B0],
              v86[1] = 3221225472,
              v86[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke,
              v86[3] = &unk_1E8EB03E0,
              v87 = v17,
              objc_msgSend(v64, "bs_firstObjectPassingTest:", v86),
              (v19 = (id)objc_claimAutoreleasedReturnValue()) != 0))
        {
          v20 = v19;
          objc_msgSend(v16, "setElementViewController:", v19);
          v21 = 1;
          v22 = v20;
        }
        else
        {
          objc_msgSend(v16, "elementViewController");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "elementViewProvider");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "element");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = SAElementIdentityEqualToIdentity();

          if (v26)
            v20 = v23;
          else
            v20 = 0;

          objc_msgSend(v16, "setElementViewController:", 0);
          v22 = 0;
          v11 = v73;
          if (!v18)
          {
            v28 = 0;
            v34 = v73;
            v35 = v16;
            v29 = 0;
            v72 = 0;
            goto LABEL_42;
          }
          v21 = 0;
        }
        v84[0] = MEMORY[0x1E0C809B0];
        v84[1] = 3221225472;
        v84[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_2;
        v84[3] = &unk_1E8EA3810;
        v85 = v18;
        objc_msgSend(v65, "bs_firstObjectPassingTest:", v84);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        v29 = 0;
        if (v20 && v27)
        {
          objc_msgSend(v27, "snapshotReason");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v20, "beginRequiringSnapshotForReason:", v30);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              objc_msgSend(v28, "associatedSystemApertureElementIdentity");
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = v11;
              v33 = (void *)v31;
              -[SBSystemApertureViewController _activeSnapshotAssertionForElementIdentity:](v32, "_activeSnapshotAssertionForElementIdentity:", v31);
              v61 = (void *)objc_claimAutoreleasedReturnValue();

              if (v29 == v61)
              {

                v29 = 0;
                v11 = v73;
              }
              else
              {
                v11 = v73;
                -[SBSystemApertureViewController _removeActiveSnapshotAssertion:](v73, "_removeActiveSnapshotAssertion:", v61);
                -[SBSystemApertureViewController _addActiveSnapshotAssertion:](v73, "_addActiveSnapshotAssertion:", v29);
              }

            }
          }
          else
          {
            v29 = 0;
          }

        }
        if (v28)
          v36 = v21;
        else
          v36 = 0;
        v72 = v22;
        if (v36 != 1)
        {
          v34 = v11;
LABEL_41:
          v35 = v16;
          goto LABEL_42;
        }
        objc_msgSend(v62, "removeObject:", v28);
        objc_msgSend(v22, "parentViewController");
        v37 = (SBSystemApertureViewController *)objc_claimAutoreleasedReturnValue();

        if (v37 != v11)
        {
          -[SBSystemApertureViewController addChildViewController:](v11, "addChildViewController:", v22);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v22, "addElementViewControllingObserver:", v11);
          objc_msgSend(v22, "didMoveToParentViewController:", v11, v61);
        }
        objc_msgSend(v22, "view", v61);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "superview");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isDescendantOfView:", v16);

        if ((v40 & 1) == 0)
        {
          objc_msgSend(v22, "view");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addContentSubview:", v41);

        }
        v42 = objc_msgSend(v28, "appearState");
        v34 = v73;
        if (v42 == 3)
        {
LABEL_39:
          v35 = v16;
          objc_msgSend(v72, "bs_beginAppearanceTransition:animated:", v42 == 1, 1);
          goto LABEL_42;
        }
        if (v42 != 2)
        {
          if (v42 == 1)
            goto LABEL_39;
          goto LABEL_41;
        }
        v35 = v16;
        objc_msgSend(v72, "bs_endAppearanceTransition");
LABEL_42:
        v43 = MEMORY[0x1E0C809B0];
        v82[0] = MEMORY[0x1E0C809B0];
        v82[1] = 3221225472;
        v82[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_3;
        v82[3] = &unk_1E8EB0408;
        v82[4] = v34;
        v44 = v71;
        v83 = v44;
        -[SBSystemApertureViewController _updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:](v34, "_updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:", v35, v14, v44, v82, 0, v70);
        v80[0] = v43;
        v80[1] = 3221225472;
        v80[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_4;
        v80[3] = &unk_1E8EB0430;
        v81 = v29;
        v45 = v29;
        -[SBSystemApertureViewController _updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:](v34, "_updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:", v20, v28, v44, 0, v80, v70);

        if (v68)
        {

          v46 = v87;
          v47 = v69;
        }
        else
        {

          v47 = v69;
          v46 = v72;
        }

        v13 = v47 + 1;
        v11 = v34;
      }
      while (v67 != v13);
      v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v93, 16);
      v67 = v48;
    }
    while (v48);
  }

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v49 = v62;
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v77 != v52)
          objc_enumerationMutation(v49);
        v54 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * i);
        objc_msgSend(v54, "associatedSystemApertureElementIdentity", v61);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_5;
        v74[3] = &unk_1E8EB03E0;
        v56 = v55;
        v75 = v56;
        objc_msgSend(v64, "bs_firstObjectPassingTest:", v74);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v57;
        if (v57)
        {
          v59 = v57;
        }
        else
        {
          -[SBSystemApertureViewController _childElementViewControllerWithIdentity:](v73, "_childElementViewControllerWithIdentity:", v56);
          v59 = (id)objc_claimAutoreleasedReturnValue();
        }
        v60 = v59;

        if (objc_msgSend(v54, "appearState") == 3)
          objc_msgSend(v60, "bs_beginAppearanceTransition:animated:", 0, 1);
        -[SBSystemApertureViewController _updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:](v73, "_updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:", v60, v54, v71, 0, 0, v70);

      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    }
    while (v51);
  }

}

- (void)_updateContainerViewRanks
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_orderedContainerViews, "enumerateObjectsUsingBlock:", &__block_literal_global_547);
}

- (void)_removeElementViewControllersExceptingThoseWithDescriptions:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SBSystemApertureViewController childViewControllers](self, "childViewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!-[SBSystemApertureViewController _isIndicatorElementViewController:](self, "_isIndicatorElementViewController:", v10)&& (objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "elementViewProvider");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "element");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            v15[0] = MEMORY[0x1E0C809B0];
            v15[1] = 3221225472;
            v15[2] = __94__SBSystemApertureViewController__removeElementViewControllersExceptingThoseWithDescriptions___block_invoke;
            v15[3] = &unk_1E8EA3810;
            v16 = v13;
            if ((objc_msgSend(v4, "bs_containsObjectPassingTest:", v15) & 1) == 0)
            {
              -[SBSystemApertureViewController _cleanupViewController:](self, "_cleanupViewController:", v11);
              -[SBSystemApertureViewController _containerViewForViewController:](self, "_containerViewForViewController:", v11);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setElementViewController:", 0);

            }
          }

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

}

- (void)_removeContainerViewsExceptingThoseWithDescriptions:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id *obj;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = (id *)&v5->super.super.super.super.isa;
  v6 = (void *)-[NSMutableArray copy](v5->_orderedContainerViews, "copy");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v13[0] = v9;
        v13[1] = 3221225472;
        v13[2] = __86__SBSystemApertureViewController__removeContainerViewsExceptingThoseWithDescriptions___block_invoke;
        v13[3] = &unk_1E8EA6A60;
        v13[4] = v11;
        if ((objc_msgSend(v4, "bs_containsObjectPassingTest:", v13) & 1) == 0)
        {
          objc_msgSend(v11, "removeFromSuperview");
          objc_msgSend(obj[132], "removeObject:", v11);
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_sync_exit(obj);
}

- (void)_handleBackgroundUpdatesFromPreferences:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "backgroundBlurDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[SBSystemApertureViewController _updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:](self, "_updateObject:withDescription:fromPreferences:conditionalAnimations:conditionalCompletion:context:", self, v7, v8, 0, 0, v6);

}

- (void)_handleAnyContentsDidChangePreferences:(id)a3 context:(id)a4
{
  _BOOL8 v5;
  id WeakRetained;
  id v7;

  v5 = SBSAContextAndPreferencesRepresentAnyContentVisible(a4, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_visibilityDelegate);
  if (self->_systemApertureContainsAnyContent != v5)
  {
    self->_systemApertureContainsAnyContent = v5;
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "systemApertureViewController:containsAnyContent:", self, v5);
    WeakRetained = v7;
  }

}

- (void)_handleActionsFromPreferences:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  BOOL v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  BOOL v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(a3, "actions", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v40;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v8);
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

        v14 = -[SBSystemApertureViewController _handlePreferencesDidChangeAction:](self, "_handlePreferencesDidChangeAction:", v13);
        if (!v14)
        {
          v15 = objc_opt_class();
          v16 = v11;
          if (v15)
            v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v16 : 0;
          else
            v17 = 0;
          v18 = v17;

          v19 = -[SBSystemApertureViewController _handleContainerTapAction:](self, "_handleContainerTapAction:", v18);
          if (!v19)
          {
            v20 = objc_opt_class();
            v21 = v16;
            if (v20)
              v22 = (objc_opt_isKindOfClass() & 1) != 0 ? v21 : 0;
            else
              v22 = 0;
            v23 = v22;

            v24 = -[SBSystemApertureViewController _handleContainerPressAction:](self, "_handleContainerPressAction:", v23);
            if (!v24)
            {
              v25 = objc_opt_class();
              v26 = v21;
              if (v25)
                v27 = (objc_opt_isKindOfClass() & 1) != 0 ? v26 : 0;
              else
                v27 = 0;
              v28 = v27;

              v29 = -[SBSystemApertureViewController _handleImpactFeedbackAction:](self, "_handleImpactFeedbackAction:", v28);
              if (!v29)
              {
                v30 = objc_opt_class();
                v31 = v26;
                if (v30)
                  v32 = (objc_opt_isKindOfClass() & 1) != 0 ? v31 : 0;
                else
                  v32 = 0;
                v33 = v32;

                v34 = -[SBSystemApertureViewController _handleContainerResizeAction:](self, "_handleContainerResizeAction:", v33);
                if (!v34)
                {
                  v35 = objc_opt_class();
                  v36 = v31;
                  if (v35)
                  {
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                      v37 = v36;
                    else
                      v37 = 0;
                  }
                  else
                  {
                    v37 = 0;
                  }
                  v38 = v37;

                  -[SBSystemApertureViewController _handleCalloutBlockAction:](self, "_handleCalloutBlockAction:", v38);
                }
              }
            }
          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v6);
  }

}

- (id)_flushSignificantUpdateTransitionAssertions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSPointerArray *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v22;
  SBSystemApertureViewController *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[NSPointerArray sa_compact](self->_significantUpdateTransitionAssertions, "sa_compact");
  -[SBSystemApertureViewController _primaryContainerView](self, "_primaryContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "elementViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "element");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SAUILayoutSpecifyingOverriderForElement();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v22 = 1240;
  v23 = self;
  v8 = self->_significantUpdateTransitionAssertions;
  v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v25;
    while (1)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v14, "isValid", v22, v23, (_QWORD)v24))
        {
          objc_msgSend(v14, "element");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 == v6)
          {
            if (objc_msgSend(v7, "layoutMode") == 3)
            {
              v18 = v14;

              v11 = v18;
              continue;
            }
            v16 = v14;
            v17 = CFSTR("element not in custom layout mode");
          }
          else
          {
            v16 = v14;
            v17 = CFSTR("element not in primary container");
          }
          objc_msgSend(v16, "invalidateWithReason:", v17);
        }
      }
      v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v10)
        goto LABEL_17;
    }
  }
  v11 = 0;
LABEL_17:

  v19 = *(Class *)((char *)&v23->super.super.super.super.isa + v22);
  *(Class *)((char *)&v23->super.super.super.super.isa + v22) = 0;

  v20 = v11;
  return v20;
}

- (id)_primaryContainerView
{
  return (id)-[NSMutableArray firstObject](self->_orderedContainerViews, "firstObject");
}

- (id)_contextWithOrderedElementViewControllers:(id)a3
{
  id v5;
  unint64_t queryIteration;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v5 = a3;
  queryIteration = self->_queryIteration;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke;
  v10[3] = &unk_1E8EA4230;
  v11 = v5;
  v12 = a2;
  v10[4] = self;
  v7 = v5;
  +[SBSAContext instanceWithQueryIteration:block:](SBSAContext, "instanceWithQueryIteration:block:", queryIteration, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_containerViewWithInterfaceElementIdentifier:(id)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SBSystemApertureViewController *v7;
  NSMutableArray *orderedContainerViews;
  id v9;
  id v10;
  BOOL v11;
  NSMutableArray *v12;
  NSMutableArray *v13;
  NSMutableArray *v14;
  _QWORD v16[4];
  id v17;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    orderedContainerViews = v7->_orderedContainerViews;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __99__SBSystemApertureViewController__containerViewWithInterfaceElementIdentifier_creatingIfNecessary___block_invoke;
    v16[3] = &unk_1E8EB02C0;
    v9 = v6;
    v17 = v9;
    -[NSMutableArray bs_firstObjectPassingTest:](orderedContainerViews, "bs_firstObjectPassingTest:", v16);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = 1;
    else
      v11 = !v4;
    if (!v11)
    {
      v10 = -[SBSystemApertureViewController _newContainerViewWithInterfaceElementIdentifier:](v7, "_newContainerViewWithInterfaceElementIdentifier:", v9);
      v12 = v7->_orderedContainerViews;
      if (!v12)
      {
        v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v14 = v7->_orderedContainerViews;
        v7->_orderedContainerViews = v13;

        v12 = v7->_orderedContainerViews;
      }
      -[NSMutableArray addObject:](v12, "addObject:", v10);
      -[SBFTouchPassThroughView insertSubview:belowSubview:](v7->_containerParent, "insertSubview:belowSubview:", v10, v7->_magiciansCurtainView);
    }

    objc_sync_exit(v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_cleanupViewController:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "bs_endAppearanceTransition");
  objc_msgSend(v5, "willMoveToParentViewController:", 0);
  objc_msgSend(v5, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  objc_msgSend(v5, "removeFromParentViewController");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "removeElementViewControllingObserver:", self);

}

- (BOOL)_isIndicatorElementViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    -[_SBSystemApertureIndicatorContainerView elementViewController](self->_indicatorContainerView, "elementViewController");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
    {
      v7 = v5 == (_QWORD)v4;
    }
    else
    {
      objc_msgSend(v4, "viewIfLoaded");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isDescendantOfView:", self->_indicatorContainerView);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)elementViewControllingDidAppear:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "elementViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "element");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "element:visibilityDidChange:", v4, 1);

}

- (void)elementViewControllingWillAppear:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "elementViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "element");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "element:visibilityWillChange:", v4, 1);

}

- (id)registerElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  SBSystemAperturePlatformElementHost *v10;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  objc_msgSend(v4, "viewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemApertureLayoutSpecifyingOverrider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addBehaviorOverridingParticipant:", self);

  -[SAUISystemApertureManager registerElement:](self->_systemApertureManager, "registerElement:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v4, "setGestureHandler:", self);
    v8 = objc_opt_respondsToSelector();
    v9 = MEMORY[0x1E0C809B0];
    if ((v8 & 1) != 0)
    {
      v10 = -[SBSystemAperturePlatformElementHost initWithElement:delegate:]([SBSystemAperturePlatformElementHost alloc], "initWithElement:delegate:", v4, self);
      objc_msgSend(v4, "setPlatformElementHost:", v10);
      objc_setAssociatedObject(v4, "com.apple.SpringBoard.SystemApertureViewController.platformElementHost", v10, (void *)1);
      v15[0] = v9;
      v15[1] = 3221225472;
      v15[2] = __50__SBSystemApertureViewController_registerElement___block_invoke;
      v15[3] = &unk_1E8EA60E0;
      v16 = v4;
      objc_msgSend(v7, "addInvalidationBlock:", v15);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "systemApertureElementAssertionAcquired");
      objc_initWeak(&location, v4);
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __50__SBSystemApertureViewController_registerElement___block_invoke_2;
      v12[3] = &unk_1E8EABB30;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v7, "addInvalidationBlock:", v12);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

void __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "_valueForProperty:ofDescription:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_keyPathForProperty:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "setValue:forKeyPath:", v8, v2);
  v3 = *(void **)(a1 + 56);
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

  objc_msgSend(v7, "layoutIfNeeded");
}

- (void)hostOrientationDidChangeTo:(int64_t)a3 withPreviousOrientation:(int64_t)a4 context:(id)a5
{
  id v9;
  int64_t activeElementInterfaceOrientation;
  NSObject *v11;
  void *v12;
  BOOL v13;
  void *v14;
  SBSystemApertureAnimator *v15;
  void *v16;
  NSObject *v17;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  SBSystemApertureViewControllerRotationTransitionContext *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  activeElementInterfaceOrientation = self->_activeElementInterfaceOrientation;
  SBLogSystemApertureOrientation();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BSInterfaceOrientationDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138412290;
    v35 = v12;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "System Aperture Orientation settings did change to: %@", (uint8_t *)&v34, 0xCu);

  }
  if (activeElementInterfaceOrientation)
    v13 = activeElementInterfaceOrientation == a4;
  else
    v13 = 1;
  if (v13)
  {
    if (!a3)
      goto LABEL_17;
LABEL_9:
    if (!v9)
      goto LABEL_20;
    goto LABEL_10;
  }
  SBLogSystemApertureOrientation();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SBSystemApertureViewController(Private) hostOrientationDidChangeTo:withPreviousOrientation:context:].cold.2();

  if (a3)
    goto LABEL_9;
LABEL_17:
  SBLogSystemApertureOrientation();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[SBSystemApertureViewController(Private) hostOrientationDidChangeTo:withPreviousOrientation:context:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

  if (!v9)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E0DA9E08], "unanimatedBehaviorSettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "BSAnimationSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_10:
  +[SBAnimationUtilities animationSettingsForRotationFromOrientation:toOrientation:withContext:](SBAnimationUtilities, "animationSettingsForRotationFromOrientation:toOrientation:withContext:", activeElementInterfaceOrientation, a3, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    goto LABEL_11;
LABEL_21:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 4071, CFSTR("Failed to compute animation settings"));

LABEL_11:
  if (activeElementInterfaceOrientation == a3)
  {
    SBLogSystemApertureOrientation();
    v15 = (SBSystemApertureAnimator *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v15->super, OS_LOG_TYPE_DEFAULT))
    {
      BSInterfaceOrientationDescription();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 138412290;
      v35 = v16;
      _os_log_impl(&dword_1D0540000, &v15->super, OS_LOG_TYPE_DEFAULT, "Not applying orientation update to SBSystemApertureViewController because new orientation:(%@) matches current orientation", (uint8_t *)&v34, 0xCu);

    }
  }
  else
  {
    v15 = -[SBSystemApertureAnimator initWithSettings:]([SBSystemApertureAnimator alloc], "initWithSettings:", v14);
    v29 = -[SBSystemApertureViewControllerRotationTransitionContext initWithTargetOrientation:]([SBSystemApertureViewControllerRotationTransitionContext alloc], "initWithTargetOrientation:", a3);
    -[_UIViewControllerTransitionContext _setIsAnimated:](v29, "_setIsAnimated:", 1);
    -[_UIViewControllerTransitionContext _setAnimator:](v29, "_setAnimator:", v15);
    -[_UIViewControllerTransitionContext _transitionCoordinator](v29, "_transitionCoordinator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureViewController _updateElementOrientationTo:withTransitionCoordinator:](self, "_updateElementOrientationTo:withTransitionCoordinator:", a3, v30);

    -[SBSystemApertureViewController view](self, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "windowScene");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "_synchronizeDrawing");

    -[SBSystemApertureAnimator animateTransition:](v15, "animateTransition:", v29);
  }

}

void __97__SBSystemApertureViewController_Private___updateElementOrientationTo_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3940];
  SBSAStringFromUIInterfaceOrientation(*(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("end rotation to %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateWithReason:", v5);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");

}

- (void)_updateElementOrientationTo:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21[2];
  _QWORD v22[5];
  id location;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SBSAStringFromUIInterfaceOrientation(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@] begin rotation to %@"), v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _layoutAssertionWithMaximumPermittedLayoutMode:reason:creatingIfNecessary:](self, "_layoutAssertionWithMaximumPermittedLayoutMode:reason:creatingIfNecessary:", 1, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

  if (self->_activeElementInterfaceOrientation != a3)
  {
    self->_activeElementInterfaceOrientation = a3;
    -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 0x4000);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = self->_orderedContainerViews;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "elementOrientationDidChangeWithTransitionCoordinator:", v6);
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }

  objc_initWeak(&location, self);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __97__SBSystemApertureViewController_Private___updateElementOrientationTo_withTransitionCoordinator___block_invoke;
  v22[3] = &unk_1E8E9EA28;
  v22[4] = self;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __97__SBSystemApertureViewController_Private___updateElementOrientationTo_withTransitionCoordinator___block_invoke_2;
  v19[3] = &unk_1E8EB08C0;
  v18 = v12;
  v20 = v18;
  v21[1] = (id)a3;
  objc_copyWeak(v21, &location);
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v22, v19);
  objc_destroyWeak(v21);

  objc_destroyWeak(&location);
}

- (void)_invalidatePreferencesForReason:(unsigned int)a3
{
  self->_preferencesInvalidationReasons |= a3;
}

- (void)setCloningStyle:(int64_t)a3
{
  if (self->_cloningStyle != a3)
  {
    self->_cloningStyle = a3;
    -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 16);
  }
}

void __108__SBSystemApertureViewController__layoutAssertionWithMaximumPermittedLayoutMode_reason_creatingIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_removeLayoutAssertionAndReevaluate:", v3);

}

- (void)_removeLayoutAssertionAndReevaluate:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self;
    objc_sync_enter(v5);
    objc_msgSend(v9, "reason");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](v5->_reasonsToLayoutAssertions, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7
      || (v8 = -[SBSystemApertureViewController _mostRestrictiveLayoutModeFromActiveLayoutAssertions](v5, "_mostRestrictiveLayoutModeFromActiveLayoutAssertions"), -[NSMapTable removeObjectForKey:](v5->_reasonsToLayoutAssertions, "removeObjectForKey:", v6), -[SBSystemApertureViewController _mostRestrictiveLayoutModeFromActiveLayoutAssertions](v5, "_mostRestrictiveLayoutModeFromActiveLayoutAssertions") != v8))
    {
      -[SAUISystemApertureManager invalidatePromotedElements](v5->_systemApertureManager, "invalidatePromotedElements");
    }

    objc_sync_exit(v5);
    v4 = v9;
  }

}

- (id)_layoutAssertionWithMaximumPermittedLayoutMode:(int64_t)a3 reason:(id)a4 creatingIfNecessary:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  SBSystemApertureViewController *v9;
  SBSystemApertureLayoutAssertion *v10;
  BOOL v11;
  SBSystemApertureLayoutAssertion *v12;
  uint64_t v13;
  NSMapTable *reasonsToLayoutAssertions;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id location;

  v5 = a5;
  v8 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v9 = self;
    objc_sync_enter(v9);
    -[NSMapTable objectForKey:](v9->_reasonsToLayoutAssertions, "objectForKey:", v8);
    v10 = (SBSystemApertureLayoutAssertion *)objc_claimAutoreleasedReturnValue();
    if (v10)
      v11 = 1;
    else
      v11 = !v5;
    if (!v11)
    {
      objc_initWeak(&location, v9);
      v12 = [SBSystemApertureLayoutAssertion alloc];
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __108__SBSystemApertureViewController__layoutAssertionWithMaximumPermittedLayoutMode_reason_creatingIfNecessary___block_invoke;
      v24 = &unk_1E8EB0898;
      objc_copyWeak(&v25, &location);
      v10 = -[SBSystemApertureLayoutAssertion initWithMaximumPermittedLayoutMode:reason:invalidationHandler:](v12, "initWithMaximumPermittedLayoutMode:reason:invalidationHandler:", a3, v8, &v21);
      if (!v9->_reasonsToLayoutAssertions)
      {
        objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable", v21, v22, v23, v24);
        v13 = objc_claimAutoreleasedReturnValue();
        reasonsToLayoutAssertions = v9->_reasonsToLayoutAssertions;
        v9->_reasonsToLayoutAssertions = (NSMapTable *)v13;

      }
      v15 = -[SBSystemApertureViewController _mostRestrictiveLayoutModeFromActiveLayoutAssertions](v9, "_mostRestrictiveLayoutModeFromActiveLayoutAssertions", v21, v22, v23, v24);
      -[NSMapTable setObject:forKey:](v9->_reasonsToLayoutAssertions, "setObject:forKey:", v10, v8);
      v16 = -[SBSystemApertureViewController _mostRestrictiveLayoutModeFromActiveLayoutAssertions](v9, "_mostRestrictiveLayoutModeFromActiveLayoutAssertions");
      if (v16 != v15)
      {
        -[SBSystemApertureViewController _primaryContainerView](v9, "_primaryContainerView");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](v9, "_layoutSpecifyingOverriderForContainerView:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "preferredLayoutModeAssertion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "preferredLayoutMode") > v16 && objc_msgSend(v19, "layoutModeChangeReason") == 3)
          objc_msgSend(v19, "invalidateWithReason:", CFSTR("more restrictive layout assertion"));
        -[SAUISystemApertureManager invalidatePromotedElements](v9->_systemApertureManager, "invalidatePromotedElements");

      }
      objc_destroyWeak(&v25);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)_mostRestrictiveLayoutModeFromActiveLayoutAssertions
{
  SBSystemApertureViewController *v2;
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v2->_reasonsToLayoutAssertions;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    v6 = 3;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKey:](v2->_reasonsToLayoutAssertions, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "maximumPermittedLayoutMode");

        if (v9 < v6)
          v6 = v9;
      }
      v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 3;
  }

  objc_sync_exit(v2);
  return v6;
}

- (id)_layoutSpecifyingOverriderForContainerView:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "elementViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SAUILayoutSpecifyingOverriderForElementViewController();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)_activeElementInterfaceOrientation
{
  int64_t result;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = self->_activeElementInterfaceOrientation;
  if (!result)
  {
    SBLogSystemApertureOrientation();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SBSystemApertureViewController _activeElementInterfaceOrientation].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

    return self->_activeElementInterfaceOrientation;
  }
  return result;
}

- (void)zStackParticipantDidChange:(id)a3
{
  int v4;
  BSInvalidatable *suppressForSystemChromeSuppressionAssertion;
  BSInvalidatable *v6;
  BSInvalidatable *v7;

  v4 = objc_msgSend(a3, "systemApertureSuppressedForSystemChromeSuppression");
  suppressForSystemChromeSuppressionAssertion = self->_suppressForSystemChromeSuppressionAssertion;
  if (!v4)
  {
    self->_suppressForSystemChromeSuppressionAssertion = 0;
    v7 = suppressForSystemChromeSuppressionAssertion;

    -[BSInvalidatable invalidate](v7, "invalidate");
    goto LABEL_5;
  }
  if (!suppressForSystemChromeSuppressionAssertion)
  {
    -[SBSystemApertureViewController systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression](self, "systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression");
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suppressForSystemChromeSuppressionAssertion;
    self->_suppressForSystemChromeSuppressionAssertion = v6;
LABEL_5:

  }
  -[SBSystemApertureViewController _reevaluateElementSuppression](self, "_reevaluateElementSuppression");
}

- (id)systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression
{
  _SBSystemApertureRepresentationSuppressionAssertion *v3;
  _SBSystemApertureRepresentationSuppressionAssertion *v4;
  _QWORD v6[5];

  v3 = [_SBSystemApertureRepresentationSuppressionAssertion alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __108__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression__block_invoke;
  v6[3] = &unk_1E8EB0060;
  v6[4] = self;
  v4 = -[_SBSystemApertureRepresentationSuppressionAssertion initWithCoverSheetVisible:liquidDetectionVisible:proximityReaderVisible:suppressForSystemChromeSuppression:invalidationBlock:](v3, "initWithCoverSheetVisible:liquidDetectionVisible:proximityReaderVisible:suppressForSystemChromeSuppression:invalidationBlock:", 0, 0, 0, 1, v6);
  -[NSMutableSet addObject:](self->_systemApertureSuppressionAssertions, "addObject:", v4);
  -[SBSystemApertureViewController _reevaluateElementSuppression](self, "_reevaluateElementSuppression");
  return v4;
}

- (void)_reevaluateElementSuppression
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  NSSet *v23;
  NSSet *sceneIDsPreferringSuppression;
  NSSet *v25;
  NSSet *bundleIDsPreferringSuppression;
  NSObject *v27;
  int prefersSuppressionOfElementsDueToSystemChromeSuppression;
  _BOOL4 prefersSuppressionOfElementsDueToProximityReaderVisibility;
  _BOOL4 prefersSuppressionOfElementsDueToLiquidDetectionVisibility;
  int v31;
  int v32;
  _BOOL4 prefersSuppressionOfElementsDueToCoversheetVisibility;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v3 = self->_systemApertureSuppressionAssertions;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v35 != v10)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        v9 |= objc_msgSend(v12, "isCoverSheetVisible");
        v6 |= objc_msgSend(v12, "isLiquidDetectionVisible");
        v7 |= objc_msgSend(v12, "isProximityReaderVisible");
        v8 |= objc_msgSend(v12, "suppressForSystemChromeSuppression");
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
    }
    while (v5);
  }
  else
  {
    LOBYTE(v6) = 0;
    LOBYTE(v7) = 0;
    LOBYTE(v8) = 0;
    LOBYTE(v9) = 0;
  }

  -[SBFZStackParticipant associatedSceneIdentifiersToSuppressInSystemAperture](self->_zStackParticipant, "associatedSceneIdentifiersToSuppressInSystemAperture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFZStackParticipant associatedSceneIdentifiersToSuppressInSystemAperture](self->_zStackParticipant, "associatedSceneIdentifiersToSuppressInSystemAperture");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unionSet:", v16);

  }
  else
  {
    v15 = 0;
  }
  -[SBFZStackParticipant associatedBundleIdentifiersToSuppressInSystemAperture](self->_zStackParticipant, "associatedBundleIdentifiersToSuppressInSystemAperture");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFZStackParticipant associatedBundleIdentifiersToSuppressInSystemAperture](self->_zStackParticipant, "associatedBundleIdentifiersToSuppressInSystemAperture");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unionSet:", v20);

  }
  else
  {
    v19 = 0;
  }
  v32 = BSEqualSets();
  v21 = BSEqualSets();
  prefersSuppressionOfElementsDueToCoversheetVisibility = self->_prefersSuppressionOfElementsDueToCoversheetVisibility;
  prefersSuppressionOfElementsDueToLiquidDetectionVisibility = self->_prefersSuppressionOfElementsDueToLiquidDetectionVisibility;
  v31 = v21;
  prefersSuppressionOfElementsDueToSystemChromeSuppression = self->_prefersSuppressionOfElementsDueToSystemChromeSuppression;
  prefersSuppressionOfElementsDueToProximityReaderVisibility = self->_prefersSuppressionOfElementsDueToProximityReaderVisibility;
  v22 = v8 & 1;
  v23 = (NSSet *)objc_msgSend(v15, "copy");
  sceneIDsPreferringSuppression = self->_sceneIDsPreferringSuppression;
  self->_sceneIDsPreferringSuppression = v23;

  v25 = (NSSet *)objc_msgSend(v19, "copy");
  bundleIDsPreferringSuppression = self->_bundleIDsPreferringSuppression;
  self->_bundleIDsPreferringSuppression = v25;

  self->_prefersSuppressionOfElementsDueToCoversheetVisibility = v9 & 1;
  self->_prefersSuppressionOfElementsDueToLiquidDetectionVisibility = v6 & 1;
  self->_prefersSuppressionOfElementsDueToProximityReaderVisibility = v7 & 1;
  self->_prefersSuppressionOfElementsDueToSystemChromeSuppression = v22;
  if (prefersSuppressionOfElementsDueToCoversheetVisibility != (v9 & 1)
    || !v32
    || !v31
    || prefersSuppressionOfElementsDueToLiquidDetectionVisibility != (v6 & 1)
    || prefersSuppressionOfElementsDueToProximityReaderVisibility != (v7 & 1)
    || prefersSuppressionOfElementsDueToSystemChromeSuppression != v22)
  {
    SBLogSystemApertureController();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110402;
      v39 = v9 & 1;
      v40 = 1024;
      v41 = v6 & 1;
      v42 = 1024;
      v43 = v7 & 1;
      v44 = 1024;
      v45 = v22;
      v46 = 2114;
      v47 = v19;
      v48 = 2114;
      v49 = v15;
      _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "Invalidating promoted elements with coversheet suppression %{BOOL}u liquid detection suppression %{BOOL}u proximity reader suppression %{BOOL}u system chrome suppression %{BOOL}u bundleIDs %{public}@ sceneIds %{public}@", buf, 0x2Eu);
    }

    -[SAUISystemApertureManager invalidatePromotedElements](self->_systemApertureManager, "invalidatePromotedElements");
  }

}

uint64_t __108__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForSystemChromeSuppression__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "removeObject:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_reevaluateElementSuppression");
}

uint64_t __70__SBSystemApertureViewController__updateAndLayoutIndicatorIfNecessary__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)_propertyUpdateBlockArrayForPropertyIdentity:(id)a3 ofObject:(id)a4 withDescription:(id)a5 withTransitionDescription:(id)a6 forceSingle:(BOOL)a7 behaviorSettingsArray:(id *)a8 updateDescriptionsArray:(id *)a9
{
  _BOOL4 v9;
  id *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *i;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id *v54;
  uint64_t v55;
  void *v56;
  void *v58;
  id v59;
  id v60;
  id v61;
  id v62;
  void *v64;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v71;
  _QWORD v72[5];
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[5];
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  id v89;
  _QWORD v90[5];
  id v91;
  id v92;
  id v93;

  v9 = a7;
  v13 = a9;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v17, "keyPathsWithAuxillaryBehaviorSettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = v20;
  if (!objc_msgSend(v20, "count"))
    goto LABEL_13;
  objc_opt_self();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v15;
  if (v21)
    v23 = (objc_opt_isKindOfClass() & 1) != 0 ? v22 : 0;
  else
    v23 = 0;

  if (!v23)
    goto LABEL_13;
  objc_msgSend(v14, "interfaceElementProperty");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_independentlyAnimatableMemberKeyPathsForProperty:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "intersectsSet:", v66);

  if (v26 && !v9)
  {
    v61 = v15;
    -[SBSystemApertureViewController _keyPathForProperty:](self, "_keyPathForProperty:", v14);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "_independentlyAnimatableMemberKeyPathsForProperty:", v69);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "keyPathsWithAuxillaryBehaviorSettings");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v88[0] = MEMORY[0x1E0C809B0];
    v88[1] = 3221225472;
    v88[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_2;
    v88[3] = &unk_1E8EAC3A8;
    v30 = v27;
    v89 = v30;
    objc_msgSend(v28, "bs_filter:", v88);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v31, "mutableCopy");

    v86[0] = v29;
    v86[1] = 3221225472;
    v86[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_3;
    v86[3] = &unk_1E8E9DE38;
    v33 = v32;
    v87 = v33;
    objc_msgSend(v30, "bs_filter:", v86);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v80[0] = v29;
    v80[1] = 3221225472;
    v80[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_4;
    v80[3] = &unk_1E8EAC000;
    v80[4] = self;
    v62 = v14;
    v35 = v14;
    v81 = v35;
    v60 = v16;
    v36 = v16;
    v82 = v36;
    v37 = v22;
    v38 = v17;
    v39 = v37;
    v83 = v37;
    v59 = v34;
    v84 = v59;
    v68 = v69;
    v85 = v68;
    v40 = (void *)MEMORY[0x1D17E5550](v80);
    objc_msgSend(v71, "addObject:", v40);

    objc_msgSend(v38, "behaviorSettings");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "addObject:", v41);

    objc_msgSend(v67, "addObject:", CFSTR("Base"));
    for (i = v33; objc_msgSend(i, "count"); i = v45)
    {
      objc_msgSend(v33, "lastObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "removeLastObject");
      v44 = MEMORY[0x1E0C809B0];
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_5;
      v78[3] = &unk_1E8E9DE38;
      v45 = v33;
      v79 = v45;
      objc_msgSend(v30, "bs_filter:", v78);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v72[0] = v44;
      v72[1] = 3221225472;
      v72[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_6;
      v72[3] = &unk_1E8EAC000;
      v72[4] = self;
      v73 = v35;
      v74 = v36;
      v75 = v39;
      v76 = v46;
      v77 = v68;
      v47 = v46;
      v48 = (void *)MEMORY[0x1D17E5550](v72);
      objc_msgSend(v71, "addObject:", v48);

      objc_msgSend(v38, "auxillaryBehaviorSettingsForKeyPath:", v43);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v49);

      objc_msgSend(v67, "addObject:", v43);
    }

    v15 = v61;
    v14 = v62;
    v13 = a9;
    v16 = v60;
    v17 = v38;
    v51 = v71;
    v54 = a8;
    v52 = v64;
  }
  else
  {
LABEL_13:
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke;
    v90[3] = &unk_1E8E9F108;
    v90[4] = self;
    v91 = v14;
    v92 = v16;
    v93 = v15;
    v50 = (void *)MEMORY[0x1D17E5550](v90);
    v51 = v71;
    objc_msgSend(v71, "addObject:", v50);

    v52 = v64;
    if (v17)
    {
      objc_msgSend(v17, "behaviorSettings");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "addObject:", v53);

    }
    objc_msgSend(v67, "addObject:", CFSTR("Only update block"));

    v54 = a8;
  }
  if (v54)
  {
    v55 = objc_msgSend(v52, "count");
    if (v55 != objc_msgSend(v51, "count") && (unint64_t)objc_msgSend(v51, "count") >= 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 1119, CFSTR("Only allowed to have missing behavior settings if [propertyUpdateBlocks count] == 1"));

    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v52);
    *v54 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v67);
    *v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v51);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

- (void)element:(id)a3 requestsDiscreteAnimationOfType:(int64_t)a4
{
  id v7;
  SBSAShakeRequest *v8;
  SBSAElementIdentification *v9;
  uint64_t v10;
  SBSAPulseRequest *v11;
  void *v12;
  SBSAPulseRequest *v13;
  SBSAElementIdentification *v14;
  SBSAPulseRequest *v15;
  SBSAEjectRequest *v16;
  void *v17;
  id v18;

  v7 = a3;
  v18 = v7;
  switch(a4)
  {
    case 1:
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 2904, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("element != nil"));

      }
      v8 = [SBSAShakeRequest alloc];
      v9 = -[SBSAElementIdentification initWithElementIdentification:]([SBSAElementIdentification alloc], "initWithElementIdentification:", v18);
      v10 = -[SBSAShakeRequest initWithParticipantIdentifier:](v8, "initWithParticipantIdentifier:", v9);
      goto LABEL_6;
    case 2:
      v11 = [SBSAPulseRequest alloc];
      v9 = -[SBSAElementIdentification initWithElementIdentification:]([SBSAElementIdentification alloc], "initWithElementIdentification:", v18);
      v10 = -[SBSAPulseRequest initWithParticipantIdentifier:pulseStyle:](v11, "initWithParticipantIdentifier:pulseStyle:", v9, 0);
LABEL_6:
      v12 = (void *)v10;
      -[SBSystemApertureViewController _addActiveRequest:](self, "_addActiveRequest:", v10);

      goto LABEL_10;
    case 3:
      if (!-[SBSystemApertureSettings pulseIndicatorEnabled](self->_settings, "pulseIndicatorEnabled"))
        goto LABEL_11;

      v13 = [SBSAPulseRequest alloc];
      v14 = -[SBSAElementIdentification initWithElementIdentification:]([SBSAElementIdentification alloc], "initWithElementIdentification:", 0);
      v15 = -[SBSAPulseRequest initWithParticipantIdentifier:pulseStyle:](v13, "initWithParticipantIdentifier:pulseStyle:", v14, 1);
      -[SBSystemApertureViewController _addActiveRequest:](self, "_addActiveRequest:", v15);

      -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 256);
      v7 = 0;
      break;
    case 4:
      v16 = objc_alloc_init(SBSAEjectRequest);
      -[SBSystemApertureViewController _addActiveRequest:](self, "_addActiveRequest:", v16);

LABEL_10:
      -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 256);
LABEL_11:
      v7 = v18;
      break;
    default:
      break;
  }

}

void __70__SBSystemApertureViewController__updateAndLayoutIndicatorIfNecessary__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "bounds");
  objc_msgSend(v2, "setFrame:");
  objc_msgSend(v2, "layoutIfNeeded");

}

void __97__SBSystemApertureViewController_Private___updateElementOrientationTo_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 1056);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "layoutIfNeeded", (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void)_configureInteractionLongPressIfNecessary
{
  SBSystemApertureLongPressGestureRecognizer *v3;
  UILongPressGestureRecognizer *interactionLongPressGesture;
  id v5;

  if (!self->_interactionLongPressGesture)
  {
    v3 = -[SBSystemApertureLongPressGestureRecognizer initWithTarget:action:]([SBSystemApertureLongPressGestureRecognizer alloc], "initWithTarget:action:", self, sel__handleInteractionLongPress_);
    interactionLongPressGesture = self->_interactionLongPressGesture;
    self->_interactionLongPressGesture = &v3->super;

    -[UILongPressGestureRecognizer setName:](self->_interactionLongPressGesture, "setName:", CFSTR("longPressSystemAperture"));
    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->_interactionLongPressGesture, "setMinimumPressDuration:", 0.0);
    -[UILongPressGestureRecognizer setCancelsTouchesInView:](self->_interactionLongPressGesture, "setCancelsTouchesInView:", 0);
    -[UILongPressGestureRecognizer setDelaysTouchesBegan:](self->_interactionLongPressGesture, "setDelaysTouchesBegan:", 0);
    -[UILongPressGestureRecognizer setDelaysTouchesEnded:](self->_interactionLongPressGesture, "setDelaysTouchesEnded:", 0);
    -[UILongPressGestureRecognizer setDelegate:](self->_interactionLongPressGesture, "setDelegate:", self);
    -[SBSystemApertureViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", self->_interactionLongPressGesture);

  }
}

- (SBSystemApertureViewController)initWithActiveWindowScene:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  void *v6;
  uint64_t v7;
  SBSystemApertureDefaults *systemApertureDefaults;
  SBSystemApertureDefaults *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  NSCountedSet *backlightAssertionRequiringReasons;
  uint64_t v21;
  NSCountedSet *overrideRenderingStyleRequests;
  uint64_t v23;
  NSMutableSet *transitionShadowAssertions;
  uint64_t v25;
  NSMutableSet *transitionKeyLineAssertions;
  uint64_t v27;
  NSMutableSet *dynamicPersistentAnimationAssertions;
  SBSystemApertureResizeGestureRecognizer *v29;
  UIPanGestureRecognizer *resizePanGesture;
  uint64_t v31;
  NSMutableArray *longPressGestureUpdateQueue;
  uint64_t v33;
  NSMutableArray *resizeGestureUpdateQueue;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  SBFZStackParticipant *zStackParticipant;
  void *v40;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSMutableArray *v42;
  NSMutableArray *zoomAnimationAssertions;
  void *v44;
  void *v45;
  SBSystemApertureKeyLineColorValidator *v46;
  SBSystemApertureKeyLineColorValidator *colorValidator;
  void *v48;
  void *v49;
  uint64_t v50;
  UITraitChangeRegistration *contentSizeCategoryTraitChangeRegistration;
  SBSystemApertureDebuggingUtility *v52;
  SBSystemApertureDebuggingUtility *debuggingUtility;
  void *v54;
  _QWORD v56[4];
  id v57;
  id location;
  objc_super v59;
  void *v60;
  _QWORD v61[7];

  v61[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)SBSystemApertureViewController;
  v5 = -[SBSystemApertureViewController initWithNibName:bundle:](&v59, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemApertureDefaults");
    v7 = objc_claimAutoreleasedReturnValue();
    systemApertureDefaults = v5->_systemApertureDefaults;
    v5->_systemApertureDefaults = (SBSystemApertureDefaults *)v7;

    objc_initWeak(&location, v5);
    v9 = v5->_systemApertureDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysRenderSystemApertureFillOnGPU");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "neverRenderSystemApertureFillOnGPU");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "suppressDynamicIslandCompletely");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v12;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysShowSystemApertureOnClonedDisplays");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v61[3] = v13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "alwaysShowSystemApertureInSnapshots");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v61[4] = v14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "enableSystemApertureStateCollection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v61[5] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C80D38];
    v56[1] = 3221225472;
    v56[2] = __60__SBSystemApertureViewController_initWithActiveWindowScene___block_invoke;
    v56[3] = &unk_1E8E9DF28;
    v56[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v57, &location);
    v18 = (id)-[SBSystemApertureDefaults observeDefaults:onQueue:withBlock:](v9, "observeDefaults:onQueue:withBlock:", v16, MEMORY[0x1E0C80D38], v56);

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    backlightAssertionRequiringReasons = v5->_backlightAssertionRequiringReasons;
    v5->_backlightAssertionRequiringReasons = (NSCountedSet *)v19;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v21 = objc_claimAutoreleasedReturnValue();
    overrideRenderingStyleRequests = v5->_overrideRenderingStyleRequests;
    v5->_overrideRenderingStyleRequests = (NSCountedSet *)v21;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    transitionShadowAssertions = v5->_transitionShadowAssertions;
    v5->_transitionShadowAssertions = (NSMutableSet *)v23;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v25 = objc_claimAutoreleasedReturnValue();
    transitionKeyLineAssertions = v5->_transitionKeyLineAssertions;
    v5->_transitionKeyLineAssertions = (NSMutableSet *)v25;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v27 = objc_claimAutoreleasedReturnValue();
    dynamicPersistentAnimationAssertions = v5->_dynamicPersistentAnimationAssertions;
    v5->_dynamicPersistentAnimationAssertions = (NSMutableSet *)v27;

    v29 = -[SBSystemApertureResizeGestureRecognizer initWithTarget:action:]([SBSystemApertureResizeGestureRecognizer alloc], "initWithTarget:action:", v5, sel__handleResizePan_);
    resizePanGesture = v5->_resizePanGesture;
    v5->_resizePanGesture = &v29->super;

    -[UIPanGestureRecognizer setName:](v5->_resizePanGesture, "setName:", CFSTR("resizeSystemAperture"));
    -[UIPanGestureRecognizer setCancelsTouchesInView:](v5->_resizePanGesture, "setCancelsTouchesInView:", 0);
    -[UIPanGestureRecognizer setAllowedScrollTypesMask:](v5->_resizePanGesture, "setAllowedScrollTypesMask:", 3);
    -[UIPanGestureRecognizer setDelegate:](v5->_resizePanGesture, "setDelegate:", v5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v31 = objc_claimAutoreleasedReturnValue();
    longPressGestureUpdateQueue = v5->_longPressGestureUpdateQueue;
    v5->_longPressGestureUpdateQueue = (NSMutableArray *)v31;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v33 = objc_claimAutoreleasedReturnValue();
    resizeGestureUpdateQueue = v5->_resizeGestureUpdateQueue;
    v5->_resizeGestureUpdateQueue = (NSMutableArray *)v33;

    objc_msgSend(v4, "associatedWindowScene");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "systemGestureManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addGestureRecognizer:withType:", v5->_resizePanGesture, 132);
    objc_msgSend(v35, "zStackResolver");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "acquireParticipantWithIdentifier:delegate:", 27, v5);
    v38 = objc_claimAutoreleasedReturnValue();
    zStackParticipant = v5->_zStackParticipant;
    v5->_zStackParticipant = (SBFZStackParticipant *)v38;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "addObserver:selector:name:object:", v5, sel__elementKeyColorWasInvalidated_, CFSTR("SBSystemApertureElementKeyColorDidInvalidateNotification"), 0);

    v5->_zoomServicesReportedAXisZooming = 0;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v5, (CFNotificationCallback)_SBSystemApertureZoomPreferencesDidChange, (CFStringRef)*MEMORY[0x1E0DDE340], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    zoomAnimationAssertions = v5->_zoomAnimationAssertions;
    v5->_zoomAnimationAssertions = v42;

    -[SBSystemApertureViewController _axRegisterForZoomUpdatesIfNecessary](v5, "_axRegisterForZoomUpdatesIfNecessary");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObserver:selector:name:object:", v5, sel__reduceTransparencyDidChange_, *MEMORY[0x1E0CEB098], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObserver:selector:name:object:", v5, sel__invertColorsChanged_, *MEMORY[0x1E0CEB018], 0);

    v46 = objc_alloc_init(SBSystemApertureKeyLineColorValidator);
    colorValidator = v5->_colorValidator;
    v5->_colorValidator = v46;

    objc_opt_self();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureViewController registerForTraitChanges:withTarget:action:](v5, "registerForTraitChanges:withTarget:action:", v49, v5, sel__updatePreferredContentSizeCategoryForAllElements_);
    v50 = objc_claimAutoreleasedReturnValue();
    contentSizeCategoryTraitChangeRegistration = v5->_contentSizeCategoryTraitChangeRegistration;
    v5->_contentSizeCategoryTraitChangeRegistration = (UITraitChangeRegistration *)v50;

    v52 = -[SBSystemApertureDebuggingUtility initWithDelegate:]([SBSystemApertureDebuggingUtility alloc], "initWithDelegate:", v5);
    debuggingUtility = v5->_debuggingUtility;
    v5->_debuggingUtility = v52;

    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "addObserver:", v5);

    -[SBSystemApertureViewController setActiveWindowScene:](v5, "setActiveWindowScene:", v4);
    objc_destroyWeak(&v57);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __60__SBSystemApertureViewController_initWithActiveWindowScene___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidatePreferencesForReason:", 2);

}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  objc_super v6;

  -[SBSystemApertureViewController unregisterForTraitChanges:](self, "unregisterForTraitChanges:", self->_contentSizeCategoryTraitChangeRegistration);
  if (self->_zoomRegistrationIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0DDB308], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeZoomAttributesChangedHandler:", self->_zoomRegistrationIdentifier);

  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0DDE340], 0);
  -[BSInvalidatable invalidate](self->_suppressTouchCancellationAssertion, "invalidate");
  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)SBSystemApertureViewController;
  -[SBSystemApertureViewController dealloc](&v6, sel_dealloc);
}

- (void)setCurtainViewHoster:(id)a3
{
  id v5;
  SBSystemApertureCurtainViewHoster *curtainViewHoster;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v5 = a3;
  -[SBSystemApertureCurtainViewHoster setCurtainView:](self->_curtainViewHoster, "setCurtainView:", 0);
  -[SBSystemApertureCurtainViewHoster setIndicatorSourceView:](self->_curtainViewHoster, "setIndicatorSourceView:", 0);
  objc_storeStrong((id *)&self->_curtainViewHoster, a3);
  curtainViewHoster = self->_curtainViewHoster;
  if (curtainViewHoster)
  {
    if (self->_highLevelMagiciansCurtainView)
      -[SBSystemApertureCurtainViewHoster setCurtainView:](curtainViewHoster, "setCurtainView:");
    if (self->_indicatorContainerPortalView)
    {
      objc_initWeak(&location, self);
      v7 = (void *)SBApp;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __55__SBSystemApertureViewController_setCurtainViewHoster___block_invoke;
      v8[3] = &unk_1E8E9DF28;
      objc_copyWeak(&v9, &location);
      objc_msgSend(v7, "sb_performBlockAfterCATransactionSynchronizedCommit:", v8);
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }

}

void __55__SBSystemApertureViewController_setCurtainViewHoster___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[127], "setIndicatorSourceView:", WeakRetained[129]);
    v2 = v3;
  }

}

- (SBSystemApertureCurtainViewHoster)curtainViewHoster
{
  return self->_curtainViewHoster;
}

- (void)setVisibilityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_visibilityDelegate, a3);
}

- (SBSystemApertureViewControllerVisibilityDelegate)visibilityDelegate
{
  return (SBSystemApertureViewControllerVisibilityDelegate *)objc_loadWeakRetained((id *)&self->_visibilityDelegate);
}

- (BOOL)isTransitionTargetForSceneIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SAUISystemApertureManager registeredElements](self->_systemApertureManager, "registeredElements", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        SAUILayoutSpecifyingOverriderForElement();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "preferredLayoutMode") >= 1
          && (objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v12, "acceptsFullScreenTransitionFromSceneWithIdentifier:ofBundleId:", v6, v7))
        {

          LOBYTE(v9) = 1;
          goto LABEL_13;
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

  return v9;
}

- (void)animateTransitionAcceptanceBounceWithVelocityVector:(CGPoint)a3 triggeredBlock:(id)a4
{
  double x;
  SBSystemApertureSettings *settings;
  id v7;
  double v8;
  uint64_t v9;
  SBSABounceRequest *v10;

  x = a3.x;
  settings = self->_settings;
  v7 = a4;
  -[SBSystemApertureSettings acceptanceSideBounceXVelocityThreshold](settings, "acceptanceSideBounceXVelocityThreshold");
  if (x >= -v8)
  {
    if (x > v8)
      v9 = 2;
    else
      v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  v10 = -[SBSABounceRequest initWithStyle:triggeredBlock:]([SBSABounceRequest alloc], "initWithStyle:triggeredBlock:", v9, v7);

  -[SBSystemApertureViewController _addActiveRequest:](self, "_addActiveRequest:", v10);
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 256);
}

- (void)animateTransitionEjectionStretchWithVelocityVector:(CGPoint)a3
{
  id v4;

  -[SBSystemApertureViewController _currentFirstElement](self, "_currentFirstElement", a3.x, a3.y);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController animateDiscreteAnimationStyle:toElement:](self, "animateDiscreteAnimationStyle:toElement:", 4, v4);

}

- (id)overrideContainerRenderingStyleAssertion:(int64_t)a3
{
  NSCountedSet *overrideRenderingStyleRequests;
  void *v7;
  id v8;
  void *v10;
  _QWORD v11[5];
  id v12[3];
  id location;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 570, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("overrideRenderingStyle > SBSystemApertureContainerRenderingStyleUnspecified"));

  }
  overrideRenderingStyleRequests = self->_overrideRenderingStyleRequests;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](overrideRenderingStyleRequests, "addObject:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0DB07E0]);
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__SBSystemApertureViewController_overrideContainerRenderingStyleAssertion___block_invoke;
  v11[3] = &unk_1E8EB0038;
  objc_copyWeak(v12, &location);
  v12[1] = (id)a3;
  v12[2] = (id)a2;
  v11[4] = self;
  objc_msgSend(v8, "addInvalidationBlock:", v11);
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 16);
  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
  return v8;
}

void __75__SBSystemApertureViewController_overrideContainerRenderingStyleAssertion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(WeakRetained[144], "countForObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("SBSystemApertureViewController.m"), 577, CFSTR("Trying to decrement nonexistant rendering request"));

  }
  v3 = WeakRetained[144];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", v4);

  objc_msgSend(WeakRetained, "_invalidatePreferencesForReason:", 16);
}

- (int64_t)cloningStyle
{
  return self->_cloningStyle;
}

- (id)systemApertureRepresentationSuppressionAssertionForCoversheetVisibility
{
  _SBSystemApertureRepresentationSuppressionAssertion *v3;
  _SBSystemApertureRepresentationSuppressionAssertion *v4;
  _QWORD v6[5];

  v3 = [_SBSystemApertureRepresentationSuppressionAssertion alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __105__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForCoversheetVisibility__block_invoke;
  v6[3] = &unk_1E8EB0060;
  v6[4] = self;
  v4 = -[_SBSystemApertureRepresentationSuppressionAssertion initWithCoverSheetVisible:liquidDetectionVisible:proximityReaderVisible:suppressForSystemChromeSuppression:invalidationBlock:](v3, "initWithCoverSheetVisible:liquidDetectionVisible:proximityReaderVisible:suppressForSystemChromeSuppression:invalidationBlock:", 1, 0, 0, 0, v6);
  -[NSMutableSet addObject:](self->_systemApertureSuppressionAssertions, "addObject:", v4);
  -[SBSystemApertureViewController _reevaluateElementSuppression](self, "_reevaluateElementSuppression");
  return v4;
}

uint64_t __105__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForCoversheetVisibility__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "removeObject:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_reevaluateElementSuppression");
}

- (id)systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility
{
  _SBSystemApertureRepresentationSuppressionAssertion *v3;
  _SBSystemApertureRepresentationSuppressionAssertion *v4;
  _QWORD v6[5];

  v3 = [_SBSystemApertureRepresentationSuppressionAssertion alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __110__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility__block_invoke;
  v6[3] = &unk_1E8EB0060;
  v6[4] = self;
  v4 = -[_SBSystemApertureRepresentationSuppressionAssertion initWithCoverSheetVisible:liquidDetectionVisible:proximityReaderVisible:suppressForSystemChromeSuppression:invalidationBlock:](v3, "initWithCoverSheetVisible:liquidDetectionVisible:proximityReaderVisible:suppressForSystemChromeSuppression:invalidationBlock:", 0, 1, 0, 0, v6);
  -[NSMutableSet addObject:](self->_systemApertureSuppressionAssertions, "addObject:", v4);
  -[SBSystemApertureViewController _reevaluateElementSuppression](self, "_reevaluateElementSuppression");
  return v4;
}

uint64_t __110__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForLiquidDetectionVisibility__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "removeObject:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_reevaluateElementSuppression");
}

- (id)systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility
{
  _SBSystemApertureRepresentationSuppressionAssertion *v3;
  _SBSystemApertureRepresentationSuppressionAssertion *v4;
  _QWORD v6[5];

  v3 = [_SBSystemApertureRepresentationSuppressionAssertion alloc];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __110__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility__block_invoke;
  v6[3] = &unk_1E8EB0060;
  v6[4] = self;
  v4 = -[_SBSystemApertureRepresentationSuppressionAssertion initWithCoverSheetVisible:liquidDetectionVisible:proximityReaderVisible:suppressForSystemChromeSuppression:invalidationBlock:](v3, "initWithCoverSheetVisible:liquidDetectionVisible:proximityReaderVisible:suppressForSystemChromeSuppression:invalidationBlock:", 0, 0, 1, 0, v6);
  -[NSMutableSet addObject:](self->_systemApertureSuppressionAssertions, "addObject:", v4);
  -[SBSystemApertureViewController _reevaluateElementSuppression](self, "_reevaluateElementSuppression");
  return v4;
}

uint64_t __110__SBSystemApertureViewController_systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "removeObject:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_reevaluateElementSuppression");
}

- (id)restrictSystemApertureToDefaultLayoutWithReason:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[SBSystemApertureViewController _primaryContainerView](self, "_primaryContainerView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "preferredLayoutModeAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "preferredLayoutMode") == 3 && objc_msgSend(v6, "layoutModeChangeReason") != 2)
      objc_msgSend(v6, "invalidateWithReason:", CFSTR("collapse to compact layout"));

  }
  v7 = objc_alloc_init(MEMORY[0x1E0DB07E0]);
  SBLogSystemApertureController();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Acquired empty restrict to default layout assertion: %{public}@", (uint8_t *)&v10, 0xCu);
  }

  objc_msgSend(v7, "addInvalidationBlock:", &__block_literal_global_178);
  return v7;
}

void __82__SBSystemApertureViewController_restrictSystemApertureToDefaultLayoutWithReason___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogSystemApertureController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Invalidated empty restrict to default layout assertion: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)restrictSystemApertureToInertWithReason:(id)a3
{
  return -[SBSystemApertureViewController _layoutAssertionWithMaximumPermittedLayoutMode:reason:creatingIfNecessary:](self, "_layoutAssertionWithMaximumPermittedLayoutMode:reason:creatingIfNecessary:", 0, a3, 1);
}

- (id)requireHeavyShadowAssertionForTransition
{
  id v3;
  _QWORD v5[5];
  id v6;
  id v7;
  id from;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0DB07E0]);
  objc_initWeak(&from, v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__SBSystemApertureViewController_requireHeavyShadowAssertionForTransition__block_invoke;
  v5[3] = &unk_1E8EB00C8;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  v5[4] = self;
  objc_msgSend(v3, "addInvalidationBlock:", v5);
  -[NSMutableSet addObject:](self->_transitionShadowAssertions, "addObject:", v3);
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 512);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

void __74__SBSystemApertureViewController_requireHeavyShadowAssertionForTransition__block_invoke(id *a1)
{
  void *v2;
  id v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v2 = (void *)WeakRetained[149];
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v2, "removeObject:", v3);

  objc_msgSend(a1[4], "_invalidatePreferencesForReason:", 512);
}

- (id)requireKeyLineAssertionForTransition
{
  id v3;
  _QWORD v5[5];
  id v6;
  id v7;
  id from;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc_init(MEMORY[0x1E0DB07E0]);
  objc_initWeak(&from, v3);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SBSystemApertureViewController_requireKeyLineAssertionForTransition__block_invoke;
  v5[3] = &unk_1E8EB00C8;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  v5[4] = self;
  objc_msgSend(v3, "addInvalidationBlock:", v5);
  -[NSMutableSet addObject:](self->_transitionKeyLineAssertions, "addObject:", v3);
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 512);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v3;
}

void __70__SBSystemApertureViewController_requireKeyLineAssertionForTransition__block_invoke(id *a1)
{
  void *v2;
  id v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v2 = (void *)WeakRetained[150];
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v2, "removeObject:", v3);

  objc_msgSend(a1[4], "_invalidatePreferencesForReason:", 512);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  NSMutableSet *v3;
  NSMutableSet *systemApertureSuppressionAssertions;
  SBSystemApertureSettings *v5;
  SBSystemApertureSettings *settings;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIView *v16;
  UIView *containerSubBackgroundParent;
  void *v18;
  void *v19;
  UIView *v20;
  UIView *containerBackgroundParent;
  void *v22;
  SBFTouchPassThroughView *v23;
  SBFTouchPassThroughView *containerParent;
  void *v25;
  SBSystemApertureGainMapBackedRendering *v26;
  SBSystemApertureGainMapBackedRendering *magiciansCurtainView;
  SBSystemApertureGainMapBackedRendering *v28;
  SBSystemApertureGainMapBackedRendering *highLevelMagiciansCurtainView;
  SBSystemApertureElementAuthority *v30;
  SBSystemApertureElementAuthority *elementAuthority;
  SAUISystemApertureManager *v32;
  SAUISystemApertureManager *systemApertureManager;
  void *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)SBSystemApertureViewController;
  -[SBSystemApertureViewController viewDidLoad](&v39, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
  systemApertureSuppressionAssertions = self->_systemApertureSuppressionAssertions;
  self->_systemApertureSuppressionAssertions = v3;

  +[SBSystemApertureDomain rootSettings](SBSystemApertureDomain, "rootSettings");
  v5 = (SBSystemApertureSettings *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  self->_settings = v5;

  -[PTSettings addKeyObserver:](self->_settings, "addKeyObserver:", self);
  -[SBSystemApertureViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v11, v13, v15);
  containerSubBackgroundParent = self->_containerSubBackgroundParent;
  self->_containerSubBackgroundParent = v16;

  -[UIView setUserInteractionEnabled:](self->_containerSubBackgroundParent, "setUserInteractionEnabled:", 0);
  -[UIView layer](self->_containerSubBackgroundParent, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDisableUpdateMask:", 32);

  -[SBSystemApertureViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addSubview:", self->_containerSubBackgroundParent);

  v20 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABB0]), "initWithFrame:", v9, v11, v13, v15);
  containerBackgroundParent = self->_containerBackgroundParent;
  self->_containerBackgroundParent = v20;

  -[UIView setUserInteractionEnabled:](self->_containerBackgroundParent, "setUserInteractionEnabled:", 0);
  -[SBSystemApertureViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", self->_containerBackgroundParent);

  v23 = (SBFTouchPassThroughView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9F28]), "initWithFrame:", v9, v11, v13, v15);
  containerParent = self->_containerParent;
  self->_containerParent = v23;

  -[SBSystemApertureViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addSubview:", self->_containerParent);

  SBCreateSystemApertureMagiciansView();
  v26 = (SBSystemApertureGainMapBackedRendering *)objc_claimAutoreleasedReturnValue();
  magiciansCurtainView = self->_magiciansCurtainView;
  self->_magiciansCurtainView = v26;

  SBCreateSystemApertureMagiciansView();
  v28 = (SBSystemApertureGainMapBackedRendering *)objc_claimAutoreleasedReturnValue();
  highLevelMagiciansCurtainView = self->_highLevelMagiciansCurtainView;
  self->_highLevelMagiciansCurtainView = v28;

  -[UIView addSubview:](self->_containerBackgroundParent, "addSubview:", self->_magiciansCurtainView);
  -[SBSystemApertureCurtainViewHoster setCurtainView:](self->_curtainViewHoster, "setCurtainView:", self->_highLevelMagiciansCurtainView);
  v30 = objc_alloc_init(SBSystemApertureElementAuthority);
  elementAuthority = self->_elementAuthority;
  self->_elementAuthority = v30;

  -[SBSystemApertureElementAuthority setElementAuthorityDelegate:](self->_elementAuthority, "setElementAuthorityDelegate:", self);
  v32 = (SAUISystemApertureManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0830]), "initWithElementAuthority:", self->_elementAuthority);
  systemApertureManager = self->_systemApertureManager;
  self->_systemApertureManager = v32;

  -[SAUISystemApertureManager setDelegate:](self->_systemApertureManager, "setDelegate:", self);
  -[SBSystemApertureViewController _configureVariableBlur](self, "_configureVariableBlur");
  -[SBSystemApertureViewController _configurePreferencesStackIfNecessary](self, "_configurePreferencesStackIfNecessary");
  -[SBSystemApertureViewController _configureGesturesIfNecessary](self, "_configureGesturesIfNecessary");
  objc_initWeak(&location, self);
  v40[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __45__SBSystemApertureViewController_viewDidLoad__block_invoke;
  v36[3] = &unk_1E8EB00F0;
  objc_copyWeak(&v37, &location);
  v35 = (id)-[SBSystemApertureViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v34, v36);

  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __45__SBSystemApertureViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  dispatch_time_t v13;
  void *v14;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_backlightLuminance");
    v10 = objc_msgSend(v6, "_backlightLuminance");

    if (v9 != v10)
    {
      objc_msgSend(v5, "traitCollection");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "_backlightLuminance");

      if (v12 == 1)
      {
        v13 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __45__SBSystemApertureViewController_viewDidLoad__block_invoke_2;
        block[3] = &unk_1E8E9DED8;
        block[4] = WeakRetained;
        dispatch_after(v13, MEMORY[0x1E0C80D38], block);
      }
      else
      {
        objc_msgSend(WeakRetained, "backlightSessionAggregator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "hostedScenesDidChange");

      }
    }
  }

}

void __45__SBSystemApertureViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "backlightSessionAggregator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hostedScenesDidChange");

}

- (void)viewIsAppearing:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBSystemApertureViewController;
  -[SBSystemApertureViewController viewIsAppearing:](&v15, sel_viewIsAppearing_, a3);
  -[SBSystemApertureViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UIView setFrame:](self->_containerSubBackgroundParent, "setFrame:", v6, v8, v10, v12);
  -[UIView setFrame:](self->_containerBackgroundParent, "setFrame:", v6, v8, v10, v12);
  -[SBFTouchPassThroughView setFrame:](self->_containerParent, "setFrame:", v6, v8, v10, v12);
  -[SBSystemApertureViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setNeedsLayout");

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__SBSystemApertureViewController_viewIsAppearing___block_invoke;
  v14[3] = &unk_1E8E9DED8;
  v14[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v14);
}

void __50__SBSystemApertureViewController_viewIsAppearing___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layoutIfNeeded");

}

- (void)setActiveWindowScene:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBFZStackParticipant *v11;
  SBFZStackParticipant *zStackParticipant;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "associatedWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemGestureManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFZStackParticipant invalidate](self->_zStackParticipant, "invalidate");
    objc_storeWeak((id *)&self->_activeWindowScene, obj);
    objc_msgSend(obj, "associatedWindowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "systemGestureManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSystemApertureViewController _moveSystemGestureRecognizerIfNecessary:withSystemGestureType:fromSystemGestureManager:toSystemGestureManager:](self, "_moveSystemGestureRecognizerIfNecessary:withSystemGestureType:fromSystemGestureManager:toSystemGestureManager:", self->_interactionLongPressGesture, 133, v6, v8);
    -[SBSystemApertureViewController _moveSystemGestureRecognizerIfNecessary:withSystemGestureType:fromSystemGestureManager:toSystemGestureManager:](self, "_moveSystemGestureRecognizerIfNecessary:withSystemGestureType:fromSystemGestureManager:toSystemGestureManager:", self->_resizePanGesture, 132, v6, v8);
    objc_msgSend(obj, "associatedWindowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "zStackResolver");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "acquireParticipantWithIdentifier:delegate:", 27, self);
    v11 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
    zStackParticipant = self->_zStackParticipant;
    self->_zStackParticipant = v11;

    -[SBSystemApertureViewController zStackParticipantDidChange:](self, "zStackParticipantDidChange:", self->_zStackParticipant);
    -[SAUISystemApertureManager invalidatePromotedElements](self->_systemApertureManager, "invalidatePromotedElements");
    -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 0x8000);

  }
}

- (void)_moveSystemGestureRecognizerIfNecessary:(id)a3 withSystemGestureType:(unint64_t)a4 fromSystemGestureManager:(id)a5 toSystemGestureManager:(id)a6
{
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v9 = a5;
  v10 = a6;
  if (objc_msgSend(v9, "isSystemGestureRecognizer:", v11))
  {
    objc_msgSend(v9, "removeGestureRecognizer:", v11);
    objc_msgSend(v10, "addGestureRecognizer:withType:", v11, a4);
  }

}

- (void)_addRunLoopObserverIfNecessary
{
  const __CFAllocator *v3;
  __CFRunLoop *Current;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_beforeCARunLoopObserver)
  {
    objc_initWeak(&location, self);
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__SBSystemApertureViewController__addRunLoopObserverIfNecessary__block_invoke;
    v5[3] = &unk_1E8EB0118;
    objc_copyWeak(&v6, &location);
    self->_beforeCARunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 1u, 1999000, v5);
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddObserver(Current, self->_beforeCARunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_configurePreferencesStackIfNecessary
{
  SBSARootPreferencesProvider *v3;
  SBSARootPreferencesProvider *rootPreferencesProvider;

  if (!self->_rootPreferencesProvider)
  {
    v3 = objc_alloc_init(SBSARootPreferencesProvider);
    rootPreferencesProvider = self->_rootPreferencesProvider;
    self->_rootPreferencesProvider = v3;

    -[SBSystemApertureViewController _addRunLoopObserverIfNecessary](self, "_addRunLoopObserverIfNecessary");
    -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 2);
  }
}

- (void)_addPendingTransitionResult:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  NSMutableArray *pendingTransitionResults;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self;
    objc_sync_enter(v5);
    pendingTransitionResults = v5->_pendingTransitionResults;
    if (!pendingTransitionResults)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = v5->_pendingTransitionResults;
      v5->_pendingTransitionResults = v7;

      pendingTransitionResults = v5->_pendingTransitionResults;
    }
    -[NSMutableArray addObject:](pendingTransitionResults, "addObject:", v9);
    objc_sync_exit(v5);

    v4 = v9;
  }

}

- (void)_addTimerIfNecessaryForDescription:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  NSMutableDictionary *timerIdentifiersToDescriptionRecords;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  _SBSATimerAndDescriptionRecord *v11;
  NSMutableDictionary *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id location;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  timerIdentifiersToDescriptionRecords = v5->_timerIdentifiersToDescriptionRecords;
  objc_msgSend(v4, "timerDescriptionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](timerIdentifiersToDescriptionRecords, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_initWeak(&location, v5);
    if (!v5->_timerIdentifiersToDescriptionRecords)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v10 = v5->_timerIdentifiersToDescriptionRecords;
      v5->_timerIdentifiersToDescriptionRecords = v9;

    }
    v11 = -[_SBSATimerAndDescriptionRecord initWithTimerDescription:]([_SBSATimerAndDescriptionRecord alloc], "initWithTimerDescription:", v4);
    v12 = v5->_timerIdentifiersToDescriptionRecords;
    objc_msgSend(v4, "timerDescriptionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, v13);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__SBSystemApertureViewController__addTimerIfNecessaryForDescription___block_invoke;
    v14[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v15, &location);
    -[_SBSATimerAndDescriptionRecord schedule:](v11, "schedule:", v14);
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  objc_sync_exit(v5);

}

void __69__SBSystemApertureViewController__addTimerIfNecessaryForDescription___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidatePreferencesForReason:", 32);
    WeakRetained = v2;
  }

}

- (void)_pushPendingInteractionResultForElementIdentity:(id)a3 interactionSource:(unint64_t)a4 viewInteractionResult:(int64_t)a5
{
  SBSystemApertureViewController *v8;
  NSMutableArray *pendingInteractionResults;
  uint64_t v10;
  NSMutableArray *v11;
  SBSAElementViewInteractionResult *v12;
  id v13;

  v13 = a3;
  v8 = self;
  objc_sync_enter(v8);
  pendingInteractionResults = v8->_pendingInteractionResults;
  if (!pendingInteractionResults)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v8->_pendingInteractionResults;
    v8->_pendingInteractionResults = (NSMutableArray *)v10;

    pendingInteractionResults = v8->_pendingInteractionResults;
  }
  v12 = -[SBSAElementViewInteractionResult initWithIdentity:interactionSource:viewInteractionResult:]([SBSAElementViewInteractionResult alloc], "initWithIdentity:interactionSource:viewInteractionResult:", v13, a4, a5);
  -[NSMutableArray addObject:](pendingInteractionResults, "addObject:", v12);

  objc_sync_exit(v8);
}

- (id)_floatAnimatablePropertyForTransitionIdentifier:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[NSMutableDictionary objectForKey:](v5->_transitionIdentifiersToFloatAnimatableProperties, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_invalidateAndRemoveFloatAnimatableProperty:(id)a3 forTransitionIdentifier:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  void *v8;
  SBSystemApertureViewController *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = (uint64_t)a3;
  v7 = (unint64_t)a4;
  if (!(v6 | v7))
  {
    v8 = 0;
    v6 = 0;
    goto LABEL_10;
  }
  v8 = (void *)v7;
  if (v6
    || (-[SBSystemApertureViewController _floatAnimatablePropertyForTransitionIdentifier:](self, "_floatAnimatablePropertyForTransitionIdentifier:", v7), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    if ((objc_msgSend((id)v6, "isInvalidated") & 1) == 0)
      objc_msgSend((id)v6, "invalidate");
    v9 = self;
    objc_sync_enter(v9);
    if (!v8)
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      -[NSMutableDictionary allKeys](v9->_transitionIdentifiersToFloatAnimatableProperties, "allKeys", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (!v11)
      {

        v8 = 0;
        goto LABEL_8;
      }
      v8 = 0;
      v12 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](v9->_transitionIdentifiersToFloatAnimatableProperties, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15 == (void *)v6)
          {
            v16 = v14;

            v8 = v16;
          }

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);

      if (!v8)
        goto LABEL_8;
    }
    -[NSMutableDictionary removeObjectForKey:](v9->_transitionIdentifiersToFloatAnimatableProperties, "removeObjectForKey:", v8);
LABEL_8:
    objc_sync_exit(v9);

  }
LABEL_10:

}

- (void)_animatedTransitionDidReachMilestone:(double)a3 description:(id)a4 propertyIdentity:(id)a5 finished:(BOOL)a6 retargeted:(BOOL)a7
{
  id v13;
  SBSystemApertureViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  SEL v25;
  double v26;
  BOOL v27;
  BOOL v28;

  v21 = a4;
  v13 = a5;
  v14 = self;
  objc_sync_enter(v14);
  objc_msgSend(v21, "animatedTransitionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 != 1.79769313e308)
  {
    -[NSMutableDictionary objectForKey:](v14->_transitionIdentifiersToFloatAnimatableProperties, "objectForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v14, CFSTR("SBSystemApertureViewController.m"), 935, CFSTR("Unknown transition: %@"), v21);

    }
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __120__SBSystemApertureViewController__animatedTransitionDidReachMilestone_description_propertyIdentity_finished_retargeted___block_invoke;
  v22[3] = &unk_1E8EB0140;
  v25 = a2;
  v22[4] = v14;
  v18 = v15;
  v23 = v18;
  v19 = v13;
  v24 = v19;
  v26 = a3;
  v27 = a6;
  v28 = a7;
  +[SBSAAnimatedTransitionResultDescription instanceWithBlock:](SBSAAnimatedTransitionResultDescription, "instanceWithBlock:", v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _addPendingTransitionResult:](v14, "_addPendingTransitionResult:", v20);

  -[SBSystemApertureViewController _invalidatePreferencesForReason:](v14, "_invalidatePreferencesForReason:", 64);
  objc_sync_exit(v14);

}

void __120__SBSystemApertureViewController__animatedTransitionDidReachMilestone_description_propertyIdentity_finished_retargeted___block_invoke(uint64_t a1, void *a2)
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
    v8 = *(_QWORD *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAAnimatedTransitionResultDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSystemApertureViewController.m"), 937, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setAnimatedTransitionIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setAssociatedInterfaceElementPropertyIdentity:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v6, "setTargetedMilestone:", *(double *)(a1 + 64));
  objc_msgSend(v6, "setTransitionEndTargeted:", *(double *)(a1 + 64) == 1.79769313e308);
  objc_msgSend(v6, "setFinished:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v6, "setRetargeted:", *(unsigned __int8 *)(a1 + 73));

}

- (void)_addFloatAnimatablePropertyForTransitionDescriptionIfNecessary:(id)a3 propertyIdentity:(id)a4 milestones:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  SBSystemApertureViewController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *transitionIdentifiersToFloatAnimatableProperties;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, double);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v8 && v9 && objc_msgSend(v10, "count"))
  {
    v12 = self;
    objc_sync_enter(v12);
    objc_msgSend(v8, "animatedTransitionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v12->_transitionIdentifiersToFloatAnimatableProperties, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_initWeak(&location, v12);
      v15 = (void *)MEMORY[0x1E0CEABC0];
      v20 = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __125__SBSystemApertureViewController__addFloatAnimatablePropertyForTransitionDescriptionIfNecessary_propertyIdentity_milestones___block_invoke;
      v23 = &unk_1E8EB0168;
      objc_copyWeak(&v26, &location);
      v24 = v8;
      v25 = v9;
      objc_msgSend(v15, "sbf_animatablePropertyWithProgressMilestones:block:", v11, &v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      transitionIdentifiersToFloatAnimatableProperties = v12->_transitionIdentifiersToFloatAnimatableProperties;
      if (!transitionIdentifiersToFloatAnimatableProperties)
      {
        v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v19 = v12->_transitionIdentifiersToFloatAnimatableProperties;
        v12->_transitionIdentifiersToFloatAnimatableProperties = v18;

        transitionIdentifiersToFloatAnimatableProperties = v12->_transitionIdentifiersToFloatAnimatableProperties;
      }
      -[NSMutableDictionary setObject:forKey:](transitionIdentifiersToFloatAnimatableProperties, "setObject:forKey:", v16, v13, v20, v21, v22, v23);

      objc_destroyWeak(&v26);
      objc_destroyWeak(&location);
    }

    objc_sync_exit(v12);
  }

}

void __125__SBSystemApertureViewController__addFloatAnimatablePropertyForTransitionDescriptionIfNecessary_propertyIdentity_milestones___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_animatedTransitionDidReachMilestone:description:propertyIdentity:finished:retargeted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 0, a2);

}

- (id)_elementViewControllerForSizeTransitionWithDescription:(id)a3 fromPreferences:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isCollisionImminent"))
  {
    objc_msgSend(v7, "elementLayoutTransition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "initialElementContexts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 > 1)
      goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_5:
    v13 = 0;
  }
  else
  {
    objc_msgSend(v6, "interfaceElementIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureViewController _containerViewWithInterfaceElementIdentifier:creatingIfNecessary:](self, "_containerViewWithInterfaceElementIdentifier:creatingIfNecessary:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "elementViewController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

void __118__SBSystemApertureViewController__shouldPerformTransitionOfProperty_ofObject_withDescription_fromPreferences_context___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "sbsa_presentationModifierValueForKeyPath:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogSystemAperturePreferencesStack();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "queryIteration");
    v6 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = 134349826;
    v8 = v4;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    v13 = 2112;
    v14 = v2;
    _os_log_debug_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEBUG, "[%{public}lu] Updating '%@' keypath of view '%@' to presentation value '%@' in order to retarget animation parameters of in-progress animation", (uint8_t *)&v7, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "setValue:forKeyPath:", v2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");

}

uint64_t __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

uint64_t __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_valueForProperty:ofDescription:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_setValue:byUpdatingMemberKeypaths:forKeyPath:");
  v2 = *(void **)(a1 + 56);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
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

  objc_msgSend(v6, "layoutIfNeeded");
}

uint64_t __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

void __188__SBSystemApertureViewController__propertyUpdateBlockArrayForPropertyIdentity_ofObject_withDescription_withTransitionDescription_forceSingle_behaviorSettingsArray_updateDescriptionsArray___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_valueForProperty:ofDescription:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_setValue:byUpdatingMemberKeypaths:forKeyPath:");
  v2 = *(void **)(a1 + 56);
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v2;
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

  objc_msgSend(v6, "layoutIfNeeded");
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_animatedTransitionDidReachMilestone:description:propertyIdentity:finished:retargeted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, a3, 1.79769313e308);

}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v3 = *(unsigned __int8 *)(a1 + 64);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_3;
  v7[3] = &unk_1E8EB01B8;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v8 = v4;
  v10 = v5;
  v11 = v6;
  v9 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_modifyAnimationsByDecomposingGeometricTypes:animations:", v3, v7);

}

uint64_t __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setValue:", 1.0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_4(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_5;
  v2[3] = &unk_1E8E9E8D0;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "_modifyAnimationsByDecomposingGeometricTypes:animations:", 1, v2);
}

uint64_t __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_invalidateAndRemoveFloatAnimatableProperty:forTransitionIdentifier:", *(_QWORD *)(a1 + 32), 0);

}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_7(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained[165], "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "animatedTransitionIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "animatedTransitionIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = BSEqualObjects();

    WeakRetained = v7;
    if (v6)
    {
      objc_msgSend(v7[165], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
      WeakRetained = v7;
    }
  }

}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  v6 = *(_QWORD *)(a1 + 64);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, a3);
  v7 = *(_QWORD *)(a1 + 72);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 16))(v7, *(_QWORD *)(a1 + 32), a2, a3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  objc_msgSend(WeakRetained, "_endRequiringBacklightAssertionForReason:", *(_QWORD *)(a1 + 40));

}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_9(uint64_t a1)
{
  void (**v1)(void);

  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();

}

uint64_t __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_10(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "isCancelled") ^ 1, 0);
}

void __143__SBSystemApertureViewController__updateProperty_ofObject_withDescription_fromPreferences_conditionalAnimations_conditionalCompletion_context___block_invoke_11(id *a1, void *a2)
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = a2;
  if (objc_msgSend(a1[4], "count"))
  {
    v3 = 0;
    do
    {
      v4 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(a1[5], "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "objectAtIndexedSubscript:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "objectAtIndexedSubscript:", v3);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sb_animateWithSettings:mode:animations:completion:", v5, 3, v6, v8);

      ++v3;
    }
    while (v3 < objc_msgSend(a1[4], "count"));
  }

}

- (id)_childElementViewControllerWithIdentity:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SBSystemApertureViewController childViewControllers](self, "childViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v11, "elementViewProvider");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "element");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = SAElementIdentityEqualToIdentity();

          if ((v14 & 1) != 0)
            goto LABEL_12;

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  v11 = 0;
LABEL_12:

  return v11;
}

uint64_t __94__SBSystemApertureViewController__removeElementViewControllersExceptingThoseWithDescriptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "associatedSystemApertureElementIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

uint64_t __75__SBSystemApertureViewController__removeIndicatorViewControllerIfNecessary__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_isIndicatorElementViewController:", a2);
}

- (void)_addActiveSnapshotAssertion:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  NSHashTable *snapshotAssertions;
  uint64_t v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self;
    objc_sync_enter(v5);
    snapshotAssertions = v5->_snapshotAssertions;
    if (!snapshotAssertions)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v5->_snapshotAssertions;
      v5->_snapshotAssertions = (NSHashTable *)v7;

      snapshotAssertions = v5->_snapshotAssertions;
    }
    -[NSHashTable addObject:](snapshotAssertions, "addObject:", v9);
    objc_sync_exit(v5);

    v4 = v9;
  }

}

- (void)_removeActiveSnapshotAssertion:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSHashTable removeObject:](v5->_snapshotAssertions, "removeObject:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (id)_activeSnapshotAssertionForElementIdentity:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  NSHashTable *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v5->_snapshotAssertions;
    v7 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (SAElementIdentityEqualToIdentity())
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)-[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __83__SBSystemApertureViewController__elementContextsForOrderedElementViewControllers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v3 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __83__SBSystemApertureViewController__elementContextsForOrderedElementViewControllers___block_invoke_2;
  v9[3] = &unk_1E8EB0310;
  v4 = *(_QWORD *)(a1 + 48);
  v10 = v3;
  v11 = v4;
  v5 = *(void **)(a1 + 32);
  v9[4] = *(_QWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 72);
  v12 = *(_OWORD *)(a1 + 56);
  v13 = v6;
  v8 = v3;
  +[SBSAElementContext instanceWithBlock:](SBSAElementContext, "instanceWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

}

void __83__SBSystemApertureViewController__elementContextsForOrderedElementViewControllers___block_invoke_2(uint64_t a1, void *a2)
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
  SBSAElementIdentification *v16;
  void *v17;
  void *v18;
  SBSAElementIdentification *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
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
    v11 = NSClassFromString(CFSTR("SBSAElementContextMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSystemApertureViewController.m"), 1399, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }
  v43 = v3;

  objc_msgSend(*(id *)(a1 + 40), "elementViewProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "element");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [SBSAElementIdentification alloc];
  objc_msgSend(v15, "clientIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "elementIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v16, "initWithClientIdentifier:elementIdentifier:", v17, v18);

  objc_msgSend(v15, "clientIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setClientIdentifier:", v20);

  objc_msgSend(v15, "elementIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setElementIdentifier:", v21);

  SAUILayoutSpecifyingOverriderForElement();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend((id)v22, "layoutMode");
  objc_msgSend(v7, "setLayoutMode:", v23);
  objc_msgSend(*(id *)(a1 + 32), "_maximumContainerViewOutsetsInBounds:inLayoutMode:", v23, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "_hostSuggestedOutsetsForElement:", v15);
  v41 = (void *)v22;
  objc_msgSend((id)v22, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:", v23);
  objc_msgSend(v7, "setPreferredEdgeOutsets:");
  v24 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
  objc_msgSend(*(id *)(a1 + 40), "elementViewProvider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "element");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "elementViewControllerForElement:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = SBSAIsElementViewControllerFixedInOrientation(v27);

  if ((v22 & 1) != 0)
    v28 = 1;
  else
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1168);
  objc_msgSend(v7, "setInterfaceOrientation:", v28);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v29 = objc_msgSend(v14, "systemApertureCustomLayout");
  else
    v29 = 0;
  objc_msgSend(v7, "setSystemApertureCustomLayout:", v29);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v30 = objc_msgSend(v14, "customLayoutRequestingSpecialFlowerBoundsResizingAnimation");
  else
    v30 = 0;
  objc_msgSend(v7, "setSystemApertureCustomLayoutCustomAnimationStyle:", v30);
  v42 = v14;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v31 = objc_msgSend(v14, "systemApertureLayoutCustomizingOptions");
  else
    v31 = 0;
  objc_msgSend(v7, "setSystemApertureLayoutCustomizingOptions:", v31);
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v32 = *(id *)(*(_QWORD *)(a1 + 32) + 1208);
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v45 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        objc_msgSend(v37, "elementIdentity");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = SAElementIdentityEqualToIdentity();

        if (v39)
          objc_msgSend(v7, "setActiveDynamicAnimation:", objc_msgSend(v37, "animationType"));
      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
    }
    while (v34);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "keyColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeyColor:", v40);

  }
}

- (BOOL)_handlePreferencesDidChangeAction:(id)a3
{
  if (a3)
    -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 1);
  return a3 != 0;
}

- (BOOL)_handleContainerTapAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (a3)
  {
    objc_msgSend(a3, "associatedInterfaceElementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureViewController _containerViewWithInterfaceElementIdentifier:creatingIfNecessary:](self, "_containerViewWithInterfaceElementIdentifier:creatingIfNecessary:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elementViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "elementViewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "element");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v7, "handleElementTap:", self->_interactionLongPressGesture);
    -[SBSystemApertureViewController _pushPendingInteractionResultForElementIdentity:interactionSource:viewInteractionResult:](self, "_pushPendingInteractionResultForElementIdentity:interactionSource:viewInteractionResult:", v9, 1, v10);
    objc_msgSend(v9, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "elementIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSystemApertureTelemetryEmitter logTelemetryForInteractionTap:clientIdentifier:elementIdentifier:](SBSystemApertureTelemetryEmitter, "logTelemetryForInteractionTap:clientIdentifier:elementIdentifier:", v10 != 0, v11, v12);

  }
  return a3 != 0;
}

- (BOOL)_handleContainerPressAction:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (a3)
  {
    objc_msgSend(a3, "associatedInterfaceElementIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureViewController _containerViewWithInterfaceElementIdentifier:creatingIfNecessary:](self, "_containerViewWithInterfaceElementIdentifier:creatingIfNecessary:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elementViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "elementViewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "element");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v7, "handleElementLongPress:", self->_interactionLongPressGesture);
    -[SBSystemApertureViewController _pushPendingInteractionResultForElementIdentity:interactionSource:viewInteractionResult:](self, "_pushPendingInteractionResultForElementIdentity:interactionSource:viewInteractionResult:", v9, 2, v10);
    objc_msgSend(v9, "clientIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "elementIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSystemApertureTelemetryEmitter logTelemetryForInteractionLongPress:clientIdentifier:elementIdentifier:](SBSystemApertureTelemetryEmitter, "logTelemetryForInteractionLongPress:clientIdentifier:elementIdentifier:", v10 != 0, v11, v12);

  }
  return a3 != 0;
}

- (id)_feedbackGeneratorForStyle:(int64_t)a3
{
  NSMutableDictionary *impactFeedbackStylesToGenerators;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;

  impactFeedbackStylesToGenerators = self->_impactFeedbackStylesToGenerators;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](impactFeedbackStylesToGenerators, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (a3 == 2)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithStyle:", 2);
      v8 = self->_impactFeedbackStylesToGenerators;
      if (!v8)
      {
        v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v10 = self->_impactFeedbackStylesToGenerators;
        self->_impactFeedbackStylesToGenerators = v9;

        v8 = self->_impactFeedbackStylesToGenerators;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v7, v11);

    }
    else
    {
      v7 = 0;
    }
  }
  return v7;
}

- (BOOL)_handleImpactFeedbackAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    -[SBSystemApertureViewController _feedbackGeneratorForStyle:](self, "_feedbackGeneratorForStyle:", objc_msgSend(v4, "impactFeedbackStyle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if (objc_msgSend(v5, "prepareOnly"))
        objc_msgSend(v6, "prepare");
      else
        objc_msgSend(v6, "impactOccurred");
    }

  }
  return v5 != 0;
}

- (BOOL)_handleContainerResizeAction:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v5 = a3;
    v6 = objc_msgSend(v5, "resizeActionResult");
    objc_msgSend(v5, "associatedInterfaceElementIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBSystemApertureViewController _containerViewWithInterfaceElementIdentifier:creatingIfNecessary:](self, "_containerViewWithInterfaceElementIdentifier:creatingIfNecessary:", v7, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureViewController _handleResizeResult:withContainerView:](self, "_handleResizeResult:withContainerView:", v6, v8);

  }
  return a3 != 0;
}

- (BOOL)_handleCalloutBlockAction:(id)a3
{
  uint64_t v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "calloutBlock");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      (*(void (**)(uint64_t))(v4 + 16))(v4);

  }
  return a3 != 0;
}

- (void)_handleContainerDefaultPressGesture:(id)a3
{
  id v5;
  SBSAContainerLongPressGestureDescription *activeContainerDefaultPressGestureDescription;
  SBSAContainerLongPressGestureDescription *v7;
  SBSAContainerLongPressGestureDescription *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v5 = a3;
  activeContainerDefaultPressGestureDescription = self->_activeContainerDefaultPressGestureDescription;
  if (activeContainerDefaultPressGestureDescription)
  {
    v10[1] = 3221225472;
    v10[2] = __70__SBSystemApertureViewController__handleContainerDefaultPressGesture___block_invoke;
    v10[3] = &unk_1E8EA4230;
    v12 = a2;
    v10[4] = self;
    v9 = v5;
    v10[0] = MEMORY[0x1E0C809B0];
    v11 = v5;
    v7 = -[SBSAGestureDescription copyWithBlock:](activeContainerDefaultPressGestureDescription, "copyWithBlock:", v10);
    v8 = self->_activeContainerDefaultPressGestureDescription;
    self->_activeContainerDefaultPressGestureDescription = v7;

    -[SBSystemApertureViewController _pushGestureDescription:](self, "_pushGestureDescription:", self->_activeContainerDefaultPressGestureDescription);
    -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 1024);

    v5 = v9;
  }

}

void __70__SBSystemApertureViewController__handleContainerDefaultPressGesture___block_invoke(uint64_t a1, void *a2)
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
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAContainerLongPressGestureDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSystemApertureViewController.m"), 1553, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setGestureRecognizerState:", objc_msgSend(*(id *)(a1 + 40), "state"));
}

- (void)_handleContainerResizeGesture:(id)a3
{
  id v5;
  SBSAContainerPanGestureDescription *activeContainerResizeGestureDescription;
  SBSAContainerPanGestureDescription *v7;
  SBSAContainerPanGestureDescription *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;

  v5 = a3;
  activeContainerResizeGestureDescription = self->_activeContainerResizeGestureDescription;
  if (activeContainerResizeGestureDescription)
  {
    v10[1] = 3221225472;
    v10[2] = __64__SBSystemApertureViewController__handleContainerResizeGesture___block_invoke;
    v10[3] = &unk_1E8EA4230;
    v12 = a2;
    v10[4] = self;
    v9 = v5;
    v10[0] = MEMORY[0x1E0C809B0];
    v11 = v5;
    v7 = -[SBSAGestureDescription copyWithBlock:](activeContainerResizeGestureDescription, "copyWithBlock:", v10);
    v8 = self->_activeContainerResizeGestureDescription;
    self->_activeContainerResizeGestureDescription = v7;

    -[SBSystemApertureViewController _pushGestureDescription:](self, "_pushGestureDescription:", self->_activeContainerResizeGestureDescription);
    -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 1024);

    v5 = v9;
  }

}

void __64__SBSystemApertureViewController__handleContainerResizeGesture___block_invoke(uint64_t a1, void *a2)
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
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAContainerPanGestureDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSystemApertureViewController.m"), 1564, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(v6, "setGestureRecognizerState:", objc_msgSend(*(id *)(a1 + 40), "state"));
  objc_msgSend(*(id *)(a1 + 32), "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _UISystemGestureTranslationInView();
  objc_msgSend(v6, "setTranslation:");

}

- (void)_pushGestureDescription:(id)a3
{
  id v4;
  NSObject *v5;
  int *v6;
  id v7;
  void *v8;
  char v9;

  v4 = a3;
  SBLogSystemAperturePreferencesStackGestures();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SBSystemApertureViewController _pushGestureDescription:].cold.1();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = &OBJC_IVAR___SBSystemApertureViewController__longPressGestureUpdateQueue;
LABEL_7:
    v7 = *(id *)((char *)&self->super.super.super.super.isa + *v6);
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = &OBJC_IVAR___SBSystemApertureViewController__resizeGestureUpdateQueue;
    goto LABEL_7;
  }
  v7 = 0;
LABEL_9:
  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BSEqualObjects();

  if ((v9 & 1) == 0)
    objc_msgSend(v7, "addObject:", v4);

}

- (void)_configureLongPressGestureIfNecessary
{
  SBSAContainerLongPressGestureDescription *v4;
  SBSAContainerLongPressGestureDescription *activeContainerDefaultPressGestureDescription;
  _QWORD v6[6];

  if (!self->_activeContainerDefaultPressGestureDescription)
  {
    -[SBSystemApertureViewController _configureInteractionLongPressIfNecessary](self, "_configureInteractionLongPressIfNecessary");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__SBSystemApertureViewController__configureLongPressGestureIfNecessary__block_invoke;
    v6[3] = &unk_1E8E9E9D0;
    v6[4] = self;
    v6[5] = a2;
    +[SBSAGestureDescription instanceWithBlock:](SBSAContainerLongPressGestureDescription, "instanceWithBlock:", v6);
    v4 = (SBSAContainerLongPressGestureDescription *)objc_claimAutoreleasedReturnValue();
    activeContainerDefaultPressGestureDescription = self->_activeContainerDefaultPressGestureDescription;
    self->_activeContainerDefaultPressGestureDescription = v4;

  }
}

void __71__SBSystemApertureViewController__configureLongPressGestureIfNecessary__block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  id v15;

  v15 = a2;
  if (!v15)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
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
    v11 = NSClassFromString(CFSTR("SBSAContainerLongPressGestureDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v9, v8, CFSTR("SBSystemApertureViewController.m"), 1614, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGestureIdentifier:", v14);

}

- (void)_configureResizeGestureIfNecessary
{
  SBSAContainerPanGestureDescription *v3;
  SBSAContainerPanGestureDescription *activeContainerResizeGestureDescription;
  _QWORD v5[6];

  if (!self->_activeContainerResizeGestureDescription)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __68__SBSystemApertureViewController__configureResizeGestureIfNecessary__block_invoke;
    v5[3] = &unk_1E8E9E9D0;
    v5[4] = self;
    v5[5] = a2;
    +[SBSAGestureDescription instanceWithBlock:](SBSAContainerPanGestureDescription, "instanceWithBlock:", v5);
    v3 = (SBSAContainerPanGestureDescription *)objc_claimAutoreleasedReturnValue();
    activeContainerResizeGestureDescription = self->_activeContainerResizeGestureDescription;
    self->_activeContainerResizeGestureDescription = v3;

  }
}

void __68__SBSystemApertureViewController__configureResizeGestureIfNecessary__block_invoke(uint64_t a1, void *a2)
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
  void *v14;
  id v15;

  v15 = a2;
  if (!v15)
    goto LABEL_9;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
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
    v11 = NSClassFromString(CFSTR("SBSAContainerPanGestureDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v9, v8, CFSTR("SBSystemApertureViewController.m"), 1623, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setGestureIdentifier:", v14);

}

- (void)_configureGesturesIfNecessary
{
  -[SBSystemApertureViewController _configureLongPressGestureIfNecessary](self, "_configureLongPressGestureIfNecessary");
  -[SBSystemApertureViewController _configureResizeGestureIfNecessary](self, "_configureResizeGestureIfNecessary");
}

SBSAElementSnapshotContext *__76__SBSystemApertureViewController__contextWithOrderedElementViewControllers___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SBSAElementSnapshotContext *v3;

  v2 = a2;
  v3 = -[SBSAElementSnapshotContext initWithSnapshotIdentity:]([SBSAElementSnapshotContext alloc], "initWithSnapshotIdentity:", v2);

  return v3;
}

- (void)_addActiveRequest:(id)a3
{
  id v4;
  SBSystemApertureViewController *v5;
  NSMutableArray *activeRequests;
  NSMutableArray *v7;
  NSMutableArray *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = self;
    objc_sync_enter(v5);
    activeRequests = v5->_activeRequests;
    if (!activeRequests)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = v5->_activeRequests;
      v5->_activeRequests = v7;

      activeRequests = v5->_activeRequests;
    }
    -[NSMutableArray addObject:](activeRequests, "addObject:", v9);
    objc_sync_exit(v5);

    v4 = v9;
  }

}

- (void)setContainerParentCenter:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  -[UIView setCenter:](self->_containerSubBackgroundParent, "setCenter:");
  -[UIView setCenter:](self->_containerBackgroundParent, "setCenter:", x, y);
  -[SBFTouchPassThroughView setCenter:](self->_containerParent, "setCenter:", x, y);
}

uint64_t __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "elementViewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SAElementIdentityEqualToIdentity();

  return v4;
}

uint64_t __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "associatedSystemApertureElementIdentity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SAElementIdentityEqualToIdentity();

  return v3;
}

void __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "interfaceElementProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = BSEqualStrings();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "behaviorSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_updateStatusBarAvoidanceFrameWithAnimationSettings:", v7);

  }
}

uint64_t __121__SBSystemApertureViewController__handleContainerAndElementUpdatesFromPreferences_orderedElementViewControllers_context___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "elementViewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SAElementIdentityEqualToIdentity();

  return v4;
}

- (id)_gestureRecognizerForDescription:(id)a3
{
  id v4;
  int *v5;
  id v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = &OBJC_IVAR___SBSystemApertureViewController__interactionLongPressGesture;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = &OBJC_IVAR___SBSystemApertureViewController__resizePanGesture;
  }
  v6 = *(id *)((char *)&self->super.super.super.super.isa + *v5);
LABEL_7:

  return v6;
}

- (void)_handleDebuggingUtilityWithPreferences:(id)a3 context:(id)a4 withStackDepiction:(id)a5 andQueryIteration:(unint64_t)a6
{
  void *v8;
  uint64_t v9;
  UILabel *queryIterationLabel;
  id v11;

  -[SBSystemApertureDebuggingUtility updatedPreferences:context:withStackDepiction:andQueryIteration:](self->_debuggingUtility, "updatedPreferences:context:withStackDepiction:andQueryIteration:", a3, a4, a5, self->_queryIteration);
  -[SAUISystemApertureManager registeredElements](self->_systemApertureManager, "registeredElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    -[SBSystemApertureDebuggingUtility clearBufferEntries](self->_debuggingUtility, "clearBufferEntries");
  queryIterationLabel = self->_queryIterationLabel;
  if (queryIterationLabel)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("System Aperture Query Iteration: %li"), a6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](queryIterationLabel, "setText:", v11);

  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 2, a4);
}

- (void)handleReachabilityModeActivated
{
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 0x10000);
}

- (void)handleReachabilityModeDeactivated
{
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 0x10000);
}

- (void)_invertColorsChanged:(id)a3
{
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 128);
}

- (void)_reduceTransparencyDidChange:(id)a3
{
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 128);
}

- (void)_elementKeyColorWasInvalidated:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBSystemApertureNotificationUserInfoElementKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_orderedContainerViews;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[SBSystemApertureViewController _elementForContainerView:](self, "_elementForContainerView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v5, "isEqual:", v11);

          if ((v12 & 1) != 0)
          {

            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

  }
  else
  {
LABEL_12:
    -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 0x2000);
  }

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIView *containerBackgroundParent;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  SBSystemApertureGainMapBackedRendering *magiciansCurtainView;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _QWORD v45[3];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)SBSystemApertureViewController;
  -[SBSystemApertureViewController viewWillLayoutSubviews](&v44, sel_viewWillLayoutSubviews);
  -[SBSystemApertureViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  containerBackgroundParent = self->_containerBackgroundParent;
  v45[0] = self->_containerSubBackgroundParent;
  v45[1] = containerBackgroundParent;
  v45[2] = self->_containerParent;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v41 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "setBounds:", v5, v7, v9, v11);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v15);
  }

  -[SBSystemApertureViewController traitCollection](self, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayScale");
  v20 = v19;

  -[SAUISystemApertureManager hostWillPerformLayout](self->_systemApertureManager, "hostWillPerformLayout");
  -[SBSystemApertureViewController minimumSensorRegionFrame](self, "minimumSensorRegionFrame");
  v39 = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  magiciansCurtainView = self->_magiciansCurtainView;
  -[SBSystemApertureGainMapBackedRendering sizeThatFits:](magiciansCurtainView, "sizeThatFits:", v24, v26);
  BSRectWithSize();
  -[SBSystemApertureViewController minimumSensorRegionFrame](self, "minimumSensorRegionFrame");
  UIRectCenteredIntegralRectScale();
  -[SBSystemApertureGainMapBackedRendering setFrame:](magiciansCurtainView, "setFrame:", v20);
  -[SBSystemApertureGainMapBackedRendering superview](self->_highLevelMagiciansCurtainView, "superview");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController view](self, "view");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "convertRect:fromView:", v30, v39, v23, v25, v27);
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;

  -[SBSystemApertureGainMapBackedRendering setFrame:](self->_highLevelMagiciansCurtainView, "setFrame:", v32, v34, v36, v38);
}

id __77__SBSystemApertureViewController__postLayoutDidChangeNotificationIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "elementViewProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "element");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_elementForContainerView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "elementViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "elementViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "element");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_elementViewControllerForLayoutSpecifyingOverrider:(id)a3
{
  SAUISystemApertureManager *systemApertureManager;
  void *v4;
  void *v5;

  systemApertureManager = self->_systemApertureManager;
  SATargetElementFromBehaviorOverrider();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SAUISystemApertureManager elementViewControllerForElement:](systemApertureManager, "elementViewControllerForElement:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_containerViewForViewController:(id)a3 includingOutgoing:(BOOL)a4
{
  id v6;
  NSMutableArray *orderedContainerViews;
  NSMutableArray *v8;
  void *v9;
  NSMutableArray *v10;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    orderedContainerViews = self->_orderedContainerViews;
    if (self->_indicatorContainerView)
    {
      if (orderedContainerViews)
      {
        -[NSMutableArray arrayByAddingObject:](orderedContainerViews, "arrayByAddingObject:");
        v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15[0] = self->_indicatorContainerView;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
        v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v8 = orderedContainerViews;
    }
    v10 = v8;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__SBSystemApertureViewController__containerViewForViewController_includingOutgoing___block_invoke;
    v12[3] = &unk_1E8EB0498;
    v13 = v6;
    v14 = a4;
    -[NSMutableArray bs_firstObjectPassingTest:](v10, "bs_firstObjectPassingTest:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

BOOL __84__SBSystemApertureViewController__containerViewForViewController_includingOutgoing___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  objc_msgSend(v3, "elementViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == *(void **)(a1 + 32))
  {
    v6 = 1;
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v3, "outgoingElementViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == *(void **)(a1 + 32);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_containerViewForViewController:(id)a3
{
  return -[SBSystemApertureViewController _containerViewForViewController:includingOutgoing:](self, "_containerViewForViewController:includingOutgoing:", a3, 0);
}

- (id)_animatablePropertyWithProgressMilestones:(id)a3 block:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  v8 = 0;
  if (v6 && v7)
  {
    v9 = (void *)objc_msgSend(v5, "mutableCopy");
    v8 = objc_alloc_init(MEMORY[0x1E0CEABC0]);
    objc_msgSend(v8, "setValue:", 0.0);
    objc_initWeak(&location, v8);
    v10 = (void *)MEMORY[0x1E0CEABB0];
    v23[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __82__SBSystemApertureViewController__animatablePropertyWithProgressMilestones_block___block_invoke;
    v18 = &unk_1E8EA0510;
    objc_copyWeak(&v21, &location);
    v12 = v9;
    v19 = v12;
    v13 = v6;
    v20 = v13;
    objc_msgSend(v10, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:", v11, &v15);

    if (objc_msgSend(v12, "containsObject:", &unk_1E91CF788, v15, v16, v17, v18))
    {
      (*((void (**)(id, id, double))v13 + 2))(v13, v8, 0.0);
      objc_msgSend(v12, "removeObject:", &unk_1E91CF788);
    }

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return v8;
}

void __82__SBSystemApertureViewController__animatablePropertyWithProgressMilestones_block___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  char v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "isInvalidated");
    objc_msgSend(v3, "presentationValue");
    v6 = v5;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v7 = *(id *)(a1 + 32);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v13, "bs_CGFloatValue");
          if ((v4 & 1) == 0 && BSFloatLessThanOrEqualToFloat())
          {
            (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(v6);
            if (!v10)
              v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v10, "addObject:", v13);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v20;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v20 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j), (_QWORD)v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v16);
    }

  }
}

- (NSDirectionalEdgeInsets)_maximumContainerViewOutsetsInBounds:(CGRect)a3 inLayoutMode:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
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
  double v26;
  CGRect v27;
  CGRect v28;
  NSDirectionalEdgeInsets result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sensorRegionSize");
  v12 = v11;
  v26 = v13;

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minimumScreenEdgeInsets");
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v27.origin.x = x;
  v27.origin.y = y;
  v27.size.width = width;
  v27.size.height = height;
  v21 = v18 + (v12 - CGRectGetWidth(v27)) * 0.5;
  if (a4 < 2)
  {
    v23 = *MEMORY[0x1E0CEA080];
    v22 = *(double *)(MEMORY[0x1E0CEA080] + 16);
    v24 = *(double *)(MEMORY[0x1E0CEA080] + 24);
  }
  else
  {
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    v22 = v26 + v20 - CGRectGetHeight(v28);
    v23 = -v16;
    v24 = v21;
  }
  v25 = v21;
  result.trailing = v24;
  result.bottom = v22;
  result.leading = v25;
  result.top = v23;
  return result;
}

- (NSDirectionalEdgeInsets)_validatedEdgeOutsetsForPreferredOutsets:(NSDirectionalEdgeInsets)a3 maximumOutsets:(NSDirectionalEdgeInsets)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  NSDirectionalEdgeInsets result;

  if (a4.top >= a3.top)
    a3.top = a4.top;
  v4 = fmin(a3.top, 0.0);
  if (a4.leading >= a3.leading)
    a3.leading = a4.leading;
  v5 = fmin(a3.leading, 0.0);
  if (a4.bottom >= a3.bottom)
    a3.bottom = a4.bottom;
  v6 = fmin(a3.bottom, 0.0);
  if (a4.trailing >= a3.trailing)
    a3.trailing = a4.trailing;
  v7 = fmin(a3.trailing, 0.0);
  result.trailing = v7;
  result.bottom = v6;
  result.leading = v5;
  result.top = v4;
  return result;
}

- (CGSize)_adjunctContainerMinimalViewSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sensorRegionSize");
  v4 = v3;

  v5 = v4;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGRect)_frameForSensorRegionInBounds:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
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
  CGRect result;

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sensorRegionSize");
  BSRectWithSize();

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minimumScreenEdgeInsets");

  -[SBSystemApertureViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  UIRectCenteredXInRectScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_portraitFrameForPrimaryContainerViewInBounds:(CGRect)a3 withPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a4 layoutDirection:(int64_t)a5
{
  void *v6;
  double v7;
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
  CGRect result;

  -[SBSystemApertureViewController _frameForSensorRegionInBounds:](self, "_frameForSensorRegionInBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[SBSystemApertureViewController traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayScale");
  UIRectRoundToScale();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)_boundsForAdjunctContainerViewWithPreferredEdgeOutsets:(NSDirectionalEdgeInsets)a3 layoutDirection:(int64_t)a4
{
  void *v5;
  double v6;
  double v7;
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
  CGRect result;

  -[SBSystemApertureViewController _adjunctContainerMinimalViewSize](self, "_adjunctContainerMinimalViewSize");
  BSRectWithSize();
  -[SBSystemApertureViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  UIRectRoundToScale();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (void)_configureVariableBlur
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  CGRect v9;

  v3 = (void *)MEMORY[0x1E0D47498];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", CFSTR("systemApertureBackgroundVariableBlur-D73"), v4, 0, 0, 1.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v8, "setFrame:", 0.0, -360.0, CGRectGetWidth(v9), 360.0);

  objc_msgSend(v8, "bs_setHitTestingDisabled:", 1);
  objc_msgSend(v8, "setAutoresizingMask:", 2);
  objc_msgSend(v8, "setHidden:", 1);
  objc_msgSend(v8, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisableUpdateMask:", 32);

  -[SBSystemApertureViewController setVariableBlurView:](self, "setVariableBlurView:", v8);
  -[SBSystemApertureViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "insertSubview:belowSubview:", v8, self->_containerSubBackgroundParent);

}

- (void)_addMitosisBlobEffects
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValue:forKey:", &unk_1E91CF798, CFSTR("inputRadius"));
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2B80]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(v5, "CGColor"), CFSTR("inputColor"));

  objc_msgSend(v4, "setValue:forKey:", 0, CFSTR("inputAmount"));
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BE8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputReversed"));
  -[UIView layer](self->_containerBackgroundParent, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  v9[1] = v4;
  v9[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFilters:", v8);

}

- (void)_removeMitosisBlobEffects
{
  id v2;

  -[UIView layer](self->_containerBackgroundParent, "layer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFilters:", MEMORY[0x1E0C9AA60]);

}

- (void)_updatePreferredContentSizeCategoryForAllElements:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[SAUISystemApertureManager orderedElementViewControllers](self->_systemApertureManager, "orderedElementViewControllers", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SBSystemApertureViewController _updatePreferredContentSizeCategoryForElementViewController:](self, "_updatePreferredContentSizeCategoryForElementViewController:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_updatePreferredContentSizeCategoryForElementViewController:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a3;
  SAUILayoutSpecifyingOverriderForElementViewController();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "layoutMode");

  objc_msgSend(v3, "viewIfLoaded");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "sbui_systemApertureApplyMinimumAndMaximumContentSizeCategoryForCustomLayoutMode:", v5 == 3);
}

- (void)_beginRequiringBacklightAssertionForReason:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BSInvalidatable *v15;
  BSInvalidatable *liveUpdatingAssertion;
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 2350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  }
  -[NSCountedSet addObject:](self->_backlightAssertionRequiringReasons, "addObject:", v5);
  if (!self->_liveUpdatingAssertion)
  {
    -[SBSystemApertureViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windowScene");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("System Aperture inactive content update: <%@>"), v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D00F48];
      objc_msgSend(MEMORY[0x1E0D00FB0], "requestLiveUpdatingForScene:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      objc_msgSend(MEMORY[0x1E0D00FB8], "requestUnrestrictedFramerateForScene:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v12;
      objc_msgSend(MEMORY[0x1E0D00FC8], "ignoreWhenBacklightInactivates");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[2] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "acquireWithExplanation:observer:attributes:", v9, 0, v14);
      v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      liveUpdatingAssertion = self->_liveUpdatingAssertion;
      self->_liveUpdatingAssertion = v15;

      -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 2048);
    }

  }
}

- (void)_endRequiringBacklightAssertionForReason:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  BSInvalidatable *liveUpdatingAssertion;
  BSInvalidatable *v9;
  void *v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 2368, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    v5 = 0;
  }
  -[NSCountedSet removeObject:](self->_backlightAssertionRequiringReasons, "removeObject:", v5);
  -[NSCountedSet anyObject](self->_backlightAssertionRequiringReasons, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v11;
  if (!v6)
  {
    if (self->_liveUpdatingAssertion)
    {
      -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 4096);
      liveUpdatingAssertion = self->_liveUpdatingAssertion;
    }
    else
    {
      liveUpdatingAssertion = 0;
    }
    -[BSInvalidatable invalidate](liveUpdatingAssertion, "invalidate");
    v9 = self->_liveUpdatingAssertion;
    self->_liveUpdatingAssertion = 0;

    v7 = v11;
  }

}

- (id)scenesForBacklightSession
{
  void *v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isMainDisplayWindowScene") & 1) != 0)
  {
    -[SBSystemApertureViewController traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_backlightLuminance");

    if (v7 == 1)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = self->_orderedContainerViews;
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v13, (_QWORD)v19);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "layoutMode") >= 1)
            {
              -[SBSystemApertureViewController _elementForContainerView:](self, "_elementForContainerView:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v15, "scene");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                  objc_msgSend(v3, "addObject:", v16);

              }
            }

          }
          v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v10);
      }

      +[SBSystemApertureSceneElement scenesForBacklightSession](SBSystemApertureSceneElement, "scenesForBacklightSession");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "unionSet:", v17);

    }
  }
  else
  {

  }
  return v3;
}

void __50__SBSystemApertureViewController_registerElement___block_invoke(uint64_t a1)
{
  objc_setAssociatedObject(*(id *)(a1 + 32), "com.apple.SpringBoard.SystemApertureViewController.platformElementHost", 0, (void *)1);
}

void __50__SBSystemApertureViewController_registerElement___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "systemApertureElementAssertionInvalidated");

}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4 forTargetWithOverrider:(id)a5
{
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id v24;

  v24 = a5;
  v8 = objc_msgSend(v24, "layoutMode");
  objc_msgSend(v24, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_setLayoutMode_reason_forTargetWithOverrider_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLayoutMode:reason:forTargetWithOverrider:", a3, a4, v24);

  v10 = objc_msgSend(v24, "layoutMode");
  v11 = v24;
  if (v8 != v10)
  {
    v12 = v10;
    -[SBSystemApertureViewController _elementViewControllerForLayoutSpecifyingOverrider:](self, "_elementViewControllerForLayoutSpecifyingOverrider:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[SBSystemApertureViewController _updatePreferredContentSizeCategoryForElementViewController:](self, "_updatePreferredContentSizeCategoryForElementViewController:", v13);
    SATargetElementFromBehaviorOverrider();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (SAHasAlertBehavior() && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "alertAssertion");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!SAHasActivityBehavior() || (objc_opt_respondsToSelector() & 1) == 0)
      {
        v16 = 0;
LABEL_12:
        if (!objc_msgSend(v16, "isValid"))
        {
LABEL_26:

          v11 = v24;
          goto LABEL_27;
        }
        if (SAHasAlertBehavior())
        {
          if (!v12)
          {
LABEL_25:
            objc_msgSend(v16, "setAutomaticallyInvalidatable:", v12);
            goto LABEL_26;
          }
          objc_msgSend(v24, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", v13, sel_layoutModePreferenceForTargetWithOverrider_isDefaultValue_);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "layoutModePreferenceForTargetWithOverrider:isDefaultValue:", v24, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12 <= objc_msgSend(v18, "preferredLayoutMode"))
          {
            v12 = 1;
          }
          else
          {
            objc_msgSend(v24, "preferredLayoutModeAssertion");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v19, "layoutModeChangeReason") != 3;

          }
        }
        else
        {
          v20 = objc_opt_class();
          v21 = v16;
          if (v20)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v22 = v21;
            else
              v22 = 0;
          }
          else
          {
            v22 = 0;
          }
          v23 = v22;

          objc_msgSend(v23, "preferredLayoutModeAssertion");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v12 == objc_msgSend(v18, "preferredLayoutMode");
        }

        goto LABEL_25;
      }
      objc_msgSend(v13, "alertingActivityAssertion");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v15;
    goto LABEL_12;
  }
LABEL_27:

}

- (id)layoutModePreferenceForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  uint64_t v26;

  v5 = a3;
  SATargetElementFromBehaviorOverrider();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = SAHasAlertBehavior();
  -[SAUISystemApertureManager elementViewControllerForElement:](self->_systemApertureManager, "elementViewControllerForElement:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (SAHasActivityBehavior() && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "temporallyOrderedAlertingActivityAssertions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "bs_containsObjectPassingTest:", &__block_literal_global_515);

    v11 = v10 ^ 1;
  }
  else
  {
    v11 = 1;
  }
  objc_msgSend(v5, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_layoutModePreferenceForTargetWithOverrider_isDefaultValue_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutModePreferenceForTargetWithOverrider:isDefaultValue:", v5, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "preferredLayoutMode");
  v15 = -[SBSystemApertureViewController _doesElementHaveValidUrgencyAssertion:](self, "_doesElementHaveValidUrgencyAssertion:", v6);
  v16 = 0;
  v26 = 0;
  v17 = v14 > 0 && v15;
  if (v14 != 3 && !v17)
    v16 = v11 & ~v7;
  if (-[SBSystemApertureViewController _shouldSuppressElement:allowsSuppressionForSystemChromeSuppression:reason:](self, "_shouldSuppressElement:allowsSuppressionForSystemChromeSuppression:reason:", v6, v16, &v26))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "suppressForReason:", v26);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "setSuppressed:", 1);
    }
    v21 = 0;
    v22 = 4;
  }
  else
  {
    v18 = objc_msgSend(v13, "layoutModeChangeReason");
    v19 = v14;
    if (v14 <= 2)
    {
      if ((unint64_t)(-[SBSystemApertureViewController _activeElementInterfaceOrientation](self, "_activeElementInterfaceOrientation")- 3) > 1)
      {
        v20 = 3;
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v20 = objc_msgSend(v5, "isMinimalPresentationPossible");
      }
      else
      {
        v20 = 0;
      }
      if (v14 >= v20)
        v19 = v20;
      else
        v19 = v14;
    }
    v23 = -[SBSystemApertureViewController _mostRestrictiveLayoutModeFromActiveLayoutAssertions](self, "_mostRestrictiveLayoutModeFromActiveLayoutAssertions");
    if (v19 >= v23)
      v21 = v23;
    else
      v21 = v19;
    if (v21 == v14)
      v22 = v18;
    else
      v22 = 4;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "setSuppressed:", 0);
  }
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0828]), "initWithPreferredLayoutMode:reason:", v21, v22);

  return v24;
}

uint64_t __92__SBSystemApertureViewController_layoutModePreferenceForTargetWithOverrider_isDefaultValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValid");
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)a4 maximumOutsets:(NSDirectionalEdgeInsets)a5 forTargetWithOverrider:(id)a6 isDefaultValue:(BOOL *)a7
{
  double trailing;
  double bottom;
  double leading;
  double top;
  double v12;
  double v13;
  double v14;
  double v15;
  id v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
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
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  NSDirectionalEdgeInsets result;

  trailing = a5.trailing;
  bottom = a5.bottom;
  leading = a5.leading;
  top = a5.top;
  v12 = a4.trailing;
  v13 = a4.bottom;
  v14 = a4.leading;
  v15 = a4.top;
  v18 = a6;
  objc_msgSend(v18, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_preferredEdgeOutsetsForLayoutMode_suggestedOutsets_maximumOutsets_forTargetWithOverrider_isDefaultValue_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferredEdgeOutsetsForLayoutMode:suggestedOutsets:maximumOutsets:forTargetWithOverrider:isDefaultValue:", a3, v18, a7, v15, v14, v13, v12, top, leading, bottom, trailing);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[SBSystemApertureViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  -[SBSystemApertureViewController _maximumContainerViewOutsetsInBounds:inLayoutMode:](self, "_maximumContainerViewOutsetsInBounds:inLayoutMode:", a3, v30, v32, v34, v36);
  -[SBSystemApertureViewController _validatedEdgeOutsetsForPreferredOutsets:maximumOutsets:](self, "_validatedEdgeOutsetsForPreferredOutsets:maximumOutsets:", v21, v23, v25, v27, v37, v38, v39, v40);
  v42 = v41;
  v44 = v43;
  v46 = v45;
  v48 = v47;
  if (a3 == 1)
  {
    if ((unint64_t)(-[SBSystemApertureViewController _activeElementInterfaceOrientation](self, "_activeElementInterfaceOrientation")- 3) < 2)goto LABEL_9;
    -[SBSystemApertureViewController _elementViewControllerForLayoutSpecifyingOverrider:](self, "_elementViewControllerForLayoutSpecifyingOverrider:", v18);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureViewController _containerViewForViewController:](self, "_containerViewForViewController:", v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSystemApertureViewController _primaryContainerView](self, "_primaryContainerView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v59 != v60)
    {
LABEL_9:
      -[SBSystemApertureViewController _adjunctContainerMinimalViewSize](self, "_adjunctContainerMinimalViewSize");
      if (v44 > -v61)
        v44 = -v61;
      goto LABEL_24;
    }
LABEL_12:
    -[SBSystemApertureViewController _applySymmetryToPreferredLayoutOutsets:](self, "_applySymmetryToPreferredLayoutOutsets:", v42, v44, v46, v48);
    v42 = v62;
    v44 = v63;
    v46 = v64;
    v48 = v65;
    goto LABEL_24;
  }
  if (a3 == 2)
    goto LABEL_12;
  if (a3 != 3)
    goto LABEL_24;
  v49 = SBSACustomLayoutForBehaviorOverrider();
  if (!SBSAIsCustomLayout(v49))
    goto LABEL_24;
  v80 = v48;
  -[SBSystemApertureViewController _preferredMinSizeForCustomLayout:elementInterfaceOrientation:](self, "_preferredMinSizeForCustomLayout:elementInterfaceOrientation:", v49, -[SBSystemApertureViewController _activeElementInterfaceOrientation](self, "_activeElementInterfaceOrientation"));
  v51 = v50;
  v82 = v52;
  -[SBSystemApertureViewController _yOffsetForCustomLayout:](self, "_yOffsetForCustomLayout:", v49);
  v81 = v53;
  v79 = v51;
  -[SBSystemApertureViewController edgeOutsetsForSize:](self, "edgeOutsetsForSize:", v51, v82);
  if (v46 <= v56)
  {
    -[SBSystemApertureViewController traitCollection](self, "traitCollection");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v80;
    -[SBSystemApertureViewController _portraitFrameForPrimaryContainerViewInBounds:withPreferredEdgeOutsets:layoutDirection:](self, "_portraitFrameForPrimaryContainerViewInBounds:withPreferredEdgeOutsets:layoutDirection:", objc_msgSend(v66, "layoutDirection"), v30, v32, v34, v36, v42, v44, v46, v80);
    v68 = v67;

    if (v49 == 4)
    {
LABEL_22:
      v74 = v81;
      v42 = v42 - v81;
      goto LABEL_23;
    }
    -[SBSystemApertureViewController edgeOutsetsForSize:](self, "edgeOutsetsForSize:", v68, v82 / v79 * v68);
    v42 = v69;
    v44 = v70;
    v46 = v71;
    v48 = v72;
  }
  else
  {
    v42 = v54;
    v44 = v55;
    v48 = v57;
    v46 = v56;
  }
  switch(v49)
  {
    case 4:
      goto LABEL_22;
    case 3:
      goto LABEL_21;
    case 1:
      v73 = -v44;
      if (v44 >= 0.0)
        v73 = v44;
      if (v73 < 39.0)
      {
LABEL_21:
        v74 = v81;
        v42 = -v81;
LABEL_23:
        v46 = v74 + v46;
      }
      break;
  }
LABEL_24:

  v75 = v42;
  v76 = v44;
  v77 = v46;
  v78 = v48;
  result.trailing = v78;
  result.bottom = v77;
  result.leading = v76;
  result.top = v75;
  return result;
}

- (BOOL)isRequestingMenuPresentationForTargetWithOverrider:(id)a3 isDefaultValue:(BOOL *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "layoutSpecifyingOverridingParticipantSubordinateToParticipant:thatRespondsToSelector:", self, sel_isRequestingMenuPresentationForTargetWithOverrider_isDefaultValue_);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v7, "isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:", v6, a4);

  if ((_DWORD)a4)
  {
    if (objc_msgSend(v6, "layoutMode") == 3)
    {
      SATargetElementFromBehaviorOverrider();
      v8 = objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v9 = self->_orderedContainerViews;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v21;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v13);
          -[SBSystemApertureViewController _elementForContainerView:](self, "_elementForContainerView:", v14, (_QWORD)v20);
          v15 = objc_claimAutoreleasedReturnValue();

          if (v15 == v8)
            break;
          if (v11 == ++v13)
          {
            v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v11)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
        v17 = v14;

        if (!v17)
          goto LABEL_18;
        v16 = 1;
      }
      else
      {
LABEL_11:

LABEL_18:
        SBLogSystemApertureController();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[SBSystemApertureViewController isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:].cold.1();

        v17 = 0;
        v16 = 0;
      }

    }
    else
    {
      SBLogSystemApertureController();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[SBSystemApertureViewController isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:].cold.2();
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSDirectionalEdgeInsets)_hostSuggestedOutsetsForElement:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  NSDirectionalEdgeInsets result;

  v3 = *MEMORY[0x1E0CEA080];
  v4 = *(double *)(MEMORY[0x1E0CEA080] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEA080] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEA080] + 24);
  result.trailing = v6;
  result.bottom = v5;
  result.leading = v4;
  result.top = v3;
  return result;
}

- (void)preferredLayoutModeDidInvalidateForLayoutSpecifier:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 0x2000);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_orderedContainerViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setNeedsLayout", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 0x2000);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v4 = self->_orderedContainerViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "setNeedsLayout", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)menuPresentationRequestDidChangeForLayoutSpecifier:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v6, "isRequestingMenuPresentation");
    -[SBSystemApertureViewController _containerViewForLayoutSpecifier:](self, "_containerViewForLayoutSpecifier:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentClippingEnabled:", v4 ^ 1u);

  }
}

- (NSDirectionalEdgeInsets)edgeOutsetsForSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  NSDirectionalEdgeInsets result;

  height = a3.height;
  width = a3.width;
  v6 = *MEMORY[0x1E0CEA080];
  if (a3.width == 0.0 && a3.height == 0.0)
  {
    v7 = *(double *)(MEMORY[0x1E0CEA080] + 8);
    v8 = *(double *)(MEMORY[0x1E0CEA080] + 16);
    v9 = *(double *)(MEMORY[0x1E0CEA080] + 24);
  }
  else
  {
    -[SBSystemApertureViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v29 = v11;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sensorRegionSize");
    v20 = v19;
    v22 = v21;

    -[SBSystemApertureViewController _maximumContainerViewOutsetsInBounds:inLayoutMode:](self, "_maximumContainerViewOutsetsInBounds:inLayoutMode:", 3, v29, v13, v15, v17);
    -[SBSystemApertureViewController _validatedEdgeOutsetsForPreferredOutsets:maximumOutsets:](self, "_validatedEdgeOutsetsForPreferredOutsets:maximumOutsets:", v6, (v20 - width) * 0.5, v22 - height, (v20 - width) * 0.5, v23, v24, v25, v26);
    v6 = v27;
  }
  v28 = v6;
  result.trailing = v9;
  result.bottom = v8;
  result.leading = v7;
  result.top = v28;
  return result;
}

- (double)concentricPaddingForProvidedView:(id)a3 fromViewProvider:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSMutableArray *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSMutableArray *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v8 = self->_orderedContainerViews;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v12);
      objc_msgSend(v13, "elementViewController", (_QWORD)v42);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "elementViewProvider");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      if (v15 == v7)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v16 = v13;

    if (!v16)
      goto LABEL_28;
    objc_msgSend(v7, "systemApertureLayoutSpecifyingOverrider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "layoutMode");
    objc_msgSend(v17, "behaviorOverridingTarget");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v19, "overridesConcentricPaddingForView:inLayoutMode:", v6, v18))
    {
      objc_msgSend(v19, "concentricPaddingOverrideForView:inLayoutMode:", v6, v18);
    }
    else
    {
      -[SBSystemApertureViewController _primaryContainerView](self, "_primaryContainerView");
      v20 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();

      if (v16 == v20 || v18 == 3)
      {
        if (v18 != 3)
        {
          -[SBSystemApertureViewController traitCollection](self, "traitCollection");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "displayScale");

        }
        objc_msgSend(v6, "bounds");
        x = v48.origin.x;
        y = v48.origin.y;
        width = v48.size.width;
        height = v48.size.height;
        if (CGRectIsEmpty(v48))
        {
          -[NSMutableArray bounds](v16, "bounds");
          objc_msgSend(v6, "sizeThatFits:", v32, v33);
          BSRectWithSize();
          x = v34;
          y = v35;
          width = v36;
          height = v37;
        }
        v49.origin.x = x;
        v49.origin.y = y;
        v49.size.width = width;
        v49.size.height = height;
        CGRectGetMidX(v49);
      }
      else
      {
        -[SBSystemApertureViewController _adjunctContainerMinimalViewSize](self, "_adjunctContainerMinimalViewSize");
        v22 = v21;
        v24 = v23;
        objc_msgSend(v17, "sizeThatFitsSize:forProvidedView:inLayoutMode:", v6, v18);
        if (v26 == 0.0 && v25 == 0.0)
          objc_msgSend(v6, "sizeThatFits:", v22, v24);
      }
    }

  }
  else
  {
LABEL_9:
    v16 = v8;
  }

LABEL_28:
  -[SBSystemApertureViewController traitCollection](self, "traitCollection", (_QWORD)v42);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "displayScale");
  UIRoundToScale();
  v40 = v39;

  return v40;
}

- (CGRect)sensorRegionObstructingViewProvider:(id)a3 inContentView:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if ((unint64_t)(-[SBSystemApertureViewController _activeElementInterfaceOrientation](self, "_activeElementInterfaceOrientation")- 1) <= 1)
  {
    -[SAUISystemApertureManager orderedElementViewControllers](self->_systemApertureManager, "orderedElementViewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "elementViewProvider");
    v14 = objc_claimAutoreleasedReturnValue();
    if ((id)v14 == v6)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[NSMutableArray firstObject](self->_orderedContainerViews, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v7, "isDescendantOfView:", v16);

      if (!v17)
        goto LABEL_7;
    }
    -[SBSystemApertureViewController sensorRegionInContentView:fromViewProvider:](self, "sensorRegionInContentView:fromViewProvider:", v7, v6);
    v8 = v18;
    v9 = v19;
    v10 = v20;
    v11 = v21;
  }
LABEL_7:

  v22 = v8;
  v23 = v9;
  v24 = v10;
  v25 = v11;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)sensorRegionInContentView:(id)a3 fromViewProvider:(id)a4
{
  SBFTouchPassThroughView *v6;
  id v7;
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
  CGRect result;

  v6 = self->_containerParent;
  v7 = a3;
  -[SBFTouchPassThroughView bounds](v6, "bounds");
  -[SBSystemApertureViewController _frameForSensorRegionInBounds:](self, "_frameForSensorRegionInBounds:");
  objc_msgSend(v7, "convertRect:fromView:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedMinimalView:(id)a3 fromViewProvider:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumHorizontalMinimalViewSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedLeadingView:(id)a3 fromViewProvider:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumLeadingTrailingViewSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)maximumAvailableSizeForProvidedTrailingView:(id)a3 fromViewProvider:(id)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maximumLeadingTrailingViewSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (BOOL)viewProviderShouldMakeSensorShadowVisible:(id)a3
{
  return -[SBSystemApertureSettings isSensorShadowVisible](self->_settings, "isSensorShadowVisible", a3);
}

- (double)viewProviderSensorShadowOpacityFactor:(id)a3
{
  double result;

  -[SBSystemApertureSettings sensorShadowOpacityFactor](self->_settings, "sensorShadowOpacityFactor", a3);
  return result;
}

- (NSDirectionalEdgeInsets)_applySymmetryToPreferredLayoutOutsets:(NSDirectionalEdgeInsets)a3
{
  double trailing;
  double leading;
  CGFloat top;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MinX;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat bottom;
  CGRect v28;
  CGRect v29;
  NSDirectionalEdgeInsets result;

  trailing = a3.trailing;
  bottom = a3.bottom;
  leading = a3.leading;
  top = a3.top;
  objc_msgSend(MEMORY[0x1E0DAC6C0], "sharedInstanceForEmbeddedDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sensorRegionSize");
  BSRectWithSize();
  -[SBSystemApertureViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  UIRectCenteredXInRectScale();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  MinX = CGRectGetMinX(v28);
  v29.origin.x = v10;
  v29.origin.y = v12;
  v29.size.width = v14;
  v29.size.height = v16;
  v18 = CGRectGetMinX(v29);
  -[SBSystemApertureSettings paddingFromScreenEdgeRequiringSymmetricLayout](self->_settings, "paddingFromScreenEdgeRequiringSymmetricLayout", 0);
  v20 = v19;
  -[SBSystemApertureSettings minimumRequiredSymmetryInCompactLayoutMode](self->_settings, "minimumRequiredSymmetryInCompactLayoutMode");
  if (leading >= trailing || leading + MinX <= v20)
  {
    if (trailing >= leading || trailing + v18 <= v20)
    {
      if (trailing < leading)
        leading = trailing;
      trailing = leading;
    }
    else
    {
      UIRoundToScale();
      leading = v22;
    }
  }
  else
  {
    UIRoundToScale();
    trailing = v21;
  }
  v23 = top;
  v24 = leading;
  v25 = bottom;
  v26 = trailing;
  result.trailing = v26;
  result.bottom = v25;
  result.leading = v24;
  result.top = v23;
  return result;
}

- (double)alertingDurationForHost:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(v4, "elementViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "element");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0DAC998]))
    v8 = 7.0;
  else
    v8 = 3.0;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "preferredAlertingDuration:", v8);
    v8 = v9;
  }

  return v8;
}

- (void)elementRequestsNegativeResponse:(id)a3
{
  -[SBSystemApertureViewController element:requestsDiscreteAnimationOfType:](self, "element:requestsDiscreteAnimationOfType:", a3, 1);
}

- (void)elementRequestsSignificantUpdateTransition:(id)a3
{
  id v4;
  NSPointerArray *significantUpdateTransitionAssertions;
  NSPointerArray *v6;
  NSPointerArray *v7;
  _SBSystemApertureSignificantUpdateTransitionAssertion *v8;

  v4 = a3;
  v8 = -[_SBSystemApertureSignificantUpdateTransitionAssertion initWithElement:]([_SBSystemApertureSignificantUpdateTransitionAssertion alloc], "initWithElement:", v4);

  significantUpdateTransitionAssertions = self->_significantUpdateTransitionAssertions;
  if (!significantUpdateTransitionAssertions)
  {
    v6 = (NSPointerArray *)objc_alloc_init(MEMORY[0x1E0CB3868]);
    v7 = self->_significantUpdateTransitionAssertions;
    self->_significantUpdateTransitionAssertions = v6;

    significantUpdateTransitionAssertions = self->_significantUpdateTransitionAssertions;
  }
  -[NSPointerArray addPointer:](significantUpdateTransitionAssertions, "addPointer:", v8);
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 0x2000);

}

- (void)elementRequestsCancellingResizeGesture:(id)a3
{
  -[UIPanGestureRecognizer sb_cancel](self->_resizePanGesture, "sb_cancel", a3);
  -[UILongPressGestureRecognizer sb_cancel](self->_interactionLongPressGesture, "sb_cancel");
}

- (BOOL)_panGestureInhibitedByElement
{
  void *v2;
  char v3;

  -[SBSystemApertureViewController _currentFirstElement](self, "_currentFirstElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "inhibitSystemPanGesture");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_longPressGestureInhibitedByElement
{
  void *v2;
  char v3;

  -[SBSystemApertureViewController _currentFirstElement](self, "_currentFirstElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "inhibitSystemLongPressGesture");
  else
    v3 = 0;

  return v3;
}

- (id)element:(id)a3 requestsPersistentAnimationOfType:(int64_t)a4
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 2934, CFSTR("Can't request No-OP animation"));

    }
    v8 = 0;
  }
  else
  {
    -[SBSystemApertureViewController _persistentAssertionForElement:withType:](self, "_persistentAssertionForElement:withType:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](self->_dynamicPersistentAnimationAssertions, "addObject:", v8);
  }
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 256);

  return v8;
}

- (id)_persistentAssertionForElement:(id)a3 withType:(int64_t)a4
{
  id v6;
  SBSAElementIdentification *v7;
  void *v8;
  void *v9;
  SBSAElementIdentification *v10;
  _SBSADynamicPersistentAnimationAssertion *v11;
  _QWORD v13[4];
  id v14;
  id location;

  v6 = a3;
  v7 = [SBSAElementIdentification alloc];
  objc_msgSend(v6, "clientIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "elementIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBSAElementIdentification initWithClientIdentifier:elementIdentifier:](v7, "initWithClientIdentifier:elementIdentifier:", v8, v9);

  v11 = -[_SBSADynamicPersistentAnimationAssertion initWithElementIdentity:animation:]([_SBSADynamicPersistentAnimationAssertion alloc], "initWithElementIdentity:animation:", v10, a4);
  objc_initWeak(&location, self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SBSystemApertureViewController__persistentAssertionForElement_withType___block_invoke;
  v13[3] = &unk_1E8EB0500;
  objc_copyWeak(&v14, &location);
  -[SAAssertion addInvalidationBlock:](v11, "addInvalidationBlock:", v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v11;
}

void __74__SBSystemApertureViewController__persistentAssertionForElement_withType___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[151], "removeObject:", v5);
    objc_msgSend(v4, "_invalidatePreferencesForReason:", 256);
  }

}

- (void)invalidateElementUrgencyPreferences
{
  -[SAUISystemApertureManager invalidatePromotedElements](self->_systemApertureManager, "invalidatePromotedElements");
}

- (id)_containerViewWithRank:(unint64_t)a3 creatingIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSMutableArray *v10;
  NSMutableArray *orderedContainerViews;
  void *v12;
  id v13;
  id v14;

  v4 = a4;
  v7 = -[NSMutableArray count](self->_orderedContainerViews, "count");
  if (v7 <= a3)
  {
    if (v4)
    {
      v9 = v7;
      if (!self->_orderedContainerViews)
      {
        v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        orderedContainerViews = self->_orderedContainerViews;
        self->_orderedContainerViews = v10;

      }
      v8 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[SBSystemApertureViewController _newContainerViewWithInterfaceElementIdentifier:](self, "_newContainerViewWithInterfaceElementIdentifier:", v12);

        -[NSMutableArray setObject:atIndexedSubscript:](self->_orderedContainerViews, "setObject:atIndexedSubscript:", v13, v9);
        if (a3 == v9)
        {
          v14 = v13;

          v8 = v14;
        }

        ++v9;
      }
      while (v9 <= a3);
      -[SBSystemApertureViewController _updateContainerViewRanks](self, "_updateContainerViewRanks");
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_orderedContainerViews, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)_containerViewWithRank:(unint64_t)a3
{
  return -[SBSystemApertureViewController _containerViewWithRank:creatingIfNecessary:](self, "_containerViewWithRank:creatingIfNecessary:", a3, 0);
}

- (BOOL)systemApertureManagerShouldUseOrderedElementViewControllers:(id)a3
{
  if (systemApertureManagerShouldUseOrderedElementViewControllers__onceToken != -1)
    dispatch_once(&systemApertureManagerShouldUseOrderedElementViewControllers__onceToken, &__block_literal_global_548);
  return 1;
}

void __94__SBSystemApertureViewController_systemApertureManagerShouldUseOrderedElementViewControllers___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogSystemApertureController();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D0540000, v0, OS_LOG_TYPE_DEFAULT, "**Using ordered element view controllers**", v1, 2u);
  }

}

- (id)systemApertureDebuggingUtilityOrderedContainerViews:(id)a3
{
  return self->_orderedContainerViews;
}

- (void)systemApertureDebuggingUtility:(id)a3 updateUIForConnectionState:(int)a4
{
  void *v5;
  void *v6;
  double v7;
  id v8;
  id v9;

  -[SBSystemApertureViewController view](self, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  switch(a4)
  {
    case 0:
    case 4:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 1:
    case 5:
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0.0;
      goto LABEL_6;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
      v7 = 5.0;
LABEL_6:
      v8 = objc_retainAutorelease(v6);
      objc_msgSend(v9, "setBorderColor:", objc_msgSend(v8, "CGColor"));

      objc_msgSend(v9, "setBorderWidth:", v7);
      break;
    default:
      break;
  }

}

- (void)systemApertureDebuggingUtility:(id)a3 shouldCreateDebuggingLabel:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  UILabel *queryIterationLabel;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UILabel *v16;
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
  void *v28;
  UILabel *v29;
  _QWORD v30[3];

  v4 = a4;
  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  queryIterationLabel = self->_queryIterationLabel;
  if (v4)
  {
    if (!queryIterationLabel)
    {
      v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
      v9 = self->_queryIterationLabel;
      self->_queryIterationLabel = v8;

      -[UILabel setText:](self->_queryIterationLabel, "setText:", CFSTR("System Aperture Query Iteration: "));
      -[UILabel layer](self->_queryIterationLabel, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAllowsHitTesting:", 0);

      -[UILabel setNumberOfLines:](self->_queryIterationLabel, "setNumberOfLines:", 1);
      -[UILabel setTextAlignment:](self->_queryIterationLabel, "setTextAlignment:", 1);
      -[UILabel setUserInteractionEnabled:](self->_queryIterationLabel, "setUserInteractionEnabled:", 0);
      v11 = self->_queryIterationLabel;
      v12 = (void *)MEMORY[0x1E0CEA5E8];
      objc_msgSend(MEMORY[0x1E0CEA5E8], "labelFontSize");
      objc_msgSend(v12, "systemFontOfSize:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setFont:](v11, "setFont:", v13);

      v14 = self->_queryIterationLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setTextColor:](v14, "setTextColor:", v15);

      v16 = self->_queryIterationLabel;
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v16, "setBackgroundColor:", v17);

      -[SBSystemApertureViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addSubview:", self->_queryIterationLabel);

      -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_queryIterationLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UILabel centerXAnchor](self->_queryIterationLabel, "centerXAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "centerXAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[UILabel centerYAnchor](self->_queryIterationLabel, "centerYAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSystemApertureViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "centerYAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = (void *)MEMORY[0x1E0CB3718];
      v30[0] = v22;
      v30[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "activateConstraints:", v28);

    }
  }
  else if (queryIterationLabel)
  {
    -[UILabel removeFromSuperview](queryIterationLabel, "removeFromSuperview");
    v29 = self->_queryIterationLabel;
    self->_queryIterationLabel = 0;

  }
}

- (void)elementViewControllingWillDisappear:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "elementViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "element");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "element:visibilityWillChange:", v4, 0);

}

- (void)elementViewControllingDidDisappear:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "elementViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "element");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "element:visibilityDidChange:", v4, 0);

}

- (id)parentViewForSubBackgroundForSystemApertureContainerView:(id)a3
{
  return self->_containerSubBackgroundParent;
}

- (id)parentViewForBackgroundForSystemApertureContainerView:(id)a3
{
  return self->_containerBackgroundParent;
}

- (void)systemApertureContainerView:(id)a3 sampledLuminanceLevelChangedTo:(int64_t)a4
{
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 4, a4);
}

- (CGRect)systemApertureContainerView:(id)a3 hitRectForBounds:(CGRect)a4 debugColor:(id *)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
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
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  double v37;
  double MinY;
  double MaxY;
  double v40;
  double v41;
  double v42;
  double MinX;
  double v44;
  SBSystemApertureSettings *settings;
  double v46;
  double v47;
  BOOL v48;
  CGFloat v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  CGFloat v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  CGFloat v61;
  double v62;
  CGFloat v63;
  double v64;
  CGFloat v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  void *v70;
  CGFloat v71;
  double MaxX;
  double v73;
  _BOOL4 v74;
  void *v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  CGFloat v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  CGFloat rect;
  double v96;
  double v97;
  CGFloat v98;
  CGFloat v99;
  CGFloat v100;
  CGFloat v101;
  double v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;
  CGRect v108;
  CGRect v109;
  CGRect v110;
  CGRect v111;
  CGRect v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect result;
  CGRect v118;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  objc_msgSend(v14, "safeAreaInsets");
  UIRectInset();
  v100 = v23;
  v101 = v24;
  v98 = v26;
  v99 = v25;
  objc_msgSend(v11, "convertRect:toView:", v14, x, y, width, height);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  if ((unint64_t)(-[SBSystemApertureViewController _activeElementInterfaceOrientation](self, "_activeElementInterfaceOrientation")- 1) >= 2)
  {
    v56 = v13;
  }
  else
  {
    v91 = v22;
    v92 = v16;
    rect = v30;
    -[SBSystemApertureSettings containerHitRectTopMarginDefault](self->_settings, "containerHitRectTopMarginDefault");
    v36 = v35;
    v103.origin.x = v100;
    v103.origin.y = v101;
    v103.size.width = v99;
    v103.size.height = v98;
    v37 = v32;
    MinY = CGRectGetMinY(v103);
    v104.origin.x = v28;
    v104.origin.y = v36;
    v104.size.width = v37;
    v104.size.height = v34;
    MaxY = CGRectGetMaxY(v104);
    -[SBSystemApertureSettings containerHitRectTopMarginDefault](self->_settings, "containerHitRectTopMarginDefault");
    v41 = MaxY + v40;
    if (MinY >= v41)
      v42 = MinY;
    else
      v42 = v41;
    v105.origin.x = v28;
    v105.origin.y = v36;
    v105.size.width = v37;
    v93 = v34;
    v105.size.height = v34;
    v106.size.height = v42 - CGRectGetMinY(v105);
    v106.origin.x = v28;
    v94 = v36;
    v106.origin.y = v36;
    v106.size.width = v37;
    v97 = v106.size.height;
    MinX = CGRectGetMinX(v106);
    v107.origin.y = v101;
    v107.origin.x = v100;
    v107.size.width = v99;
    v107.size.height = v98;
    v44 = MinX - CGRectGetMinX(v107);
    -[SBSystemApertureSettings containerHitRectHorizontalMarginLimit](self->_settings, "containerHitRectHorizontalMarginLimit");
    settings = self->_settings;
    v90 = v28;
    if (v44 >= v46)
    {
      -[SBSystemApertureSettings containerHitRectHorizontalMargin](settings, "containerHitRectHorizontalMargin");
      v96 = v28 - v57;
      -[SBSystemApertureSettings containerHitRectHorizontalMargin](self->_settings, "containerHitRectHorizontalMargin");
      v58 = v37;
      v102 = v37 + v59 * 2.0;
      v50 = v92;
      v49 = v93;
      v51 = v18;
      v52 = v20;
      v53 = v91;
      v60 = v28;
      v61 = v58;
    }
    else
    {
      v88 = v42;
      v89 = v37;
      -[SBSystemApertureSettings containerHitRectHorizontalLimit](settings, "containerHitRectHorizontalLimit");
      v48 = v44 < v47;
      v50 = v92;
      v49 = v93;
      v51 = v18;
      v52 = v20;
      v53 = v91;
      if (v48)
      {
        v108.origin.x = v100;
        v108.origin.y = v101;
        v108.size.width = v99;
        v108.size.height = v98;
        v96 = CGRectGetMinX(v108);
        v109.origin.x = v100;
        v109.origin.y = v101;
        v49 = v93;
        v109.size.width = v99;
        v109.size.height = v98;
        v54 = CGRectGetWidth(v109);
        -[SBSystemApertureSettings containerHitRectTopMarginWide](self->_settings, "containerHitRectTopMarginWide");
        v110.origin.y = v55;
        v110.origin.x = v96;
        v110.size.height = v97;
        v94 = v110.origin.y;
        v102 = v54;
        v110.size.width = v54;
        v61 = v37;
        v97 = v88 - CGRectGetMinY(v110);
        v60 = v90;
      }
      else
      {
        v61 = v37;
        v60 = v90;
        v96 = v90;
        v102 = v89;
      }
    }
    -[SBSystemApertureViewController _frameForSensorRegionInBounds:](self, "_frameForSensorRegionInBounds:", v50, v51, v52, v53);
    v63 = v62;
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v111.origin.x = v60;
    v111.origin.y = rect;
    v111.size.width = v61;
    v111.size.height = v49;
    v118.origin.x = v63;
    v118.origin.y = v65;
    v118.size.width = v67;
    v118.size.height = v69;
    if (CGRectIntersectsRect(v111, v118))
    {
      v56 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "colorWithAlphaComponent:", 0.5);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      v112.origin.x = v63;
      v112.origin.y = v65;
      v112.size.width = v67;
      v112.size.height = v69;
      v71 = v49;
      MaxX = CGRectGetMaxX(v112);
      v113.origin.x = v60;
      v113.origin.y = rect;
      v113.size.width = v61;
      v113.size.height = v71;
      v73 = CGRectGetMinX(v113);
      v114.origin.x = v96;
      v114.origin.y = v94;
      v114.size.width = v102;
      v114.size.height = v97;
      CGRectGetMaxX(v114);
      if (MaxX < v73)
      {
        v115.origin.x = v90;
        v115.origin.y = rect;
        v115.size.width = v61;
        v115.size.height = v71;
        v116.origin.x = CGRectGetMinX(v115) + -4.0;
        v116.origin.y = v94;
        v116.size.width = v102;
        v116.size.height = v97;
        CGRectGetMinX(v116);
      }
    }
  }
  v74 = -[SBSystemApertureSettings isContainerHitRectVisible](self->_settings, "isContainerHitRectVisible");
  if (a5 && v74)
    *a5 = objc_retainAutorelease(v56);
  -[SBSystemApertureViewController traitCollection](self, "traitCollection");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "displayScale");
  UIRectRoundToScale();
  objc_msgSend(v14, "convertRect:toView:", v11);
  v77 = v76;
  v79 = v78;
  v81 = v80;
  v83 = v82;

  v84 = v77;
  v85 = v79;
  v86 = v81;
  v87 = v83;
  result.size.height = v87;
  result.size.width = v86;
  result.origin.y = v85;
  result.origin.x = v84;
  return result;
}

- (id)keyLineColorValidatorForSystemApertureContainerView:(id)a3
{
  return self->_colorValidator;
}

- (unint64_t)systemApertureApertureElementAuthorityMaximumNumberOfSimultaneouslyVisibleElements:(id)a3
{
  return 2;
}

- (int64_t)systemApertureApertureElementAuthority:(id)a3 preferredLayoutModeForElement:(id)a4
{
  void *v4;
  int64_t v5;

  SAUILayoutSpecifyingOverriderForElement();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "preferredLayoutMode");

  return v5;
}

- (BOOL)systemApertureApertureElementAuthority:(id)a3 isActivityElementAlerting:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  char v8;

  v5 = a4;
  if (SAHasActivityBehavior())
  {
    -[SAUISystemApertureManager elementViewControllerForElement:](self->_systemApertureManager, "elementViewControllerForElement:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "temporallyOrderedAlertingActivityAssertions");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "bs_containsObjectPassingTest:", &__block_literal_global_558);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __99__SBSystemApertureViewController_systemApertureApertureElementAuthority_isActivityElementAlerting___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValid");
}

- (BOOL)systemApertureApertureElementAuthority:(id)a3 isElementExpandedDueToUserInteraction:(id)a4
{
  void *v4;
  void *v5;
  BOOL v6;

  SAUILayoutSpecifyingOverriderForElement();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLayoutModeAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "layoutModeChangeReason") == 3;

  return v6;
}

- (BOOL)systemApertureApertureElementAuthority:(id)a3 isElementRequiredToRemainVisible:(id)a4
{
  return !-[SBSystemApertureViewController _isInteractiveHidingSupportedByElement:](self, "_isInteractiveHidingSupportedByElement:", a4);
}

- (BOOL)_doesElementHaveValidUrgencyAssertion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "platformElementHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urgentAndImportantAssertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isValid");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)systemApertureApertureElementAuthority:(id)a3 isElementUrgentlyVisible:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  if (-[SBSystemApertureViewController _doesElementHaveValidUrgencyAssertion:](self, "_doesElementHaveValidUrgencyAssertion:", v5))
  {
    SAUILayoutSpecifyingOverriderForElement();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "preferredLayoutMode") > 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_containerViewForGesture:(id)a3 initialLocationInContainerView:(CGPoint *)a4
{
  id v6;
  NSMutableArray *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_orderedContainerViews;
  v8 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        _UISystemGestureLocationInView();
        v13 = v12;
        v15 = v14;
        if (objc_msgSend(v11, "pointInside:withEvent:", 0, (_QWORD)v17))
        {
          v8 = v11;
          if (a4)
          {
            a4->x = v13;
            a4->y = v15;
          }
          goto LABEL_12;
        }
      }
      v8 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_12:

  return v8;
}

- (id)_containerViewForScrollEvent:(id)a3 ofGestureRecognizer:(id)a4 initialLocation:(CGPoint *)a5
{
  id v8;
  id v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  id v27;
  CGPoint *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = self->_orderedContainerViews;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v11)
  {
    v12 = v11;
    v29 = a5;
    v13 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if (-[SBSystemApertureViewController _isSystemGesture:](self, "_isSystemGesture:", v9))
        {
          _UISystemGestureLocationForScrollEventInView();
          v17 = v16;
          v19 = v18;
          +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "effectiveReachabilityYOffset");
          v22 = v19 - v21;

        }
        else
        {
          objc_msgSend(v8, "locationInView:", v15);
          v17 = v23;
          v22 = v24;
        }
        if (objc_msgSend(v15, "pointInside:withEvent:", 0, v17, v22))
        {
          v25 = v15;
          if (v29)
          {
            v29->x = v17;
            v29->y = v22;
          }
          goto LABEL_15;
        }
      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v12)
        continue;
      break;
    }
  }
  v25 = 0;
LABEL_15:

  if (objc_msgSend(v25, "_isInAWindow"))
    v26 = v25;
  else
    v26 = 0;
  v27 = v26;

  return v27;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveEvent:(id)a4
{
  UIPanGestureRecognizer *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  SBSAContainerPanGestureDescription *activeContainerResizeGestureDescription;
  SBSAContainerPanGestureDescription *v14;
  SBSAContainerPanGestureDescription *v15;
  BOOL v16;
  _QWORD v18[5];
  id v19;
  SEL v20;
  __int128 v21;
  __int128 v22;

  v7 = (UIPanGestureRecognizer *)a3;
  v8 = a4;
  v9 = v8;
  if (self->_resizePanGesture != v7 && (UIPanGestureRecognizer *)self->_interactionLongPressGesture != v7)
    goto LABEL_12;
  v10 = objc_msgSend(v8, "type");
  if (v10)
  {
    if (v10 == 10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = *MEMORY[0x1E0C9D538];
        -[SBSystemApertureViewController _containerViewForScrollEvent:ofGestureRecognizer:initialLocation:](self, "_containerViewForScrollEvent:ofGestureRecognizer:initialLocation:", v9, v7, &v22);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = v11;
          if (self->_resizePanGesture == v7)
          {
            activeContainerResizeGestureDescription = self->_activeContainerResizeGestureDescription;
            v18[0] = MEMORY[0x1E0C809B0];
            v18[1] = 3221225472;
            v18[2] = __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveEvent___block_invoke;
            v18[3] = &unk_1E8EB05A8;
            v20 = a2;
            v18[4] = self;
            v19 = v11;
            v21 = v22;
            v14 = -[SBSAGestureDescription copyWithBlock:](activeContainerResizeGestureDescription, "copyWithBlock:", v18);
            v15 = self->_activeContainerResizeGestureDescription;
            self->_activeContainerResizeGestureDescription = v14;

          }
          goto LABEL_10;
        }
      }
      -[SBSystemApertureViewController _collapseExpandedElementIfPossible](self, "_collapseExpandedElementIfPossible");
    }
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
LABEL_10:
  v16 = 1;
LABEL_13:

  return v16;
}

void __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveEvent___block_invoke(uint64_t a1, void *a2)
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
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAContainerPanGestureDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSystemApertureViewController.m"), 3362, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssociatedInterfaceElementIdentifier:", v13);

  objc_msgSend(v6, "setInitialLocation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveTouch___block_invoke(uint64_t a1, void *a2)
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
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAContainerLongPressGestureDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSystemApertureViewController.m"), 3394, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssociatedInterfaceElementIdentifier:", v13);

}

void __71__SBSystemApertureViewController_gestureRecognizer_shouldReceiveTouch___block_invoke_2(uint64_t a1, void *a2)
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
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = NSClassFromString(CFSTR("SBSAContainerPanGestureDescriptionMutator"));
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", v8, v9, CFSTR("SBSystemApertureViewController.m"), 3399, CFSTR("Unexpected class – expected '%@', got '%@'"), v10, v12);

LABEL_9:
    v6 = 0;
  }

  objc_msgSend(*(id *)(a1 + 40), "interfaceElementIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAssociatedInterfaceElementIdentifier:", v13);

  objc_msgSend(v6, "setInitialLocation:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UIPanGestureRecognizer *v4;
  UIPanGestureRecognizer *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  char isKindOfClass;

  v4 = (UIPanGestureRecognizer *)a3;
  v5 = v4;
  if ((UIPanGestureRecognizer *)self->_interactionLongPressGesture == v4
    && self->_activeContainerDefaultPressGestureDescription)
  {
    -[UIPanGestureRecognizer view](v4, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPanGestureRecognizer locationInView:](v5, "locationInView:", v7);
    objc_msgSend(v7, "hitTest:withEvent:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      LOBYTE(v6) = 0;
    else
      v6 = !-[SBSystemApertureViewController _longPressGestureInhibitedByElement](self, "_longPressGestureInhibitedByElement");

  }
  else if (self->_resizePanGesture == v4 && self->_activeContainerResizeGestureDescription)
  {
    v6 = !-[SBSystemApertureViewController _panGestureInhibitedByElement](self, "_panGestureInhibitedByElement");
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (unint64_t)_systemGestureTypeForGesture:(id)a3 systemGestureManager:(id)a4
{
  UILongPressGestureRecognizer *v6;
  id v7;
  void *v8;
  unint64_t v9;

  v6 = (UILongPressGestureRecognizer *)a3;
  v7 = a4;
  v8 = v7;
  if ((UILongPressGestureRecognizer *)self->_resizePanGesture == v6)
  {
    v9 = 132;
  }
  else if (self->_interactionLongPressGesture == v6)
  {
    v9 = 133;
  }
  else
  {
    v9 = objc_msgSend(v7, "typeOfSystemGesture:", v6);
  }

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  SBSystemApertureWindowScene **p_activeWindowScene;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_activeWindowScene = &self->_activeWindowScene;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemGestureManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SBSystemApertureViewController _systemGestureTypeForGesture:systemGestureManager:](self, "_systemGestureTypeForGesture:systemGestureManager:", v8, v11);
  v13 = -[SBSystemApertureViewController _systemGestureTypeForGesture:systemGestureManager:](self, "_systemGestureTypeForGesture:systemGestureManager:", v7, v11);

  if ((unint64_t)(v12 - 132) >= 2 && v12 != 45 || (v14 = 1, (unint64_t)(v13 - 132) >= 2) && v13 != 45)
  {
    SBLogSystemGesture();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      SBSystemGestureTypeDebugName(v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      SBSystemGestureTypeDebugName(v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2114;
      v22 = v17;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "disallowing simultaneous (%{public}@) and (%{public}@)", (uint8_t *)&v19, 0x16u);

    }
    v14 = 0;
  }

  return v14;
}

- (BOOL)_isResizePanGestureActive
{
  return (unint64_t)(-[UIPanGestureRecognizer state](self->_resizePanGesture, "state") - 1) < 2;
}

- (BOOL)_isInteractionLongPressGestureActive
{
  return (unint64_t)(-[UILongPressGestureRecognizer state](self->_interactionLongPressGesture, "state") - 1) < 2;
}

- (BOOL)_isAnyGestureRecognizerActive
{
  return -[SBSystemApertureViewController _isResizePanGestureActive](self, "_isResizePanGestureActive")
      || -[SBSystemApertureViewController _isInteractionLongPressGestureActive](self, "_isInteractionLongPressGestureActive");
}

- (void)_cancelExternalGesturesForReason:(id)a3
{
  SBSystemApertureWindowScene **p_activeWindowScene;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  p_activeWindowScene = &self->_activeWindowScene;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_activeWindowScene);
  objc_msgSend(WeakRetained, "associatedWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemGestureManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cancelGestureRecognizerOfType:reason:", 1, v4);
  objc_msgSend(v7, "cancelGestureRecognizerOfType:reason:", 7, v4);
  objc_msgSend(v7, "cancelGestureRecognizerOfType:reason:", 45, v4);

}

- (void)_handleResizePan:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
    -[SBSystemApertureViewController _cancelExternalGesturesForReason:](self, "_cancelExternalGesturesForReason:", CFSTR("SAResizePan"));
  -[SBSystemApertureViewController _handleContainerResizeGesture:](self, "_handleContainerResizeGesture:", v4);

}

- (void)_handleResizeResult:(int64_t)a3 withContainerView:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v7 = a4;
  -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "elementViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "layoutMode");
  v11 = v10;
  if (a3 != 1)
  {
    if (a3 != -1)
      goto LABEL_42;
    v12 = objc_msgSend(v8, "minimumSupportedLayoutMode");
    objc_msgSend(v9, "elementViewProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "element");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[SBSystemApertureViewController _isInteractiveHidingSupportedByElement:](self, "_isInteractiveHidingSupportedByElement:", v14);

    v16 = 2;
    if (v12 > 2)
      v16 = v12;
    if (!v15)
      v16 = v12;
    if (v11 - 1 <= v16)
      v17 = v16;
    else
      v17 = v11 - 1;
    if (v11 <= v16)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v8, "isInteractiveDismissalEnabled") & 1) != 0)
      {
        v17 = -1;
      }
      else if (v15)
      {
        v17 = 0;
      }
    }
    goto LABEL_29;
  }
  if (v10 <= 2)
    v17 = 2;
  else
    v17 = v10;
  v18 = v10 + 1;
  v19 = objc_msgSend(v8, "maximumSupportedLayoutMode");
  if (v18 < v19)
    v20 = v11 + 1;
  else
    v20 = v19;
  if (v20 < v17)
    v17 = v20;
  if (v11 != v17)
  {
LABEL_29:
    if (v11 != v17)
    {
      objc_msgSend(v9, "elementViewProvider");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "element");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17 == -1)
      {
        -[SAUISystemApertureManager elementAssertionForElement:](self->_systemApertureManager, "elementAssertionForElement:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if (v31 && objc_msgSend(v31, "isValid"))
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v32, "invalidateWithReason:layoutModeChangeReason:", CFSTR("removed via pan gesture"), 3);
        }
        else
        {
          SBLogSystemApertureController();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[SBSystemApertureViewController _handleResizeResult:withContainerView:].cold.1();

        }
      }
      else
      {
        objc_msgSend(v8, "setPreferredLayoutMode:reason:", v17, 3);
      }
      objc_msgSend(v30, "clientIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "elementIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSystemApertureTelemetryEmitter logTelemetryForInteractionPanGesture:handled:clientIdentifier:elementIdentifier:](SBSystemApertureTelemetryEmitter, "logTelemetryForInteractionPanGesture:handled:clientIdentifier:elementIdentifier:", v17, 1, v34, v35);

      -[SBSystemApertureViewController view](self, "view");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setNeedsLayout");

    }
    goto LABEL_42;
  }
  -[SAUISystemApertureManager registeredElements](self->_systemApertureManager, "registeredElements");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "bs_compactMap:", &__block_literal_global_568);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bs_reduce:block:", v23, &__block_literal_global_570);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "invalidateWithReason:", CFSTR("User Unhide"));
      objc_msgSend(v24, "representedElement");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "clientIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "elementIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBSystemApertureTelemetryEmitter logTelemetryForInteractionPanGesture:handled:clientIdentifier:elementIdentifier:](SBSystemApertureTelemetryEmitter, "logTelemetryForInteractionPanGesture:handled:clientIdentifier:elementIdentifier:", 2, 1, v26, v27);

      -[SBSystemApertureViewController view](self, "view");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setNeedsLayout");

    }
  }

LABEL_42:
}

id __72__SBSystemApertureViewController__handleResizeResult_withContainerView___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  SAUILayoutSpecifyingOverriderForElement();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "preferredLayoutModeAssertion");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "layoutModeChangeReason") == 3)
  {
    if (objc_msgSend(v1, "preferredLayoutMode"))
      v2 = 0;
    else
      v2 = v1;
  }
  else
  {
    v2 = 0;
  }
  v3 = v2;

  return v3;
}

id __72__SBSystemApertureViewController__handleResizeResult_withContainerView___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "compare:", v7) == -1)
    v8 = v4;
  else
    v8 = v5;
  v9 = v8;

  return v9;
}

- (BOOL)_isInteractiveHidingSupportedByElement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  int v7;

  v3 = a3;
  if (!SAHasActivityBehavior())
    goto LABEL_4;
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CEAA00], "getStyleOverrides");
  STUIBackgroundActivityIdentifiersForStyleOverrides();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "representedBackgroundActivityIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "intersectsSet:", v5);

  if ((v6 & 1) != 0)
  {
LABEL_4:
    LOBYTE(v7) = 0;
  }
  else
  {
LABEL_5:
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v3, "preventsSwipeToHide") ^ 1;
    else
      LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)_handleInteractionLongPress:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
    -[SBSystemApertureViewController _cancelExternalGesturesForReason:](self, "_cancelExternalGesturesForReason:", CFSTR("SAInteractionLongPress"));
  -[SBSystemApertureViewController _handleContainerDefaultPressGesture:](self, "_handleContainerDefaultPressGesture:", v4);

}

- (BOOL)_handleButtonEventWithTest:(id)a3 handler:(id)a4
{
  unsigned int (**v7)(id, _QWORD);
  id v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = (unsigned int (**)(id, _QWORD))a3;
  v8 = a4;
  v9 = (uint64_t (**)(_QWORD, _QWORD))v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 3591, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("test"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureViewController.m"), 3592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

LABEL_3:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[SAUISystemApertureManager registeredElements](self->_systemApertureManager, "registeredElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v7[2](v7, v14) && (v9[2](v9, v14) & 1) != 0)
        {
          LOBYTE(v11) = 1;
          goto LABEL_14;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_14:

  return v11;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _QWORD v4[4];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SBSystemApertureViewController_handleHeadsetButtonPress___block_invoke_2;
  v4[3] = &__block_descriptor_33_e21_B16__0___SAElement__8l;
  v5 = a3;
  return -[SBSystemApertureViewController _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_591_0, v4);
}

uint64_t __59__SBSystemApertureViewController_handleHeadsetButtonPress___block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __59__SBSystemApertureViewController_handleHeadsetButtonPress___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleHeadsetButtonPress:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)handleHomeButtonPress
{
  return -[SBSystemApertureViewController _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_595_0, &__block_literal_global_598_0);
}

uint64_t __55__SBSystemApertureViewController_handleHomeButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __55__SBSystemApertureViewController_handleHomeButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleHomeButtonPress");
}

- (BOOL)handleHomeButtonDoublePress
{
  return -[SBSystemApertureViewController _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_599_0, &__block_literal_global_602_0);
}

uint64_t __61__SBSystemApertureViewController_handleHomeButtonDoublePress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __61__SBSystemApertureViewController_handleHomeButtonDoublePress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleHomeButtonDoublePress");
}

- (BOOL)handleHomeButtonLongPress
{
  return -[SBSystemApertureViewController _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_603_0, &__block_literal_global_606);
}

uint64_t __59__SBSystemApertureViewController_handleHomeButtonLongPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __59__SBSystemApertureViewController_handleHomeButtonLongPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleHomeButtonLongPress");
}

- (BOOL)handleLockButtonPress
{
  return -[SBSystemApertureViewController _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_607, &__block_literal_global_610);
}

uint64_t __55__SBSystemApertureViewController_handleLockButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __55__SBSystemApertureViewController_handleLockButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleLockButtonPress");
}

- (BOOL)handleVoiceCommandButtonPress
{
  return -[SBSystemApertureViewController _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_611_0, &__block_literal_global_614_0);
}

uint64_t __63__SBSystemApertureViewController_handleVoiceCommandButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __63__SBSystemApertureViewController_handleVoiceCommandButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleVoiceCommandButtonPress");
}

- (BOOL)handleVolumeUpButtonPress
{
  return -[SBSystemApertureViewController _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_615, &__block_literal_global_618_0);
}

uint64_t __59__SBSystemApertureViewController_handleVolumeUpButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __59__SBSystemApertureViewController_handleVolumeUpButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleVolumeUpButtonPress");
}

- (BOOL)handleVolumeDownButtonPress
{
  return -[SBSystemApertureViewController _handleButtonEventWithTest:handler:](self, "_handleButtonEventWithTest:handler:", &__block_literal_global_619, &__block_literal_global_622);
}

uint64_t __61__SBSystemApertureViewController_handleVolumeDownButtonPress__block_invoke()
{
  return objc_opt_respondsToSelector() & 1;
}

uint64_t __61__SBSystemApertureViewController_handleVolumeDownButtonPress__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handleVolumeDownButtonPress");
}

- (void)_axRegisterForZoomUpdatesIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSString *v7;
  NSString *zoomRegistrationIdentifier;
  _QWORD v9[5];
  id v10;
  id location;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  if (self->_zoomRegistrationIdentifier || !_AXSZoomTouchEnabled())
  {
    -[SBSystemApertureViewController _axZoomLevelOrStandbyModeChanged](self, "_axZoomLevelOrStandbyModeChanged");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DDB308], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerInterestInZoomAttributes");

    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0DDB308], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x1E0DDB310];
    v12[0] = *MEMORY[0x1E0DDB320];
    v12[1] = v5;
    v12[2] = *MEMORY[0x1E0DDB318];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __70__SBSystemApertureViewController__axRegisterForZoomUpdatesIfNecessary__block_invoke;
    v9[3] = &unk_1E8EB0870;
    objc_copyWeak(&v10, &location);
    v9[4] = self;
    objc_msgSend(v4, "registerForZoomAttributes:onDisplay:updatesImmediatelyWithChangedHandler:", v6, 0, v9);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    zoomRegistrationIdentifier = self->_zoomRegistrationIdentifier;
    self->_zoomRegistrationIdentifier = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __70__SBSystemApertureViewController__axRegisterForZoomUpdatesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DDB320]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bs_CGFloatValue");

    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DDB310]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "BOOLValue");

    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0DDB318]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "_addZoomAnimationAssertion");
      v8 = 1;
    }
    else
    {
      v8 = BSFloatEqualToFloat() ^ 1;
    }
    if (WeakRetained[1280] != v8)
    {
      WeakRetained[1280] = v8;
      objc_msgSend(WeakRetained, "_axZoomLevelOrStandbyModeChanged");
    }
  }

}

- (void)_addZoomAnimationAssertion
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SBSystemApertureViewController *v12;
  _QWORD v13[4];
  id v14;
  id location;

  BSDispatchQueueAssertMain();
  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0D01868]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__SBSystemApertureViewController__addZoomAnimationAssertion__block_invoke;
  v13[3] = &unk_1E8E9E468;
  objc_copyWeak(&v14, &location);
  v7 = (void *)objc_msgSend(v3, "initWithIdentifier:forReason:invalidationBlock:", v5, CFSTR("Zoom Animating"), v13);

  -[NSMutableArray addObject:](self->_zoomAnimationAssertions, "addObject:", v7);
  v8 = dispatch_time(0, 200000000);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __60__SBSystemApertureViewController__addZoomAnimationAssertion__block_invoke_2;
  v10[3] = &unk_1E8E9E820;
  v11 = v7;
  v12 = self;
  v9 = v7;
  dispatch_after(v8, MEMORY[0x1E0C80D38], v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __60__SBSystemApertureViewController__addZoomAnimationAssertion__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained[157], "count"))
    objc_msgSend(v4[157], "removeObject:", v5);

}

uint64_t __60__SBSystemApertureViewController__addZoomAnimationAssertion__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1256), "count");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 40), "_axZoomLevelOrStandbyModeChanged");
  return result;
}

- (void)_axZoomLevelOrStandbyModeChanged
{
  -[SBSystemApertureViewController _invalidatePreferencesForReason:](self, "_invalidatePreferencesForReason:", 128);
}

- (void)_axRevealHiddenElementIfPossible
{
  id v3;

  -[SBSystemApertureViewController _primaryContainerView](self, "_primaryContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _handleResizeResult:withContainerView:](self, "_handleResizeResult:withContainerView:", 1, v3);

}

- (void)_axLayoutSpecifierRequestsDiminishment:(id)a3
{
  id v4;

  -[SBSystemApertureViewController _containerViewForLayoutSpecifier:](self, "_containerViewForLayoutSpecifier:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _handleResizeResult:withContainerView:](self, "_handleResizeResult:withContainerView:", -1, v4);

}

- (id)_newContainerViewWithInterfaceElementIdentifier:(id)a3
{
  id v4;
  SBSystemApertureContainerView *v5;

  v4 = a3;
  v5 = -[SBSystemApertureContainerView initWithInterfaceElementIdentifier:]([SBSystemApertureContainerView alloc], "initWithInterfaceElementIdentifier:", v4);

  -[SBSystemApertureContainerView setDelegate:](v5, "setDelegate:", self);
  -[SBSystemApertureContainerView setElementOrientationAuthority:](v5, "setElementOrientationAuthority:", self);
  return v5;
}

- (id)_containerViewForLayoutSpecifier:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_orderedContainerViews;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v10, (_QWORD)v19);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          v17 = v10;
          v12 = v4;
LABEL_17:

          goto LABEL_18;
        }
        v12 = v11;
        objc_msgSend(v11, "behaviorOverridingParticipantSubordinateToParticipant:", self);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (id)v13;
          while (v14 != v4)
          {
            objc_msgSend(v12, "behaviorOverridingParticipantSubordinateToParticipant:", v14);
            v15 = objc_claimAutoreleasedReturnValue();

            v14 = (id)v15;
            if (!v15)
              goto LABEL_13;
          }
          v16 = v10;

          if (v16)
            goto LABEL_17;
        }
LABEL_13:

      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_18:

  return v10;
}

- (void)_updateStatusBarAvoidanceFrameWithAnimationSettings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;

  v40 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "BSAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _associatedWindowScene](self, "_associatedWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBSystemApertureViewController minimumSensorRegionFrame](self, "minimumSensorRegionFrame");
  x = v7;
  y = v9;
  width = v11;
  height = v13;
  if ((unint64_t)(-[SBSystemApertureViewController _activeElementInterfaceOrientation](self, "_activeElementInterfaceOrientation")- 1) <= 1)
  {
    v33 = v6;
    v34 = v4;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v15 = self->_orderedContainerViews;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v19);
          -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v20, v33, v34, (_QWORD)v35);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v21, "layoutMode") > 0
            || !-[UILongPressGestureRecognizer state](self->_interactionLongPressGesture, "state")
            || -[UIPanGestureRecognizer state](self->_resizePanGesture, "state") >= 1)
          {
            objc_msgSend(v20, "window");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "bounds");
            objc_msgSend(v22, "convertRect:fromView:", v20);
            v24 = v23;
            v26 = v25;
            v28 = v27;
            v30 = v29;

            v41.origin.x = v24;
            v41.origin.y = v26;
            v41.size.width = v28;
            v41.size.height = v30;
            if (!CGRectIsEmpty(v41))
            {
              v42.origin.x = x;
              v42.origin.y = y;
              v42.size.width = width;
              v42.size.height = height;
              v44.origin.x = v24;
              v44.origin.y = v26;
              v44.size.width = v28;
              v44.size.height = v30;
              v43 = CGRectUnion(v42, v44);
              x = v43.origin.x;
              y = v43.origin.y;
              width = v43.size.width;
              height = v43.size.height;
            }
          }

          ++v19;
        }
        while (v17 != v19);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        v17 = v31;
      }
      while (v31);
    }

    v6 = v33;
    v4 = v34;
  }
  if (-[SBSystemApertureViewController _isAnyGestureRecognizerActive](self, "_isAnyGestureRecognizerActive", v33, v34))
    v32 = 3;
  else
    v32 = 2;
  objc_msgSend(v6, "setAvoidanceFrame:reason:statusBar:animationSettings:options:", CFSTR("SBSystemApertureViewController"), 0, v4, v32, x, y, width, height);

}

- (id)_associatedWindowScene
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  -[SBSystemApertureViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

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

  objc_msgSend(v8, "associatedWindowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGSize)_preferredMinSizeForCustomLayout:(int64_t)a3 elementInterfaceOrientation:(int64_t)a4
{
  BOOL v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  int v18;
  double v19;
  CGSize result;

  switch(a3)
  {
    case 1:
      v6 = (unint64_t)(a4 - 3) >= 2;
      v7 = 143.666667;
      v8 = 144.666667;
      goto LABEL_5;
    case 2:
      -[SBSystemApertureViewController _layoutMetrics](self, "_layoutMetrics");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "minimumScreenEdgeInsets");
      v12 = v11;
      v14 = v13;

      -[SBSystemApertureViewController view](self, "view");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bounds");
      v17 = v16;

      v9 = v17 - v12 - v14;
      if ((BSSizeEqualToSize() & 1) != 0)
      {
        v8 = 465.0;
      }
      else if ((BSSizeEqualToSize() & 1) != 0)
      {
        v8 = 432.0;
      }
      else
      {
        v18 = BSSizeEqualToSize();
        v8 = 467.0;
        if (!v18)
          v8 = 423.0;
      }
      break;
    case 3:
      v9 = 250.0;
      v8 = 180.0;
      break;
    case 4:
      -[SBSystemApertureSettings tallRectWidth](self->_settings, "tallRectWidth");
      v6 = (unint64_t)(a4 - 3) >= 2;
      v8 = 220.0;
LABEL_5:
      if (v6)
        v9 = v7;
      else
        v9 = v8;
      if (!v6)
        v8 = v7;
      break;
    default:
      v9 = *MEMORY[0x1E0C9D820];
      v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      break;
  }
  v19 = v9;
  result.height = v8;
  result.width = v19;
  return result;
}

- (double)_yOffsetForCustomLayout:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 3)
    return dbl_1D0E89CD0[a3 - 1];
  return result;
}

- (SBSystemApertureWindowScene)activeWindowScene
{
  return (SBSystemApertureWindowScene *)objc_loadWeakRetained((id *)&self->_activeWindowScene);
}

- (SBSystemApertureBacklightSessionAggregator)backlightSessionAggregator
{
  return (SBSystemApertureBacklightSessionAggregator *)objc_loadWeakRetained((id *)&self->_backlightSessionAggregator);
}

- (void)setBacklightSessionAggregator:(id)a3
{
  objc_storeWeak((id *)&self->_backlightSessionAggregator, a3);
}

- (void)setVariableBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_variableBlurView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backlightSessionAggregator);
  objc_destroyWeak((id *)&self->_activeWindowScene);
  objc_storeStrong((id *)&self->_queryIterationLabel, 0);
  objc_storeStrong((id *)&self->_debuggingUtility, 0);
  objc_storeStrong((id *)&self->_snapshotAssertions, 0);
  objc_storeStrong((id *)&self->_activeRequests, 0);
  objc_storeStrong((id *)&self->_impactFeedbackStylesToGenerators, 0);
  objc_storeStrong((id *)&self->_activeContainerResizeGestureDescription, 0);
  objc_storeStrong((id *)&self->_activeContainerDefaultPressGestureDescription, 0);
  objc_storeStrong((id *)&self->_resizeGestureUpdateQueue, 0);
  objc_storeStrong((id *)&self->_longPressGestureUpdateQueue, 0);
  objc_storeStrong((id *)&self->_pendingInteractionResults, 0);
  objc_storeStrong((id *)&self->_pendingTransitionResults, 0);
  objc_storeStrong((id *)&self->_timerIdentifiersToDescriptionRecords, 0);
  objc_storeStrong((id *)&self->_transitionIdentifiersToFloatAnimatableProperties, 0);
  objc_storeStrong((id *)&self->_lastAppliedPropertyIdentitiesToTransitionDescriptions, 0);
  objc_storeStrong((id *)&self->_containerParentIdentifier, 0);
  objc_storeStrong((id *)&self->_rootPreferencesProvider, 0);
  objc_storeStrong((id *)&self->_contentSizeCategoryTraitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_cachedLayoutDidChangeUserInfo, 0);
  objc_storeStrong((id *)&self->_zoomAnimationAssertions, 0);
  objc_storeStrong((id *)&self->_systemApertureDefaults, 0);
  objc_storeStrong((id *)&self->_significantUpdateTransitionAssertions, 0);
  objc_storeStrong((id *)&self->_colorValidator, 0);
  objc_storeStrong((id *)&self->_zoomRegistrationIdentifier, 0);
  objc_storeStrong((id *)&self->_dynamicPersistentAnimationAssertions, 0);
  objc_storeStrong((id *)&self->_transitionKeyLineAssertions, 0);
  objc_storeStrong((id *)&self->_transitionShadowAssertions, 0);
  objc_storeStrong((id *)&self->_suppressForSystemChromeSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_liveUpdatingAssertion, 0);
  objc_storeStrong((id *)&self->_overrideRenderingStyleRequests, 0);
  objc_storeStrong((id *)&self->_backlightAssertionRequiringReasons, 0);
  objc_storeStrong((id *)&self->_reasonsToLayoutAssertions, 0);
  objc_storeStrong((id *)&self->_bundleIDsPreferringSuppression, 0);
  objc_storeStrong((id *)&self->_sceneIDsPreferringSuppression, 0);
  objc_storeStrong((id *)&self->_systemApertureSuppressionAssertions, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_suppressTouchCancellationAssertion, 0);
  objc_storeStrong((id *)&self->_interactionLongPressGesture, 0);
  objc_storeStrong((id *)&self->_resizePanGesture, 0);
  objc_storeStrong((id *)&self->_elementAuthority, 0);
  objc_storeStrong((id *)&self->_systemApertureManager, 0);
  objc_storeStrong((id *)&self->_orderedContainerViews, 0);
  objc_storeStrong((id *)&self->_highLevelMagiciansCurtainView, 0);
  objc_storeStrong((id *)&self->_magiciansCurtainView, 0);
  objc_storeStrong((id *)&self->_indicatorContainerPortalView, 0);
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_curtainViewHoster, 0);
  objc_storeStrong((id *)&self->_containerParent, 0);
  objc_storeStrong((id *)&self->_variableBlurView, 0);
  objc_storeStrong((id *)&self->_containerBackgroundParent, 0);
  objc_storeStrong((id *)&self->_containerSubBackgroundParent, 0);
  objc_destroyWeak((id *)&self->_visibilityDelegate);
  objc_destroyWeak((id *)&self->_embeddedDisplayWindowScene);
}

- (NSArray)stateDump
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  void *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), *MEMORY[0x1E0DAC158]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), *MEMORY[0x1E0DAC160]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), *MEMORY[0x1E0DAC168]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SAUISystemApertureManager orderedElementViewControllers](self->_systemApertureManager, "orderedElementViewControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v7);
        SAUILayoutSpecifyingOverriderForElementViewController();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v8, "elementViewProvider");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "element");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clientIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v13, v21);

        objc_msgSend(v8, "elementViewProvider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "element");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "elementIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v16, v20);

        objc_msgSend(v9, "layoutMode");
        SAUIStringFromElementViewLayoutMode();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setValue:forKey:", v17, v3);

        objc_msgSend(v22, "addObject:", v10);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v5);
  }

  return (NSArray *)v22;
}

- (NSMutableArray)systemApertureModelStateDump
{
  return -[SBSystemApertureDebuggingUtility systemApertureModelStateDump](self->_debuggingUtility, "systemApertureModelStateDump");
}

- (void)setSystemApertureAnimationFrameRecording:(BOOL)a3
{
  -[SBSystemApertureDebuggingUtility setAnimationFrameRecording:](self->_debuggingUtility, "setAnimationFrameRecording:", a3);
}

- (NSMutableDictionary)animationFrameRecordings
{
  return -[SBSystemApertureDebuggingUtility animationFrameRecordings](self->_debuggingUtility, "animationFrameRecordings");
}

- (void)setSystemApertureUnderAutomationTesting:(BOOL)a3
{
  -[SBSystemApertureDebuggingUtility setSystemApertureUnderAutomationTesting:](self->_debuggingUtility, "setSystemApertureUnderAutomationTesting:", a3);
}

- (void)animateDiscreteAnimationStyle:(int64_t)a3 toElement:(id)a4
{
  -[SBSystemApertureViewController element:requestsDiscreteAnimationOfType:](self, "element:requestsDiscreteAnimationOfType:", a4, a3);
}

- (id)applyPersistentAnimationStyle:(int64_t)a3 toElement:(id)a4
{
  return -[SBSystemApertureViewController element:requestsPersistentAnimationOfType:](self, "element:requestsPersistentAnimationOfType:", a4, a3);
}

- (id)_currentFirstElement
{
  void *v3;
  void *v4;

  -[NSMutableArray firstObject](self->_orderedContainerViews, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemApertureViewController _elementForContainerView:](self, "_elementForContainerView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)systemApertureProximityBacklightPolicyShouldConsiderSystemApertureInert:(id)a3
{
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_orderedContainerViews;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "layoutMode");

        if (v10 > 0)
        {
          v11 = 0;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)systemApertureProximityBacklightPolicy:(id)a3 isSystemApertureElementVisibleAtPoint:(CGPoint)a4
{
  double y;
  double x;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  y = a4.y;
  x = a4.x;
  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_orderedContainerViews;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        -[SBSystemApertureViewController _layoutSpecifyingOverriderForContainerView:](self, "_layoutSpecifyingOverriderForContainerView:", v12, (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "layoutMode") >= 1)
        {
          -[SBSystemApertureViewController view](self, "view");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "convertPoint:toView:", v12, x, y);
          v16 = v15;
          v18 = v17;

          if ((objc_msgSend(v12, "pointInside:withEvent:", 0, v16, v18) & 1) != 0)
          {

            v19 = 1;
            goto LABEL_12;
          }
        }

      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_12:

  return v19;
}

- (void)systemApertureProximityBacklightPolicy:(id)a3 embedProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a5;
  v8 = a4;
  -[SBSystemApertureViewController view](self, "view");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v9, "bounds");
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v8, "setAutoresizingMask:", 18);
  objc_msgSend(v7, "setAutoresizingMask:", 18);
  objc_msgSend(v9, "insertSubview:atIndex:", v7, 0);

  objc_msgSend(v9, "addSubview:", v8);
  -[UILongPressGestureRecognizer sb_cancel](self->_interactionLongPressGesture, "sb_cancel");
  -[UIPanGestureRecognizer sb_cancel](self->_resizePanGesture, "sb_cancel");

}

- (void)systemApertureProximityBacklightPolicy:(id)a3 removeProximityTouchTrackingView:(id)a4 touchBlockingView:(id)a5
{
  id v6;

  v6 = a5;
  objc_msgSend(a4, "removeFromSuperview");
  objc_msgSend(v6, "removeFromSuperview");

}

- (BOOL)systemApertureProximityBacklightPolicyShouldDisableGracePeriod:(id)a3
{
  return 0;
}

- (void)statusBarBackgroundActivityDidChangeWithoutUpdateFromProvider:(id)a3
{
  -[SAUISystemApertureManager invalidatePromotedElements](self->_systemApertureManager, "invalidatePromotedElements", a3);
}

- (void)_updatePreferencesForReasonStackInitiated:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFFFE;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonInitOrDefaults:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFFFD;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonLumaSampling:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFFFB;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonTimerExpired:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFFDF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonMilestoneReached:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFFBF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonAccessibility:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFF7F;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonDynamicsAnimation:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFEFF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonTransitionEffectAssertion:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFDFF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonGestures:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFFBFF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonAnimatedPropertyUpdateBegin:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFF7FF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonAnimatedPropertyUpdateEnd:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFEFFF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonElementRequested:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFFDFFF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonActiveDisplayChanged:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFF7FFF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x10000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonReachabilityChanged:updates:](v8, "_updatePreferencesForReasonReachabilityChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_updatePreferencesForReasonReachabilityChanged:(unsigned int)a3 updates:(id)a4
{
  id v6;
  uint64_t v7;
  SBSystemApertureViewController *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3 & 0xFFFEFFFF;
  v8 = self;
  v9 = v6;
  v12 = v9;
  if ((_DWORD)v7)
  {
    if ((v7 & 1) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonStackInitiated:updates:](v8, "_updatePreferencesForReasonStackInitiated:updates:", v7, v9);
    }
    else if ((v7 & 2) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonInitOrDefaults:updates:](v8, "_updatePreferencesForReasonInitOrDefaults:updates:", v7, v9);
    }
    else if ((v7 & 4) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonLumaSampling:updates:](v8, "_updatePreferencesForReasonLumaSampling:updates:", v7, v9);
    }
    else if ((v7 & 8) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonSystemApertureManager:updates:](v8, "_updatePreferencesForReasonSystemApertureManager:updates:", v7, v9);
    }
    else if ((v7 & 0x10) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonCloningOrRenderingStyle:updates:](v8, "_updatePreferencesForReasonCloningOrRenderingStyle:updates:", v7, v9);
    }
    else if ((v7 & 0x20) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTimerExpired:updates:](v8, "_updatePreferencesForReasonTimerExpired:updates:", v7, v9);
    }
    else if ((v7 & 0x40) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonMilestoneReached:updates:](v8, "_updatePreferencesForReasonMilestoneReached:updates:", v7, v9);
    }
    else if ((v7 & 0x80) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAccessibility:updates:](v8, "_updatePreferencesForReasonAccessibility:updates:", v7, v9);
    }
    else if ((v7 & 0x100) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonDynamicsAnimation:updates:](v8, "_updatePreferencesForReasonDynamicsAnimation:updates:", v7, v9);
    }
    else if ((v7 & 0x200) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonTransitionEffectAssertion:updates:](v8, "_updatePreferencesForReasonTransitionEffectAssertion:updates:", v7, v9);
    }
    else if ((v7 & 0x400) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonGestures:updates:](v8, "_updatePreferencesForReasonGestures:updates:", v7, v9);
    }
    else if ((v7 & 0x800) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateBegin:updates:", v7, v9);
    }
    else if ((v7 & 0x1000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:](v8, "_updatePreferencesForReasonAnimatedPropertyUpdateEnd:updates:", v7, v9);
    }
    else if ((v7 & 0x2000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonElementRequested:updates:](v8, "_updatePreferencesForReasonElementRequested:updates:", v7, v9);
    }
    else if ((v7 & 0x4000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonOrientation:updates:](v8, "_updatePreferencesForReasonOrientation:updates:", v7, v9);
    }
    else if ((v7 & 0x8000) != 0)
    {
      -[SBSystemApertureViewController _updatePreferencesForReasonActiveDisplayChanged:updates:](v8, "_updatePreferencesForReasonActiveDisplayChanged:updates:", v7, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _SBSAUpdatePreferencesForReason(SBSystemApertureViewController * _Nonnull __strong, SBSAPreferencesInvalidationReason, BSBlock  _Nonnull __strong)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("SBSystemApertureViewController+PreferencesValidationTracing.h"), 105, CFSTR("Unhandled SBSAPreferencesInvalidationReason; update PreferencesValidationTracing code."));

    }
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }

}

- (void)_shouldPerformTransitionOfProperty:ofObject:withDescription:fromPreferences:context:.cold.1()
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
  OUTLINED_FUNCTION_0_2(&dword_1D0540000, v2, v3, "[%{public}lu] A transition description is requesting a milestone, but this transition would otherwise not be performed: %@", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_2();
}

- (void)_pushGestureDescription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "Gesture Updated: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)_popActiveGestureDescriptions
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_1D0540000, v0, v1, "Sending Gesture Update to Stack: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

- (void)isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Overrider requesting menu presentation isn't associated with an existing container view – denying: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)isRequestingMenuPresentationForTargetWithOverrider:isDefaultValue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "Overrider requesting menu presentation isn't in custom layout mode – denying: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_handleResizeResult:withContainerView:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_20_0();
  MEMORY[0x1D17E3810]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_15(&dword_1D0540000, v1, v2, "Attempting to remove element via pan gesture, but no valid assertion was found: element: %@; assertion: %@",
    v3,
    v4,
    v5,
    v6,
    v7);

  OUTLINED_FUNCTION_20();
}

- (void)_activeElementInterfaceOrientation
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "Use of interface orientation attempted (in layout?) before being set by traits arbiter", a5, a6, a7, a8, 0);
}

@end
