@implementation UIEditMenuPresentationServer

void __57___UIEditMenuPresentationServer_sharedPresentationServer__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)qword_1ECD80280;
  qword_1ECD80280 = v0;

}

void __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _UIOMenuLeafPerformAction *v7;
  _UIOMenuLeafPerformAction *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = [_UIOMenuLeafPerformAction alloc];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_2;
  v9[3] = &unk_1E16E06A8;
  v10 = *(id *)(a1 + 40);
  v8 = -[_UIOMenuLeafPerformAction initWithMenuElement:pasteAuthenticationMesage:responseHandler:](v7, "initWithMenuElement:pasteAuthenticationMesage:responseHandler:", v6, v5, v9);

  objc_msgSend(*(id *)(a1 + 32), "sendAction:", v8);
}

void __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_3;
  block[3] = &unk_1E16B1BF8;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84___UIEditMenuPresentationServer__editMenuPresentation_didSelectMenuLeaf_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2);
}

void __89___UIEditMenuPresentationServer__editMenuPresentation_preparedMenuForDisplay_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __89___UIEditMenuPresentationServer__editMenuPresentation_preparedMenuForDisplay_completion___block_invoke_2;
  v6[3] = &unk_1E16B2F48;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __89___UIEditMenuPresentationServer__editMenuPresentation_preparedMenuForDisplay_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "preparedMenu");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __96___UIEditMenuPresentationServer__editMenuPresentation_willPresentMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendLifecycleEvent:forMenuWithIdentifier:", 1, *(_QWORD *)(a1 + 40));
}

void __96___UIEditMenuPresentationServer__editMenuPresentation_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_sendLifecycleEvent:forMenuWithIdentifier:", 3, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "configurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "presentations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "connections");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

@end
