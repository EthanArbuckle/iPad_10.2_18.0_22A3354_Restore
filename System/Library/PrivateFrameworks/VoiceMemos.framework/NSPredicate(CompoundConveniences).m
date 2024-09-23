@implementation NSPredicate(CompoundConveniences)

- (id)rc_and:()CompoundConveniences
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  v9[0] = a1;
  v9[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)rc_or:()CompoundConveniences
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3528];
  v9[0] = a1;
  v9[1] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "orPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)rc_andNot:()CompoundConveniences
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "rc_and:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
