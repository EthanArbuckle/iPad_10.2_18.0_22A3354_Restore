@implementation ProcessLevel

uint64_t __ProcessLevel_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = 0.0;
  v8 = 0.0;
  if ((objc_msgSend(v5, "hasPrefix:", CFSTR("_")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("_confidence"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v8 = v11;

  }
  if ((objc_msgSend(v6, "hasPrefix:", CFSTR("_")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_confidence"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v7 = v14;

  }
  if (v8 <= v7)
  {
    if (v8 < v7)
      v15 = 1;
    else
      v15 = objc_msgSend(v5, "compare:", v6);
  }
  else
  {
    v15 = -1;
  }

  return v15;
}

@end
