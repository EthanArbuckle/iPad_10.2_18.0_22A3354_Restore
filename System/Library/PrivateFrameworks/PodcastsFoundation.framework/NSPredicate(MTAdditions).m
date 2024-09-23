@implementation NSPredicate(MTAdditions)

+ (uint64_t)falsePredicate
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("FALSEPREDICATE"));
}

- (uint64_t)NOT
{
  return objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", a1);
}

+ (uint64_t)predicateForDateKey:()MTAdditions isGreaterThanOrEqualToDate:
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL AND %K >= %@"), a3, a3, a4);
}

- (id)OR:()MTAdditions
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

- (id)AND:()MTAdditions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return a1;
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

+ (uint64_t)predicateForDateKey:()MTAdditions isLessThanDate:
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL AND %K < %@"), a3, a3, a4);
}

+ (uint64_t)predicateForDateKey:()MTAdditions isGreaterThanOrEqualToDateKey:
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL AND %K >= %K"), a3, a3, a4);
}

+ (uint64_t)predicateForNilValueForKey:()MTAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NULL"), a3);
}

+ (uint64_t)truePredicate
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("TRUEPREDICATE"));
}

+ (uint64_t)predicateForDateKey:()MTAdditions isGreaterThanDate:
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL AND %K > %@"), a3, a3, a4);
}

+ (uint64_t)predicateForDateKey:()MTAdditions isLessThanOrEqualToDate:
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL AND %K <= %@"), a3, a3, a4);
}

+ (uint64_t)predicateForNonNilValueForKey:()MTAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), a3);
}

+ (uint64_t)predicateForNilValueOrEmptyStringForKey:()MTAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = NULL OR %K == %@"), a3, a3, &stru_1E5500770);
}

+ (uint64_t)predicateForObjectId:()MTAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(self == %@)"), a3);
}

+ (uint64_t)predicateForObjectIds:()MTAdditions
{
  return objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(self IN %@)"), a3);
}

@end
