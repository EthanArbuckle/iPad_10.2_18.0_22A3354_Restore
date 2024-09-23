@implementation NSAttributedString

uint64_t __57__NSAttributedString_PhotosUICore__px_containsAttribute___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  if (a2)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

void __80__NSAttributedString_PhotosUICore__px_attributedStringByApplyingCapitalization___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a2, "px_stringByApplyingCapitalization:", *(_QWORD *)(a1 + 40));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "replaceCharactersInRange:withString:", a3, a4, v7);

}

void __84__NSAttributedString_PhotosUICore__px_stringWithFormat_defaultAttributes_arguments___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v4);
  }
  else
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", v3);

  }
}

uint64_t __130__NSAttributedString_PhotosUICore__px_attributedStringWithHTMLString_defaultAttributes_emphasizedAttributes_italicizedAttributes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", a2);
}

void __176__NSAttributedString_PXLocalization__px_localizedAttributedStringForInboxCoalescedLikesAndCommentsFromUser_otherPeopleFullNames_defaultTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "appendAttributedString:", v6);

}

void __176__NSAttributedString_PXLocalization__px_localizedAttributedStringForInboxCoalescedLikesAndCommentsFromUser_otherPeopleFullNames_defaultTextAttributes_emphasizedTextAttributes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "appendAttributedString:", v6);

}

void __168__NSAttributedString_PXLocalization__px_localizedAttributedStringForInboxCoalescedCommentsFromUser_otherPeopleFullNames_defaultTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "appendAttributedString:", v6);

}

void __168__NSAttributedString_PXLocalization__px_localizedAttributedStringForInboxCoalescedCommentsFromUser_otherPeopleFullNames_defaultTextAttributes_emphasizedTextAttributes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "appendAttributedString:", v6);

}

void __159__NSAttributedString_PXLocalization__px_localizedAttributedStringForLikesFromUser_otherPeopleFullNames_isVideo_defaultTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "appendAttributedString:", v6);

}

void __159__NSAttributedString_PXLocalization__px_localizedAttributedStringForLikesFromUser_otherPeopleFullNames_isVideo_defaultTextAttributes_emphasizedTextAttributes___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (a3)
    objc_msgSend(*(id *)(a1 + 32), "appendAttributedString:", *(_QWORD *)(a1 + 40));
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, *(_QWORD *)(a1 + 48));
  objc_msgSend(v5, "appendAttributedString:", v6);

}

@end
