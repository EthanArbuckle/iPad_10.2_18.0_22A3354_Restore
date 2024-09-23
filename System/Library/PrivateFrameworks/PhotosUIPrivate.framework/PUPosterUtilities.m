@implementation PUPosterUtilities

+ (int64_t)mediaIndexWithSeed:(int64_t)a3 mediaCount:(int64_t)a4
{
  int64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int64_t v21;

  if (a4 < 1 || !a3)
    return 0;
  v6 = a3 / a4;
  v7 = a3 / a4 == 0;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v7 < a4)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      ++v7;
    }
    while (a4 != v7);
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75238]), "initWithSeed:", v6);
  PFShuffledArrayWithRandomNumberGenerator();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  v13 = a3 % (unint64_t)objc_msgSend(v12, "count");
  if (a4 >= 3 && v6 && v13 < 2)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D75238]), "initWithSeed:", v6 - 1);
    PFShuffledArrayWithRandomNumberGenerator();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "integerValue");
    objc_msgSend(v12, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "integerValue");

    if (v17 == v19)
      objc_msgSend(v12, "exchangeObjectAtIndex:withObjectAtIndex:", 0, 1);

  }
  objc_msgSend(v12, "objectAtIndexedSubscript:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "integerValue");

  return v21;
}

@end
