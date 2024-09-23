@implementation NSMutableDictionary(SwipeSelectionConvenience)

- (uint64_t)pu_containsIndexPath:()SwipeSelectionConvenience
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = objc_msgSend(v7, "containsIndex:", objc_msgSend(v4, "item"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
