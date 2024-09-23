@implementation _UIScenefbsSceneBasedMetricsCalculator

- (void)_updateMetricsOnWindows:(id)a3 animated:(BOOL)a4
{
  id v5;
  UIWindowScene **p_scene;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  char v13;
  id v14;
  id v15;
  id v16;
  int v17;
  id v18;
  int v19;
  id v20;
  int v21;
  id v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  int v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  uint64_t v38;
  BOOL v39;
  id v40;
  id v41;
  void *v42;
  char v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id *location;
  uint64_t v50;
  void *v51;
  char v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  p_scene = &self->_scene;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "_effectiveSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v8, "interfaceOrientation");

  v9 = objc_loadWeakRetained((id *)p_scene);
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:](_UISceneLifecycleMultiplexer, "mostActiveWindowSceneOnScreen:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v12 = objc_loadWeakRetained((id *)p_scene);
  LODWORD(v10) = objc_msgSend(v12, "_affectsScreenOrientation");
  v13 = objc_msgSend((id)UIApp, "_viewServiceIgnoresSceneForLegacyInterfaceOrientation:", v12);

  if ((_DWORD)v10 && (v13 & 1) == 0)
  {
    v14 = objc_loadWeakRetained((id *)p_scene);
    LODWORD(v15) = objc_msgSend(v14, "isEqual:", v11);

    if ((v15 & 1) == 0 && !v11)
    {
      v15 = objc_loadWeakRetained((id *)p_scene);

      if (v15)
      {
        v16 = objc_loadWeakRetained((id *)p_scene);
        v17 = objc_msgSend(v16, "_hasLifecycle");

        v18 = objc_loadWeakRetained((id *)p_scene);
        v19 = objc_msgSend(v18, "_isInternal");

        if (v19)
        {
          v20 = objc_loadWeakRetained((id *)p_scene);
          v21 = objc_msgSend(v20, "_affectsAppLifecycleIfInternal");

        }
        else
        {
          v21 = 0;
        }
        v22 = objc_loadWeakRetained((id *)p_scene);
        v23 = objc_msgSend(v22, "_isConnecting");

        LODWORD(v15) = v17 & v23 & (v21 | ~v19);
      }
    }
    if ((objc_msgSend((id)UIApp, "isFrontBoard") & 1) == 0 && (_DWORD)v15)
    {
      v24 = objc_loadWeakRetained((id *)p_scene);
      objc_msgSend(v24, "screen");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_setInterfaceOrientation:", v50);

    }
  }
  v47 = (void *)v11;
  v26 = objc_loadWeakRetained((id *)p_scene);
  +[UIWindow _findWindowForControllingOverallAppearanceInWindowScene:](UIWindow, "_findWindowForControllingOverallAppearanceInWindowScene:", v26);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = objc_loadWeakRetained((id *)p_scene);
  v52 = objc_msgSend(v27, "_sceneSessionRoleIsCarPlayOrNonInteractiveExternal");

  v28 = objc_loadWeakRetained((id *)p_scene);
  v29 = objc_msgSend(v28, "_canDynamicallySpecifySupportedInterfaceOrientations");

  location = (id *)p_scene;
  v30 = objc_loadWeakRetained((id *)p_scene);
  _UISceneMetricsCalculatorApplySceneCornerRadiiToScreenIfNecessary(v30);

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v31 = v5;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  v33 = v50;
  if (v32)
  {
    v34 = v32;
    v35 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v54 != v35)
          objc_enumerationMutation(v31);
        v37 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        if (objc_msgSend(v37, "_isWindowServerHostingManaged", v47))
        {
          v38 = v33;
          if (!v29)
            goto LABEL_34;
          v39 = !objc_msgSend(v37, "_canAffectStatusBarAppearance") || v51 == 0;
          v38 = v33;
          if (v39)
            goto LABEL_34;
          v40 = v51;
          v41 = v37;
          if (v40 == v41)
          {

          }
          else
          {
            v42 = v41;
            if (v41)
            {
              v43 = objc_msgSend(v40, "isEqual:", v41);

              v33 = v50;
              v38 = v50;
              if ((v43 & 1) != 0)
                goto LABEL_34;
            }
            else
            {

            }
            objc_msgSend(v42, "rootViewController");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "_viewControllerForSupportedInterfaceOrientations");
            v40 = (id)objc_claimAutoreleasedReturnValue();

            if (v40)
            {
              v38 = objc_msgSend(v42, "_interfaceOrientationForSupportedOrientations:preferredOrientation:", objc_msgSend(v40, "__supportedInterfaceOrientations"), objc_msgSend(v42, "_preferredInterfaceOrientationForRootViewController"));
LABEL_33:

              v33 = v50;
LABEL_34:
              if ((v52 & 1) != 0 || v38 == objc_msgSend(v37, "interfaceOrientation"))
              {
                -[UIWindow _invalidateDeferredOrientationUpdate](v37);
                if (objc_msgSend((id)objc_opt_class(), "_transformLayerRotationsAreEnabled"))
                  objc_msgSend(v37, "_sceneBoundsDidChange");
                else
                  objc_msgSend(v37, "_updateTransformLayer");
              }
              else if (a4)
              {
                v45 = objc_loadWeakRetained(location);
                objc_msgSend(v45, "screen");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "_updateToInterfaceOrientation:animated:", v38, objc_msgSend(v46, "_isPerformingSystemSnapshot") ^ 1);

                v33 = v50;
              }
              else
              {
                objc_msgSend(v37, "_updateToInterfaceOrientation:animated:", v38, 0);
              }
              continue;
            }
          }
          v38 = v50;
          goto LABEL_33;
        }
      }
      v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v34);
  }

}

- (void)_setScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (UIWindowScene)_scene
{
  return (UIWindowScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

@end
