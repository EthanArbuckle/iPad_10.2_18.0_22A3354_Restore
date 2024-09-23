@implementation LNEnumMetadata(Workflow)

- (id)wf_contentItemClassWithAppBundleIdentifier:()Workflow
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("LNEnumMetadata+Workflow.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appBundleIdentifier"));

  }
  objc_msgSend(a1, "wf_contentItemClassWithAppBundleIdentifier:superclass:", v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (objc_class)wf_contentItemClassWithAppBundleIdentifier:()Workflow superclass:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  Class v11;
  objc_class *v12;
  objc_class *v13;
  NSString *v14;
  Class ClassPair;
  objc_class *v16;
  uint64_t v17;
  void (**v18)(void *, objc_class *, char *, void *);
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD aBlock[5];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  NSStringFromClass(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v7;
  v31[1] = v6;
  objc_msgSend(a1, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "componentsJoinedByString:", CFSTR("_"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  v11 = NSClassFromString(v10);
  if (v11)
  {
    v12 = v11;
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)&classRegistrationLock_62561);
    v14 = objc_retainAutorelease(v10);
    ClassPair = objc_allocateClassPair(a4, -[NSString cStringUsingEncoding:](v14, "cStringUsingEncoding:", 4), 0);
    if (ClassPair)
    {
      v16 = ClassPair;
      v17 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __82__LNEnumMetadata_Workflow__wf_contentItemClassWithAppBundleIdentifier_superclass___block_invoke;
      aBlock[3] = &__block_descriptor_40_e14_B32__0_8_16_24lu32l8;
      aBlock[4] = a4;
      v18 = (void (**)(void *, objc_class *, char *, void *))_Block_copy(aBlock);
      v28[0] = v17;
      v28[1] = 3221225472;
      v28[2] = __82__LNEnumMetadata_Workflow__wf_contentItemClassWithAppBundleIdentifier_superclass___block_invoke_2;
      v28[3] = &unk_1E7AF9190;
      v29 = a1;
      v19 = v29;
      v20 = _Block_copy(v28);
      v18[2](v18, v16, sel_enumMetadata, v20);

      v26[0] = v17;
      v26[1] = 3221225472;
      v26[2] = __82__LNEnumMetadata_Workflow__wf_contentItemClassWithAppBundleIdentifier_superclass___block_invoke_3;
      v26[3] = &unk_1E7AF91B8;
      v21 = v6;
      v27 = v21;
      v22 = _Block_copy(v26);
      v18[2](v18, v16, sel_appBundleIdentifier, v22);

      v23 = (void *)MEMORY[0x1E0D43C98];
      objc_msgSend(v19, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "wf_addDescriptionMethodsToClass:withEntityType:appBundleIdentifier:", v16, v24, v21);

      objc_registerClassPair(v16);
      os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock_62561);
      v13 = v16;

      goto LABEL_6;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)&classRegistrationLock_62561);
    NSClassFromString(v14);
    v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;
LABEL_6:

  return v13;
}

- (id)wf_contentItemWithAppBundleIdentifier:()Workflow enumCaseIdentifier:
{
  id v6;
  void *v7;
  WFLinkEnumerationCase *v8;
  void *v9;

  v6 = a4;
  v7 = (void *)objc_msgSend(a1, "wf_contentItemClassWithAppBundleIdentifier:", a3);
  v8 = -[WFLinkEnumerationCase initWithIdentifier:]([WFLinkEnumerationCase alloc], "initWithIdentifier:", v6);

  objc_msgSend(v7, "itemWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
