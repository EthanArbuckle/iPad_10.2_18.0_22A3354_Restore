@implementation UITextInteractionEditMenuAssistant

void __67___UITextInteractionEditMenuAssistant_menuElementsForReplacements___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "sender");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canPerformAction:withSender:", sel_replace_, v3))
  {
    objc_msgSend(v3, "replace:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "didReplaceTextWithTarget:", v3);
  }

}

void __93___UITextInteractionEditMenuAssistant_showReplacementsWithGenerator_forDictation_afterDelay___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "calculateReplacementsWithGenerator:andShowAfterDelay:", v3, 0.0);
  objc_msgSend(v4, "returnExecutionToParent");

}

void __93___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_forDictation_afterDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  char v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "interactionAssistant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  if (!objc_msgSend(WeakRetained, "viewConformsToAsynchronousInteractionProtocol"))
  {

    goto LABEL_5;
  }
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "_showCommandsWithReplacements:isForContextMenu:forDictation:arrowDirection:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48), 0);
    goto LABEL_6;
  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_2;
  v7[3] = &unk_1E16C2A08;
  v6 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v3, "requestPreferredArrowDirectionForEditMenuWithCompletionHandler:", v7);

LABEL_6:
}

uint64_t __93___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_forDictation_afterDelay___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if ((unint64_t)(a2 - 1) >= 4)
    v2 = 0;
  else
    v2 = a2;
  return objc_msgSend(*(id *)(a1 + 32), "_showCommandsWithReplacements:isForContextMenu:forDictation:arrowDirection:", *(_QWORD *)(a1 + 40), 0, *(unsigned __int8 *)(a1 + 48), v2);
}

uint64_t __114___UITextInteractionEditMenuAssistant__showCommandsWithReplacements_isForContextMenu_forDictation_arrowDirection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_isNoReplacementsFoundItem");
}

@end
