@implementation UIStatusBarRegion

void __38___UIStatusBarRegion_setDisplayItems___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v3 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8);
  v4 = v8;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(v8, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 != *(void **)(a1 + 40))
    {

LABEL_6:
      v4 = v8;
      goto LABEL_7;
    }
    v7 = objc_msgSend(v8, "floating");

    v4 = v8;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v8, "setContainerView:", 0);
      objc_msgSend(v8, "setRegion:", 0);
      goto LABEL_6;
    }
  }
LABEL_7:

}

void __38___UIStatusBarRegion_setDisplayItems___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setContainerView:", v3);
  objc_msgSend(v4, "setRegion:", *(_QWORD *)(a1 + 40));

}

uint64_t __41___UIStatusBarRegion_enabledDisplayItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
    v3 = objc_msgSend(v2, "floating") ^ 1;
  else
    v3 = 0;

  return v3;
}

BOOL __48___UIStatusBarRegion_currentEnabledDisplayItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isEnabled") && (objc_msgSend(v3, "floating") & 1) == 0)
  {
    objc_msgSend(v3, "region");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 == *(void **)(a1 + 32);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __47___UIStatusBarRegion_displayItemAbsoluteFrames__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v9, "absoluteFrame");
    objc_msgSend(v5, "valueWithCGRect:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

  }
}

@end
