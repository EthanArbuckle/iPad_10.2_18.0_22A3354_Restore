@implementation ICLanguageUsesSpaces

uint64_t __ICLanguageUsesSpaces_block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a3 = 1;
  return result;
}

void __ICLanguageUsesSpaces_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("zh"), CFSTR("yue"), CFSTR("ja"), CFSTR("th"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ICLanguageUsesSpaces_sLanguagesWithoutSpaces;
  ICLanguageUsesSpaces_sLanguagesWithoutSpaces = v0;

}

@end
