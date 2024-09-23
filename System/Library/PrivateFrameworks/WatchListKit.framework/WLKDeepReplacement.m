@implementation WLKDeepReplacement

void ___WLKDeepReplacement_block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a2;
  _WLKDeepReplacement(a3, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, v7);

}

@end
