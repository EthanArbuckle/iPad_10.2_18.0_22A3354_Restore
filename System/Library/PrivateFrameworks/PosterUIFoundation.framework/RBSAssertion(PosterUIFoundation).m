@implementation RBSAssertion(PosterUIFoundation)

+ (id)pui_posterRuntimeAssertionForTarget:()PosterUIFoundation explanation:sceneType:auditToken:posterProviderBundleIdentifier:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  const char *v17;
  void *v18;
  int v19;
  int v20;
  id *v21;
  id v22;
  void *v23;

  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a4;
  v16 = a3;
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("PosterKit.rendering")))
  {
    objc_msgSend(v13, "valueForEntitlement:", CFSTR("com.apple.posterkit.enhanced-memory-limits"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v19 = objc_msgSend(v18, "BOOLValue");
      v20 = PFBundleIdentifierRequiresMemoryHogAssertion();
      v21 = (id *)MEMORY[0x24BE74D90];
      if ((v19 & v20) != 0)
        v21 = (id *)MEMORY[0x24BE74D98];
      if ((v19 & 1) != 0)
        goto LABEL_11;
    }
    else
    {
      PFBundleIdentifierRequiresMemoryHogAssertion();
    }
    v21 = (id *)MEMORY[0x24BE74DA0];
LABEL_11:
    v22 = *v21;

    goto LABEL_13;
  }
  if (PUISceneRoleIsEditing(v12, v17))
    v22 = (id)*MEMORY[0x24BE74D88];
  else
    v22 = 0;
LABEL_13:
  objc_msgSend(a1, "pf_assertionForTarget:assertionIdentifier:explanation:invalidationHandler:", v16, v22, v15, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
