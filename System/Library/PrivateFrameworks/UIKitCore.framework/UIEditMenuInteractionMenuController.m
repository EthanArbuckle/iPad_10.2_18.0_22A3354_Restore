@implementation UIEditMenuInteractionMenuController

uint64_t __64___UIEditMenuInteractionMenuController_setMenuVisible_animated___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (!v2)
    return objc_msgSend(v3, "_dismissEditMenu");
  objc_msgSend(v3, "_prepareEditMenuInteractionIfNeeded");
  return objc_msgSend(*(id *)(a1 + 32), "_presentEditMenu");
}

void __101___UIEditMenuInteractionMenuController_editMenuInteraction_willPresentMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("UIMenuControllerDidShowMenuNotification"), *(_QWORD *)(a1 + 32));

}

void __101___UIEditMenuInteractionMenuController_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDisplayingMenu") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeInteraction:", *(_QWORD *)(a1 + 32));

    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    if (v3 == *(void **)(v4 + 24))
    {
      *(_QWORD *)(v4 + 24) = 0;

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("UIMenuControllerDidHideMenuNotification"), *(_QWORD *)(a1 + 40));

}

@end
