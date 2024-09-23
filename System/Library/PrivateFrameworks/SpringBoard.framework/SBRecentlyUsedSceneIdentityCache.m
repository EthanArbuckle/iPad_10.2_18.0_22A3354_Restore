@implementation SBRecentlyUsedSceneIdentityCache

void __50___SBRecentlyUsedSceneIdentityCache_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = (id)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v6, v5);

}

id __66___SBRecentlyUsedSceneIdentityCache_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  v3 = *(void **)(a1 + 40);
  if (!v2)
    return (id)objc_msgSend(v3, "appendString:withName:", CFSTR("empty"), 0);
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), CFSTR("recentPIDs"));
  return (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("recentSceneIdentityTokensByPID"));
}

@end
