@implementation NSString

void __64__NSString_SafariSharedExtras__safari_bestURLForUserTypedString__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __54__NSString_SafariSharedExtras__safari_bestLanguageTag__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v9;
  void *v10;
  char v11;
  unint64_t v12;
  id v13;

  v9 = a2;
  v10 = v9;
  if (v9)
  {
    v13 = v9;
    v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("und"));
    v10 = v13;
    if ((v11 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
      v12 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v13);
      v10 = v13;
      if (v12 >= 0x64)
        *a7 = 1;
    }
  }

}

void __54__NSString_SafariSharedExtras__safari_bestLanguageTag__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;

  v5 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "countForObject:");
  if (v4 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
  }

}

void __60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke()
{
  id v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  -[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt = objc_msgSend(v0, "integerForKey:", CFSTR("safari_urlHashesOfComponents_salt"));

  if (!-[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt)
  {
    -[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt = arc4random();
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setInteger:forKey:", -[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt, CFSTR("safari_urlHashesOfComponents_salt"));

  }
}

__CFString *__60__NSString_SafariSharedExtras__safari_urlHashesOfComponents__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char v4;
  __CFString *v5;

  v2 = a2;
  if (objc_msgSend(v2, "length"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = objc_msgSend(v2, "hash");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%.2X"), (-[NSString(SafariSharedExtras) safari_urlHashesOfComponents]::salt + v4));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("00");
  }

  return v5;
}

id __52__NSString_SafariSharedExtras__safari_containedURLs__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((unint64_t)(WBSUnifiedFieldInputTypeForString(v2) - 3) >= 0xFFFFFFFFFFFFFFFELL)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "safari_URLWithUserTypedString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __80__NSString_SafariSharedExtras__safari_stringByRedactingStrings_withReplacement___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "replaceCharactersInRange:withString:", a2, a3, *(_QWORD *)(a1 + 40));
}

void __60__NSString_ParsecExtras__safari_normalizedParsecInputString__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(a2, "characterIsMember:", *(unsigned __int16 *)(a1 + 48)))
  {
    objc_msgSend(*(id *)(a1 + 32), "appendString:", v7);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

@end
