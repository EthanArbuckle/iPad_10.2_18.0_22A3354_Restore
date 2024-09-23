@implementation PGGraphYearNodeCollection

- (NSArray)years
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__PGGraphYearNodeCollection_years__block_invoke;
  v6[3] = &unk_1E8431D48;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateIntegerPropertyValuesForKey:withBlock:](self, "enumerateIntegerPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return (NSArray *)v4;
}

- (void)enumerateYearsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__PGGraphYearNodeCollection_enumerateYearsUsingBlock___block_invoke;
  v6[3] = &unk_1E8431D70;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateIntegerPropertyValuesForKey:withBlock:](self, "enumerateIntegerPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

}

uint64_t __54__PGGraphYearNodeCollection_enumerateYearsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __34__PGGraphYearNodeCollection_years__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

+ (unint64_t)calendarUnit
{
  return 4;
}

+ (id)yearNodesLargerThanYear:(int64_t)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = CFSTR("name");
  v8 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithComparator:value:", 5, v9);
  v16[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterBySettingProperties:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
