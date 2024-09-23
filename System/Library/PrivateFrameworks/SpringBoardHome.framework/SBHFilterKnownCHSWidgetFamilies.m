@implementation SBHFilterKnownCHSWidgetFamilies

void __SBHFilterKnownCHSWidgetFamilies_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  SBHGetIconGridSizeClassInfoValue(a2, CFSTR("SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "integerValue");
  if (v3)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 1 << v3;

}

@end
