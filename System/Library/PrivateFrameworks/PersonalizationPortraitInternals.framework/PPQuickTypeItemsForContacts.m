@implementation PPQuickTypeItemsForContacts

uint64_t __PPQuickTypeItemsForContacts_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  int v11;
  int v12;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0D70D00];
  objc_msgSend(v4, "score");
  v8 = v7;
  objc_msgSend(v5, "score");
  v10 = objc_msgSend(v6, "reverseCompareDouble:withDouble:", v8, v9);
  if (!v10)
  {
    v11 = objc_msgSend(v4, "source");
    v12 = objc_msgSend(v5, "source");
    if (v11 != 1 || v12 == 1)
    {
      if (v12 != 1 || v11 == 1)
        v10 = 0;
      else
        v10 = -1;
    }
    else
    {
      v10 = 1;
    }
  }

  return v10;
}

@end
