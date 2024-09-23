@implementation PXSharedLibrarySwitchLibraryMenu

void __PXSharedLibrarySwitchLibraryMenu_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  _PXSharedLibraryMenuConfiguration *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;

  v6 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __PXSharedLibrarySwitchLibraryMenu_block_invoke_2;
  v9[3] = &unk_1E5117A18;
  v10 = *(id *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v6, "addSectionWithConfiguration:", v9);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __PXSharedLibrarySwitchLibraryMenu_block_invoke_5;
  v7[3] = &unk_1E5144508;
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v6, "addSectionWithConfiguration:", v7);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
  {
    v5 = -[_PXSharedLibraryMenuConfiguration initWithMenuBuilder:]([_PXSharedLibraryMenuConfiguration alloc], "initWithMenuBuilder:", v6);
    (*(void (**)(uint64_t, _PXSharedLibraryMenuConfiguration *))(v4 + 16))(v4, v5);

  }
}

void __PXSharedLibrarySwitchLibraryMenu_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(void *, _QWORD);
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  char v11;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "viewMode");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __PXSharedLibrarySwitchLibraryMenu_block_invoke_3;
  v7[3] = &unk_1E51179F0;
  v11 = *(_BYTE *)(a1 + 40);
  v8 = v3;
  v10 = v4;
  v9 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = (void (**)(void *, _QWORD))_Block_copy(v7);
  v6[2](v6, 0);
  v6[2](v6, 1);
  v6[2](v6, 2);

}

void __PXSharedLibrarySwitchLibraryMenu_block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  LODWORD(v3) = objc_msgSend(v3, "isSharedLibraryBadgeEnabled");
  PXLocalizedSharedLibraryString(CFSTR("PXSharedLibrary_FilterMenu_ToggleBadge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __PXSharedLibrarySwitchLibraryMenu_block_invoke_6;
  v6[3] = &unk_1E5142B28;
  v7 = *(id *)(a1 + 32);
  v8 = (char)v3;
  objc_msgSend(v4, "addItemWithTitle:systemImageName:state:options:handler:", v5, 0, v3, 0, v6);

}

uint64_t __PXSharedLibrarySwitchLibraryMenu_block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSharedLibraryBadgeEnabled:", *(_BYTE *)(a1 + 40) == 0);
}

void __PXSharedLibrarySwitchLibraryMenu_block_invoke_3(_QWORD *a1, uint64_t a2)
{
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  if (a2 == 2)
    v4 = 2;
  else
    v4 = a2 == 1;
  v5 = (void *)a1[4];
  PXLibraryFilterTitleForItemTag(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXLibraryFilterMenuImageNameForItemTagFilled(v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[5];
  v9 = a1[6] == a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __PXSharedLibrarySwitchLibraryMenu_block_invoke_4;
  v10[3] = &unk_1E5144FE8;
  v11 = v8;
  v12 = a2;
  objc_msgSend(v5, "addItemWithTitle:systemImageName:state:options:handler:", v6, v7, v9, 0, v10);

}

uint64_t __PXSharedLibrarySwitchLibraryMenu_block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setViewMode:", *(_QWORD *)(a1 + 40));
}

@end
