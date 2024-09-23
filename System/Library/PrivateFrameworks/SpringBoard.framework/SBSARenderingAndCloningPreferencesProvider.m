@implementation SBSARenderingAndCloningPreferencesProvider

void __69__SBSARenderingAndCloningPreferencesProvider_preferencesFromContext___block_invoke_2(uint64_t a1, void *a2)
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
  __int128 v14;
  uint64_t v15;

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
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v11 = NSClassFromString(CFSTR("SBSAContainerViewDescriptionMutator"));
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSARenderingAndCloningPreferencesProvider.m"), 86, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

LABEL_9:
    v7 = 0;
  }

  v14 = *(_OWORD *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v7, "setRenderingConfiguration:", &v14);

}

void __69__SBSARenderingAndCloningPreferencesProvider_preferencesFromContext___block_invoke(uint64_t a1, void *a2)
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
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  _QWORD v23[6];
  __int128 v24;
  uint64_t v25;

  v3 = a2;
  if (v3)
  {
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
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSARenderingAndCloningPreferencesProvider.m"), 81, CFSTR("Unexpected class – expected '%@', got '%@'"), v11, v13);

  }
  v7 = 0;
LABEL_10:

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "containerViewDescriptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");

  if (objc_msgSend(v15, "count"))
  {
    v16 = 0;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      objc_msgSend(v15, "objectAtIndex:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v17;
      v23[1] = 3221225472;
      v23[2] = __69__SBSARenderingAndCloningPreferencesProvider_preferencesFromContext___block_invoke_2;
      v23[3] = &unk_1E8EA4148;
      v19 = *(_QWORD *)(a1 + 48);
      v23[4] = *(_QWORD *)(a1 + 32);
      v23[5] = v19;
      v24 = *(_OWORD *)(a1 + 56);
      v25 = *(_QWORD *)(a1 + 72);
      v20 = (void *)objc_msgSend(v18, "copyWithBlock:", v23);

      objc_msgSend(v15, "replaceObjectAtIndex:withObject:", v16, v20);
      ++v16;
    }
    while (v16 < objc_msgSend(v15, "count"));
  }
  objc_msgSend(v7, "setContainerViewDescriptions:", v15);
  v21 = *(_OWORD *)(a1 + 80);
  v22 = *(_QWORD *)(a1 + 96);
  objc_msgSend(v7, "setCurtainRenderingConfiguration:", &v21);
  v21 = *(_OWORD *)(a1 + 80);
  v22 = *(_QWORD *)(a1 + 96);
  objc_msgSend(v7, "setHighLevelCurtainRenderingConfiguration:", &v21);

}

- (id)preferencesFromContext:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _BOOL4 v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  int v24;
  unint64_t v25;
  int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  char v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v55;
  Class v56;
  objc_class *v57;
  void *v58;
  void *v59;
  objc_super v61;
  _QWORD v62[7];
  __int128 v63;
  uint64_t v64;
  __int128 v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint8_t buf[4];
  id v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = NSClassFromString(CFSTR("SBSAContext"));
      v57 = (objc_class *)objc_opt_class();
      NSStringFromClass(v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSARenderingAndCloningPreferencesProvider.m"), 27, CFSTR("Unexpected class – expected '%@', got '%@'"), v56, v58);

      v10 = 0;
      v5 = v6;
    }
  }
  else
  {
    v10 = 0;
  }
  v59 = v5;

  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__12;
  v75 = __Block_byref_object_dispose__12;
  objc_msgSend(v10, "preferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v13 = v11;
  if (v12)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  v76 = v15;
  v16 = SBSAContextAndPreferencesRepresentAnyContentVisible(v10, (void *)v72[5]);
  v17 = objc_msgSend(v10, "isAnimatedTransitionInProgress");
  v18 = objc_msgSend(v10, "activeDisplay");
  v19 = objc_msgSend(v10, "cloningStyle");
  objc_msgSend(v10, "defaultsContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "alwaysRenderSystemApertureFillOnGPU");

  objc_msgSend(v10, "defaultsContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "neverRenderSystemApertureFillOnGPU");

  v24 = objc_msgSend(v10, "isTargetPlatformSimulator");
  v25 = 0;
  if (((v16 | v17) & 1) == 0 && (v21 & ~v23 & 1) == 0)
  {
    v26 = v24;
    v27 = objc_msgSend(v10, "isKeyLineRequiredForTransition");
    if (v18 == 1)
      v28 = 1;
    else
      v28 = v27;
    v29 = 1;
    if (v26)
      v29 = 2;
    if (v28)
      v25 = 0;
    else
      v25 = v29;
  }
  v30 = objc_msgSend(v10, "overrideRenderingStyle");
  if (v30 == -1)
    v31 = v25;
  else
    v31 = v30;
  objc_msgSend(v10, "defaultsContext");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "alwaysShowSystemApertureInSnapshots");

  if ((objc_msgSend(v10, "isReachabilityActive") & 1) != 0
    || (v34 = v31, objc_msgSend(v10, "isAccessibilityZoomActiveAndEnabled")))
  {
    v34 = 3;
  }
  v69 = 0uLL;
  v70 = 0;
  SBSystemApertureContainerRenderingConfigurationMake(v34, v19, v33, &v69);
  v67 = 0uLL;
  v68 = 0;
  SBSystemApertureContainerRenderingConfigurationMake(v31, v19, v33, &v67);
  if (self->_previousCloningStyle != v19
    || self->_previousCurtainRenderingStyle != v31
    || self->_previousContainerRenderingStyle != v34)
  {
    if (v34 == v31)
    {
      SBLogSystemAperturePreferencesStackRenderingCloning();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        SBStringFromSystemApertureContainerRenderingStyle(v31);
        v36 = (id)objc_claimAutoreleasedReturnValue();
        SBStringFromSystemApertureContainerCloningStyle(v19);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v36;
        v79 = 2114;
        v80 = v37;
        _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, "Updating curtain and container rendering style to: %{public}@, cloning style: %{public}@", buf, 0x16u);

      }
    }
    else
    {
      SBLogSystemAperturePreferencesStackRenderingCloning();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        SBStringFromSystemApertureContainerRenderingStyle(v31);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        SBStringFromSystemApertureContainerCloningStyle(v19);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v39;
        v79 = 2114;
        v80 = v40;
        _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_DEFAULT, "Updating curtain rendering style to: %{public}@, cloning style: %{public}@", buf, 0x16u);

      }
      SBLogSystemAperturePreferencesStackRenderingCloning();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        SBStringFromSystemApertureContainerRenderingStyle(v34);
        v41 = (id)objc_claimAutoreleasedReturnValue();
        SBStringFromSystemApertureContainerCloningStyle(v19);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v78 = v41;
        v79 = 2114;
        v80 = v42;
        _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_DEFAULT, "Updating container rendering style to: %{public}@, cloning style: %{public}@", buf, 0x16u);

      }
    }

  }
  self->_previousContainerRenderingStyle = v34;
  self->_previousCurtainRenderingStyle = v31;
  self->_previousCloningStyle = v19;
  v43 = (void *)v72[5];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __69__SBSARenderingAndCloningPreferencesProvider_preferencesFromContext___block_invoke;
  v62[3] = &unk_1E8EA4170;
  v62[4] = self;
  v62[5] = &v71;
  v62[6] = a2;
  v63 = v69;
  v64 = v70;
  v66 = v68;
  v65 = v67;
  v44 = objc_msgSend(v43, "copyWithBlock:", v62);
  v45 = (void *)v72[5];
  v72[5] = v44;

  v46 = (void *)objc_msgSend(v10, "copyByUpdatingPreferences:", v72[5]);
  v61.receiver = self;
  v61.super_class = (Class)SBSARenderingAndCloningPreferencesProvider;
  -[SBSABasePreferencesProvider preferencesFromContext:](&v61, sel_preferencesFromContext_, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_opt_class();
  v49 = v47;
  if (v48)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v50 = v49;
    else
      v50 = 0;
  }
  else
  {
    v50 = 0;
  }
  v51 = v50;

  v52 = (void *)v72[5];
  v72[5] = (uint64_t)v51;

  v53 = (id)v72[5];
  _Block_object_dispose(&v71, 8);

  return v53;
}

@end
