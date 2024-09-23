@implementation _UIApplicationSceneRequestBuilder

- (void)buildWorkspaceRequestOptionsForRequest:(id)a3 withContinuation:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  void (**v20)(id, _QWORD, id);
  uint64_t *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  if (self)
  {
    v8 = v6;
    -[_UIApplicationSceneRequestBuilder _specification](self, "_specification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v9, "clientSettingsClass"), "settings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    -[_UIApplicationSceneRequestBuilder _customizeInitialClientSettings:usingRequest:](self, "_customizeInitialClientSettings:usingRequest:", v11, v8);
    v12 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v12 = 0;
  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  objc_msgSend(v6, "options");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  -[_UIApplicationSceneRequestBuilder _optionsWithInitialClientSettings:activationOptions:targetSession:optionsClass:outError:](self, "_optionsWithInitialClientSettings:activationOptions:targetSession:optionsClass:outError:", v12, v13, v14, -[_UIApplicationSceneRequestBuilder _requestOptionsClass](self, "_requestOptionsClass"), &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  v28 = v15;

  if (v16)
  {
    v7[2](v7, 0, v16);
  }
  else
  {
    -[_UIApplicationSceneRequestBuilder _customizeWorkspaceRequestOptions:usingRequest:](self, "_customizeWorkspaceRequestOptions:usingRequest:", v24[5], v6);
    objc_msgSend(v6, "userActivity");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v6, "userActivity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __93___UIApplicationSceneRequestBuilder_buildWorkspaceRequestOptionsForRequest_withContinuation___block_invoke;
      v19[3] = &unk_1E16B15A8;
      v20 = v7;
      v21 = &v23;
      +[UISActivityContinuationAction buildWithUserActivity:completion:](UIActivityContinuationAction, "buildWithUserActivity:completion:", v18, v19);

    }
    else
    {
      v7[2](v7, v24[5], 0);
    }
  }
  _Block_object_dispose(&v23, 8);

}

- (id)_specification
{
  return +[FBSSceneSpecification specification](UIApplicationSceneSpecification, "specification");
}

- (Class)_requestOptionsClass
{
  return (Class)objc_opt_class();
}

- (id)_optionsWithInitialClientSettings:(id)a3 activationOptions:(id)a4 targetSession:(id)a5 optionsClass:(Class)a6 outError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id *v32;
  void *v33;
  id v34;

  v12 = a4;
  v13 = a5;
  v14 = a3;
  v15 = objc_alloc_init(a6);
  objc_msgSend(v15, "setInitialClientSettings:", v14);

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v13, "persistentIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIdentifier:", v17);

  }
  if (v12)
  {
    objc_msgSend(v12, "requestingScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "session");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "persistentIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setSourceIdentifier:", v20);

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v32 = a7;
      v21 = v12;
      objc_msgSend(v21, "_interactionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setInteractionIdentifier:", v22);

      objc_msgSend(v21, "_quickLookSceneConfiguration");
      v23 = objc_claimAutoreleasedReturnValue();
      v24 = (void *)v23;
      if (!v13 && v23)
      {
        objc_msgSend(v15, "setRequestQuickLookScene:", 1);
        +[UIQuickLookSceneConfigurationAction actionWithSceneConfiguration:](UIQuickLookSceneConfigurationAction, "actionWithSceneConfiguration:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v25);

      }
      v33 = v24;
      objc_msgSend(v15, "setPreserveLayout:", objc_msgSend(v21, "_effectivelyWantsPreservedLayout"));
      objc_msgSend(v15, "setRequestFullscreen:", objc_msgSend(v21, "_effectivelyWantsFullscreen"));
      objc_msgSend(v15, "setRequestCenterSlot:", objc_msgSend(v21, "_effectivelyWantsProminence"));
      objc_msgSend(v15, "setRequestBackground:", objc_msgSend(v21, "_effectivelyWantsBackground"));
      objc_msgSend(v21, "placement");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26
        || ((objc_msgSend(v15, "preserveLayout") & 1) != 0
         || (objc_msgSend(v15, "requestFullscreen") & 1) != 0
         || (objc_msgSend(v15, "requestCenterSlot") & 1) != 0
         || objc_msgSend(v15, "requestBackground"))
        && (_UIWindowScenePlacementForLegacyFlags(objc_msgSend(v15, "requestFullscreen"), objc_msgSend(v15, "requestCenterSlot"), objc_msgSend(v15, "preserveLayout"), objc_msgSend(v15, "requestBackground")), (v26 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        v34 = 0;
        objc_msgSend(v26, "_createConfigurationWithError:", &v34);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v34;
        objc_msgSend(v15, "setScenePlacementConfiguration:", v27);

        if (v28)
          *v32 = objc_retainAutorelease(v28);

      }
    }
    else
    {
      objc_msgSend(v15, "setRequestFullscreen:", objc_msgSend(v12, "_requestFullscreen"));
      objc_msgSend(v15, "setPreserveLayout:", objc_msgSend(v12, "preserveLayout"));
    }

  }
  -[_UIApplicationSceneRequestBuilder _specification](self, "_specification");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setSpecification:", v29);

  v30 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v15, "setActions:", v30);

  return v15;
}

@end
