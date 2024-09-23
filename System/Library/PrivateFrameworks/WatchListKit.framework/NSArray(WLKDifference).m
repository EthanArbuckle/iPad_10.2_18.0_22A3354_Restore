@implementation NSArray(WLKDifference)

- (id)wlk_arrayDifference:()WLKDifference
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT SELF IN %@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("deletions"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT SELF IN %@"), a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("additions"));

  return v5;
}

@end
