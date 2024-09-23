@implementation NSArray

void __52__NSArray_TextInputAdditions___readingStringWithin___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "reading");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

}

void __52__NSArray_TextInputAdditions___surfaceStringWithin___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "surface");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:", v3);

}

@end
