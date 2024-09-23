@implementation NSPredicate

uint64_t __67__NSPredicate_TAEventProtocol__predicateForTAEventsInDateInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_254F12A80))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "getDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "containsDate:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __58__NSPredicate_TAEventProtocol__predicateForTAEventsClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

BOOL __74__NSPredicate_TAEventProtocol__predicateForTAEventsClass_andEventSubtype___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = (objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v3, "conformsToProtocol:", &unk_254F12A80)
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v3, "getEventSubtype") == *(_QWORD *)(a1 + 40);

  return v4;
}

@end
