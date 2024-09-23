@implementation _UIKeyShortcutHUDUtilities

+ (void)setCurrentHUDCollectionViewManager:(uint64_t)a1
{
  id WeakRetained;
  void *v3;
  id obj;

  obj = a2;
  objc_opt_self();
  WeakRetained = objc_loadWeakRetained(&_currentHUDCollectionViewManager);

  v3 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak(&_currentHUDCollectionViewManager, obj);
    v3 = obj;
  }

}

+ (id)searchIcon
{
  objc_opt_self();
  if (qword_1ECD829D0 != -1)
    dispatch_once(&qword_1ECD829D0, &__block_literal_global_682);
  return (id)_MergedGlobals_1340[0];
}

+ (id)searchIconAttributedString
{
  uint64_t v0;
  _QWORD block[5];

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56___UIKeyShortcutHUDUtilities_searchIconAttributedString__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (qword_1ECD829E0 != -1)
    dispatch_once(&qword_1ECD829E0, block);
  return (id)qword_1ECD829D8;
}

+ (id)modifiersAttributedStringForShortcut:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;

  v2 = a2;
  objc_msgSend((id)objc_opt_self(), "_generateDiscoverabilityUIKeyCommandIfNeededForShortcut:", v2);
  v3 = (void *)objc_opt_new();
  if (qword_1ECD82A18 != -1)
    dispatch_once(&qword_1ECD82A18, &__block_literal_global_8_10);
  if ((objc_msgSend(v2, "modifierFlags") & 0x40000) != 0)
    objc_msgSend(v3, "appendAttributedString:", qword_1ECD829E8);
  if ((objc_msgSend(v2, "modifierFlags") & 0x80000) != 0)
    objc_msgSend(v3, "appendAttributedString:", qword_1ECD829F0);
  if ((objc_msgSend(v2, "modifierFlags") & 0x20000) != 0)
    objc_msgSend(v3, "appendAttributedString:", qword_1ECD829F8);
  if ((objc_msgSend(v2, "modifierFlags") & 0x100000) != 0)
    objc_msgSend(v3, "appendAttributedString:", qword_1ECD82A00);
  if ((objc_msgSend(v2, "modifierFlags") & 0x800000) != 0)
  {
    +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "shouldDisplayGlobeModiferAsGlobeSymbol");

    v6 = 9;
    if (v5)
      v6 = 8;
    objc_msgSend(v3, "appendAttributedString:", _MergedGlobals_1340[v6]);
  }

  return v3;
}

+ (id)inputAttributedStringForShortcut:(_BYTE *)a3 outShouldStyleAsSingleCharacterOrSymbol:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v4 = a2;
  objc_msgSend((id)objc_opt_self(), "_generateDiscoverabilityUIKeyCommandIfNeededForShortcut:", v4);
  if (qword_1ECD82A40 != -1)
    dispatch_once(&qword_1ECD82A40, &__block_literal_global_22_11);
  v5 = (void *)qword_1ECD82A28;
  objc_msgSend(v4, "input");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldMirrorShortcutInputs");

    if (v9)
    {
      v10 = (void *)qword_1ECD82A30;
      objc_msgSend(v4, "input");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = v12;
      else
        v13 = v7;
      v14 = v13;

      v7 = v14;
    }
    +[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", v7, qword_1ECD82A20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E1679D28, "textAttachmentWithImage:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3)
      *a3 = 1;

  }
  else
  {
    objc_msgSend(v4, "discoverabilityUIKeyCommand");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_readableStringForInputUsingWords:forHUD:outIsSingleCharacterOrKeySymbol:", 0, 1, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend(v19, "shouldMirrorShortcutInputs");

    if ((_DWORD)v18)
    {
      objc_msgSend((id)qword_1ECD82A38, "objectForKeyedSubscript:", v7);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v20;
      if (v20)
        v22 = (void *)v20;
      else
        v22 = v7;
      v23 = v22;

      v7 = v23;
    }
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v7);
  }

  return v17;
}

+ (void)_generateDiscoverabilityUIKeyCommandIfNeededForShortcut:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "discoverabilityUIKeyCommand");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v10;
  if (!v3)
  {
    +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "shouldDisplayEscShortcutAlternative"))
    {
      objc_msgSend(v10, "input");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", CFSTR("UIKeyInputEscape")) & 1) != 0)
      {
        v7 = objc_msgSend(v10, "modifierFlags");

        if ((v7 & 0x100000) == 0)
        {
          _UIKeyCommandGetLocalizedSymbol(CFSTR("."));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          +[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", v8, objc_msgSend(v10, "modifierFlags") | 0x100000, sel__nop_);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
            goto LABEL_10;
        }
        goto LABEL_9;
      }

    }
LABEL_9:
    objc_msgSend(v10, "uiKeyCommand");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    objc_msgSend(v10, "setDiscoverabilityUIKeyCommand:", v9);

    v4 = v10;
  }

}

+ (const)sharedFocusGroupIdentifier
{
  objc_opt_self();
  return CFSTR("com.apple.uikit.key-shortcut-hud.focus-group-identifier");
}

+ (const)separatorElementKind
{
  objc_opt_self();
  return CFSTR("com.apple.uikit.key-shortcut-hud.separator");
}

@end
