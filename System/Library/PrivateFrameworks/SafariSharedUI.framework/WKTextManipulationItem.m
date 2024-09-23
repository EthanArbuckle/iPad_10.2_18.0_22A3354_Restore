@implementation WKTextManipulationItem

uint64_t __96___WKTextManipulationItem_SafariSharedExtras__safari_textManipulationItemWithTranslationResult___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CEF6F8], "safari_tokenWithTranslationAlignmentRepresentation:", a2);
}

id __79___WKTextManipulationItem_SafariSharedExtras__safari_updateTranslationRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a2, "safari_translationRangeRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", *MEMORY[0x1E0D8A6B8]);

  if (v5)
  {
    objc_msgSend(v3, "metaInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isSubframe"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("isInSubframe"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isCrossSiteSubframe"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("isInCrossSiteSubframe"));

    objc_msgSend(v3, "setMetaInfo:", v7);
  }
  return v3;
}

uint64_t __105___WKTextManipulationItem_SafariSharedExtras__safari_isEqualToManipulationItem_includingContentEquality___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(a2, "safari_isEqualToManipulationToken:includingContentEquality:", a3, *(unsigned __int8 *)(a1 + 40));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a5 = 1;
  }
  return result;
}

id __84___WKTextManipulationItem_SafariSharedExtras___safari_descriptionPreservingPrivacy___block_invoke(uint64_t a1, void *a2)
{
  if (*(_BYTE *)(a1 + 32))
    objc_msgSend(a2, "safari_privacyPreservingDescription");
  else
    objc_msgSend(a2, "safari_debugDescription");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __78___WKTextManipulationItem_SafariSharedExtras__safari_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_dictionaryRepresentation");
}

@end
