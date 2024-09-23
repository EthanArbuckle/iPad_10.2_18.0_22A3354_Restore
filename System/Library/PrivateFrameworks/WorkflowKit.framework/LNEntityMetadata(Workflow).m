@implementation LNEntityMetadata(Workflow)

- (objc_class)wf_contentItemClassWithQueryMetadata:()Workflow appBundleIdentifier:displayedAppBundleIdentifier:
{
  id v9;
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  Class v17;
  objc_class *v18;
  objc_class *v19;
  NSString *v20;
  Class ClassPair;
  objc_class *v22;
  uint64_t v23;
  void (**v24)(void *, objc_class *, char *, void *);
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD aBlock[5];
  _QWORD v48[5];

  v48[3] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNEntityMetadata+Workflow.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

  }
  v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = v13;
  v48[1] = v10;
  objc_msgSend(a1, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v48[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "componentsJoinedByString:", CFSTR("_"));
  v16 = (NSString *)objc_claimAutoreleasedReturnValue();
  v17 = NSClassFromString(v16);
  if (v17)
  {
    v18 = v17;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&classRegistrationLock_45080);
    v20 = objc_retainAutorelease(v16);
    ClassPair = objc_allocateClassPair(v12, -[NSString cStringUsingEncoding:](v20, "cStringUsingEncoding:", 4), 0);
    if (ClassPair)
    {
      v22 = ClassPair;
      aBlock[0] = MEMORY[0x1E0C809B0];
      v23 = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke;
      aBlock[3] = &__block_descriptor_40_e14_B32__0_8_16_24lu32l8;
      aBlock[4] = v12;
      v24 = (void (**)(void *, objc_class *, char *, void *))_Block_copy(aBlock);
      v25 = a1;
      v26 = v23;
      v45[0] = v23;
      v45[1] = 3221225472;
      v45[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_2;
      v45[3] = &unk_1E7AF48A8;
      v46 = v25;
      v37 = v25;
      v27 = _Block_copy(v45);
      v24[2](v24, v22, sel_entityMetadata, v27);

      v43[0] = v26;
      v43[1] = 3221225472;
      v43[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_3;
      v43[3] = &unk_1E7AF48D0;
      v44 = v9;
      v28 = _Block_copy(v43);
      v24[2](v24, v22, sel_queryMetadata, v28);

      v41[0] = v26;
      v41[1] = 3221225472;
      v41[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_4;
      v41[3] = &unk_1E7AF48F8;
      v29 = v10;
      v42 = v29;
      v30 = _Block_copy(v41);
      v24[2](v24, v22, sel_appBundleIdentifier, v30);

      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __116__LNEntityMetadata_Workflow__wf_contentItemClassWithQueryMetadata_appBundleIdentifier_displayedAppBundleIdentifier___block_invoke_5;
      v38[3] = &unk_1E7AF4920;
      v39 = v11;
      v31 = v29;
      v40 = v31;
      v32 = _Block_copy(v38);
      v24[2](v24, v22, sel_displayedAppBundleIdentifier, v32);

      v33 = (void *)MEMORY[0x1E0D43C98];
      objc_msgSend(v37, "identifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "wf_addDescriptionMethodsToClass:withEntityType:appBundleIdentifier:", v22, v34, v31);

      objc_registerClassPair(v22);
      os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock_45080);
      v19 = v22;

      goto LABEL_8;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock_45080);
    NSClassFromString(v20);
    v18 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;
LABEL_8:

  return v19;
}

@end
