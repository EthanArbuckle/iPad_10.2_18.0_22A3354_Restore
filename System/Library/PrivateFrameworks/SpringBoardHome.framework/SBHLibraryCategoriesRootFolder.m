@implementation SBHLibraryCategoriesRootFolder

- (void)setSupportsBadging:(BOOL)a3
{
  id v3;

  if (self->_supportsBadging != a3)
  {
    self->_supportsBadging = a3;
    -[SBRootFolder model](self, "model");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enumerateLeafIconsUsingBlock:", &__block_literal_global_76);

  }
}

uint64_t __53__SBHLibraryCategoriesRootFolder_setSupportsBadging___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteBadgeDidChange");
}

- (void)enumerateAllIconsWithBaseIndexPath:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  unint64_t v15;
  BOOL v16;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __88__SBHLibraryCategoriesRootFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke;
  v12[3] = &unk_1E8D87D28;
  v16 = (a4 & 2) != 0;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  -[SBFolder enumerateListsUsingBlock:](self, "enumerateListsUsingBlock:", v12);

}

void __88__SBHLibraryCategoriesRootFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v8 = a2;
  if (!*(_BYTE *)(a1 + 56) || (objc_msgSend(v8, "isHidden") & 1) == 0)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __88__SBHLibraryCategoriesRootFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke_2;
    v9[3] = &unk_1E8D87D00;
    v12 = a3;
    v10 = *(id *)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v13 = a4;
    v14 = v7;
    objc_msgSend(v8, "enumerateIconsUsingBlock:", v9);

  }
}

void __88__SBHLibraryCategoriesRootFolder_enumerateAllIconsWithBaseIndexPath_options_usingBlock___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIconIndex:listIndex:", a3, a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_indexPathByAddingPrefix:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(a1[5] + 16))();
  if (objc_msgSend(v5, "isFolderIcon") && (a1[8] & 1) != 0)
  {
    objc_msgSend(v5, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enumerateAllIconsWithBaseIndexPath:options:usingBlock:", v7, a1[8], a1[5]);
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isCategoryIcon") && (a1[8] & 1) != 0)
  {
    objc_msgSend(v5, "category");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "expandedPodFolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "enumerateAllIconsWithBaseIndexPath:options:usingBlock:", v7, a1[8], a1[5]);

LABEL_7:
  }

}

- (BOOL)supportsBadging
{
  return self->_supportsBadging;
}

@end
