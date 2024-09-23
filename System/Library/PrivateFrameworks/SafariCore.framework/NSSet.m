@implementation NSSet

uint64_t __45__NSSet_SafariCoreExtras__safari_shortestURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  objc_msgSend(v4, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "length");
  v9 = -1;
  if (v6 >= v8)
    v9 = 1;
  if (v6 == v8)
    return 0;
  else
    return v9;
}

@end
