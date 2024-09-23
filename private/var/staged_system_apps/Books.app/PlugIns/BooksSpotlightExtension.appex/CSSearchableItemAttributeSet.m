@implementation CSSearchableItemAttributeSet

- (id)si_stringAttributeForKey:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSSearchableItemAttributeSet attributeForKey:](self, "attributeForKey:", a3));
  v4 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return v5;
}

@end
