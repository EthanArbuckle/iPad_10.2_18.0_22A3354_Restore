@implementation FBScene

uint64_t __72__FBScene_PRUISAdditions__pruis_updateWithoutActivating_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__FBScene_PRUISAdditions__pruis_updateWithoutActivating_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __105__FBScene_PRUISAdditions__pruis_setupSceneForSnapshottingWithOptions_traitCollection_updater_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(v9, "pui_setSnapshot:", 1);
  objc_msgSend(v9, "pui_setFloatingLayerSnapshot:", *(unsigned __int8 *)(a1 + 72));
  objc_msgSend(v9, "pui_setContent:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v9, "pr_setUnlockProgress:", *(double *)(a1 + 56));
  objc_msgSend(v9, "pui_setUserInterfaceStyle:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v9, "pui_setShowsHeaderElements:", *(unsigned __int8 *)(a1 + 73));
  objc_msgSend(v9, "pui_setShowsComplications:", *(unsigned __int8 *)(a1 + 74));
  if (objc_msgSend(v9, "isUISubclass"))
  {
    v6 = *(void **)(a1 + 32);
    v7 = v9;
    objc_msgSend(v7, "setAccessibilityContrast:", objc_msgSend(v6, "accessibilityContrast"));

  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v9, v5);

}

void __85__FBScene_PRUISAdditions__pruis_restoreSceneAfterSnapshottingWithUpdater_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(v7, "pui_setSnapshot:", 0);
  objc_msgSend(v7, "pui_setFloatingLayerSnapshot:", 0);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

void __85__FBScene_PRUISAdditions__pruis_snapshotSceneWithOptions_traitCollection_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  id v4;

  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "pruis_snapshotContextConfiguredWithOptions:", *(_QWORD *)(a1 + 48));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "pruis_createSnapshotWithContext:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_msgSend(*(id *)(a1 + 32), "pruis_restoreSceneAfterSnapshottingWithUpdater:completion:", 0, 0);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __54__FBScene_PRUISAdditions___layersToExcludeForOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t *v5;
  _BOOL4 v6;
  uint64_t *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "level");
  switch(((*(_QWORD *)(a1 + 32) & 0x38uLL) - 8) >> 3)
  {
    case 0uLL:
      v5 = (uint64_t *)MEMORY[0x24BE74E78];
      goto LABEL_7;
    case 1uLL:
      v5 = (uint64_t *)MEMORY[0x24BE74E58];
      goto LABEL_7;
    case 2uLL:
      v7 = (uint64_t *)MEMORY[0x24BE74E68];
      goto LABEL_12;
    case 3uLL:
      v5 = (uint64_t *)MEMORY[0x24BE74E68];
LABEL_7:
      v6 = v4 == (double)*v5;
      break;
    case 4uLL:
      v6 = v4 != (double)(uint64_t)*MEMORY[0x24BE74E50] && v4 != (double)(uint64_t)*MEMORY[0x24BE74E58];
      break;
    case 5uLL:
      v7 = (uint64_t *)MEMORY[0x24BE74E78];
LABEL_12:
      v6 = v4 != (double)*v7;
      break;
    default:
      v6 = 1;
      break;
  }
  v8 = objc_msgSend(v3, "type");

  return v8 != 1 || !v6;
}

@end
