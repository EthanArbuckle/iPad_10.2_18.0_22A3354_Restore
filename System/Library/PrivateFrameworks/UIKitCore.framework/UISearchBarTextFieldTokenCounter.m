@implementation UISearchBarTextFieldTokenCounter

void __57___UISearchBarTextFieldTokenCounter_initWithTextStorage___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleProcessEditing");

}

void __84___UISearchBarTextFieldTokenCounter__addCharacterIndexesOfTokensInRange_toIndexSet___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "addIndex:", a3);
  }

}

_QWORD *__86___UISearchBarTextFieldTokenCounter_characterIndexForSelectingOrRemovingTokenAtIndex___block_invoke(_QWORD *result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(result[4] + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  if (v4 == result[6])
  {
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

uint64_t __71___UISearchBarTextFieldTokenCounter_characterRangeOfTextAfterLastToken__block_invoke(uint64_t result, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)(v4 - a2) >= 2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32) = a2 + 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                            + 8)
                                                                                + 24)
                                                                    + ~a2;
    *a3 = 1;
  }
  else
  {
    *(_QWORD *)(v3 + 24) = a2;
  }
  return result;
}

@end
