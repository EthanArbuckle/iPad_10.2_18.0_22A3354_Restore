@implementation NSString

id __69__NSString_SafariCoreExtras__safari_stringByRemovingExcessWhitespace__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

void __71__NSString_SafariCoreExtras__safari_containsPeriodOrHomoglyphForPeriod__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".٠۰܁܂․ꓸ꘎．‧。｡"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod;
  -[NSString(SafariCoreExtras) safari_containsPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod = v0;

}

void __78__NSString_SafariCoreExtras__safari_firstLocationOfPeriodOrHomoglyphForPeriod__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".٠۰܁܂․ꓸ꘎．‧。｡"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod;
  -[NSString(SafariCoreExtras) safari_firstLocationOfPeriodOrHomoglyphForPeriod]::periodAndHomoglyphsForPeriod = v0;

}

void __80__NSString_SafariCoreExtras__safari_stringByReplacingHomoglyphForSpaceWithSpace__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "controlCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::homoglyphsForSpace;
  -[NSString(SafariCoreExtras) safari_stringByReplacingHomoglyphForSpaceWithSpace]::homoglyphsForSpace = v0;

}

void __105__NSString_SafariCoreExtras__safari_comparableSafariVersionNumberForAnalyticsFromNormalizedVersionString__block_invoke(uint64_t a1, void *a2, __int16 a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(MEMORY[0x1E0CB3598], "decimalNumberWithString:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decimalNumberByMultiplyingByPowerOf10:", (__int16)(-3 * a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "decimalNumberByAdding:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("(log.{0,2}(in|on|out))|(sign.{0,2}(in|on|up|out))|account|auth|authentication|federate|setsid"), 1024, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern;
  -[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::loginURLPattern = v0;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("continue|after|next|later|return|sequent|succeed|success|result|resume|sso|then|follow.{0,2}(up|on|ing)|proceed|back.{0,2}(to|in|on)|done"), 1024, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::redirectQueryNamePattern;
  -[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::redirectQueryNamePattern = v2;

  objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("accountname|appidkey|certversion|securityupgrade|relaystate|rememberme|samlrequest|sigalg|signature|widgetkey"), 1024, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::samlQueryNamePattern;
  -[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::samlQueryNamePattern = v4;

}

void __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "range");
  if ((double)v6 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") > 0.8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

BOOL __107__NSString_SafariCoreExtras___safari_looksLikeWillRedirectToURLStringAfterAuthentication_orHostAfterLogin___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByRemovingPercentEncoding");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (*(_BYTE *)(a1 + 48)
      && objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::samlQueryNamePattern, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")))
    {
      v7 = 1;
    }
    else
    {
      objc_msgSend(v3, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByRemovingPercentEncoding");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (*(_QWORD *)(a1 + 32) && (objc_msgSend(v10, "safari_hasPrefix:") & 1) == 0
        || *(_QWORD *)(a1 + 40) && !objc_msgSend(v10, "containsString:"))
      {
        v7 = 0;
      }
      else if (*(_BYTE *)(a1 + 48))
      {
        v7 = 1;
      }
      else
      {
        v7 = objc_msgSend((id)-[NSString(SafariCoreExtras) _safari_looksLikeWillRedirectToURLStringAfterAuthentication:orHostAfterLogin:]::redirectQueryNamePattern, "numberOfMatchesInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0;
      }

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __63__NSString_SafariCoreExtras__safari_numberOfComposedCharacters__block_invoke(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __62__NSString_SafariCoreExtras__safari_bestURLForUserTypedString__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

@end
