@implementation _UIPhysicalButtonBSActionResponder

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a5, "_physicalButtonInteractionArbiter", a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a5, "_hasInvalidated") & 1) != 0 || !v8)
  {
    v21 = a3;
LABEL_19:
    v18 = v21;
    v12 = 0;
    goto LABEL_20;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = a3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v10)
  {

    v21 = v9;
    goto LABEL_19;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v24 != v13)
        objc_enumerationMutation(v9);
      v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
      if (objc_msgSend(v15, "UIActionType", (_QWORD)v23) == 51)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = v15;
          if (!v12)
            v12 = (void *)objc_opt_new();
          objc_msgSend(v12, "addObject:", v16);
          -[_UIPhysicalButtonInteractionArbiter _handleBSAction:]((uint64_t)v8, v16);

        }
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v11);

  v17 = v9;
  v18 = v17;
  if (v12)
  {
    v19 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v19, "minusSet:", v12);
    v20 = objc_msgSend(v19, "copy");

    v18 = (void *)v20;
  }
LABEL_20:

  return v18;
}

@end
