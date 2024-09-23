@implementation VOSFirstGesturesCompatibleBrailleTable

BOOL __VOSFirstGesturesCompatibleBrailleTable_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  VOSBrailleTableForRotorItem(a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replacements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

@end
