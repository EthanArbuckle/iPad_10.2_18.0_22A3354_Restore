@implementation PKIndexOfValueInLabeledValuesForContactKey

uint64_t ___PKIndexOfValueInLabeledValuesForContactKey_block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a2;
  if ((objc_msgSend(v6, "isEqualIgnoringIdentifiers:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0C967F0]))
  {
    objc_msgSend(v6, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");
    PKCorrectCountryCodeIfNecessaryForPostalAddress(v9);
    objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "labeledValueBySettingValue:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v10, "isEqualIgnoringIdentifiers:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    v7 = 0;
  }
  *a4 = v7;

  return v7;
}

@end
