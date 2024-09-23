@implementation UIPhysicalButtonInteractionArbiter

uint64_t __61___UIPhysicalButtonInteractionArbiter__resolveConfigurations__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPhysicalButtonConfigurations:", *(_QWORD *)(a1 + 32));
}

void __188___UIPhysicalButtonInteractionArbiter__enumerateAndValidateInteractionsInWindow_withRequiredBehaviorMask_configurationAcceptanceEvaluator_interactionAcceptanceHandler_shouldStopEvaluator___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  id *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  int v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  void *v48;
  id v49;
  int v50;
  id obj;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;
  CGPoint v58;
  CGRect v59;

  v57 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = objc_msgSend(a2, "_wantsRelaxedVisibilityRequirement");
  objc_msgSend(v7, "frame");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16))())
  {
    v18 = *(void **)(a1 + 40);
    if (!v18 || v9 == v18)
    {
      v49 = v9;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(a2, "_configurationSet", a4);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      if (v19)
      {
        v20 = v19;
        v21 = 0;
        v22 = 0;
        v23 = v11 + v15 * 0.5;
        v24 = v13 + v17 * 0.5;
        v25 = *(_QWORD *)v53;
        v48 = v7;
        do
        {
          v26 = 0;
          v27 = v21;
          do
          {
            if (*(_QWORD *)v53 != v25)
              objc_enumerationMutation(obj);
            v28 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v26);
            objc_msgSend(v28, "_button");
            v29 = objc_msgSend(v28, "_behavior");
            if (v29 >= 3)
              v30 = 0;
            else
              v30 = 1 << v29;
            v31 = *(_QWORD *)(a1 + 104);
            if (v31)
              v32 = v30 == v31;
            else
              v32 = 1;
            if (v32)
            {
              if ((v30 & ~v22) != 0)
              {
                v21 = v30 | v27;
                if (v29 != 2)
                {
                  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
                  v35 = *(id *)(v33 + 40);
                  v34 = (id *)(v33 + 40);
                  if (v49 != v35)
                  {
                    objc_storeStrong(v34, v49);
                    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
                    v36 = objc_claimAutoreleasedReturnValue();
                    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
                    v38 = *(void **)(v37 + 40);
                    *(_QWORD *)(v37 + 40) = v36;

                  }
                  v39 = -[UIView _containsView:](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), (uint64_t)v7);
                  if (((v39 ^ 1 | v50) & 1) == 0)
                    LOBYTE(v39) = -[UIView _isInVisibleHierarchy]((uint64_t)v7);
                  if ((v39 & 1) != 0)
                  {
                    objc_msgSend(v7, "superview");
                    v40 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "convertPoint:toCoordinateSpace:", *(_QWORD *)(a1 + 48), v23, v24);
                    v42 = v41;
                    v44 = v43;

                    v7 = v48;
                    objc_msgSend(*(id *)(a1 + 48), "bounds");
                    v58.x = v42;
                    v58.y = v44;
                    if (!CGRectContainsPoint(v59, v58))
                      v21 = v27 & ~v30;
                  }
                  else
                  {
                    v21 = v27 & ~v30;
                  }
                }
              }
              else
              {
                v21 = v27;
              }
              if ((v30 & ~v21) == 0)
              {
                v45 = *(_QWORD *)(a1 + 64);
                if (!v45 || (*(unsigned int (**)(uint64_t, void *))(v45 + 16))(v45, v28))
                  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
              }
              v22 |= v30;
              v27 = v21;
            }
            else
            {
              v21 = v27;
            }
            ++v26;
          }
          while (v20 != v26);
          v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
        }
        while (v20);
      }

      a4 = v47;
      v9 = v49;
    }
  }
  v46 = *(_QWORD *)(a1 + 80);
  if (v46)
    *a4 = (*(uint64_t (**)(void))(v46 + 16))();

}

uint64_t __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v6)
  {
    v7 = objc_opt_new();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  return objc_msgSend(v6, "setObject:forKey:", a2, a3);
}

BOOL __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v4)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(v4, "_configurationForButton:", objc_msgSend(a2, "_button"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "_setConfiguration:forButton:", a2, objc_msgSend(a2, "_button"));

  return v8 == 0;
}

BOOL __88___UIPhysicalButtonInteractionArbiter__performConfigurationResolutionForRequiredWindow___block_invoke_3(uint64_t a1)
{
  return -[_UIPhysicalButtonConfigurationSet _isFull](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

uint64_t __74___UIPhysicalButtonInteractionArbiter__createEvaluatedObjectCacheIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = objc_msgSend(a2, "_wantsRelaxedVisibilityRequirement");
    objc_msgSend(a2, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v4 & 1) == 0 && ((objc_msgSend(v5, "isHidden") & 1) != 0 || (objc_msgSend(v6, "isHidden") & 1) != 0))
    {
      v7 = 0;
    }
    else
    {
      v8 = WeakRetained[1];
      if (v8)
        v7 = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, a2);
      else
        v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __188___UIPhysicalButtonInteractionArbiter__enumerateAndValidateInteractionsInWindow_withRequiredBehaviorMask_configurationAcceptanceEvaluator_interactionAcceptanceHandler_shouldStopEvaluator___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_effectiveExclusiveCollectionPhysicalButtonConfigurationViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __53___UIPhysicalButtonInteractionArbiter_initWithScene___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "descriptionBuilderWithMultilinePrefix:", &stru_1E16EDF20);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __74___UIPhysicalButtonInteractionArbiter__registerPhysicalButtonInteraction___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  unint64_t v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  char v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  id v48;
  objc_class *v49;
  void *v50;
  __CFString *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t v66[4];
  id v67;
  __int16 v68;
  __CFString *v69;
  uint8_t buf[4];
  id v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v52 = WeakRetained;
    objc_msgSend(WeakRetained, "_scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = v52;
    if (v5)
    {
      v6 = objc_msgSend(v5, "_hasInvalidated");

      WeakRetained = v52;
      if ((v6 & 1) == 0)
      {
        v7 = *(void **)(a1 + 32);
        objc_msgSend(v52, "_scene");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v9 = v8;
          v10 = objc_msgSend(v8, "_hasInvalidated");

          if ((v10 & 1) == 0)
          {
            objc_msgSend(v7, "view");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "_window");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v12, "_windowHostingScene");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            v14 = objc_loadWeakRetained((id *)v52 + 6);

            if (v13 != v14)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_loadWeakRetained((id *)v52 + 6);
              objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", sel__unregisterPhysicalButtonInteraction_withRegistrationToken_, "-[_UIPhysicalButtonInteractionArbiter _unregisterPhysicalButtonInteraction:withRegistrationToken:]", v12, v45, v52);

            }
            v15 = qword_1ECD802E8;
            if (!qword_1ECD802E8)
            {
              v15 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
              atomic_store(v15, (unint64_t *)&qword_1ECD802E8);
            }
            v16 = *(NSObject **)(v15 + 8);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = v16;
              objc_msgSend(v7, "succinctDescription");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134349570;
              v71 = v52;
              v72 = 2112;
              v73 = v18;
              v74 = 2112;
              v75 = a2;
              _os_log_impl(&dword_185066000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: unregistering physical button interaction: %@; with registrationToken: %@",
                buf,
                0x20u);

            }
            -[_UIEvaluatedObjectCache removeObject:](*((_QWORD *)v52 + 9), (uint64_t)v7);
            v63 = 0u;
            v64 = 0u;
            v61 = 0u;
            v62 = 0u;
            objc_msgSend(v7, "_configurationSet");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v62;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v62 != v22)
                    objc_enumerationMutation(v19);
                  v24 = (void *)*((_QWORD *)v52 + 3);
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * i), "_generation"));
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "removeObject:", v25);

                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v61, buf, 16);
              }
              while (v21);
            }

            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*((id *)v52 + 11), "removeObject:", v26);
            if (!objc_msgSend(*((id *)v52 + 11), "countForObject:", v26))
              objc_msgSend(*((id *)v52 + 10), "removeObject:", v12);
            v27 = objc_loadWeakRetained((id *)v52 + 7);

            if (!v27)
            {
              objc_msgSend(*((id *)v52 + 12), "removeObject:", v26);
              if (!objc_msgSend(*((id *)v52 + 12), "countForObject:", v26))
              {
                objc_msgSend(v12, "_removeWindowLevelChangedObserver:", v52);
                v28 = qword_1ECD80328;
                if (!qword_1ECD80328)
                {
                  v28 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                  atomic_store(v28, (unint64_t *)&qword_1ECD80328);
                }
                if ((*(_BYTE *)v28 & 1) != 0)
                {
                  v46 = *(id *)(v28 + 8);
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                  {
                    if (v12)
                    {
                      v47 = (void *)MEMORY[0x1E0CB3940];
                      v48 = v12;
                      v49 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v49);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v47, "stringWithFormat:", CFSTR("<%@: %p>"), v50, v48);
                      v51 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v51 = CFSTR("(nil)");
                    }
                    *(_DWORD *)v66 = 134349314;
                    v67 = v52;
                    v68 = 2112;
                    v69 = v51;
                    _os_log_impl(&dword_185066000, v46, OS_LOG_TYPE_ERROR, "[%{public}p] Arbiter ended observing window level for window: %@", v66, 0x16u);

                  }
                }
              }
            }

            v29 = objc_loadWeakRetained((id *)v52 + 7);
            if (v29)
            {
              objc_msgSend(*((id *)v52 + 16), "objectForKey:", v12);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "configurationToInteractionMap");
              v57 = 0u;
              v58 = 0u;
              v59 = 0u;
              v60 = 0u;
              v31 = (id)objc_claimAutoreleasedReturnValue();
              v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
              if (v32)
              {
                v33 = v32;
                v34 = *(_QWORD *)v58;
                while (2)
                {
                  for (j = 0; j != v33; ++j)
                  {
                    if (*(_QWORD *)v58 != v34)
                      objc_enumerationMutation(v31);
                    objc_msgSend(v31, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * j));
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v36 == v7)
                    {
                      v37 = 1;
                      goto LABEL_37;
                    }
                  }
                  v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
                  if (v33)
                    continue;
                  break;
                }
              }
              v37 = 0;
LABEL_37:

            }
            else
            {
              v37 = 0;
            }
            objc_msgSend(*((id *)v52 + 14), "configurationToInteractionMap");
            v53 = 0u;
            v54 = 0u;
            v55 = 0u;
            v56 = 0u;
            v38 = (id)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
            if (v39)
            {
              v40 = v39;
              v41 = *(_QWORD *)v54;
              while (2)
              {
                for (k = 0; k != v40; ++k)
                {
                  if (*(_QWORD *)v54 != v41)
                    objc_enumerationMutation(v38);
                  objc_msgSend(v38, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * k));
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v43 == v7)
                  {

                    goto LABEL_50;
                  }
                }
                v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
                if (v40)
                  continue;
                break;
              }
            }

            if ((v37 & 1) != 0)
            {
LABEL_50:
              -[_UIPhysicalButtonInteractionArbiter _addSystemShellWindowRequiringResolutionIfNeeded:]((uint64_t)v52, (uint64_t)v12);
              -[_UIPhysicalButtonInteractionArbiter _resolveConfigurations]((uint64_t)v52);
            }

          }
        }
        WeakRetained = v52;
      }
    }
  }

}

uint64_t __80___UIPhysicalButtonInteractionArbiter__setResolutionStrategy_forInitialization___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && WeakRetained[17])
  {
    objc_msgSend(a2, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v4[17];
    if (v7)
      v8 = (void *)objc_msgSend(*(id *)(v7 + 8), "copy");
    else
      v8 = 0;
    v9 = objc_msgSend(v8, "containsObject:", v6);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __77___UIPhysicalButtonInteractionArbiter__gestureViewsForWindow_physicalButton___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v3)
  {
    v5 = objc_opt_new();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(a2, "view");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

}

BOOL __77___UIPhysicalButtonInteractionArbiter__gestureViewsForWindow_physicalButton___block_invoke_2(uint64_t a1)
{
  return *(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count") != 0;
}

void __68___UIPhysicalButtonInteractionArbiter__registerViewServiceObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;
  unint64_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id *WeakRetained;
  uint8_t buf[4];
  id *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, "_hasInvalidated");

      if ((v7 & 1) == 0)
      {
        if (v4)
        {
          objc_msgSend(WeakRetained, "_scene");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = v8;
            v10 = objc_msgSend(v8, "_hasInvalidated");

            if ((v10 & 1) == 0)
            {
              v11 = _unregisterViewServiceObserver_withRegistrationToken____s_category;
              if (!_unregisterViewServiceObserver_withRegistrationToken____s_category)
              {
                v11 = __UILogCategoryGetNode("PhysicalButtonInteraction", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v11, (unint64_t *)&_unregisterViewServiceObserver_withRegistrationToken____s_category);
              }
              v12 = *(id *)(v11 + 8);
              if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
              {
                v13 = (void *)MEMORY[0x1E0CB3940];
                v14 = v4;
                v15 = (objc_class *)objc_opt_class();
                NSStringFromClass(v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "stringWithFormat:", CFSTR("<%@: %p>"), v16, v14);
                v17 = (void *)objc_claimAutoreleasedReturnValue();

                *(_DWORD *)buf = 134349570;
                v20 = WeakRetained;
                v21 = 2112;
                v22 = v17;
                v23 = 2112;
                v24 = a2;
                _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}p] Arbiter: unregistering view service observer: %@; with registrationToken: %@",
                  buf,
                  0x20u);

              }
              objc_msgSend(WeakRetained[18], "removeObject:", v4);
            }
          }
        }
      }
    }
  }

}

BOOL __55___UIPhysicalButtonInteractionArbiter__handleBSAction___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend(a2, "_button");
  if (v4 != objc_msgSend(*(id *)(a1 + 32), "button"))
    return 0;
  v5 = objc_msgSend(a2, "_behavior");
  if (v5 != objc_msgSend(*(id *)(a1 + 32), "behavior"))
    return 0;
  v6 = objc_msgSend(a2, "_generation");
  v7 = objc_msgSend(*(id *)(a1 + 32), "generation");
  return v7 == v6 || v7 == 0x3E1CC2CA76C17F8;
}

void __55___UIPhysicalButtonInteractionArbiter__handleBSAction___block_invoke_202(_QWORD *a1, void *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1[4] + 16) + 16))())
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(a2, "_configurationSet", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          if (-[_UIPhysicalButtonConfiguration _isEqualToConfigurationMinusGeneration:](*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), a1[5]))
          {

            -[_UIPhysicalButtonInteraction _bsActionDriver](a2);
            v4 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "_handleBSAction:", a1[6]);
            goto LABEL_12;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "activeMultilinePrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v6[3] = &unk_1E16B1B50;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "appendBodySectionWithName:multilinePrefix:block:", 0, v3, v6);

}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  const __CFString *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;
  __CFString *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  int8x16_t v55;
  int8x16_t v56;
  int8x16_t v57;
  id v58[2];
  id v59;
  _QWORD v60[4];
  int8x16_t v61;
  _QWORD v62[4];
  int8x16_t v63;
  _QWORD v64[4];
  int8x16_t v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  int8x16_t v70;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
  v4 = &stru_1E16EDF20;
  if (v3 == 1)
    v4 = CFSTR("viewServices");
  if (v3)
    v5 = v4;
  else
    v5 = CFSTR("sceneClientSettings");
  objc_msgSend(v2, "appendString:withName:", v5, CFSTR("resolutionStrategy"));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));

  if (WeakRetained)
  {
    v7 = *(void **)(a1 + 32);
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 56));
    if (v8)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v11, v8);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = CFSTR("(nil)");
    }

    v13 = (id)objc_msgSend(v7, "appendObject:withName:", v12, CFSTR("systemShellDelegate"));
  }
  v14 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40) >> 3) & 1, CFSTR("configurationResolutionPaused"), 1);
  v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40) >> 4) & 1, CFSTR("needsConfigurationResolutionWhenResumed"), 1);
  v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40) >> 1) & 1, CFSTR("hasScheduledDeferredConfigurationResolution"));
  v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", (*(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 40) >> 2) & 1, CFSTR("hasScheduledDeferredConfigurationResolutionForReentrancy"));
  v18 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "succinctDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v18, "appendObject:withName:", v19, CFSTR("evaluatedObjectCache"));

  -[_UIEvaluatedObjectCache sortedObjects](*(id **)(*(_QWORD *)(a1 + 40) + 72));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v23 = *(void **)(a1 + 32);
  v24 = MEMORY[0x1E0C809B0];
  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v24;
    v69[1] = 3221225472;
    v69[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v69[3] = &unk_1E16B1B50;
    *(_OWORD *)v58 = *(_OWORD *)(a1 + 32);
    v26 = v58[0];
    v70 = vextq_s8(*(int8x16_t *)v58, *(int8x16_t *)v58, 8uLL);
    objc_msgSend(v23, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("registeredAndSortedInteractions"), v25, v69);

  }
  else
  {
    v27 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("registeredAndSortedInteractions"));
  }
  v59 = *(id *)(*(_QWORD *)(a1 + 40) + 112);
  v28 = *(void **)(a1 + 32);
  objc_msgSend(v59, "configurations");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v28, "appendObject:withName:", v29, CFSTR("resolvedConfigurations"));

  objc_msgSend(v59, "configurationToInteractionMap");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");
  v33 = *(void **)(a1 + 32);
  if (v32)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = v24;
    v66[1] = 3221225472;
    v66[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_4;
    v66[3] = &unk_1E16B1B50;
    v67 = v31;
    v68 = *(id *)(a1 + 32);
    objc_msgSend(v33, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("sceneConfigurationToInteractionMap"), v34, v66);

  }
  else
  {
    v35 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("sceneConfigurationToInteractionMap"));
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "count"))
    v36 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "count"), CFSTR("trackedWindowPointers"));
  else
    v37 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("trackedWindowPointers"));
  v38 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "count");
  v39 = *(void **)(a1 + 32);
  if (v38)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v24;
    v64[1] = 3221225472;
    v64[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_5;
    v64[3] = &unk_1E16B1B50;
    v55 = *(int8x16_t *)(a1 + 32);
    v41 = (id)v55.i64[0];
    v65 = vextq_s8(v55, v55, 8uLL);
    objc_msgSend(v39, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("windowPointersObservedForLevelChanges"), v40, v64);

  }
  else
  {
    v42 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("windowPointersObservedForLevelChanges"));
  }
  v43 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "count");
  v44 = *(void **)(a1 + 32);
  if (v43)
  {
    objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v24;
    v62[1] = 3221225472;
    v62[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_6;
    v62[3] = &unk_1E16B1B50;
    v56 = *(int8x16_t *)(a1 + 32);
    v46 = (id)v56.i64[0];
    v63 = vextq_s8(v56, v56, 8uLL);
    objc_msgSend(v44, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("eventDeferringTokens"), v45, v62);

  }
  else
  {
    v47 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("eventDeferringTokens"));
  }
  v48 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v48 + 64) == 1)
  {
    v49 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(v48 + 136), CFSTR("mostActiveViewServiceSession"));
    v50 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "count");
    v51 = *(void **)(a1 + 32);
    if (v50)
    {
      objc_msgSend(*(id *)(a1 + 32), "activeMultilinePrefix");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = v24;
      v60[1] = 3221225472;
      v60[2] = __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_7;
      v60[3] = &unk_1E16B1B50;
      v57 = *(int8x16_t *)(a1 + 32);
      v53 = (id)v57.i64[0];
      v61 = vextq_s8(v57, v57, 8uLL);
      objc_msgSend(v51, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("viewServiceObservers"), v52, v60);

    }
    else
    {
      v54 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("viewServiceObservers"));
    }
  }

}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[_UIEvaluatedObjectCache sortedObjects](*(id **)(*(_QWORD *)(a1 + 32) + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v6), "succinctDescription", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (id)objc_msgSend(v7, "appendObject:withName:", v8, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  uint64_t i;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  __CFString *v14;
  id v15;
  id obj;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v18)
  {
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = *(void **)(a1 + 40);
        if (v4)
        {
          v6 = (void *)MEMORY[0x1E0CB3940];
          v7 = (objc_class *)objc_opt_class();
          NSStringFromClass(v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "stringWithFormat:", CFSTR("<%@: %p>"), v8, v4);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

          if (v3)
            goto LABEL_8;
        }
        else
        {
          v9 = CFSTR("(nil)");
          if (v3)
          {
LABEL_8:
            v10 = (void *)MEMORY[0x1E0CB3940];
            v11 = v3;
            v12 = (objc_class *)objc_opt_class();
            NSStringFromClass(v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p>"), v13, v11);
            v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

            goto LABEL_11;
          }
        }
        v14 = CFSTR("(nil)");
LABEL_11:
        v15 = (id)objc_msgSend(v5, "appendObject:withName:", v9, v14);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v18);
  }

}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_5(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id obj;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v13 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "countForObject:", v6);
        v8 = *(void **)(a1 + 40);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p count"), objc_msgSend(v6, "pointerValue"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (id)objc_msgSend(v8, "appendUnsignedInteger:withName:", v7, v9);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v3);
  }

}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_6(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 152);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "objectForKey:", v7, (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 40);
        objc_msgSend(v8, "succinctDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)objc_msgSend(v9, "appendObject:withName:", v10, v11);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

void __77___UIPhysicalButtonInteractionArbiter_descriptionBuilderWithMultilinePrefix___block_invoke_7(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  __CFString *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 144);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v6);
        v8 = *(void **)(a1 + 40);
        if (v7)
        {
          v9 = (void *)MEMORY[0x1E0CB3940];
          v10 = v7;
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("<%@: %p>"), v12, v10, (_QWORD)v15);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v13 = CFSTR("(nil)");
        }
        v14 = (id)objc_msgSend(v8, "appendObject:withName:", v13, 0);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

}

@end
