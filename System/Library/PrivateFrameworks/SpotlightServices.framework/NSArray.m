@implementation NSArray

void __42__NSArray_Tokenize__tokenizedStringArray___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  SSTokenizedString *v4;
  void *v5;
  SSTokenizedString *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "length"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = [SSTokenizedString alloc];
    objc_msgSend(v7, "lowercaseString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SSTokenizedString initWithString:locale:](v4, "initWithString:locale:", v5, *(_QWORD *)(a1 + 40));
    objc_msgSend(v3, "addObject:", v6);

  }
}

void __35__NSArray_QueryUtils__mapNonEmpty___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "length"))
  {
    v3 = *(void **)(a1 + 32);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

  }
}

@end
