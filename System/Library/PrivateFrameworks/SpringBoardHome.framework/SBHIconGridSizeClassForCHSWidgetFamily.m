@implementation SBHIconGridSizeClassForCHSWidgetFamily

BOOL __SBHIconGridSizeClassForCHSWidgetFamily_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "objectForKey:", CFSTR("SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue") == *(_QWORD *)(a1 + 32);

  return v4;
}

@end
