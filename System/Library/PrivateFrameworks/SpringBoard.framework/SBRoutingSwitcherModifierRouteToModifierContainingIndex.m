@implementation SBRoutingSwitcherModifierRouteToModifierContainingIndex

id ___SBRoutingSwitcherModifierRouteToModifierContainingIndex_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(<%@: %p>: %lu)"), objc_opt_class(), v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@, %@"), v5, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v10;
  }
  v12 = v11;

  return v12;
}

@end
