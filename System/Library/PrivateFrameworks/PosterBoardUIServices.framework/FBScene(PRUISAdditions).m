@implementation FBScene(PRUISAdditions)

- (uint64_t)pruis_updateWithoutActivating:()PRUISAdditions
{
  return objc_msgSend(a1, "pruis_updateWithoutActivating:withCompletion:", a3, 0);
}

- (void)pruis_updateWithoutActivating:()PRUISAdditions withCompletion:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = v8;
    if (objc_msgSend(a1, "isActive"))
    {
      objc_msgSend(a1, "performUpdate:withCompletion:", v7, v9);
    }
    else
    {
      v10 = MEMORY[0x24BDAC760];
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __72__FBScene_PRUISAdditions__pruis_updateWithoutActivating_withCompletion___block_invoke;
      v14[3] = &unk_251534E60;
      v15 = v7;
      objc_msgSend(a1, "updateSettingsWithBlock:", v14);
      if (v9)
      {
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __72__FBScene_PRUISAdditions__pruis_updateWithoutActivating_withCompletion___block_invoke_2;
        block[3] = &unk_251534E88;
        v13 = v9;
        dispatch_async(MEMORY[0x24BDAC9B8], block);

      }
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("updater != ((void *)0)"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[FBScene(PRUISAdditions) pruis_updateWithoutActivating:withCompletion:].cold.1(a2, (uint64_t)a1, (uint64_t)v11);
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (uint64_t)pruis_setupSceneForSnapshottingWithOptions:()PRUISAdditions traitCollection:completion:
{
  return objc_msgSend(a1, "pruis_setupSceneForSnapshottingWithOptions:traitCollection:updater:completion:", a3, a4, 0, a5);
}

- (void)pruis_setupSceneForSnapshottingWithOptions:()PRUISAdditions traitCollection:updater:completion:
{
  id v10;
  id v11;
  id v12;
  char IsFloatingLayerOnly;
  uint64_t v14;
  double v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  char v25;
  BOOL v26;
  BOOL v27;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  IsFloatingLayerOnly = PRSPosterSnapshotOptionsIsFloatingLayerOnly();
  v14 = objc_msgSend(a1, "_renderingContentForOptions:", a3);
  if ((a3 & 0x40) != 0)
    v15 = 1.0;
  else
    v15 = 0.0;
  v16 = objc_msgSend(v10, "userInterfaceStyle");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __105__FBScene_PRUISAdditions__pruis_setupSceneForSnapshottingWithOptions_traitCollection_updater_completion___block_invoke;
  v19[3] = &unk_2515357E8;
  v25 = IsFloatingLayerOnly;
  v21 = v11;
  v22 = v14;
  v23 = v15;
  v24 = v16;
  v26 = (a3 & 2) != 0;
  v27 = (a3 & 4) != 0;
  v20 = v10;
  v17 = v11;
  v18 = v10;
  objc_msgSend(a1, "performUpdate:withCompletion:", v19, v12);

}

- (uint64_t)pruis_restoreSceneAfterSnapshottingWithCompletion:()PRUISAdditions
{
  return objc_msgSend(a1, "pruis_restoreSceneAfterSnapshottingWithUpdater:completion:", 0, a3);
}

- (void)pruis_restoreSceneAfterSnapshottingWithUpdater:()PRUISAdditions completion:
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __85__FBScene_PRUISAdditions__pruis_restoreSceneAfterSnapshottingWithUpdater_completion___block_invoke;
  v8[3] = &unk_251535810;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a1, "performUpdate:withCompletion:", v8, a4);

}

- (void)pruis_snapshotSceneWithOptions:()PRUISAdditions traitCollection:completion:
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__FBScene_PRUISAdditions__pruis_snapshotSceneWithOptions_traitCollection_completion___block_invoke;
  v10[3] = &unk_251535838;
  v10[4] = a1;
  v11 = v8;
  v12 = a3;
  v9 = v8;
  objc_msgSend(a1, "pruis_setupSceneForSnapshottingWithOptions:traitCollection:completion:", a3, a4, v10);

}

- (id)pruis_createSnapshotWithContext:()PRUISAdditions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(a1, "createSnapshotWithContext:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "capture"))
  {
    objc_msgSend(v2, "IOSurface");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "interfaceOrientation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAttachment:forKey:", v6, *MEMORY[0x24BE74F48]);

    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a1, "settings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "pui_deviceOrientation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAttachment:forKey:", v9, *MEMORY[0x24BE74F38]);

    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v2, "context");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    objc_msgSend(v10, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAttachment:forKey:", v12, *MEMORY[0x24BE74F40]);

  }
  return v2;
}

- (id)pruis_snapshotContextConfiguredWithOptions:()PRUISAdditions
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "snapshotContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOpaque:", PRSPosterSnapshotOptionsAllowTransparency() ^ 1);
  objc_msgSend(a1, "_layersToExcludeForOptions:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayersToExclude:", v6);

  return v5;
}

- (uint64_t)_renderingContentForOptions:()PRUISAdditions
{
  return (a3 >> 7) & 1;
}

- (id)_layersToExcludeForOptions:()PRUISAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(a1, "layerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__FBScene_PRUISAdditions___layersToExcludeForOptions___block_invoke;
  v9[3] = &__block_descriptor_40_e22_B16__0__FBSceneLayer_8l;
  v9[4] = a3;
  objc_msgSend(v5, "bs_filter:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)pruis_updateWithoutActivating:()PRUISAdditions withCompletion:.cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("PRUISSceneTypes.m");
  v16 = 1024;
  v17 = 19;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_2445ED000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
