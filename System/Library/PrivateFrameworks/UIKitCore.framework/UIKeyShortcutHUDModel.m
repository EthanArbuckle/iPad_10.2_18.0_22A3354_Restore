@implementation UIKeyShortcutHUDModel

uint64_t __36___UIKeyShortcutHUDModel__buildMenu__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.menu.application"));

  return v3;
}

void __36___UIKeyShortcutHUDModel__buildMenu__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "_enumerationPriority"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "addObject:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "_enumerationPriority"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

    }
  }

}

uint64_t __72___UIKeyShortcutHUDModel__responderBasedKeyCommandsStartingAtResponder___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __44___UIKeyShortcutHUDModel__sanitizedMainMenu__block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_menuByOmittingNonKeyCommandsInMenu:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __44___UIKeyShortcutHUDModel__sanitizedMainMenu__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  _UIKeyShortcutHUDLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_185066000, v0, OS_LOG_TYPE_ERROR, "Main root menu cannot have non-UIMenu children. Ignoring a child.", v1, 2u);
  }

}

void __62___UIKeyShortcutHUDModel__menuByOmittingNonKeyCommandsInMenu___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_menuByOmittingNonKeyCommandsInMenu:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __62___UIKeyShortcutHUDModel__menuByOmittingNonKeyCommandsInMenu___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  id v6;

  v6 = a2;
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = (void *)objc_msgSend(v6, "_mutableCopy");
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

  }
}

void __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke_2;
  v4[3] = &unk_1E16CD230;
  v3 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_enumerateKeyCommandsInMenu:block:", a2, v4);

}

uint64_t __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60___UIKeyShortcutHUDModel__enumerateKeyCommandsInMenu_block___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __54___UIKeyShortcutHUDModel__validatedHUDMenuFromUIMenu___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_validatedHUDMenuFromUIMenu:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __54___UIKeyShortcutHUDModel__validatedHUDMenuFromUIMenu___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

uint64_t __68___UIKeyShortcutHUDModel__addShortcutsFromHUDMenu_toShortcutsArray___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addShortcutsFromHUDMenu:toShortcutsArray:", a2, *(_QWORD *)(a1 + 40));
}

uint64_t __68___UIKeyShortcutHUDModel__addShortcutsFromHUDMenu_toShortcutsArray___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
