@implementation NSLayoutConstraint

uint64_t __56__NSLayoutConstraint_IC__ic_constraints_affectingViews___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "firstItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "secondItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "containsObject:", v8);

  }
  return v6;
}

@end
