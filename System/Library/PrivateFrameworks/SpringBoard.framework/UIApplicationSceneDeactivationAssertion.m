@implementation UIApplicationSceneDeactivationAssertion

uint64_t __116__UIApplicationSceneDeactivationAssertion_SBWindowScene__sb_acquireWithPredicate_transitionContext_displayIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7 && !(*(unsigned int (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6))
  {
    v9 = 0;
  }
  else if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v6, "sb_displayIdentityForSceneManagers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

@end
