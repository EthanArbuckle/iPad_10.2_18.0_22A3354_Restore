@implementation WFLinkActionProvider

uint64_t __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  id v4;

  v3 = objc_msgSend(a3, "wf_contentItemClassWithAppBundleIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0D13ED0], "sharedRegistry");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerContentItemClass:", v3);

}

- (void)createActionsForRequests:(id)a3 forceLocalActionsOnly:(BOOL)a4
{
  -[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:](self, "createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:", a3, 0, a4);
}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_4;
  v7[3] = &unk_1E7AF9C80;
  v8 = *(id *)(a1 + 32);
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (id)linkActionWithActionRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 actionMetadataByAppIdentifier:(id)a5 enumMetadataByAppIdentifier:(id)a6 entityMetadataByAppIdentifier:(id)a7 forceLocalActionsOnly:(BOOL)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
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
  id v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  uint64_t v72;
  objc_class *v73;
  unint64_t v74;
  void *v75;
  WFLinkActionProvider *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  char v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  _BOOL4 v99;
  void *v100;
  WFLinkActionProvider *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  const __CFString *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD v112[2];
  _QWORD v113[4];

  v99 = a8;
  v113[2] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a6;
  objc_msgSend(v14, "bundleIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v15;
  objc_msgSend(v15, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "objectForKeyedSubscript:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "objectForKeyedSubscript:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v103 = v23;
  v104 = v22;
  WFBuildActionMetadataWithProperties(v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "effectiveBundleIdentifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = self;
    v102 = v14;
    if (objc_msgSend(v25, "count") == 1)
    {
      objc_msgSend(v24, "effectiveBundleIdentifiers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v27, "type") == 2)
      {
        objc_msgSend(v24, "effectiveBundleIdentifiers");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = v13;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "bundleIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", v18);

        v13 = v29;
        v14 = v102;

      }
      else
      {
        v32 = 0;
      }

    }
    else
    {
      v32 = 0;
    }

    objc_msgSend(v24, "effectiveBundleIdentifiers");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "count") == 1)
    {
      objc_msgSend(v24, "effectiveBundleIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstObject");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "type") == 3)
      {
        objc_msgSend(v24, "effectiveBundleIdentifiers");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "firstObject");
        v96 = v13;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "bundleIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", v18);

        v14 = v102;
        v13 = v96;

      }
      else
      {
        v40 = 0;
      }

    }
    else
    {
      v40 = 0;
    }

    v91 = v32 | v40;
    if (((v32 | v40) & 1) != 0)
    {
      v41 = 0;
    }
    else
    {
      -[WFLinkActionProvider appDescriptorForActionRequest:forceLocalActionsOnly:](v101, "appDescriptorForActionRequest:forceLocalActionsOnly:", v13, v99);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v43 = v42;
        else
          v43 = 0;
      }
      else
      {
        v43 = 0;
      }
      v41 = v43;

    }
    objc_msgSend(v14, "actionIdentifier");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    WFShortcutsActionIdentifierForClassOverrideSearch(v18, v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = +[WFLinkAction classForLinkActionWithIdentifier:metadata:](WFLinkAction, "classForLinkActionWithIdentifier:metadata:", v45, v24);
    if (!v46)
      v46 = (objc_class *)objc_opt_class();
    v47 = (void *)objc_opt_new();
    objc_msgSend(v24, "requiredCapabilities");
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      objc_msgSend(v24, "requiredCapabilities");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      WFResourceDefinitionsForRequiredCapabilities(v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v50, CFSTR("RequiredResources"));

      v14 = v102;
    }
    objc_msgSend(v14, "actionIdentifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = v18;
    WFShortcutsActionIdentifierFromLinkIdentifiers(v18, v51);
    v52 = objc_claimAutoreleasedReturnValue();

    v98 = (void *)v52;
    if (!v52)
    {
      v33 = 0;
      v65 = 0;
LABEL_45:

      v18 = v100;
      goto LABEL_46;
    }
    v94 = v45;
    v95 = v41;
    v97 = v13;
    objc_msgSend(v24, "deprecationMetadata");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "replacedByIntentIdentifier");
    v54 = objc_claimAutoreleasedReturnValue();

    v55 = v100;
    if (v54)
    {
      objc_msgSend(v105, "objectForKeyedSubscript:", v100);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "objectForKeyedSubscript:", v54);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "title");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v47, "setObject:forKeyedSubscript:", v58, CFSTR("DiscontinuedReplacementTitle"));
    }
    v59 = v46;
    v112[0] = CFSTR("DisabledOnPlatforms");
    objc_msgSend(v24, "availabilityAnnotations", v55);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkActionProvider disabledOnPlatformsWithAvailability:](v101, "disabledOnPlatformsWithAvailability:", v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v112[1] = CFSTR("Discontinued");
    v113[0] = v61;
    v62 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v24, "deprecationMetadata");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
    {
      v64 = 1;
    }
    else
    {
      objc_msgSend(v24, "availabilityAnnotations");
      v46 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v64 = -[WFLinkActionProvider isDiscontinuedWithAvailability:](v101, "isDiscontinuedWithAvailability:", v46);
    }
    objc_msgSend(v62, "numberWithInt:", v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v113[1] = v66;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v113, v112, 2);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addEntriesFromDictionary:", v67);

    if (!v63)
    objc_msgSend(v24, "systemProtocols");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D43E20], "audioRecordingProtocol");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "containsObject:", v69);

    if (v70)
      objc_msgSend(v47, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("MightStartAudioRecording"));
    v71 = v98;
    WFLinkActionBundleIdentifierOverrides(v98);
    v72 = objc_claimAutoreleasedReturnValue();
    v73 = v59;
    if (v72 || (objc_msgSend(v24, "attributionBundleIdentifier"), (v72 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v110 = *MEMORY[0x1E0DC7920];
      v93 = (void *)v72;
      v111 = v72;
      v74 = 0x1E0C99000uLL;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v111, &v110, 1);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setObject:forKeyedSubscript:", v75, CFSTR("LinkActionDisplayedAppDescriptor"));

      v76 = v101;
    }
    else
    {
      v93 = 0;
      v76 = v101;
      v74 = 0x1E0C99000;
    }
    objc_msgSend(v24, "shortcutsActionMetadata");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v77;
    if (v77)
    {
      objc_msgSend(v77, "dictionaryRepresentation");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addEntriesFromDictionary:", v78);
    }
    else
    {
      if ((v91 & 1) != 0)
        goto LABEL_44;
      if (v95)
      {
        objc_msgSend(v95, "serializedRepresentation");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = *MEMORY[0x1E0DC7920];
      }
      else
      {
        v87 = *MEMORY[0x1E0DC7920];
        v108 = *MEMORY[0x1E0DC7920];
        v109 = v100;
        objc_msgSend(*(id *)(v74 + 3456), "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v78, "objectForKeyedSubscript:", v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      if (v88)
      {
        v106 = CFSTR("ActionRequiresAppInstallation");
        v107 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(*(id *)(v74 + 3456), "dictionaryWithObjects:forKeys:count:", &v107, &v106, 1);
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "if_dictionaryByAddingEntriesFromDictionary:", v89);
        v90 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v47, "setObject:forKeyedSubscript:", v90, CFSTR("AppDefinition"));
        v78 = (void *)v90;
        v71 = v98;
      }
    }

LABEL_44:
    -[WFActionProvider defaultActionDefinition](v76, "defaultActionDefinition");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "definitionByAddingEntriesInDictionary:", v47);
    v80 = (void *)objc_claimAutoreleasedReturnValue();

    v81 = [v73 alloc];
    objc_msgSend(v97, "serializedParameters");
    v82 = v47;
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v71;
    v41 = v95;
    v85 = (void *)v54;
    v65 = v71;
    v14 = v102;
    v33 = (void *)objc_msgSend(v81, "initWithIdentifier:metadata:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:", v84, v24, v80, v83, v95, v102);

    v47 = v82;
    v13 = v97;
    v45 = v94;
    goto LABEL_45;
  }
  v33 = 0;
LABEL_46:

  return v33;
}

- (id)appDescriptorForActionRequest:(id)a3 availableActions:(id)a4 availableEntities:(id)a5 fullyQualifiedIdentifier:(id *)a6 forceLocalActionsOnly:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  os_unfair_lock_s *p_actionRequestsLock;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  os_unfair_lock_s *v36;

  v7 = a7;
  v12 = a4;
  v13 = a5;
  if (!v7)
  {
    p_actionRequestsLock = &self->_actionRequestsLock;
    v19 = a3;
    os_unfair_lock_lock(&self->_actionRequestsLock);
    objc_msgSend(v19, "actionIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    WFLinkActionIdentifierFromShortcutsActionIdentifier(v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "serializedParameters");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "objectForKey:", CFSTR("AppIntentDescriptor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22
      && -[WFLinkActionProvider serializedAppIntentDescriptorIsValid:](self, "serializedAppIntentDescriptorIsValid:", v22))
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD748]), "initWithSerializedRepresentation:", v22);
    }
    else
    {
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CBD748]), "initWithFullyQualifiedActionIdentifier:", v16);
    }
    v24 = (void *)v23;
    objc_msgSend(MEMORY[0x1E0CBD758], "sharedResolver");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "resolvedAppIntentMatchingDescriptor:availableActions:availableEntities:", v24, v12, v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26
      && (objc_msgSend(v26, "intentIdentifier"), (v27 = objc_claimAutoreleasedReturnValue()) != 0)
      && (v28 = (void *)v27,
          objc_msgSend(v26, "bundleIdentifier"),
          v29 = (void *)objc_claimAutoreleasedReturnValue(),
          v29,
          v28,
          v29))
    {
      v30 = objc_alloc(MEMORY[0x1E0D43CE8]);
      objc_msgSend(v26, "intentIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "bundleIdentifier");
      v36 = p_actionRequestsLock;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (id)objc_msgSend(v30, "initWithActionIdentifier:bundleIdentifier:", v31, v32);

      p_actionRequestsLock = v36;
      if (!a6)
        goto LABEL_16;
    }
    else
    {
      v33 = v16;
      if (!a6)
      {
LABEL_16:
        os_unfair_lock_unlock(p_actionRequestsLock);
        if (v26)
          v34 = v26;
        else
          v34 = v24;
        v17 = v34;

        goto LABEL_20;
      }
    }
    *a6 = objc_retainAutorelease(v33);
    goto LABEL_16;
  }
  v14 = a3;
  objc_msgSend(v14, "actionIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  WFLinkActionIdentifierFromShortcutsActionIdentifier(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (a6)
    *a6 = objc_retainAutorelease(v16);
  v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CBD748]), "initWithFullyQualifiedActionIdentifier:", v16);
LABEL_20:

  return v17;
}

- (id)disabledOnPlatformsWithAvailability:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  WFLinkActionProvider *v13;
  SEL v14;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  -[WFLinkActionProvider availabilityWithAvailabilityAnnotations:](self, "availabilityWithAvailabilityAnnotations:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__WFLinkActionProvider_disabledOnPlatformsWithAvailability___block_invoke;
  v11[3] = &unk_1E7AF9FF0;
  v8 = v6;
  v13 = self;
  v14 = a2;
  v12 = v8;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v11);

  v9 = v8;
  return v9;
}

- (BOOL)isDiscontinuedWithAvailability:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[WFLinkActionProvider availabilityWithAvailabilityAnnotations:](self, "availabilityWithAvailabilityAnnotations:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkActionProvider linkCurrentPlatformName](self, "linkCurrentPlatformName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = v6 == (void *)*MEMORY[0x1E0D44050];
  return (char)v5;
}

- (id)availabilityWithAvailabilityAnnotations:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (objc_class *)MEMORY[0x1E0D44148];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithAvailabilityAnnotations:", v5);

  -[WFLinkActionProvider linkCurrentPlatformName](self, "linkCurrentPlatformName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemVersion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availabilityWithPlatform:platformVersion:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)linkCurrentPlatformName
{
  void *v2;
  unint64_t v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0DC7AC8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "platform");

  if (v3 <= 2)
    v4 = **((id **)&unk_1E7AFA5D8 + v3);
  return v4;
}

- (id)appDescriptorForActionRequest:(id)a3 forceLocalActionsOnly:(BOOL)a4
{
  return -[WFLinkActionProvider appDescriptorForActionRequest:availableActions:availableEntities:fullyQualifiedIdentifier:forceLocalActionsOnly:](self, "appDescriptorForActionRequest:availableActions:availableEntities:fullyQualifiedIdentifier:forceLocalActionsOnly:", a3, self->_actionMetadataByAppIdentifier, self->_entityMetadataByAppIdentifier, 0, a4);
}

+ (BOOL)shouldAllowActionWithIdentifier:(id)a3
{
  return objc_msgSend(a1, "allowDenyStateForActionIdentifier:", a3) != 2;
}

+ (unint64_t)allowDenyStateForActionIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  objc_msgSend(a1, "denyListedLinkActionIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (v6)
    return 2;
  else
    return 0;
}

+ (id)denyListedLinkActionIdentifiers
{
  if (denyListedLinkActionIdentifiers_onceToken != -1)
    dispatch_once(&denyListedLinkActionIdentifiers_onceToken, &__block_literal_global_220);
  return (id)denyListedLinkActionIdentifiers_denyListedLinkActionIdentifiers;
}

- (void)createActionsForRequests:(id)a3 allowsActionInDenyList:(BOOL)a4 forceLocalActionsOnly:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *v11;
  NSDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  WFLinkActionProvider *v17;
  uint64_t i;
  NSDictionary *v19;
  NSDictionary *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  NSDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  NSDictionary *v35;
  WFLinkActionProvider *v36;
  uint64_t k;
  NSDictionary *v38;
  NSDictionary *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  NSDictionary *v50;
  void *v51;
  void *v52;
  void *v53;
  NSDictionary *v54;
  WFLinkActionProvider *v55;
  void *n;
  NSDictionary *v57;
  NSDictionary *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t ii;
  void *v67;
  NSObject *v68;
  NSDictionary *v69;
  uint64_t v70;
  NSDictionary *v71;
  NSDictionary *v72;
  NSDictionary *v73;
  NSObject *v74;
  NSDictionary *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  NSDictionary *v81;
  BOOL v82;
  NSDictionary *v83;
  id v84;
  void *v85;
  uint64_t v86;
  id obj;
  id obja;
  id objb;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  NSDictionary *v98;
  WFLinkActionProvider *v99;
  NSDictionary *v100;
  NSDictionary *v101;
  _QWORD v102[4];
  id v103;
  NSDictionary *v104;
  WFLinkActionProvider *v105;
  NSDictionary *v106;
  NSDictionary *v107;
  NSDictionary *v108;
  BOOL v109;
  _QWORD v110[4];
  NSDictionary *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  NSDictionary *v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  NSDictionary *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  NSDictionary *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  id v139;
  _BYTE v140[128];
  _BYTE v141[128];
  _BYTE v142[128];
  _BYTE v143[128];
  uint8_t v144[128];
  uint8_t buf[4];
  const char *v146;
  __int16 v147;
  NSDictionary *v148;
  __int16 v149;
  NSDictionary *v150;
  _BYTE v151[128];
  uint64_t v152;

  v5 = a5;
  v152 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v82 = v5;
  -[WFLinkActionProvider resolvedActionIdentifiersForActionRequests:availableActions:availableEntities:forceLocalActionsOnly:](self, "resolvedActionIdentifiersForActionRequests:availableActions:availableEntities:forceLocalActionsOnly:", v7, self->_actionMetadataByAppIdentifier, self->_entityMetadataByAppIdentifier, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = self;
  v83 = self->_actionMetadataByAppIdentifier;
  if (v83)
    goto LABEL_4;
  -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = 0;
  objc_msgSend(v9, "actionsWithFullyQualifiedIdentifiers:error:", v8, &v139);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (NSDictionary *)v139;

  if (v10)
  {
    v83 = (NSDictionary *)v10;

    self = v99;
LABEL_4:
    v12 = self->_enumMetadataByAppIdentifier;
    if (!v12)
    {
      v90 = (void *)objc_opt_new();
      v13 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "if_compactMap:", &__block_literal_global_145);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithArray:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v137 = 0u;
      v138 = 0u;
      v135 = 0u;
      v136 = 0u;
      obj = v15;
      v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
      if (v96)
      {
        v76 = v8;
        v78 = v7;
        v16 = 0;
        v93 = *(_QWORD *)v136;
        v17 = v99;
        do
        {
          for (i = 0; i != v96; ++i)
          {
            v19 = v16;
            if (*(_QWORD *)v136 != v93)
              objc_enumerationMutation(obj);
            v20 = *(NSDictionary **)(*((_QWORD *)&v135 + 1) + 8 * i);
            -[WFLinkActionProvider metadataProvider](v17, "metadataProvider");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = v16;
            objc_msgSend(v21, "enumsForBundleIdentifier:error:", v20, &v134);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v134;

            if (v22)
            {
              v100 = v16;
              v23 = objc_opt_new();
              v130 = 0u;
              v131 = 0u;
              v132 = 0u;
              v133 = 0u;
              v24 = v22;
              v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
              if (v25)
              {
                v26 = v25;
                v27 = *(_QWORD *)v131;
                do
                {
                  for (j = 0; j != v26; ++j)
                  {
                    if (*(_QWORD *)v131 != v27)
                      objc_enumerationMutation(v24);
                    v29 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * j);
                    objc_msgSend(v29, "identifier");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setObject:forKey:](v23, "setObject:forKey:", v29, v30);

                  }
                  v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
                }
                while (v26);
              }

              objc_msgSend(v90, "setObject:forKey:", v23, v20);
              v17 = v99;
              v16 = v100;
            }
            else
            {
              getWFActionsLogObject();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
                v147 = 2114;
                v148 = v20;
                v149 = 2114;
                v150 = v16;
                _os_log_impl(&dword_1C15B3000, v23, OS_LOG_TYPE_ERROR, "%s Unable to get enum for bundle identifier: %{public}@, from metadata provider %{public}@", buf, 0x20u);
              }
            }

          }
          v96 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v135, v151, 16);
        }
        while (v96);

        v8 = v76;
        v7 = v78;
      }

      v12 = (NSDictionary *)objc_msgSend(v90, "copy");
      self = v99;
    }
    v81 = v12;
    v31 = self->_entityMetadataByAppIdentifier;
    if (!v31)
    {
      v91 = (void *)objc_opt_new();
      v32 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "if_compactMap:", &__block_literal_global_147);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setWithArray:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v128 = 0u;
      v129 = 0u;
      v126 = 0u;
      v127 = 0u;
      obja = v34;
      v97 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
      if (v97)
      {
        v77 = v8;
        v79 = v7;
        v35 = 0;
        v94 = *(_QWORD *)v127;
        v36 = v99;
        do
        {
          for (k = 0; k != v97; ++k)
          {
            v38 = v35;
            if (*(_QWORD *)v127 != v94)
              objc_enumerationMutation(obja);
            v39 = *(NSDictionary **)(*((_QWORD *)&v126 + 1) + 8 * k);
            -[WFLinkActionProvider metadataProvider](v36, "metadataProvider");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v125 = v35;
            objc_msgSend(v40, "entitiesForBundleIdentifier:error:", v39, &v125);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v125;

            if (v41)
            {
              v101 = v35;
              v42 = objc_opt_new();
              v121 = 0u;
              v122 = 0u;
              v123 = 0u;
              v124 = 0u;
              v43 = v41;
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
              if (v44)
              {
                v45 = v44;
                v46 = *(_QWORD *)v122;
                do
                {
                  for (m = 0; m != v45; ++m)
                  {
                    if (*(_QWORD *)v122 != v46)
                      objc_enumerationMutation(v43);
                    v48 = *(void **)(*((_QWORD *)&v121 + 1) + 8 * m);
                    objc_msgSend(v48, "typeName");
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    -[NSObject setObject:forKey:](v42, "setObject:forKey:", v48, v49);

                  }
                  v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v121, v142, 16);
                }
                while (v45);
              }

              objc_msgSend(v91, "setObject:forKey:", v42, v39);
              v36 = v99;
              v35 = v101;
            }
            else
            {
              getWFActionsLogObject();
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
                v147 = 2114;
                v148 = v39;
                v149 = 2114;
                v150 = v35;
                _os_log_impl(&dword_1C15B3000, v42, OS_LOG_TYPE_ERROR, "%s Unable to get entities for bundle identifier: %{public}@, from metadata provider %{public}@", buf, 0x20u);
              }
            }

          }
          v97 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
        }
        while (v97);

        v8 = v77;
        v7 = v79;
      }

      v31 = (NSDictionary *)objc_msgSend(v91, "copy");
      self = v99;
    }
    v50 = self->_queryMetadataByAppIdentifier;
    if (!v50)
    {
      v85 = (void *)objc_opt_new();
      v51 = (void *)MEMORY[0x1E0C99E60];
      objc_msgSend(v8, "if_compactMap:", &__block_literal_global_149);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "setWithArray:", v52);
      v53 = (void *)objc_claimAutoreleasedReturnValue();

      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v84 = v53;
      objb = (id)objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
      if (objb)
      {
        v75 = v31;
        v80 = v7;
        v54 = 0;
        v86 = *(_QWORD *)v118;
        v55 = v99;
        do
        {
          for (n = 0; n != objb; n = (char *)n + 1)
          {
            v57 = v54;
            if (*(_QWORD *)v118 != v86)
              objc_enumerationMutation(v84);
            v58 = *(NSDictionary **)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)n);
            -[WFLinkActionProvider metadataProvider](v55, "metadataProvider", v75);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v116 = v54;
            objc_msgSend(v59, "queriesForBundleIdentifier:ofType:error:", v58, 0, &v116);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = v116;

            if (v60)
            {
              v95 = n;
              v98 = v54;
              v61 = objc_opt_new();
              v112 = 0u;
              v113 = 0u;
              v114 = 0u;
              v115 = 0u;
              v92 = v60;
              v62 = v60;
              v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v112, v140, 16);
              if (v63)
              {
                v64 = v63;
                v65 = *(_QWORD *)v113;
                do
                {
                  for (ii = 0; ii != v64; ++ii)
                  {
                    if (*(_QWORD *)v113 != v65)
                      objc_enumerationMutation(v62);
                    v67 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * ii);
                    if ((WFQueryMetadataIsEligibleForAction(v67, v58) & 1) != 0)
                    {
                      objc_msgSend(v67, "entityType");
                      v68 = objc_claimAutoreleasedReturnValue();
                      -[NSObject setObject:forKey:](v61, "setObject:forKey:", v67, v68);
                    }
                    else
                    {
                      getWFActionsLogObject();
                      v68 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v67, "identifier");
                        v69 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 136315650;
                        v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
                        v147 = 2112;
                        v148 = v69;
                        v149 = 2112;
                        v150 = v58;
                        _os_log_impl(&dword_1C15B3000, v68, OS_LOG_TYPE_DEFAULT, "%s Skipping query (%@) for bundle (%@) because it is not eligible for an action", buf, 0x20u);

                      }
                    }

                  }
                  v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v112, v140, 16);
                }
                while (v64);
              }

              objc_msgSend(v85, "setObject:forKey:", v61, v58);
              v54 = v98;
              v55 = v99;
              v60 = v92;
              n = v95;
            }
            else
            {
              getWFActionsLogObject();
              v61 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
                v147 = 2114;
                v148 = v58;
                v149 = 2114;
                v150 = v54;
                _os_log_impl(&dword_1C15B3000, v61, OS_LOG_TYPE_ERROR, "%s Unable to get queries for bundle identifier: %{public}@, from metadata provider %{public}@", buf, 0x20u);
              }
            }

          }
          objb = (id)objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v117, v141, 16);
        }
        while (objb);

        v7 = v80;
        v31 = v75;
      }

      v50 = (NSDictionary *)objc_msgSend(v85, "copy");
      self = v99;
    }
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v81, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_152_66022);
    v70 = MEMORY[0x1E0C809B0];
    v110[0] = MEMORY[0x1E0C809B0];
    v110[1] = 3221225472;
    v110[2] = __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_3;
    v110[3] = &unk_1E7AF9CA8;
    v71 = v50;
    v111 = v71;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v31, "enumerateKeysAndObjectsUsingBlock:", v110);
    v102[0] = v70;
    v102[1] = 3221225472;
    v102[2] = __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_5;
    v102[3] = &unk_1E7AF9CD0;
    v103 = v8;
    v104 = v83;
    v105 = self;
    v106 = v81;
    v109 = v82;
    v107 = v31;
    v108 = v71;
    v72 = v71;
    v73 = v31;
    v74 = v81;
    v11 = v83;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v102);

    goto LABEL_72;
  }
  getWFActionsLogObject();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v146 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]";
    v147 = 2114;
    v148 = v11;
    _os_log_impl(&dword_1C15B3000, v74, OS_LOG_TYPE_ERROR, "%s Unable to get actions from metadata provider %{public}@", buf, 0x16u);
  }
LABEL_72:

}

- (LNMetadataProvider)metadataProvider
{
  return self->_metadataProvider;
}

- (id)resolvedActionIdentifiersForActionRequests:(id)a3 availableActions:(id)a4 availableEntities:(id)a5 forceLocalActionsOnly:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;

  v10 = a4;
  v11 = a5;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __124__WFLinkActionProvider_resolvedActionIdentifiersForActionRequests_availableActions_availableEntities_forceLocalActionsOnly___block_invoke;
  v16[3] = &unk_1E7AF9B68;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v19 = a6;
  v12 = v11;
  v13 = v10;
  objc_msgSend(a3, "if_compactMap:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __60__WFLinkActionProvider_disabledOnPlatformsWithAvailability___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((id)*MEMORY[0x1E0D44058] == v5)
  {
    if ((id)*MEMORY[0x1E0D43990] == v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", CFSTR("Pad"));
      v7 = *(void **)(a1 + 32);
      v8 = CFSTR("Phone");
      goto LABEL_12;
    }
    if ((id)*MEMORY[0x1E0D439A0] == v9)
    {
      v7 = *(void **)(a1 + 32);
      v8 = CFSTR("Desktop");
      goto LABEL_12;
    }
    if ((id)*MEMORY[0x1E0D439C8] == v9)
    {
      v7 = *(void **)(a1 + 32);
      v8 = CFSTR("Watch");
      goto LABEL_12;
    }
    if ((id)*MEMORY[0x1E0D439B0] != v9)
    {
      if ((id)*MEMORY[0x1E0D439C0] != v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), CFSTR("WFLinkActionProvider.m"), 1389, CFSTR("Unknown OS Execution Platform: %@"), v9);

        goto LABEL_13;
      }
      v7 = *(void **)(a1 + 32);
      v8 = CFSTR("XR");
LABEL_12:
      objc_msgSend(v7, "addObject:", v8);
    }
  }
LABEL_13:

}

+ (id)sharedProvider
{
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, &__block_literal_global_136_66179);
  return (id)sharedProvider_sharedProvider;
}

id __124__WFLinkActionProvider_resolvedActionIdentifiersForActionRequests_availableActions_availableEntities_forceLocalActionsOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v7;

  v3 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = 0;
  v5 = (id)objc_msgSend(v3, "appDescriptorForActionRequest:availableActions:availableEntities:fullyQualifiedIdentifier:forceLocalActionsOnly:", a2, v2, v4, &v7, *(unsigned __int8 *)(a1 + 56));
  return v7;
}

+ (BOOL)restrictIdentifierToAssistantOnly:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  void *v6;
  char v7;
  unsigned __int8 md[16];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CC_MD5((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), md);
  v4 = (void *)objc_opt_new();
  for (i = 0; i != 16; ++i)
    objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), md[i]);
  +[WFLinkActionProvider assistantOnlyLinkActionIdentifierHashes](WFLinkActionProvider, "assistantOnlyLinkActionIdentifierHashes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

+ (id)assistantOnlyLinkActionIdentifierHashes
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__WFLinkActionProvider_Hiding__assistantOnlyLinkActionIdentifierHashes__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (assistantOnlyLinkActionIdentifierHashes_onceToken != -1)
    dispatch_once(&assistantOnlyLinkActionIdentifierHashes_onceToken, block);
  return (id)assistantOnlyLinkActionIdentifierHashes_assistantOnlyLinkActionIdentifiers;
}

void __71__WFLinkActionProvider_Hiding__assistantOnlyLinkActionIdentifierHashes__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("AssistantIntents-iOS"), CFSTR("metadata"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v1, 4, &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  if (v3)
  {
    getWFActionsLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "+[WFLinkActionProvider(Hiding) assistantOnlyLinkActionIdentifierHashes]_block_invoke";
      v12 = 2112;
      v13 = v3;
      _os_log_impl(&dword_1C15B3000, v4, OS_LOG_TYPE_DEBUG, "%s Failed to open file. %@", buf, 0x16u);
    }

  }
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR("\n"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)assistantOnlyLinkActionIdentifierHashes_assistantOnlyLinkActionIdentifiers;
  assistantOnlyLinkActionIdentifierHashes_assistantOnlyLinkActionIdentifiers = v7;

}

- (WFLinkActionProvider)initWithMetadataProvider:(id)a3
{
  id v5;
  WFLinkActionProvider *v6;
  WFLinkActionProvider *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  INSystemAppMapper *systemAppMapper;
  Class v14;
  uint64_t *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  Class v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  WFLinkActionProvider *v23;
  uint64_t v25;
  uint64_t v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFLinkActionProvider;
  v6 = -[WFLinkActionProvider init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_metadataProvider, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(21, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create_with_target_V2("com.apple.shortcuts.WFLinkActionProvider", v8, v9);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    v12 = objc_opt_new();
    systemAppMapper = v7->_systemAppMapper;
    v7->_systemAppMapper = (INSystemAppMapper *)v12;

    v7->_actionRequestsLock._os_unfair_lock_opaque = 0;
    v14 = NSClassFromString(CFSTR("WFActionKitStaticInitializer"));
    v15 = (uint64_t *)MEMORY[0x1E0DC7FD8];
    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *v15;
      v26 = 0;
      +[WFLinkMetadataRegistrationHelper registerWithBundle:forBundleIdentifier:error:](WFLinkMetadataRegistrationHelper, "registerWithBundle:forBundleIdentifier:error:", v16, v17, &v26);
      if (v26)
      {
        getWFActionsLogObject();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[WFLinkActionProvider initWithMetadataProvider:]";
          _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_ERROR, "%s Failed to register ActionKit metadata for built-in actions", buf, 0xCu);
        }

      }
    }
    v19 = NSClassFromString(CFSTR("VCVoiceShortcutClient"));
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *v15;
      v25 = 0;
      +[WFLinkMetadataRegistrationHelper registerWithBundle:forBundleIdentifier:error:](WFLinkMetadataRegistrationHelper, "registerWithBundle:forBundleIdentifier:error:", v20, v21, &v25);
      if (v25)
      {
        getWFActionsLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v29 = "-[WFLinkActionProvider initWithMetadataProvider:]";
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s Failed to register VoiceShortcutClient metadata for built-in actions", buf, 0xCu);
        }

      }
    }
    v23 = v7;

  }
  return v7;
}

- (BOOL)serializedAppIntentDescriptorIsValid:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = *MEMORY[0x1E0DC7920];
  v4 = a3;
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
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

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0DC7910]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_opt_class();
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

  LOBYTE(v8) = 0;
  if (v7 && v10)
  {
    objc_msgSend(&unk_1E7B8E030, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v11, "containsObject:", v10) ^ 1;

  }
  return (char)v8;
}

- (void)createActionsForRequests:(id)a3 allowsActionInDenyList:(BOOL)a4
{
  -[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:](self, "createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:", a3, a4, 0);
}

- (id)definitionForMissingActionWithSerializedParameters:(id)a3
{
  void *v3;
  WFActionDefinition *v4;
  void *v5;
  WFActionDefinition *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("AppIntentDescriptor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = [WFActionDefinition alloc];
    v8 = CFSTR("AppDefinition");
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[WFActionDefinition initWithDictionary:](v4, "initWithDictionary:", v5);

    return v6;
  }
  else
  {

    return 0;
  }
}

- (id)createActionsForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSDictionary *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  WFActionRequest *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v47;
  NSDictionary *v48;
  void *v49;
  id v50;
  void *v51;
  NSDictionary *v52;
  WFLinkActionProvider *v53;
  void *v54;
  NSDictionary *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  _QWORD v70[4];
  id v71;
  id v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = self->_entityMetadataByAppIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v55 = v6;
  if (v6)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_entityMetadataByAppIdentifier, "objectForKeyedSubscript:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = 0;
  }
  else
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    objc_msgSend(v10, "entitiesForBundleIdentifier:error:", v4, &v72);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v72;

    v70[0] = v7;
    v70[1] = 3221225472;
    v70[2] = __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke;
    v70[3] = &unk_1E7AF9D00;
    v8 = (id)objc_opt_new();
    v71 = v8;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v70);

  }
  v12 = self->_actionMetadataByAppIdentifier;
  v52 = v12;
  if (v12)
  {
    -[NSDictionary objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v9;
    objc_msgSend(v13, "actionsForBundleIdentifier:error:", v4, &v69);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v69;

    v9 = v15;
  }

  v65[0] = v7;
  v65[1] = 3221225472;
  v65[2] = __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_2;
  v65[3] = &unk_1E7AF9D50;
  v50 = v8;
  v66 = v50;
  v16 = v4;
  v67 = v16;
  v17 = v5;
  v68 = v17;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v65);
  v18 = self->_queryMetadataByAppIdentifier;
  v51 = v14;
  v48 = v18;
  if (v18)
  {
    v54 = v9;
    -[NSDictionary objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "allValues");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v9;
    objc_msgSend(v19, "queriesForBundleIdentifier:ofType:error:", v16, 0, &v64);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v64;

    v54 = v21;
  }
  v53 = self;

  if (objc_msgSend(v20, "count"))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v22 = v20;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v61 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if (WFQueryMetadataIsEligibleForAction(v27, v16))
          {
            objc_msgSend(v27, "entityType");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObject:", v28);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
      }
      while (v24);
    }

  }
  v47 = v20;
  v29 = (void *)objc_opt_new();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v49 = v17;
  v30 = (void *)objc_msgSend(v17, "copy");
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v57;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v57 != v33)
          objc_enumerationMutation(v30);
        WFShortcutsActionIdentifierFromLinkIdentifiers(v16, *(void **)(*((_QWORD *)&v56 + 1) + 8 * j));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (v35)
        {
          objc_msgSend(v29, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {
            v37 = -[WFActionRequest initWithActionIdentifier:serializedParameters:]([WFActionRequest alloc], "initWithActionIdentifier:serializedParameters:", v35, 0);
            -[WFActionRequest actionIdentifier](v37, "actionIdentifier");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "setObject:forKeyedSubscript:", v37, v38);

          }
        }

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
    }
    while (v32);
  }

  objc_msgSend(v29, "allValues");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkActionProvider createActionsForRequests:forceLocalActionsOnly:](v53, "createActionsForRequests:forceLocalActionsOnly:", v39, 0);

  objc_msgSend(v29, "allValues");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "if_compactMap:", &__block_literal_global_168);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
    v44 = v42;
  else
    v44 = (id)objc_opt_new();
  v45 = v44;

  return v45;
}

- (id)actionMetadataByUpdatingWithEnumAndEntityMetadata:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v6 = a4;
  -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v7, "enumsForBundleIdentifier:error:", v6, &v41);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v41;

  v10 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v13);
  }

  -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v9;
  objc_msgSend(v18, "entitiesForBundleIdentifier:error:", v6, &v36);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v36;

  v20 = (void *)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v26, "identifier", v30);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v26, v27);

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v23);
  }

  WFBuildActionMetadataWithProperties(v31, v10, v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (id)actionMetadataByAppBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  SEL v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 643, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

  }
  -[NSDictionary objectForKeyedSubscript:](self->_actionMetadataByAppIdentifier, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFLinkActionProvider actionMetadataByAppIdentifier](self, "actionMetadataByAppIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v24 = a2;
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v9, "actionsForBundleIdentifier:error:", v5, &v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v30;

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v24, self, CFSTR("WFLinkActionProvider.m"), 652, CFSTR("link gave us two actions with the same id"));

          }
          objc_msgSend(v17, "identifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v20);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v14);
    }

    v8 = (void *)objc_msgSend(v11, "copy");
  }

  return v8;
}

- (id)actionMetadataByAppBundleIdentifier:(id)a3 actionIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 661, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 662, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actionIdentifier"));

LABEL_3:
  -[NSDictionary objectForKeyedSubscript:](self->_actionMetadataByAppIdentifier, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFLinkActionProvider actionMetadataByAppIdentifier](self, "actionMetadataByAppIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v15, "actionsForBundleIdentifier:error:", v7, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__WFLinkActionProvider_actionMetadataByAppBundleIdentifier_actionIdentifier___block_invoke;
    v19[3] = &unk_1E7AF9DB8;
    v20 = v9;
    objc_msgSend(v12, "if_firstObjectPassingTest:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)entityMetadataByAppBundleIdentifier:(id)a3 entityIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 675, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 676, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityIdentifier"));

LABEL_3:
  -[NSDictionary objectForKeyedSubscript:](self->_entityMetadataByAppIdentifier, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFLinkActionProvider entityMetadataByAppIdentifier](self, "entityMetadataByAppIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "entitiesForBundleIdentifier:error:", v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __77__WFLinkActionProvider_entityMetadataByAppBundleIdentifier_entityIdentifier___block_invoke;
    v19[3] = &unk_1E7AF9DE0;
    v20 = v9;
    objc_msgSend(v12, "if_firstObjectPassingTest:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)enumMetadataByAppBundleIdentifier:(id)a3 enumIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 688, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 689, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("enumIdentifier"));

LABEL_3:
  -[NSDictionary objectForKeyedSubscript:](self->_enumMetadataByAppIdentifier, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFLinkActionProvider enumMetadataByAppIdentifier](self, "enumMetadataByAppIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "enumsForBundleIdentifier:error:", v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __73__WFLinkActionProvider_enumMetadataByAppBundleIdentifier_enumIdentifier___block_invoke;
    v19[3] = &unk_1E7AF9E08;
    v20 = v9;
    objc_msgSend(v12, "if_firstObjectPassingTest:", v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)queryMetadataByAppBundleIdentifier:(id)a3 entityIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 701, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 702, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entityIdentifier"));

LABEL_3:
  -[NSDictionary objectForKeyedSubscript:](self->_queryMetadataByAppIdentifier, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFLinkActionProvider queryMetadataByAppIdentifier](self, "queryMetadataByAppIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queriesForBundleIdentifier:ofType:error:", v7, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v12, "count") >= 2)
    {
      getWFAppIntentsLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v23 = "-[WFLinkActionProvider queryMetadataByAppBundleIdentifier:entityIdentifier:]";
        v24 = 2048;
        v25 = objc_msgSend(v12, "count");
        v26 = 2112;
        v27 = v9;
        v28 = 2112;
        v29 = v7;
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_DEFAULT, "%s %lu queries returned for %@ in %@", buf, 0x2Au);
      }

    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __76__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_entityIdentifier___block_invoke;
    v20[3] = &unk_1E7AF9E30;
    v21 = v9;
    objc_msgSend(v12, "if_firstObjectPassingTest:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)queryMetadataByAppBundleIdentifier:(id)a3 queryIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 717, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

    if (v9)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionProvider.m"), 718, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryIdentifier"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_8;
LABEL_3:
  -[NSDictionary objectForKeyedSubscript:](self->_queryMetadataByAppIdentifier, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (!v10)
    goto LABEL_5;
  -[WFLinkActionProvider queryMetadataByAppIdentifier](self, "queryMetadataByAppIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __75__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_queryIdentifier___block_invoke;
  v23[3] = &unk_1E7AF9E30;
  v24 = v9;
  objc_msgSend(v14, "if_firstObjectPassingTest:", v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_5:
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queriesForBundleIdentifier:ofType:error:", v7, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __75__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_queryIdentifier___block_invoke_2;
    v21[3] = &unk_1E7AF9E30;
    v22 = v9;
    objc_msgSend(v17, "if_firstObjectPassingTest:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)availableActionIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[5];
  id v19;

  -[WFLinkActionProvider enumMetadataByAppIdentifier](self, "enumMetadataByAppIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLinkActionProvider entityMetadataByAppIdentifier](self, "entityMetadataByAppIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  -[WFLinkActionProvider actionMetadataByAppIdentifier](self, "actionMetadataByAppIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke;
  v18[3] = &unk_1E7AF9EA8;
  v18[4] = self;
  v19 = v5;
  v8 = v5;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v18);

  v9 = (void *)objc_opt_new();
  -[WFLinkActionProvider queryMetadataByAppIdentifier](self, "queryMetadataByAppIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = 3221225472;
  v16[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_4;
  v16[3] = &unk_1E7AF9CA8;
  v17 = v9;
  v11 = v9;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v16);

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithArray:", v13);

  return v14;
}

- (id)linkContentItemFilterActionWithActionRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 enumMetadataByAppIdentifier:(id)a5 entityMetadataByAppIdentifier:(id)a6 entityMetadata:(id)a7 queryMetadata:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  WFLinkActionProvider *v25;
  void *v26;
  char v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  id v37;
  void *v38;
  char v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  WFLinkActionProvider *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  objc_class *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  id v73;
  void *v74;
  uint64_t v75;
  void *v76;
  void *v78;
  void *v79;
  uint64_t v80;
  objc_class *v81;
  WFLinkActionProvider *v82;
  id v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  const __CFString *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[2];
  _QWORD v98[2];
  uint8_t buf[4];
  const char *v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = a8;
  v90 = v13;
  objc_msgSend(v13, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v89 = v15;
    objc_msgSend(v13, "actionIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    WFShortcutsActionIdentifierForClassOverrideSearch(v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = +[WFLinkAction classForLinkActionWithIdentifier:metadata:](WFLinkAction, "classForLinkActionWithIdentifier:metadata:", v18, 0);
    if (!v19)
      v19 = (objc_class *)objc_opt_class();
    v81 = v19;
    objc_msgSend(v14, "effectiveBundleIdentifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v18;
    v87 = v16;
    if (objc_msgSend(v20, "count") == 1)
    {
      objc_msgSend(v14, "effectiveBundleIdentifiers");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "type") == 2)
      {
        objc_msgSend(v14, "effectiveBundleIdentifiers");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bundleIdentifier");
        v25 = self;
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", v87);

        self = v25;
        v16 = v87;
      }
      else
      {
        v27 = 0;
      }

    }
    else
    {
      v27 = 0;
    }

    objc_msgSend(v14, "effectiveBundleIdentifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = self;
    if (objc_msgSend(v31, "count") == 1)
    {
      objc_msgSend(v14, "effectiveBundleIdentifiers");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v33, "type") == 3)
      {
        objc_msgSend(v14, "effectiveBundleIdentifiers");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "firstObject");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bundleIdentifier");
        v36 = v27;
        v37 = v12;
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", v16);

        v12 = v37;
        v27 = v36;

        self = v82;
      }
      else
      {
        v39 = 0;
      }

    }
    else
    {
      v39 = 0;
    }

    v40 = v27 | v39;
    if ((v40 & 1) != 0)
    {
      v83 = 0;
    }
    else
    {
      -[WFLinkActionProvider appDescriptorForActionRequest:forceLocalActionsOnly:](self, "appDescriptorForActionRequest:forceLocalActionsOnly:", v12, 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (v41)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v42 = v41;
        else
          v42 = 0;
      }
      else
      {
        v42 = 0;
      }
      v83 = v42;

    }
    v88 = v12;
    v43 = (void *)objc_opt_new();
    objc_msgSend(v14, "requiredCapabilities");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(v14, "requiredCapabilities");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      WFResourceDefinitionsForRequiredCapabilities(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v46, CFSTR("RequiredResources"));

    }
    v97[0] = CFSTR("DisabledOnPlatforms");
    objc_msgSend(v14, "availabilityAnnotations");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLinkActionProvider disabledOnPlatformsWithAvailability:](self, "disabledOnPlatformsWithAvailability:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v48;
    v97[1] = CFSTR("Discontinued");
    v49 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v14, "availabilityAnnotations");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = self;
    v52 = (void *)v50;
    objc_msgSend(v49, "numberWithBool:", -[WFLinkActionProvider isDiscontinuedWithAvailability:](v51, "isDiscontinuedWithAvailability:", v50));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v53;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v98, v97, 2);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "addEntriesFromDictionary:", v54);

    objc_msgSend(v14, "attributionBundleIdentifier");
    v55 = objc_claimAutoreleasedReturnValue();
    v56 = (void *)v55;
    if (v55)
    {
      v95 = *MEMORY[0x1E0DC7920];
      v96 = v55;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v96, &v95, 1);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "setObject:forKeyedSubscript:", v57, CFSTR("LinkActionDisplayedAppDescriptor"));

    }
    v85 = v56;
    objc_msgSend(v14, "shortcutsActionMetadata");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = v58;
    if (v58)
    {
      objc_msgSend(v58, "dictionaryRepresentation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "addEntriesFromDictionary:", v59);
      v60 = v83;
    }
    else
    {
      v60 = v83;
      if ((v40 & 1) != 0)
        goto LABEL_34;
      if (v83)
      {
        objc_msgSend(v83, "serializedRepresentation");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = *MEMORY[0x1E0DC7920];
      }
      else
      {
        v75 = *MEMORY[0x1E0DC7920];
        v93 = *MEMORY[0x1E0DC7920];
        v94 = v87;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v59, "objectForKeyedSubscript:", v75);
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      if (v78)
      {
        v91 = CFSTR("ActionRequiresAppInstallation");
        v92 = MEMORY[0x1E0C9AAB0];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "if_dictionaryByAddingEntriesFromDictionary:", v79);
        v80 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "setObject:forKeyedSubscript:", v80, CFSTR("AppDefinition"));
        v59 = (void *)v80;
      }
    }

LABEL_34:
    objc_msgSend(v14, "attributionBundleIdentifier");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortcutsActionMetadata");
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(v14, "shortcutsActionMetadata");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "attributionBundleIdentifierWithDefaultValue:", v61);
      v64 = objc_claimAutoreleasedReturnValue();

      v61 = (void *)v64;
    }
    objc_msgSend(v90, "bundleIdentifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (objc_class *)objc_msgSend(v14, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v89, v65, v61);

    NSStringFromClass(v66);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "setObject:forKeyedSubscript:", v67, CFSTR("WFContentItemClass"));

    objc_msgSend(v90, "bundleIdentifier");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "actionIdentifier");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    WFShortcutsActionIdentifierFromLinkIdentifiers(v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v70, "length"))
    {
      -[WFActionProvider defaultActionDefinition](v82, "defaultActionDefinition");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "definitionByAddingEntriesInDictionary:", v43);
      v72 = objc_claimAutoreleasedReturnValue();

      v73 = [v81 alloc];
      objc_msgSend(v88, "serializedParameters");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v73, "initWithIdentifier:queryMetadata:entityMetadata:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:", v70, v89, v14, v72, v74, v60, v90);

    }
    else
    {
      getWFAppIntentsLogObject();
      v72 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v90, "actionIdentifier");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v100 = "-[WFLinkActionProvider linkContentItemFilterActionWithActionRequest:fullyQualifiedActionIdentifier:enumMe"
               "tadataByAppIdentifier:entityMetadataByAppIdentifier:entityMetadata:queryMetadata:]";
        v101 = 2112;
        v102 = v76;
        _os_log_impl(&dword_1C15B3000, v72, OS_LOG_TYPE_DEFAULT, "%s Couldn't create a filter action from Link ID %@", buf, 0x16u);

      }
      v30 = 0;
    }
    v28 = v86;

    v12 = v88;
    v15 = v89;
    v16 = v87;
    goto LABEL_45;
  }
  getWFGeneralLogObject();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v13, "actionIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v100 = "-[WFLinkActionProvider linkContentItemFilterActionWithActionRequest:fullyQualifiedActionIdentifier:enumMetada"
           "taByAppIdentifier:entityMetadataByAppIdentifier:entityMetadata:queryMetadata:]";
    v101 = 2112;
    v102 = v29;
    _os_log_impl(&dword_1C15B3000, v28, OS_LOG_TYPE_ERROR, "%s Could not find entity metadata for query: %@", buf, 0x16u);

  }
  v30 = 0;
LABEL_45:

  return v30;
}

- (id)targetedEntityUpdaterActionForRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 enumMetadataByAppIdentifier:(id)a5 entityMetadataByAppIdentifier:(id)a6 localActionsOnly:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  char isKindOfClass;
  void *v34;
  id v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t k;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  _TtC11WorkflowKit29WFTargetedEntityUpdaterAction *v89;
  void *v90;
  void *v91;
  void *v92;
  _TtC11WorkflowKit29WFTargetedEntityUpdaterAction *v93;
  void *v94;
  WFActionDefinition *v95;
  void *v96;
  _BOOL4 v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  WFLinkActionProvider *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  void *v111;
  id v112;
  id v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  id obj;
  id obja;
  id objb;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _QWORD v129[4];
  id v130;
  id v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint64_t v144;
  uint64_t v145;
  uint8_t buf[4];
  const char *v147;
  __int16 v148;
  void *v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v7 = a7;
  v154 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v110 = a6;
  objc_msgSend(v13, "bundleIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "actionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("-"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  objc_msgSend(v18, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = objc_msgSend(v19, "isEqualToString:", CFSTR("UpdatableEntity"));

  if ((_DWORD)v17)
  {
    objc_msgSend(v18, "removeLastObject");
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR("-"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "componentsSeparatedByString:", CFSTR("."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lastObject");
    v22 = objc_claimAutoreleasedReturnValue();

    v111 = (void *)v22;
    -[WFLinkActionProvider entityMetadataByAppBundleIdentifier:entityIdentifier:](self, "entityMetadataByAppBundleIdentifier:entityIdentifier:", v15, v22);
    v23 = (void *)v15;
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    if (v109)
    {
      v98 = v7;
      v103 = v18;
      v108 = v14;
      v105 = v13;
      v106 = v12;
      v118 = (void *)objc_opt_new();
      v104 = self;
      v107 = (void *)v15;
      -[WFLinkActionProvider actionMetadataByAppBundleIdentifier:](self, "actionMetadataByAppBundleIdentifier:", v15);
      v140 = 0u;
      v141 = 0u;
      v142 = 0u;
      v143 = 0u;
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v102, "allValues");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v153, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v141;
        v27 = *MEMORY[0x1E0D43A60];
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v141 != v26)
              objc_enumerationMutation(obj);
            v29 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
            objc_msgSend(v29, "systemProtocolMetadata");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "objectForKeyedSubscript:", v27);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (v31)
            {
              v32 = v31;
              objc_opt_class();
              isKindOfClass = objc_opt_isKindOfClass();
              if ((isKindOfClass & 1) != 0)
                v34 = v32;
              else
                v34 = 0;
              v35 = v34;

              if ((isKindOfClass & 1) != 0)
              {
                objc_msgSend(v32, "entityIdentifier");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = objc_msgSend(v36, "isEqualToString:", v111);

                if (v37)
                {
                  objc_msgSend(v32, "entityProperty");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v118, "setObject:forKey:", v29, v38);

                }
              }

            }
          }
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v140, v153, 16);
        }
        while (v25);
      }

      v39 = (void *)objc_opt_new();
      v40 = (void *)objc_opt_new();
      v136 = 0u;
      v137 = 0u;
      v138 = 0u;
      v139 = 0u;
      objc_msgSend(v109, "properties");
      v112 = (id)objc_claimAutoreleasedReturnValue();
      v121 = v39;
      v116 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
      if (v116)
      {
        v114 = *(_QWORD *)v137;
        do
        {
          for (j = 0; j != v116; ++j)
          {
            if (*(_QWORD *)v137 != v114)
              objc_enumerationMutation(v112);
            v42 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * j);
            objc_msgSend(v42, "identifier");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v118, "objectForKeyedSubscript:", v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v44)
            {
              v119 = j;
              v134 = 0u;
              v135 = 0u;
              v132 = 0u;
              v133 = 0u;
              obja = v44;
              objc_msgSend(v44, "parameters");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
              if (v46)
              {
                v47 = v46;
                v48 = *(_QWORD *)v133;
                do
                {
                  for (k = 0; k != v47; ++k)
                  {
                    if (*(_QWORD *)v133 != v48)
                      objc_enumerationMutation(v45);
                    v50 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * k);
                    objc_msgSend(v50, "name");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    +[WFEntityUpdatingAction entityParameterName](_TtC11WorkflowKit22WFEntityUpdatingAction, "entityParameterName");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v51, "isEqualToString:", v52);

                    if (v53)
                    {
                      objc_msgSend(v50, "name");
                    }
                    else
                    {
                      objc_msgSend(v42, "identifier");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v121, "setObject:forKey:", obja, v54);

                      objc_msgSend(v42, "identifier");
                    }
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "setObject:forKey:", v50, v55);

                  }
                  v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v132, v151, 16);
                }
                while (v47);
              }

              j = v119;
              v39 = v121;
              v44 = obja;
            }

          }
          v116 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v136, v152, 16);
        }
        while (v116);
      }

      objc_msgSend(v40, "allKeys");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "sortedArrayUsingSelector:", sel_compare_);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      v129[0] = MEMORY[0x1E0C809B0];
      v129[1] = 3221225472;
      v129[2] = __168__WFLinkActionProvider_targetedEntityUpdaterActionForRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke;
      v129[3] = &unk_1E7AF9F30;
      objb = v40;
      v130 = objb;
      v131 = v109;
      objc_msgSend(v57, "if_compactMap:", v129);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v107;
      v14 = v108;
      objc_msgSend(v108, "objectForKeyedSubscript:", v107);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v110, "objectForKeyedSubscript:", v107);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v120 = v59;
      if (!v60)
      {
        v61 = v58;
        v62 = (void *)objc_opt_new();
        v125 = 0u;
        v126 = 0u;
        v127 = 0u;
        v128 = 0u;
        -[WFLinkActionProvider metadataProvider](v104, "metadataProvider");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "entitiesForBundleIdentifier:error:", v107, 0);
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
        if (v65)
        {
          v66 = v65;
          v67 = *(_QWORD *)v126;
          do
          {
            for (m = 0; m != v66; ++m)
            {
              if (*(_QWORD *)v126 != v67)
                objc_enumerationMutation(v64);
              v69 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * m);
              objc_msgSend(v69, "identifier");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "setObject:forKey:", v69, v70);

            }
            v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v125, v150, 16);
          }
          while (v66);
        }

        v71 = objc_msgSend(v62, "copy");
        v23 = v107;
        v14 = v108;
        v58 = v61;
        v60 = (void *)v71;
        v59 = v120;
      }
      objc_msgSend(v60, "objectForKeyedSubscript:", v111);
      v72 = objc_claimAutoreleasedReturnValue();
      v117 = v60;
      if (v72)
      {
        v100 = (void *)v72;
        v115 = v57;
        objc_msgSend(v39, "allValues");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "firstObject");
        v74 = v23;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "actionMetadataWithParameters:", v58);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        WFBuildActionMetadataWithProperties(v76, v59, v60);
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        WFUpdatableEntityValueTypeFromEntityUpdaterAction(v77);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "wf_actionMetadataWithOutputType:");
        v78 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v105, "actionIdentifier");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        WFShortcutsActionIdentifierFromLinkIdentifiers(v74, v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        v81 = (void *)objc_opt_new();
        v82 = v80;
        WFLinkActionBundleIdentifierOverrides(v80);
        v83 = objc_claimAutoreleasedReturnValue();
        if (v83
          || (-[NSObject attributionBundleIdentifier](v78, "attributionBundleIdentifier"),
              (v83 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          v144 = *MEMORY[0x1E0DC7920];
          v145 = v83;
          v99 = (void *)v83;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v81;
          objc_msgSend(v81, "setObject:forKeyedSubscript:", v84, CFSTR("LinkActionDisplayedAppDescriptor"));

        }
        else
        {
          v85 = v81;
          v99 = 0;
        }
        -[NSObject systemProtocolMetadata](v78, "systemProtocolMetadata");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "objectForKeyedSubscript:", *MEMORY[0x1E0D43A80]);
        v87 = (void *)objc_claimAutoreleasedReturnValue();

        v113 = v58;
        if (v87)
        {
          v88 = 0;
        }
        else
        {
          -[WFLinkActionProvider appDescriptorForActionRequest:forceLocalActionsOnly:](v104, "appDescriptorForActionRequest:forceLocalActionsOnly:", v106, v98);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          if (v91)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v92 = v91;
            else
              v92 = 0;
          }
          else
          {
            v92 = 0;
          }
          v88 = v92;

        }
        v93 = [_TtC11WorkflowKit29WFTargetedEntityUpdaterAction alloc];
        v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:", v39);
        v95 = -[WFActionDefinition initWithDictionary:]([WFActionDefinition alloc], "initWithDictionary:", v85);
        objc_msgSend(v106, "serializedParameters");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v105;
        v90 = v100;
        v89 = -[WFTargetedEntityUpdaterAction initWithIdentifier:actionMetadata:entityMetadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:](v93, "initWithIdentifier:actionMetadata:entityMetadata:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:", v82, v78, v100, v94, v95, v96, v88, v105);

        v39 = v121;
        v23 = v107;
        v14 = v108;
        v58 = v113;
        v57 = v115;
        v59 = v120;
      }
      else
      {
        v90 = 0;
        getWFGeneralLogObject();
        v78 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315394;
          v147 = "-[WFLinkActionProvider targetedEntityUpdaterActionForRequest:fullyQualifiedActionIdentifier:enumMetadat"
                 "aByAppIdentifier:entityMetadataByAppIdentifier:localActionsOnly:]";
          v148 = 2112;
          v149 = v111;
          _os_log_impl(&dword_1C15B3000, v78, OS_LOG_TYPE_FAULT, "%s Entity Updater action is missing entity metadata for identifier: %@ which is required.", buf, 0x16u);
        }
        v89 = 0;
        v13 = v105;
      }

      v12 = v106;
      v18 = v103;
    }
    else
    {
      v89 = 0;
    }

  }
  else
  {
    v89 = 0;
    v23 = (void *)v15;
  }

  return v89;
}

- (id)settingUpdaterActionForActionRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 enumMetadataByAppIdentifier:(id)a5 entityMetadataByAppIdentifier:(id)a6 localActionsOnly:(BOOL)a7
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_class *v52;
  void *v53;
  id v54;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  objc_class *v63;
  void *v64;
  int v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  objc_class *v72;
  void *v73;
  void *v74;
  int v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  WFActionDefinition *v81;
  void *v82;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  WFLinkActionProvider *v91;
  _BOOL4 v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  id v97;
  id obj;
  id obja;
  int objb;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  _QWORD v106[4];
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  id v117;
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v92 = a7;
  v120 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v97 = a5;
  v95 = v12;
  v96 = a6;
  objc_msgSend(v12, "bundleIdentifier");
  v13 = objc_claimAutoreleasedReturnValue();
  v102 = (void *)objc_opt_new();
  -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entitiesWithError:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v13);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = self;
  v103 = (void *)v13;
  -[WFLinkActionProvider actionMetadataByAppBundleIdentifier:](self, "actionMetadataByAppBundleIdentifier:", v13);
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "allKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v112, v119, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v113;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v113 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v104, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v112 + 1) + 8 * i));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        WFUpdatableEntityValueTypeFromEntityUpdaterAction(v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          objc_msgSend(v105, "objectForKeyedSubscript:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = WFISEligibleForSettingsUpdaterAction(v24, v103);

          if (v25)
          {
            objc_msgSend(v21, "identifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            WFShortcutsActionIdentifierFromLinkIdentifiers(v103, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            WFLinkActionIdentifierFromShortcutsActionIdentifier(v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (+[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:](WFLinkActionProvider, "isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:", v28, v21, 0))
            {
              objc_msgSend(v102, "setObject:forKey:", v21, v23);
            }

          }
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v112, v119, 16);
    }
    while (v18);
  }

  v29 = v102;
  if (objc_msgSend(v102, "count"))
  {
    v94 = v11;
    v101 = (void *)objc_opt_new();
    v30 = (void *)objc_opt_new();
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    objc_msgSend(v102, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v109;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v109 != v33)
            objc_enumerationMutation(obj);
          v35 = *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * j);
          objc_msgSend(v105, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "setObject:forKey:", v36, v35);
          objc_msgSend(v37, "parameters");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "if_firstObjectPassingTest:", &__block_literal_global_201);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v30, "setObject:forKey:", v39, v35);
          v29 = v102;

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
      }
      while (v32);
    }

    objc_msgSend(v30, "allKeys");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sortedArrayUsingSelector:", sel_compare_);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v106[0] = MEMORY[0x1E0C809B0];
    v106[1] = 3221225472;
    v106[2] = __167__WFLinkActionProvider_settingUpdaterActionForActionRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke_2;
    v106[3] = &unk_1E7AF9F78;
    v89 = v30;
    v90 = v41;
    v107 = v89;
    objc_msgSend(v41, "if_compactMap:", v106);
    v42 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "objectForKeyedSubscript:", v103);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "objectForKeyedSubscript:", v103);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "allValues");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "firstObject");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = (void *)v42;
    objc_msgSend(v46, "actionMetadataWithParameters:", v42);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v86 = v44;
    v87 = v43;
    WFBuildActionMetadataWithProperties(v47, v43, v44);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v95;
    objc_msgSend(v95, "actionIdentifier");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    WFShortcutsActionIdentifierFromLinkIdentifiers(v103, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = (objc_class *)objc_opt_class();
    if (objc_msgSend(v103, "isEqualToString:", CFSTR("com.apple.AccessibilityUIServer")))
      v52 = (objc_class *)objc_opt_class();
    v53 = (void *)objc_opt_new();
    WFLinkActionBundleIdentifierOverrides(v51);
    v54 = (id)objc_claimAutoreleasedReturnValue();
    v55 = 0x1E0C99000uLL;
    v85 = v51;
    if (v54 || (v54 = v103) != 0)
    {
      v116 = *MEMORY[0x1E0DC7920];
      v117 = v54;
      v84 = v54;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v117, &v116, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setObject:forKeyedSubscript:", v56, CFSTR("LinkActionDisplayedAppDescriptor"));

    }
    else
    {
      v84 = 0;
    }
    objc_msgSend(v48, "effectiveBundleIdentifiers");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "count") == 1)
    {
      objc_msgSend(v48, "effectiveBundleIdentifiers");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "firstObject");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v59, "type") == 2)
      {
        objc_msgSend(v48, "effectiveBundleIdentifiers");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "firstObject");
        v61 = v53;
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "bundleIdentifier");
        v63 = v52;
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = objc_msgSend(v64, "isEqualToString:", v103);

        v52 = v63;
        v55 = 0x1E0C99000;

        v53 = v61;
        v49 = v95;

      }
      else
      {
        v65 = 0;
      }

    }
    else
    {
      v65 = 0;
    }

    objc_msgSend(v48, "effectiveBundleIdentifiers");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v53;
    if (objc_msgSend(v67, "count") == 1)
    {
      objc_msgSend(v48, "effectiveBundleIdentifiers");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "firstObject");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v69, "type") == 3)
      {
        objc_msgSend(v48, "effectiveBundleIdentifiers");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "firstObject");
        objb = v65;
        v71 = v55;
        v72 = v52;
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "bundleIdentifier");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v74, "isEqualToString:", v103);

        v52 = v72;
        v55 = v71;
        v49 = v95;
        v65 = objb;

        v53 = v93;
      }
      else
      {
        v75 = 0;
      }

    }
    else
    {
      v75 = 0;
    }

    if (((v65 | v75) & 1) != 0)
    {
      v66 = v49;
      v76 = 0;
    }
    else
    {
      -[WFLinkActionProvider appDescriptorForActionRequest:forceLocalActionsOnly:](v91, "appDescriptorForActionRequest:forceLocalActionsOnly:", v94, v92);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (v77)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v78 = v77;
        else
          v78 = 0;
      }
      else
      {
        v78 = 0;
      }
      v66 = v49;
      v76 = v78;

    }
    v79 = [v52 alloc];
    v29 = v102;
    v80 = (void *)objc_msgSend(objc_alloc(*(Class *)(v55 + 3456)), "initWithDictionary:", v102);
    v81 = -[WFActionDefinition initWithDictionary:]([WFActionDefinition alloc], "initWithDictionary:", v53);
    objc_msgSend(v94, "serializedParameters");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    obja = (id)objc_msgSend(v79, "initWithIdentifier:actionMetadata:entityMetadataForParameterIdentifier:metadataForParameterIdentifier:definition:serializedParameters:appIntentDescriptor:fullyQualifiedActionIdentifier:", v85, v48, v101, v80, v81, v82, v76, v66);

    v11 = v94;
  }
  else
  {
    obja = 0;
    v66 = v95;
  }

  return obja;
}

- (id)getAppSettingActionForRequest:(id)a3 fullyQualifiedActionIdentifier:(id)a4 entityMetadataByAppIdentifier:(id)a5 localActionsOnly:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  WFLinkActionProvider *v50;
  void *v51;
  int v52;
  WFLinkActionProvider *v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  objc_class *v63;
  id v64;
  void *v65;
  int v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  WFLinkActionProvider *v72;
  WFLinkActionProvider *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  _QWORD v79[4];
  id v80;
  id v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  const __CFString *v87;
  uint64_t v88;
  uint64_t v89;
  id v90;
  uint64_t v91;
  id v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v75 = v10;
    v13 = v9;
    v12 = (void *)objc_opt_new();
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v86 = 0u;
    v72 = self;
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "entitiesForBundleIdentifier:error:", v11, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v84;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v84 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
          objc_msgSend(v20, "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKey:", v20, v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
      }
      while (v17);
    }

    v9 = v13;
    self = v72;
    v10 = v75;
  }
  v22 = (void *)objc_opt_new();
  objc_msgSend(v12, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __132__WFLinkActionProvider_getAppSettingActionForRequest_fullyQualifiedActionIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke;
  v79[3] = &unk_1E7AF9FA0;
  v77 = v12;
  v80 = v77;
  v24 = v11;
  v81 = v24;
  v25 = v22;
  v82 = v25;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", v79);

  if (objc_msgSend(v25, "count"))
  {
    objc_msgSend(v9, "actionIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    WFShortcutsActionIdentifierFromLinkIdentifiers(v24, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v78;
    if (objc_msgSend(v27, "length"))
    {
      v29 = (void *)objc_opt_new();
      WFLinkActionBundleIdentifierOverrides(v27);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      v31 = (uint64_t *)MEMORY[0x1E0DC7920];
      if (v30 || (v30 = v24) != 0)
      {
        v91 = *v31;
        v92 = v30;
        v68 = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("LinkActionDisplayedAppDescriptor"));

      }
      else
      {
        v68 = 0;
      }
      objc_msgSend(v77, "allValues");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "effectiveBundleIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v27;
      v70 = v34;
      v71 = v29;
      v76 = v10;
      if (objc_msgSend(v35, "count") == 1)
      {
        objc_msgSend(v34, "effectiveBundleIdentifiers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "firstObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v37, "type") == 2)
        {
          objc_msgSend(v34, "effectiveBundleIdentifiers");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "firstObject");
          v73 = self;
          v39 = v9;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "bundleIdentifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isEqualToString:", v24);

          v43 = v42;
          v9 = v39;
          self = v73;

          v34 = v70;
        }
        else
        {
          v43 = 0;
        }

        v28 = v78;
        v10 = v76;
      }
      else
      {
        v43 = 0;
      }

      objc_msgSend(v34, "effectiveBundleIdentifiers");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "count") == 1)
      {
        objc_msgSend(v34, "effectiveBundleIdentifiers");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "firstObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "type") == 3)
        {
          objc_msgSend(v34, "effectiveBundleIdentifiers");
          v67 = v43;
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "firstObject");
          v74 = v9;
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "bundleIdentifier");
          v50 = self;
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "isEqualToString:", v24);

          self = v50;
          v9 = v74;

          v43 = v67;
        }
        else
        {
          v52 = 0;
        }

        v28 = v78;
        v10 = v76;
      }
      else
      {
        v52 = 0;
      }

      if (((v43 | v52) & 1) == 0)
      {
        v53 = self;
        -[WFLinkActionProvider appDescriptorForActionRequest:forceLocalActionsOnly:](self, "appDescriptorForActionRequest:forceLocalActionsOnly:", v28, 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (v54 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v55 = v54;

          objc_msgSend(v55, "serializedRepresentation");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = *MEMORY[0x1E0DC7920];
        }
        else
        {

          v57 = *MEMORY[0x1E0DC7920];
          v89 = *MEMORY[0x1E0DC7920];
          v90 = v24;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v55 = 0;
        }
        objc_msgSend(v56, "objectForKeyedSubscript:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v58)
        {
          v87 = CFSTR("ActionRequiresAppInstallation");
          v88 = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "if_dictionaryByAddingEntriesFromDictionary:", v59);
          v60 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v71, "setObject:forKeyedSubscript:", v60, CFSTR("AppDefinition"));
          v56 = (void *)v60;
        }

        self = v53;
      }
      -[WFActionProvider defaultActionDefinition](self, "defaultActionDefinition");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "definitionByAddingEntriesInDictionary:", v71);
      v62 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = (objc_class *)objc_opt_class();
      if (objc_msgSend(v24, "isEqualToString:", CFSTR("com.apple.AccessibilityUIServer")))
        v63 = (objc_class *)objc_opt_class();
      v27 = v69;
      v64 = [v63 alloc];
      objc_msgSend(v28, "serializedParameters");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = (void *)objc_msgSend(v64, "initWithIdentifier:definition:entityByEntityIdentifier:serializedParameters:fullyQualifiedActionIdentifier:", v69, v62, v25, v65, v9);

    }
    else
    {
      v44 = 0;
    }

  }
  else
  {
    v44 = 0;
    v28 = v78;
  }

  return v44;
}

- (NSDictionary)actionMetadataByAppIdentifier
{
  NSDictionary *actionMetadataByAppIdentifier;
  void *v4;
  NSDictionary *v5;
  id v6;
  NSDictionary *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  actionMetadataByAppIdentifier = self->_actionMetadataByAppIdentifier;
  if (!actionMetadataByAppIdentifier)
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "actionsWithError:", &v10);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v7 = self->_actionMetadataByAppIdentifier;
    self->_actionMetadataByAppIdentifier = v5;

    if (!self->_actionMetadataByAppIdentifier)
    {
      getWFActionsLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFLinkActionProvider actionMetadataByAppIdentifier]";
        v13 = 2114;
        v14 = v6;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get actions from metadata provider %{public}@", buf, 0x16u);
      }

    }
    actionMetadataByAppIdentifier = self->_actionMetadataByAppIdentifier;
  }
  return actionMetadataByAppIdentifier;
}

- (NSDictionary)enumMetadataByAppIdentifier
{
  NSDictionary *enumMetadataByAppIdentifier;
  void *v4;
  NSDictionary *v5;
  id v6;
  NSDictionary *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  enumMetadataByAppIdentifier = self->_enumMetadataByAppIdentifier;
  if (!enumMetadataByAppIdentifier)
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "enumsWithError:", &v10);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v7 = self->_enumMetadataByAppIdentifier;
    self->_enumMetadataByAppIdentifier = v5;

    if (!self->_enumMetadataByAppIdentifier)
    {
      getWFActionsLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFLinkActionProvider enumMetadataByAppIdentifier]";
        v13 = 2114;
        v14 = v6;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get enums from metadata provider %{public}@", buf, 0x16u);
      }

    }
    enumMetadataByAppIdentifier = self->_enumMetadataByAppIdentifier;
  }
  return enumMetadataByAppIdentifier;
}

- (NSDictionary)entityMetadataByAppIdentifier
{
  NSDictionary *entityMetadataByAppIdentifier;
  void *v4;
  NSDictionary *v5;
  id v6;
  NSDictionary *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  entityMetadataByAppIdentifier = self->_entityMetadataByAppIdentifier;
  if (!entityMetadataByAppIdentifier)
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v4, "entitiesWithError:", &v10);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v7 = self->_entityMetadataByAppIdentifier;
    self->_entityMetadataByAppIdentifier = v5;

    if (!self->_entityMetadataByAppIdentifier)
    {
      getWFActionsLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "-[WFLinkActionProvider entityMetadataByAppIdentifier]";
        v13 = 2114;
        v14 = v6;
        _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s Unable to get entities from metadata provider %{public}@", buf, 0x16u);
      }

    }
    entityMetadataByAppIdentifier = self->_entityMetadataByAppIdentifier;
  }
  return entityMetadataByAppIdentifier;
}

- (NSDictionary)queryMetadataByAppIdentifier
{
  NSDictionary *queryMetadataByAppIdentifier;
  void *v4;
  void *v5;
  id v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  queryMetadataByAppIdentifier = self->_queryMetadataByAppIdentifier;
  if (!queryMetadataByAppIdentifier)
  {
    -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v4, "queriesWithError:", &v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v11;
    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_214_65928);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_queryMetadataByAppIdentifier;
    self->_queryMetadataByAppIdentifier = v7;

    if (!self->_queryMetadataByAppIdentifier)
    {
      getWFActionsLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = "-[WFLinkActionProvider queryMetadataByAppIdentifier]";
        v14 = 2114;
        v15 = v6;
        _os_log_impl(&dword_1C15B3000, v9, OS_LOG_TYPE_ERROR, "%s Unable to get queries from metadata provider %{public}@", buf, 0x16u);
      }

    }
    queryMetadataByAppIdentifier = self->_queryMetadataByAppIdentifier;
  }
  return queryMetadataByAppIdentifier;
}

- (id)customIntentMigratedActionIdentifierWithLaunchId:(id)a3 className:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *);
  void *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WFLinkActionProvider metadataProvider](self, "metadataProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v8, "actionsForBundleIdentifier:error:", v6, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;

  if (v9)
  {
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __83__WFLinkActionProvider_customIntentMigratedActionIdentifierWithLaunchId_className___block_invoke;
    v20 = &unk_1E7AF9DB8;
    v21 = v7;
    objc_msgSend(v9, "if_firstObjectPassingTest:", &v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "identifier", v17, v18, v19, v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      WFShortcutsActionIdentifierFromLinkIdentifiers(v6, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

    v15 = v21;
  }
  else
  {
    getWFActionsLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "-[WFLinkActionProvider customIntentMigratedActionIdentifierWithLaunchId:className:]";
      v25 = 2114;
      v26 = v6;
      v27 = 2114;
      v28 = v10;
      _os_log_impl(&dword_1C15B3000, v15, OS_LOG_TYPE_ERROR, "%s Unable to get actions for %{public}@: %{public}@", buf, 0x20u);
    }
    v14 = 0;
  }

  return v14;
}

- (BOOL)isObservingInstalledApplicationsChanges
{
  return self->_observingInstalledApplicationsChanges;
}

- (void)setObservingInstalledApplicationsChanges:(BOOL)a3
{
  self->_observingInstalledApplicationsChanges = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (INSystemAppMapper)systemAppMapper
{
  return self->_systemAppMapper;
}

- (os_unfair_lock_s)actionRequestsLock
{
  return self->_actionRequestsLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemAppMapper, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_queryMetadataByAppIdentifier, 0);
  objc_storeStrong((id *)&self->_entityMetadataByAppIdentifier, 0);
  objc_storeStrong((id *)&self->_enumMetadataByAppIdentifier, 0);
  objc_storeStrong((id *)&self->_actionMetadataByAppIdentifier, 0);
}

uint64_t __83__WFLinkActionProvider_customIntentMigratedActionIdentifierWithLaunchId_className___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "customIntentClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __52__WFLinkActionProvider_queryMetadataByAppIdentifier__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _QWORD *a5)
{
  id result;

  objc_msgSend(a3, "if_compactMap:", &__block_literal_global_216_65931);
  result = (id)objc_claimAutoreleasedReturnValue();
  *a5 = result;
  return result;
}

id __52__WFLinkActionProvider_queryMetadataByAppIdentifier__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  id result;

  objc_msgSend(a3, "entityType");
  result = (id)objc_claimAutoreleasedReturnValue();
  *a4 = result;
  return result;
}

void __132__WFLinkActionProvider_getAppSettingActionForRequest_fullyQualifiedActionIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && WFISEligibleForSettingsUpdaterAction(v3, a1[5]))
  {
    v5 = a1[5];
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WFShortcutsActionIdentifierFromLinkIdentifiers(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    WFLinkActionIdentifierFromShortcutsActionIdentifier(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:](WFLinkActionProvider, "isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:", v8, v4, 0))
    {
      objc_msgSend(a1[6], "setObject:forKey:", v4, v9);
    }

  }
}

id __167__WFLinkActionProvider_settingUpdaterActionForActionRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D43BB8]);
  objc_msgSend(v4, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isOptional");
  objc_msgSend(v4, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvableInputTypes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeSpecificMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v5, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:", v3, v6, v7, v8, v9, v10, v11, objc_msgSend(v4, "dynamicOptionsSupport"), objc_msgSend(v4, "inputConnectionBehavior"));

  return v12;
}

uint64_t __167__WFLinkActionProvider_settingUpdaterActionForActionRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("property"));

  return v3;
}

id __168__WFLinkActionProvider_targetedEntityUpdaterActionForRequest_fullyQualifiedActionIdentifier_enumMetadataByAppIdentifier_entityMetadataByAppIdentifier_localActionsOnly___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "dynamicOptionsSupport");
  +[WFEntityUpdatingAction entityParameterName](_TtC11WorkflowKit22WFEntityUpdatingAction, "entityParameterName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", v6) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "systemProtocolMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D43A00]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v5 = 0;
  }
  else
  {

  }
  v9 = objc_alloc(MEMORY[0x1E0D43BB8]);
  objc_msgSend(v4, "valueType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "isOptional");
  objc_msgSend(v4, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resolvableInputTypes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "typeSpecificMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v9, "initWithName:valueType:optional:title:description:resolvableInputTypes:typeSpecificMetadata:dynamicOptionsSupport:inputConnectionBehavior:capabilities:", v3, v10, v11, v12, v13, v14, v15, v5, objc_msgSend(v4, "inputConnectionBehavior"), objc_msgSend(v4, "capabilities"));

  return v16;
}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v5 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_2;
  v8[3] = &unk_1E7AF9E80;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v7 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_5;
  v7[3] = &unk_1E7AF9ED0;
  v8 = v5;
  v9 = *(id *)(a1 + 32);
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WFShortcutsActionIdentifierFromLinkIdentifiers(*(void **)(a1 + 32), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    if (WFQueryMetadataIsEligibleForAction(v6, *(void **)(a1 + 32)))
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else
  {
    getWFAppIntentsLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 136315650;
      v11 = "-[WFLinkActionProvider availableActionIdentifiers]_block_invoke_5";
      v12 = 2112;
      v13 = v9;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_DEFAULT, "%s Couldn't create a find action for %@ %@", (uint8_t *)&v10, 0x20u);
    }

  }
}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "entityMetadataByAppIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  WFEffectiveActionIdentifiersForActionMetadata(v5, v8, *(void **)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_3;
  v9[3] = &unk_1E7AF9E58;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __50__WFLinkActionProvider_availableActionIdentifiers__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  WFShortcutsActionIdentifierFromLinkIdentifiers(*(void **)(a1 + 32), a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

uint64_t __75__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_queryIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __75__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_queryIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __76__WFLinkActionProvider_queryMetadataByAppBundleIdentifier_entityIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "entityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __73__WFLinkActionProvider_enumMetadataByAppBundleIdentifier_enumIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __77__WFLinkActionProvider_entityMetadataByAppBundleIdentifier_entityIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __77__WFLinkActionProvider_actionMetadataByAppBundleIdentifier_actionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

void __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_2(void **a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;

  WFEffectiveActionIdentifiersForActionMetadata(a2, a1[4], a1[5]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_3;
  v4[3] = &unk_1E7AF9D28;
  v5 = a1[6];
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v4);

}

uint64_t __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "result");
}

uint64_t __57__WFLinkActionProvider_createActionsForBundleIdentifier___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_5(uint64_t a1, void *a2, uint64_t a3)
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
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 72), "objectForKeyedSubscript:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && WFQueryMetadataIsEligibleForAction(v13, v7))
    {
      objc_msgSend(*(id *)(a1 + 48), "linkContentItemFilterActionWithActionRequest:fullyQualifiedActionIdentifier:enumMetadataByAppIdentifier:entityMetadataByAppIdentifier:entityMetadata:queryMetadata:", v5, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v23, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      getWFActionsLogObject();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v25 = "-[WFLinkActionProvider createActionsForRequests:allowsActionInDenyList:forceLocalActionsOnly:]_block_invoke";
        v26 = 2112;
        v27 = v15;
        _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_DEFAULT, "%s Created WFLinkContentItemFilterAction: %@", buf, 0x16u);
      }

      if (v15)
        objc_msgSend(v5, "setResult:", v15);

    }
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("WFAppSettingEntityUpdaterAction")))
    {
      objc_msgSend(*(id *)(a1 + 48), "settingUpdaterActionForActionRequest:fullyQualifiedActionIdentifier:enumMetadataByAppIdentifier:entityMetadataByAppIdentifier:localActionsOnly:", v5, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80));
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("WFGetAppSettingAction")))
    {
      objc_msgSend(*(id *)(a1 + 48), "getAppSettingActionForRequest:fullyQualifiedActionIdentifier:entityMetadataByAppIdentifier:localActionsOnly:", v5, v6, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80));
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "actionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("-"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqualToString:", CFSTR("UpdatableEntity"));

      if (!v21)
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(*(id *)(a1 + 48), "targetedEntityUpdaterActionForRequest:fullyQualifiedActionIdentifier:enumMetadataByAppIdentifier:entityMetadataByAppIdentifier:localActionsOnly:", v5, v6, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80));
      v17 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v17;
    if (v17)
      objc_msgSend(v5, "setResult:", v17);

    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 48), "linkActionWithActionRequest:fullyQualifiedActionIdentifier:actionMetadataByAppIdentifier:enumMetadataByAppIdentifier:entityMetadataByAppIdentifier:forceLocalActionsOnly:", v5, v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 80));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v5, "setResult:", v11);

  }
LABEL_21:

}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "attributionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "shortcutsActionMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v13, "shortcutsActionMetadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributionBundleIdentifierWithDefaultValue:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v7;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v13, "wf_contentItemClassWithQueryMetadata:appBundleIdentifier:displayedAppBundleIdentifier:", v10, *(_QWORD *)(a1 + 40), v4);

  objc_msgSend(MEMORY[0x1E0D13ED0], "sharedRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerContentItemClass:", v11);

}

void __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_2;
  v6[3] = &unk_1E7AF9C58;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v6);

}

uint64_t __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_148(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

uint64_t __94__WFLinkActionProvider_createActionsForRequests_allowsActionInDenyList_forceLocalActionsOnly___block_invoke_146(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdentifier");
}

+ (BOOL)isFullyQualifiedActionIdentifier:(id)a3 withMetadata:(id)a4 visibleForUse:(int64_t)a5
{
  id v8;
  id v9;
  int v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  int v24;
  const char *v25;
  __int16 v26;
  void *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = VCIsInternalBuild();
  if (a5 || !v10 || (objc_msgSend(MEMORY[0x1E0C99EA0], "showAllAppIntents") & 1) == 0)
  {
    v28 = CFSTR("com.apple.SafariTechnologyPreview");
    v29[0] = *MEMORY[0x1E0DC7F40];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v8, "bundleIdentifier");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v8, "actionIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    WFShortcutsActionIdentifierFromLinkIdentifiers(v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[WFLinkActionProvider shouldAllowActionWithIdentifier:](WFLinkActionProvider, "shouldAllowActionWithIdentifier:", v19))
    {
      if (a5 || !objc_msgSend(a1, "restrictIdentifierToAssistantOnly:", v19))
      {
        if (v9)
        {
          getWFActionsLogObject();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v24 = 136315394;
            v25 = "+[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:]";
            v26 = 2112;
            v27 = v19;
            _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_DEBUG, "%s visibleForUse using metadata %@", (uint8_t *)&v24, 0x16u);
          }

          v11 = objc_msgSend(v9, "visibleForUse:", a5);
        }
        else
        {
          v11 = 1;
        }
        goto LABEL_22;
      }
      getWFActionsLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v24 = 136315394;
        v25 = "+[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:]";
        v26 = 2112;
        v27 = v19;
        v21 = "%s visibleForUse Shortcuts OVERRIDDEN %@";
LABEL_15:
        _os_log_impl(&dword_1C15B3000, v20, OS_LOG_TYPE_DEBUG, v21, (uint8_t *)&v24, 0x16u);
      }
    }
    else
    {
      getWFActionsLogObject();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v24 = 136315394;
        v25 = "+[WFLinkActionProvider isFullyQualifiedActionIdentifier:withMetadata:visibleForUse:]";
        v26 = 2112;
        v27 = v19;
        v21 = "%s visibleForUse always denied %@";
        goto LABEL_15;
      }
    }

    v11 = 0;
LABEL_22:

    goto LABEL_23;
  }
  v11 = 1;
LABEL_23:

  return v11;
}

void __55__WFLinkActionProvider_denyListedLinkActionIdentifiers__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[72];

  v4[71] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("com.apple.shortcuts.OpenWorkflowAction");
  v4[1] = CFSTR("com.apple.mobilenotes.OpenFolderLinkAction");
  v4[2] = CFSTR("com.apple.VoiceMemos.OpenUIElement");
  v4[3] = CFSTR("com.apple.VoiceMemos.CloseUIElement");
  v4[4] = CFSTR("com.apple.VoiceMemos.System.SynthesizedCopyEntityAction<RCRecordingEntity>");
  v4[5] = CFSTR("com.apple.mobilemail.CreateMessageAction");
  v4[6] = CFSTR("com.apple.mobilemail.OpenMessageEntityAction");
  v4[7] = CFSTR("com.apple.mobilemail.OpenDisplayableEntityAction");
  v4[8] = CFSTR("com.apple.mobilemail.NavigateMessagesAction");
  v4[9] = CFSTR("com.apple.mobilemail.DeleteMessageEntityAction");
  v4[10] = CFSTR("com.apple.mobilemail.ChangeFilterStateAction");
  v4[11] = CFSTR("com.apple.mobilemail.MailMessageEntity");
  v4[12] = CFSTR("com.apple.mobilemail.SendMail");
  v4[13] = CFSTR("com.apple.mobilemail.SetMailMessageIsRead");
  v4[14] = CFSTR("com.apple.Music.PausePlaybackAppIntent");
  v4[15] = CFSTR("com.apple.Music.StartPlaybackAppIntent");
  v4[16] = CFSTR("com.apple.Music.SkipItemPlaybackAppIntent");
  v4[17] = CFSTR("com.apple.Music.TogglePlaybackAppIntent");
  v4[18] = CFSTR("com.apple.podcasts.PlayPauseWidgetIntent");
  v4[19] = CFSTR("com.apple.tv.StartSportsActivityIntent");
  v4[20] = CFSTR("com.apple.tv.DestroySportsActivityIntent");
  v4[21] = CFSTR("com.apple.PeopleViewService.URLAppIntent");
  v4[22] = CFSTR("com.apple.mobileslideshow.Delete");
  v4[23] = CFSTR("com.apple.mobileslideshow.Open");
  v4[24] = CFSTR("com.apple.mobileslideshow.Favorite");
  v4[25] = CFSTR("com.apple.mobileslideshow.SearchGlobal");
  v4[26] = CFSTR("com.apple.mobileslideshow.CreateUserAlbum");
  v4[27] = CFSTR("com.apple.mobileslideshow.NavigateSequentiallyOneUp");
  v4[28] = CFSTR("com.apple.mobileslideshow.OpenSystemAlbum");
  v4[29] = CFSTR("com.apple.mobileslideshow.OpenUserAlbum");
  v4[30] = CFSTR("com.apple.mobileslideshow.OpenDestination");
  v4[31] = CFSTR("com.apple.mobilecal.Close");
  v4[32] = CFSTR("com.apple.mobilecal.Cancel");
  v4[33] = CFSTR("com.apple.mobilecal.NavigateScreenSequentiallyAction");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[34] = CFSTR("com.apple.mobilecal.OpenScreen");
  v4[35] = CFSTR("com.apple.mobilecal.ChangeCalendarBinarySetting");
  v4[36] = CFSTR("com.apple.mobilecal.Cancel");
  v4[37] = CFSTR("com.apple.mobilecal.DeleteCalendar");
  v4[38] = CFSTR("com.apple.mobilecal.CreateCalendar");
  v4[39] = CFSTR("com.apple.reminders.TTROpenListAppIntent");
  v4[40] = CFSTR("com.apple.news.OpenSplitViewIntent");
  v4[41] = CFSTR("com.apple.news.CloseSplitViewIntent");
  v4[42] = CFSTR("com.apple.news.ArticleNavigateIntent");
  v4[43] = CFSTR("com.apple.news.FeedArticleOpenIntent");
  v4[44] = CFSTR("com.apple.news.FollowingAppEntityOpenIntent");
  v4[45] = CFSTR("com.apple.news.TabBarItemOpenIntent");
  v4[46] = CFSTR("com.apple.news.SearchAppIntent");
  v4[47] = CFSTR("com.apple.stocks.SymbolAppOpenIntent");
  v4[48] = CFSTR("com.apple.stocks.OpenTodayAppIntent");
  v4[49] = CFSTR("com.apple.stocks.FeedArticleOpenIntent");
  v4[50] = CFSTR("com.apple.stocks.AddSymbolAppIntent");
  v4[51] = CFSTR("com.apple.stocks.OpenSplitViewSiriLinkAction");
  v4[52] = CFSTR("com.apple.stocks.CloseSplitViewSiriLinkAction");
  v4[53] = CFSTR("com.apple.stocks.ArticleNavigateIntent");
  v4[54] = CFSTR("com.apple.stocks.SearchSiriLinkAction");
  v4[55] = CFSTR("com.apple.mobilesafari.CreateNewBookmark");
  v4[56] = CFSTR("com.apple.mobilesafari.WebSearch");
  v4[57] = CFSTR("com.apple.weather.OpenSearchResultAction");
  v4[58] = CFSTR("com.apple.weather.OpenSidebarAction");
  v4[59] = CFSTR("com.apple.weather.CloseSidebarAction");
  v4[60] = CFSTR("com.apple.weather.CloseLocationL2ViewAction");
  v4[61] = CFSTR("com.apple.weather.CancelAction");
  v4[62] = CFSTR("com.apple.weather.DeleteLocationAction");
  v4[63] = CFSTR("com.apple.weather.NavigateLocationsAction");
  v4[64] = CFSTR("com.apple.weather.OpenLocationAction");
  v4[65] = CFSTR("com.apple.weather.OpenLocationL2ViewAction");
  v4[66] = CFSTR("com.apple.weather.OpenMyLocationAction");
  v4[67] = CFSTR("com.apple.weather.OpenListAction");
  v4[68] = CFSTR("com.apple.weather.SearchLocationAction");
  v4[69] = CFSTR("com.apple.tips.NavigateTipsAction");
  v4[70] = CFSTR("com.apple.mobiletimer.OpenAlarmIntent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 71);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)denyListedLinkActionIdentifiers_denyListedLinkActionIdentifiers;
  denyListedLinkActionIdentifiers_denyListedLinkActionIdentifiers = v2;

}

void __38__WFLinkActionProvider_sharedProvider__block_invoke()
{
  WFLinkActionProvider *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [WFLinkActionProvider alloc];
  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D44200]), "initWithOptions:", 2);
  v1 = -[WFLinkActionProvider initWithMetadataProvider:](v0, "initWithMetadataProvider:", v3);
  v2 = (void *)sharedProvider_sharedProvider;
  sharedProvider_sharedProvider = v1;

}

@end
