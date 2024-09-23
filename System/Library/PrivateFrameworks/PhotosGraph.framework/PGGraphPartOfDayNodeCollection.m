@implementation PGGraphPartOfDayNodeCollection

- (NSArray)partsOfDay
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PGGraphPartOfDayNodeCollection_partsOfDay__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

  return (NSArray *)v4;
}

- (void)enumerateNamesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__PGGraphPartOfDayNodeCollection_enumerateNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E8432440;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("name"), v6);

}

uint64_t __59__PGGraphPartOfDayNodeCollection_enumerateNamesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__PGGraphPartOfDayNodeCollection_partsOfDay__block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  id v4;

  v2 = +[PGGraphPartOfDayNode partOfDayForPartOfDayName:](PGGraphPartOfDayNode, "partOfDayForPartOfDayName:");
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)partOfDayNodeForPartOfDay:(unint64_t)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  +[PGGraphPartOfDayNode filterWithPartOfDay:](PGGraphPartOfDayNode, "filterWithPartOfDay:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphPartOfDayNodeCollection, "nodesMatchingFilter:inGraph:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
