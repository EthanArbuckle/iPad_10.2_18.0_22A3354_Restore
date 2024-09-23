@implementation UIView(Constraints)

- (id)_pu_associatedConstraints
{
  id v2;

  objc_getAssociatedObject(a1, CFSTR("PUConstraintDictionaryKey"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_setAssociatedObject(a1, CFSTR("PUConstraintDictionaryKey"), v2, (void *)1);
  }
  return v2;
}

- (BOOL)pu_hasConstraintForKey:()Constraints
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;

  v4 = a3;
  objc_msgSend(a1, "_pu_associatedConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "count") != 0;
  else
    v7 = 0;

  return v7;
}

- (void)pu_addConstraint:()Constraints forKey:
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "pu_addConstraints:forKey:", v9, v7, v10, v11);
}

- (void)pu_addConstraints:()Constraints forKey:
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(a1, "_pu_associatedConstraints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);
    }
    objc_msgSend(v8, "addObjectsFromArray:", v9);
    objc_msgSend(a1, "addConstraints:", v9);

  }
}

- (void)pu_removeAllConstraintsForKey:()Constraints
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a1, "_pu_associatedConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(a1, "removeConstraints:", v5);
    objc_msgSend(v4, "removeObjectForKey:", v6);
  }

}

- (void)pu_clearAllConstraintsForKey:()Constraints
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_pu_associatedConstraints");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v4);

}

- (id)pu_constraintsForKey:()Constraints
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_pu_associatedConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
