@implementation UISplitViewController(PXProgrammaticNavigation)

- (id)_participantForDestination:()PXProgrammaticNavigation routingOptions:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
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
  objc_msgSend(a1, "viewControllers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "routingOptionsForDestination:", v6);
        if (v13)
        {
          v15 = v13;
          v14 = v12;

          if (a4 && v14)
            *a4 = v15;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  v14 = 0;
LABEL_13:

  return v14;
}

- (uint64_t)routingOptionsForDestination:()PXProgrammaticNavigation
{
  void *v3;
  uint64_t v4;
  uint64_t v6;

  v6 = 0;
  objc_msgSend(a1, "_participantForDestination:routingOptions:", a3, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = v6;
  else
    v4 = 0;

  return v4;
}

- (id)nextExistingParticipantOnRouteToDestination:()PXProgrammaticNavigation
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_participantForDestination:routingOptions:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "nextExistingParticipantOnRouteToDestination:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)navigateToDestination:()PXProgrammaticNavigation options:completionHandler:
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v9 = a3;
  v10 = a5;
  v23 = 0;
  objc_msgSend(a1, "_participantForDestination:routingOptions:", v9, &v23);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIViewController+PXProgrammaticNavigation.m"), 499, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

  }
  v12 = v23;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__UISplitViewController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke;
  v17[3] = &unk_1E5138D30;
  v17[4] = a1;
  v18 = v11;
  v21 = a2;
  v22 = a4;
  v19 = v9;
  v20 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  objc_msgSend(a1, "_px_prepareNavigationFromViewController:routingOptions:options:completionHandler:", a1, v12, a4, v17);

}

@end
