@implementation NSMutableAttributedString

void __102__NSMutableAttributedString_WBSNSMutableAttributedExtras__safari_replaceCharactersWithStringBindings___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  WBSPair *v9;
  void *v10;
  WBSPair *v11;
  id v12;

  v12 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "rangeOfString:", a2);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v5;
    v8 = v6;
    v9 = [WBSPair alloc];
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WBSPair initWithFirst:second:](v9, "initWithFirst:second:", v12, v10);

    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v11, objc_msgSend(*(id *)(a1 + 40), "indexOfObject:inSortedRange:options:usingComparator:", v11, 0, objc_msgSend(*(id *)(a1 + 40), "count"), 1024, &__block_literal_global_24));
  }

}

uint64_t __102__NSMutableAttributedString_WBSNSMutableAttributedExtras__safari_replaceCharactersWithStringBindings___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "second");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "rangeValue");

  objc_msgSend(v4, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "rangeValue");
  if (v6 < v8)
    return 1;
  else
    return -1;
}

@end
